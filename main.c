#include <gb/gb.h>
#include <rand.h>
#include <stdio.h>
#include <stdint.h>
#include <types.h>
#include <gbdk/font.h>
#include "GameCharacter.c"
#include "Girl.c"
#include "BackgroundTiles.c"
#include "BackgroundMap.c"
#include "windowmap.c"

typedef unsigned char UINT8;

// ============================================
// GAME CONSTANTS
// ============================================

// SCREEN BOUNDARIES
#define BG_WIDTH 160
#define BG_HEIGHT 144
#define MIN_GIRL_X 23
#define MAX_GIRL_X 138
#define MIN_GIRL_Y 20
#define MAX_GIRL_Y 113

// ENTITY DIMENSIONS
#define GIRL_WIDTH 16
#define GIRL_HEIGHT 16
#define SLIME_WIDTH 8
#define SLIME_HEIGHT 8

// TIMING CONSTANTS
#define ANIM_TIMER_MAX 20
#define ATTACK_LOCK_TIME 10
#define SPAWN_TIMER_MAX 1000

// SPAWNING BOUNDARIES
#define SPAWN_MIN_X 32
#define SPAWN_MAX_X 128
#define SPAWN_MIN_Y 44
#define SPAWN_MAX_Y 120

// RESPAWN TOGGLE (set to 0 to disable enemy respawning)
#define ENABLE_RESPAWN 0

// ENEMY MOVEMENT BOUNDARIES
#define MIN_ENEMY_X 16
#define MAX_ENEMY_X 152
#define MIN_ENEMY_Y 20
#define MAX_ENEMY_Y 128

// Palette flag fallbacks for older GBDK headers
#ifndef S_PALETTE
#define S_PALETTE 0x10
#endif
#ifndef S_PAL0
#define S_PAL0 0x00
#endif
#ifndef S_PAL1
#define S_PAL1 S_PALETTE
#endif

// PALETTE ASSIGNMENTS
#define GIRL_PALETTE S_PAL0
#define SWORD_PALETTE S_PAL0
#define ENEMY_PALETTE S_PAL1

// ============================================
// SPRITE ALLOCATION MAP (for 8 enemies max)
// ============================================
// 
// VRAM (Tile Graphics Storage - 256 sprite tiles available):
//   Tiles 0-15:   Girl sprite graphics (all directions/poses)
//   Tiles 16-17:  Slime sprite graphics (animation frames 0-1)
//   Tiles 18-21:  Sword sprite graphics (left/right 18-19, up/down 20-21)
//   Tiles 22-255: Available for future use
//
// OAM (Sprite Slots - 40 slots maximum):
//   Slots 0-3:    Girl (displayed as 2x2 sprite grid)
//   Slots 4-5:    Sword (all directions use these 2 slots)
//   Slots 6-7:    Sword placeholder (reserved for future sword use)
//   Slots 8-13:   Stat sprites (6 slots for future use: hearts, damage, etc.)
//   Slots 14-21:  Placeholders (8 slots reserved for future use)
//   Slots 22-39:  Enemies (18 slots, each enemy uses 1 slot with tile animation)
//                 Currently: slime_0 at slot 22, slime_1 at slot 23
//
// NOTE: Enemies now use single sprite slots with tile swapping for animation
//
// PALETTES:
//   Palette 0 (OBP0_REG): Girl and Sword colors
//   Palette 1 (OBP1_REG): Enemy colors (different from girl)
//
// ============================================

struct GameCharacter girl;
struct Weapon sword;
struct Enemy slime;
struct Enemy slime_0;
struct Enemy slime_1;

//Constants
UINT8 gamestate = 0;
UINT8 score = 0;
UBYTE spritesize = 8;
UINT8 collision = 0;
UINT8 pad = 2;
UINT8 animtimer = 0;
UINT8 locktimer = 0;
UINT8 spawntimer = 0;
UINT8 direction = 0; // 0 = down, 1 = up, 2 = left, 3 = right
UINT8 room = 0;
UINT8 prev_pad = 0;

// Forward Declarations
void moveslime(struct Enemy* character, UINT8 x, UINT8 y);

//Normal Rooms

//Room 0 Function
void room_0()
{
    if (room == 0)
    {
        //Room 1 Code
            slime_0.x = 26;
            slime_0.y = 50;
            slime_0.width = 8;
            slime_0.height = 8;
            slime_0.anim = 0;
            slime_0.death = 0;

            //set_sprite_palette(16, 0xE0);
            set_sprite_tile(22, 16);
            set_sprite_prop(22, ENEMY_PALETTE);
            slime_0.spritids[0] = 22;
            
            moveslime(&slime_0, slime_0.x, slime_0.y);

            slime_1.x = 26;
            slime_1.y = 70;
            slime_1.width = 8;
            slime_1.height = 8;
            slime_1.anim = 0;
            slime_1.death = 0;

            //set_sprite_palette(16, 0xE0);
            set_sprite_tile(23, 16);
            set_sprite_prop(23, ENEMY_PALETTE);
            slime_1.spritids[0] = 23;
            
            moveslime(&slime_1, slime_1.x, slime_1.y);
    }
}

// Function Prototypes

    void performantdelay(UINT8 numloops)
    {
        UINT8 i;
        for(i = 0; i < numloops; i++)
        {
            wait_vbl_done();
        }
    }

    /* void animdelay(UINT8 animloops)
    {
        UINT8 i;
        for(i = 0; i < animloops*2; i++)
        {
            if (i < animloops )
            {
                slime.anim = 0;
            }
            else if(i >= animloops)
            {
                slime.anim = 1;
            }
        }
    } */

    void character_enemy_collision(struct GameCharacter* character, struct Enemy* enemy)
    {
        if (character->x < enemy->x + enemy->width - pad &&
        character->x + character->width - pad > enemy->x &&
        character->y < enemy->y + enemy->height - pad &&
        character->y + character->height - pad > enemy->y)
        {
            {
                hide_sprite(character->spritids[0]);
                hide_sprite(character->spritids[1]);
                hide_sprite(character->spritids[2]);
                hide_sprite(character->spritids[3]);
            }
        }
    }
    void weapon_enemy_collision(struct Weapon* weapon, struct Enemy* enemy)
    {
        if (weapon->x < enemy->x + enemy->width &&
        weapon->x + weapon->width > enemy->x &&
        weapon->y < enemy->y + enemy->height &&
        weapon->y + enemy->height > enemy->y)
        {
            {
                enemy->death = 1;
                enemy->x = 0;
                enemy->y = 0;
                score = score ++;
            }
        }
    }
    void movegirl(struct GameCharacter* character, UINT8 x, UINT8 y)
    {
        move_sprite(character->spritids[0], x, y);
        move_sprite(character->spritids[1], x + spritesize, y);
        move_sprite(character->spritids[2], x, y + spritesize);
        move_sprite(character->spritids[3], x + spritesize, y + spritesize);
    }


    void sword_set_direction(struct Weapon* weapon)
    {
        // Uses global direction variable: 0=down, 1=up, 2=left, 3=right
        // All directions now use OAM slots 4-5
        if(direction == 2) // left
        {
            sword.x = girl.x - 3;
            sword.y = girl.y + 8;
            set_sprite_tile(4, 18);
            set_sprite_prop(4, 0);
            sword.spritids[0] = 4;
            set_sprite_tile(5, 19);
            set_sprite_prop(5, 0);
            sword.spritids[1] = 5;
            move_sprite(weapon->spritids[0], sword.x, sword.y);
            move_sprite(weapon->spritids[1], sword.x - spritesize, sword.y);
        }
        else if(direction == 3) // right
        {
            sword.x = girl.x + 21;
            sword.y = girl.y + 8;
            set_sprite_tile(4, 18);
            set_sprite_prop(4, S_FLIPX);
            sword.spritids[1] = 4;
            set_sprite_tile(5, 19);
            set_sprite_prop(5, S_FLIPX);
            sword.spritids[0] = 5;
            move_sprite(weapon->spritids[0], sword.x, sword.y);
            move_sprite(weapon->spritids[1], sword.x - spritesize, sword.y);
        }
        else if(direction == 1) // up
        {
            sword.x = girl.x + 9;
            sword.y = girl.y;
            set_sprite_tile(4, 20);
            set_sprite_prop(4, S_FLIPX);
            sword.spritids[0] = 4;
            set_sprite_tile(5, 21);
            set_sprite_prop(5, S_FLIPX);
            sword.spritids[1] = 5;
            move_sprite(weapon->spritids[0], sword.x, sword.y);
            move_sprite(weapon->spritids[1], sword.x, sword.y - spritesize);
        }
        else if(direction == 0) // down
        {
            sword.x = girl.x - 2;
            sword.y = girl.y + 20;
            set_sprite_tile(4, 20);
            set_sprite_prop(4, S_FLIPY);
            sword.spritids[1] = 4;
            set_sprite_tile(5, 21);
            set_sprite_prop(5, S_FLIPY);
            sword.spritids[0] = 5;
            move_sprite(weapon->spritids[0], sword.x, sword.y);
            move_sprite(weapon->spritids[1], sword.x, sword.y - spritesize);
        }
    }
    void attack()
    {
        sword_set_direction(&sword);
        if(direction == 0)
        {
            sword.y = sword.y + 6;
        }
        else if(direction == 1)
        {
            sword.y = sword.y - 6;
        }
        else if(direction == 2)
        {
            sword.x = sword.x - 6;
        }
        else if(direction == 3)
        {
            sword.x = sword.x + 6;
        }
        if (locktimer == 0)
        {
            locktimer ++;
        }
    }
    void swordreset()
    {
        if(direction == 0)
        {
            sword.y = sword.y - 8;
        }
        else if(direction == 1)
        {
            sword.y = sword.y + 8;
        }
        else if(direction == 2)
        {
            sword.x = sword.x + 8;
        }
        else if(direction == 3)
        {
            sword.x = sword.x - 8;
        }
        sword_set_direction(&sword);
    }
    void moveslime(struct Enemy* character, UINT8 x, UINT8 y)
    {
        move_sprite(character->spritids[0], x, y);
    }
    void animate_enemy(struct Enemy* enemy, UINT8 tile0, UINT8 tile1)
    {
        // Now just changes the tile in spritids[0] based on anim state
        if(enemy->anim == 0)
        {
            set_sprite_tile(enemy->spritids[0], tile0);
        }
        else if(enemy->anim == 1)
        {
            set_sprite_tile(enemy->spritids[0], tile1);
        }
    }

    void enemy_check_borders(struct Enemy* enemy)
    {
        if (enemy->x < MIN_ENEMY_X)
        {
            enemy->x = MIN_ENEMY_X;
        }
        if (enemy->x > MAX_ENEMY_X)
        {
            enemy->x = MAX_ENEMY_X;
        }
        if (enemy->y < MIN_ENEMY_Y)
        {
            enemy->y = MIN_ENEMY_Y;
        }
        if (enemy->y > MAX_ENEMY_Y)
        {
            enemy->y = MAX_ENEMY_Y;
        }
    }

    // Consolidated sprite setter: always uses slots 0-3, swaps tiles based on direction/state
    void character_set_sprite(struct GameCharacter* character, UINT8 anim_state)
    {
        // anim_state: 0=down_walk, 1=down_stand, 2=left_walk, 3=left_stand,
        //             4=right_walk, 5=right_stand, 6=up_walk, 7=up_stand
        
        if(anim_state == 0) // down walking
        {
            set_sprite_tile(0, 0);
            set_sprite_prop(0, 0);
            character->spritids[0] = 0;
            set_sprite_tile(1, 1);
            set_sprite_prop(1, 0);
            character->spritids[1] = 1;
            set_sprite_tile(2, 2);
            set_sprite_prop(2, S_FLIPX);
            character->spritids[3] = 2;
            set_sprite_tile(3, 3);
            set_sprite_prop(3, S_FLIPX);
            character->spritids[2] = 3;
        }
        else if(anim_state == 1) // down standing
        {
            set_sprite_tile(0, 0);
            set_sprite_prop(0, 0);
            character->spritids[0] = 0;
            set_sprite_tile(1, 1);
            set_sprite_prop(1, 0);
            character->spritids[1] = 1;
            set_sprite_tile(2, 2);
            set_sprite_prop(2, 0);
            character->spritids[2] = 2;
            set_sprite_tile(3, 3);
            set_sprite_prop(3, 0);
            character->spritids[3] = 3;
        }
        else if(anim_state == 2) // left walking
        {
            set_sprite_tile(0, 4);
            set_sprite_prop(0, 0);
            character->spritids[0] = 0;
            set_sprite_tile(1, 5);
            set_sprite_prop(1, 0);
            character->spritids[1] = 1;
            set_sprite_tile(2, 6);
            set_sprite_prop(2, 0);
            character->spritids[2] = 2;
            set_sprite_tile(3, 7);
            set_sprite_prop(3, 0);
            character->spritids[3] = 3;
        }
        else if(anim_state == 3) // left standing
        {
            set_sprite_tile(0, 8);
            set_sprite_prop(0, 0);
            character->spritids[0] = 0;
            set_sprite_tile(1, 9);
            set_sprite_prop(1, 0);
            character->spritids[1] = 1;
            set_sprite_tile(2, 10);
            set_sprite_prop(2, 0);
            character->spritids[2] = 2;
            set_sprite_tile(3, 11);
            set_sprite_prop(3, 0);
            character->spritids[3] = 3;
        }
        else if(anim_state == 4) // right walking
        {
            set_sprite_tile(0, 5);
            set_sprite_prop(0, S_FLIPX);
            character->spritids[0] = 0;
            set_sprite_tile(1, 4);
            set_sprite_prop(1, S_FLIPX);
            character->spritids[1] = 1;
            set_sprite_tile(2, 7);
            set_sprite_prop(2, S_FLIPX);
            character->spritids[2] = 2;
            set_sprite_tile(3, 6);
            set_sprite_prop(3, S_FLIPX);
            character->spritids[3] = 3;
        }
        else if(anim_state == 5) // right standing
        {
            set_sprite_tile(0, 9);
            set_sprite_prop(0, S_FLIPX);
            character->spritids[0] = 0;
            set_sprite_tile(1, 8);
            set_sprite_prop(1, S_FLIPX);
            character->spritids[1] = 1;
            set_sprite_tile(2, 11);
            set_sprite_prop(2, S_FLIPX);
            character->spritids[2] = 2;
            set_sprite_tile(3, 10);
            set_sprite_prop(3, S_FLIPX);
            character->spritids[3] = 3;
        }
        else if(anim_state == 6) // up walking
        {
            set_sprite_tile(0, 12);
            set_sprite_prop(0, 0);
            character->spritids[0] = 0;
            set_sprite_tile(1, 13);
            set_sprite_prop(1, 0);
            character->spritids[1] = 1;
            set_sprite_tile(2, 14);
            set_sprite_prop(2, 0);
            character->spritids[2] = 2;
            set_sprite_tile(3, 15);
            set_sprite_prop(3, 0);
            character->spritids[3] = 3;
        }
        else if(anim_state == 7) // up standing
        {
            set_sprite_tile(0, 12);
            set_sprite_prop(0, 0);
            character->spritids[0] = 0;
            set_sprite_tile(1, 13);
            set_sprite_prop(1, 0);
            character->spritids[1] = 1;
            set_sprite_tile(2, 15);
            set_sprite_prop(2, S_FLIPX);
            character->spritids[2] = 2;
            set_sprite_tile(3, 14);
            set_sprite_prop(3, S_FLIPX);
            character->spritids[3] = 3;
        }
        
        movegirl(character, character->x, character->y);
    }

    void setupgirl()
    {
        girl.x = 80;
        girl.y = 36;
        girl.width = 16;
        girl.height = 16;
        girl.anim = 0;

        set_sprite_tile(0, 0);
        set_sprite_prop(0, 0);
        girl.spritids[0] = 0;
        set_sprite_tile(1, 1);
        set_sprite_prop(1, 0);
        girl.spritids[1] = 1;
        set_sprite_tile(2, 2);
        set_sprite_prop(2, 0);
        girl.spritids[2] = 2;
        set_sprite_tile(3, 3);
        set_sprite_prop(3, 0);
        girl.spritids[3] = 3;
        
        movegirl(&girl, girl.x, girl.y);
    }

    void setupslime()
    {
        slime.x = rand() % 128 + 16;
        slime.y = rand() % 96 + 24;
        slime.width = 8;
        slime.height = 8;
        slime.anim = 0;

            set_sprite_tile(22, 16);
            set_sprite_prop(22, ENEMY_PALETTE);
            slime.spritids[0] = 22;
            set_sprite_tile(23, 17);
            set_sprite_prop(23, ENEMY_PALETTE);
            slime.spritids[1] = 23;
        
        moveslime(&slime, slime.x, slime.y);
    }

    void setupsword()
{
    sword.x = 100;
    sword.y = 100;
    sword.width = 8;
    sword.height = 8;
    sword.anim = 0;

    //set_sprite_palette(16, 0xE0);
    set_sprite_tile(4, 18);
    set_sprite_prop(4, 0);
    sword.spritids[0] = 4;
    set_sprite_tile(5, 19);
    set_sprite_prop(5, 0);
    sword.spritids[1] = 5;
    
    //movesword(&sword, sword.x, sword.y);
}


void main()
{   
    // Clean initialization after boot sequence
    DISPLAY_OFF;
    
    while(1)
    {
        UINT8 current_pad = joypad();

        if((current_pad & J_START) && !(prev_pad & J_START))
        {
            if(gamestate == 0)
            {
                gamestate = 1;
                initrand(DIV_REG);
                font_t min_font;

                font_init();
                min_font = font_load(font_min);
                font_set(min_font);

                set_bkg_data(37, 8, backgroundtiles);
                set_bkg_tiles(0, 0, 20, 16, backgroundmap);

                set_win_tiles(0, 0, 20, 2, windowmap);
                move_win(8,128);
                
                
                
                set_sprite_data(0, 22, Girl);
                setupgirl();
                //setupslime();
                setupsword();
                room_0();  // Initialize room after sprite data is loaded

                
                // Palette encoding: bits 1-0 = C0, 3-2 = C1, 5-4 = C2, 7-6 = C3
                // Shade codes: 00 = transparent, 01 = light, 10 = dark, 11 = black
                // 0xE4 = 0b11100100 -> C3=11 (black), C2=10 (dark), C1=01 (light), C0=00 (transparent for sprites, lightest for background)
                // 0xE0 = 0b11100000 -> C3=11 (black), C2=10 (dark), C1=00 (lightest), C0=00 (transparent for sprites, lightest for background)
                // 0xE4 = 0b11100100 -> C3=11 (black), C2=10 (dark), C1=01 (light), C0=00 (transparent for sprites, lightest for background)
                BGP_REG  = 0xE4; // Background palette (light fill uses C1)
                OBP0_REG = 0xE0; // Sprite palette 0: Girl/Sword (old colors)
                OBP1_REG = 0xE4; // Sprite palette 1: Slimes (clear, light, dark, black)
                SHOW_SPRITES;
                SHOW_BKG;
                SHOW_WIN;
                DISPLAY_ON;
            }
            else if(gamestate == 1)
            {
                gamestate = 2;
                HIDE_BKG;
                HIDE_SPRITES;
            }
            else if(gamestate == 2)
            {
                gamestate = 1;
                SHOW_SPRITES;
                SHOW_BKG;
            }
        }

        if(gamestate == 1)
        {
        if (locktimer == 0)
        {
        if(joypad() & J_LEFT)
        {
            direction = 2;
            sword_set_direction(&sword);
            if(girl.x > MIN_GIRL_X)
            {
                girl.x -= 2;
                
            }
            if(girl.anim != 2 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
            {
                character_set_sprite(&girl, 2);
                girl.anim = 2;
            }
            else if(girl.anim != 3 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
            {
                character_set_sprite(&girl, 3);
                girl.anim = 3;
            }
        }
        if(joypad() & J_RIGHT)
        {
            direction = 3;
            sword_set_direction(&sword);
            if(girl.x < MAX_GIRL_X)
            {
                girl.x += 2;
                
            }
            
            if(girl.anim != 4 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
            {
                character_set_sprite(&girl, 4);
                girl.anim = 4;
            }
            else if(girl.anim != 5 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
            {
                character_set_sprite(&girl, 5);
                girl.anim = 5;
            }
        }
        if(joypad() & J_UP)
        {
            direction = 1;
            sword_set_direction(&sword);
            if(girl.y > MIN_GIRL_Y)
            {
                
                girl.y -= 2;
            }
            if(girl.anim != 6)
            {
                character_set_sprite(&girl, 6);
                girl.anim = 6;
            }
            else if(girl.anim != 7)
            {
                character_set_sprite(&girl, 7);
                girl.anim = 7;
            }
        }
        if(joypad() & J_DOWN)
        {
            direction = 0;
            sword_set_direction(&sword);
            if(girl.y < MAX_GIRL_Y)
            {
                
                girl.y += 2;
            }
            
            if(girl.anim != 0)
            {
                character_set_sprite(&girl, 0);
                girl.anim = 0;
            }
            else if(girl.anim != 1)
            {
                character_set_sprite(&girl, 1);
                girl.anim = 1;
            }
        }        

        if(joypad() & J_A)
        {
            attack();
        }
        }
        
        if(locktimer > 0)
        {
            weapon_enemy_collision(&sword, &slime_0);
            weapon_enemy_collision(&sword, &slime_1);
            locktimer++;
        }
        if(locktimer == ATTACK_LOCK_TIME)
        {
            locktimer = 0;
            swordreset();
        }
        
        // Animate slime_0
        if(slime_0.death == 0)
        {
            animate_enemy(&slime_0, 16, 17);
        }
        else if(slime_0.death == 1)
        {
            slime_0.x = 0;
            slime_0.y = 0;
            moveslime(&slime_0, slime_0.x, slime_0.y);
        }
        
        // Animate slime_1
        if(slime_1.death == 0)
        {
            animate_enemy(&slime_1, 16, 17);
        }
        else if(slime_1.death == 1)
        {
            slime_1.x = 0;
            slime_1.y = 0;
            moveslime(&slime_1, slime_1.x, slime_1.y);
        }
        
        // Animation timer for both slimes
        animtimer++;
        if(animtimer == ANIM_TIMER_MAX)
        {
            animtimer = 0;
            if(slime_0.anim == 0)
            {
                slime_0.anim = 1;
            }
            else if(slime_0.anim == 1)
            {
                slime_0.anim = 0;
            }
            
            if(slime_1.anim == 0)
            {
                slime_1.anim = 1;
            }
            else if(slime_1.anim == 1)
            {
                slime_1.anim = 0;
            }
        }
        
        character_enemy_collision(&girl, &slime_0);
        character_enemy_collision(&girl, &slime_1);
        }  // end gamestate == 1

        /* DISABLED: Main slime logic (using slime_0 and slime_1 instead)
        if(slime.death == 0)
        {
            animate_enemy(&slime, 16, 17);
            animtimer++;
            if(animtimer == ANIM_TIMER_MAX)
            {
                animtimer = 0;
                if(slime.anim == 0)
                {
                    slime.anim = 1;
                }
                else if(slime.anim == 1)
                {
                    slime.anim = 0;
                }
            }
        }
        else if(slime.death == 1)
        {
            slime.x = 0;
            slime.y = 0;
            moveslime(&slime, slime.x, slime.y);
#if ENABLE_RESPAWN
            spawntimer++;
#endif
        }
#if ENABLE_RESPAWN
        if(spawntimer == SPAWN_TIMER_MAX)
        {
            spawntimer = 0;
            slime.death = 0;
            setupslime();
        }
#endif
        character_enemy_collision(&girl, &slime);
        */
        
        prev_pad = current_pad;
        performantdelay(5);
        //animdelay(30);
    }
}