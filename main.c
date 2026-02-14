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
            slime_0.y = 26;
            slime_0.width = 8;
            slime_0.height = 8;
            slime_0.anim = 0;

            //set_sprite_palette(16, 0xE0);
            set_sprite_tile(16, 16);
            slime_0.spritids[0] = 16;
            set_sprite_tile(17, 17);
            slime_0.spritids[1] = 17;
            
            moveslime(&slime_0, slime_0.x, slime_0.y);

            slime_1.x = 26;
            slime_1.y = 26;
            slime_1.width = 8;
            slime_1.height = 8;
            slime_1.anim = 0;

            //set_sprite_palette(16, 0xE0);
            set_sprite_tile(16, 16);
            slime_1.spritids[0] = 16;
            set_sprite_tile(17, 17);
            slime_1.spritids[1] = 17;
            
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

    void girl_slimecolision()
    {
        if (girl.x < slime.x + slime.width - pad &&
        girl.x + girl.width - pad > slime.x &&
        girl.y < slime.y + slime.height - pad &&
        girl.y + girl.height - pad > slime.y)
        {
            {
                hide_sprite(girl.spritids[0]);
                hide_sprite(girl.spritids[1]);
                hide_sprite(girl.spritids[2]);
                hide_sprite(girl.spritids[3]);
            }
        }
    }
    void sword_slimecolision()
    {
        if (sword.x < slime.x + slime.width &&
        sword.x + sword.width > slime.x &&
        sword.y < slime.y + slime.height &&
        sword.y + sword.height > slime.y)
        {
            {
                slime.death = 1;
                slime.x = 0;
                slime.y = 0;
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


    void moveswordl(struct Weapon* character, UINT8 x, UINT8 y)
    {

        sword.x = girl.x - 3;
        sword.y = girl.y + 8;
        set_sprite_tile(18, 18);
        set_sprite_prop(18, 0);
        sword.spritids[0] = 18;
        set_sprite_tile(19, 19);
        set_sprite_prop(19, 0);
        sword.spritids[1] = 19;
        move_sprite(character->spritids[0], x, y);
        move_sprite(character->spritids[1], x - spritesize, y);
        hide_sprite(20);
        hide_sprite(21);

    }
    void moveswordr(struct Weapon* character, UINT8 x, UINT8 y)
    {
        sword.x = girl.x + 21;
        sword.y = girl.y + 8;
        set_sprite_tile(18, 18);
        set_sprite_prop(18, S_FLIPX);
        sword.spritids[1] = 18;
        set_sprite_tile(19, 19);
        set_sprite_prop(19, S_FLIPX);
        sword.spritids[0] = 19;
        move_sprite(character->spritids[0], x, y);
        move_sprite(character->spritids[1], x - spritesize, y);
        hide_sprite(20);
        hide_sprite(21);
    }
    void moveswordu(struct Weapon* character, UINT8 x, UINT8 y)
    {
        sword.x = girl.x + 9;
        sword.y = girl.y;
        set_sprite_tile(20, 20);
        set_sprite_prop(20, S_FLIPX);
        sword.spritids[0] = 20;
        set_sprite_tile(21, 21);
        set_sprite_prop(21, S_FLIPX);
        sword.spritids[1] = 21;
        move_sprite(character->spritids[0], x, y);
        move_sprite(character->spritids[1], x, y - spritesize);
        hide_sprite(18);
        hide_sprite(19);
    }
    void moveswordd(struct Weapon* character, UINT8 x, UINT8 y)
    {
        sword.x = girl.x - 2;
        sword.y = girl.y + 20;
        set_sprite_tile(20, 20);
        set_sprite_prop(20, S_FLIPY);
        sword.spritids[1] = 20;
        set_sprite_tile(21, 21);
        set_sprite_prop(21, S_FLIPY);
        sword.spritids[0] = 21;
        move_sprite(character->spritids[0], x, y);
        move_sprite(character->spritids[1], x , y - spritesize);
        hide_sprite(18);
        hide_sprite(19);
    }
    void attack()
    {
        if(direction == 0)
        {
            moveswordd(&sword, sword.x, sword.y);
            sword.y = sword.y + 6;
        }
        else if(direction == 1)
        {
            moveswordu(&sword, sword.x, sword.y);
            sword.y = sword.y - 6;
        }
        else if(direction == 2)
        {
            moveswordl(&sword, sword.x, sword.y);
            sword.x = sword.x - 6;
        }
        else if(direction == 3)
        {
            moveswordr(&sword, sword.x, sword.y);
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
            moveswordd(&sword, sword.x, sword.y);
        }
        else if(direction == 1)
        {
            sword.y = sword.y + 8;
            moveswordu(&sword, sword.x, sword.y);
        }
        else if(direction == 2)
        {
            sword.x = sword.x + 8;
            moveswordl(&sword, sword.x, sword.y);
        }
        else if(direction == 3)
        {
            sword.x = sword.x - 8;
            moveswordr(&sword, sword.x, sword.y);
        }
    }
    void moveslime(struct Enemy* character, UINT8 x, UINT8 y)
    {
        move_sprite(character->spritids[0], x, y);
    }
    void animslime()
    {
        if(slime.anim == 0)
        {
            set_sprite_tile(17, 17);
            slime.spritids[0] = 17;
            hide_sprite(16);
            moveslime(&slime, slime.x, slime.y);
        }
        else if(slime.anim == 1)
        {
            set_sprite_tile(16, 16);
            slime.spritids[0] = 16;
            hide_sprite(17);
            moveslime(&slime, slime.x, slime.y);
        }
    }

    // Sprite Assignment to Girl if facing front (State 0)
    void flipgirl()
    {
        set_sprite_tile(0, 0);
        //set_sprite_prop(0, S_FLIPX);
        girl.spritids[0] = 0;
        set_sprite_tile(1, 1);
        //set_sprite_prop(1, S_FLIPX);
        girl.spritids[1] = 1;
        set_sprite_tile(2, 2);
        set_sprite_prop(2, S_FLIPX);
        girl.spritids[3] = 2;
        set_sprite_tile(3, 3);
        set_sprite_prop(3, S_FLIPX);
        girl.spritids[2] = 3;

        hide_sprite(4);
        hide_sprite(5);
        hide_sprite(6);
        hide_sprite(7);
        hide_sprite(8);
        hide_sprite(9);
        hide_sprite(10);
        hide_sprite(11);
        hide_sprite(12);
        hide_sprite(13);
        hide_sprite(14);
        hide_sprite(15);

        movegirl(&girl, girl.x, girl.y);


    }

    // Sprite Assignment to Girl if facing front (State 1)
    void flipgirln()
    {
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
        

        hide_sprite(4);
        hide_sprite(5);
        hide_sprite(6);
        hide_sprite(7);
        hide_sprite(8);
        hide_sprite(9);
        hide_sprite(10);
        hide_sprite(11);
        hide_sprite(12);
        hide_sprite(13);
        hide_sprite(14);
        hide_sprite(15);

        movegirl(&girl, girl.x, girl.y);
    }

    // Sprite Assignment to Girl if facing left and walking (State 0)
    void flipgirllw()
    {
        set_sprite_tile(4, 4);
        set_sprite_prop(4, 0);
        girl.spritids[0] = 4;
        set_sprite_tile(5, 5);
        set_sprite_prop(5, 0);
        girl.spritids[1] = 5;
        set_sprite_tile(6, 6);
        set_sprite_prop(6, 0);
        girl.spritids[2] = 6;
        set_sprite_tile(7, 7);
        set_sprite_prop(7, 0);
        girl.spritids[3] = 7;

        hide_sprite(0);
        hide_sprite(1);
        hide_sprite(2);
        hide_sprite(3);
        hide_sprite(8);
        hide_sprite(9);
        hide_sprite(10);
        hide_sprite(11);
        hide_sprite(12);
        hide_sprite(13);
        hide_sprite(14);
        hide_sprite(15);
        
        movegirl(&girl, girl.x, girl.y);
    }

    // Sprite Assignment to Girl if facing left and standing (State 1)
    void flipgirlls()
    {
        set_sprite_tile(8, 8);
        set_sprite_prop(8, 0);
        girl.spritids[0] = 8;
        set_sprite_tile(9, 9);
        set_sprite_prop(9, 0);
        girl.spritids[1] = 9;
        set_sprite_tile(10, 10);
        set_sprite_prop(10, 0);
        girl.spritids[2] = 10;
        set_sprite_tile(11, 11);
        set_sprite_prop(11, 0);
        girl.spritids[3] = 11;

        hide_sprite(0);
        hide_sprite(1);
        hide_sprite(2);
        hide_sprite(3);
        hide_sprite(4);
        hide_sprite(5);
        hide_sprite(6);
        hide_sprite(7);
        hide_sprite(12);
        hide_sprite(13);
        hide_sprite(14);
        hide_sprite(15);
        
        movegirl(&girl, girl.x, girl.y);
    }

    // Sprite Assignment to Girl if facing right and walking (State 0)
    void flipgirlrw()
    {
        set_sprite_tile(4, 4);
        set_sprite_prop(4, S_FLIPX);
        girl.spritids[1] = 4;
        set_sprite_tile(5, 5);
        set_sprite_prop(5, S_FLIPX);
        girl.spritids[0] = 5;
        set_sprite_tile(6, 6);
        set_sprite_prop(6, S_FLIPX);
        girl.spritids[3] = 6;
        set_sprite_tile(7, 7);
        set_sprite_prop(7, S_FLIPX);
        girl.spritids[2] = 7;

        hide_sprite(0);
        hide_sprite(1);
        hide_sprite(2);
        hide_sprite(3);
        hide_sprite(8);
        hide_sprite(9);
        hide_sprite(10);
        hide_sprite(11);
        hide_sprite(12);
        hide_sprite(13);
        hide_sprite(14);
        hide_sprite(15); 
        
        movegirl(&girl, girl.x, girl.y);
    }

    // Sprite Assignment to Girl if facing right and standing (State 1)
    void flipgirlrs()
    {
        set_sprite_tile(8, 8);
        set_sprite_prop(8, S_FLIPX);
        girl.spritids[1] = 8;
        set_sprite_tile(9, 9);
        set_sprite_prop(9, S_FLIPX);
        girl.spritids[0] = 9;
        set_sprite_tile(10, 10);
        set_sprite_prop(10, S_FLIPX);
        girl.spritids[3] = 10;
        set_sprite_tile(11, 11);
        set_sprite_prop(11, S_FLIPX);
        girl.spritids[2] = 11;

        hide_sprite(0);
        hide_sprite(1);
        hide_sprite(2);
        hide_sprite(3);
        hide_sprite(4);
        hide_sprite(5);
        hide_sprite(6);
        hide_sprite(7);
        hide_sprite(8);
        hide_sprite(13);
        hide_sprite(14);
        hide_sprite(15);
        
        movegirl(&girl, girl.x, girl.y);
    }

    // Sprite Assignment to Girl if facing up (State 0)
    void flipgirlu()
    {
        set_sprite_tile(12, 12);
        set_sprite_prop(12, 0);
        girl.spritids[0] = 12;
        set_sprite_tile(13, 13);
        set_sprite_prop(13, 0);
        girl.spritids[1] = 13;
        set_sprite_tile(14, 14);
        set_sprite_prop(14, 0);
        girl.spritids[2] = 14;
        set_sprite_tile(15, 15);
        set_sprite_prop(15, 0);
        girl.spritids[3] = 15;
        
        hide_sprite(0);
        hide_sprite(1);
        hide_sprite(2);
        hide_sprite(3);
        hide_sprite(4);
        hide_sprite(5);
        hide_sprite(6);
        hide_sprite(7);
        hide_sprite(8);
        hide_sprite(9);
        hide_sprite(10);
        hide_sprite(11);


        movegirl(&girl, girl.x, girl.y);
    }

    // Sprite Assignment to Girl if facing up (State 1)
    void flipgirlun()
    {
        set_sprite_tile(12, 12);
        //set_sprite_prop(0, S_FLIPX);
        girl.spritids[0] = 12;
        set_sprite_tile(13, 13);
        //set_sprite_prop(1, S_FLIPX);
        girl.spritids[1] = 13;
        set_sprite_tile(14, 14);
        set_sprite_prop(14, S_FLIPX);
        girl.spritids[3] = 14;
        set_sprite_tile(15, 15);
        set_sprite_prop(15, S_FLIPX);
        girl.spritids[2] = 15;
        set_sprite_tile(3, 3);

        hide_sprite(0);
        hide_sprite(1);
        hide_sprite(2);
        hide_sprite(3);
        hide_sprite(4);
        hide_sprite(5);
        hide_sprite(6);
        hide_sprite(7);
        hide_sprite(8);
        hide_sprite(9);
        hide_sprite(10);
        hide_sprite(11);

        movegirl(&girl, girl.x, girl.y);

    }

    void setupgirl()
    {
        girl.x = 80;
        girl.y = 36;
        girl.width = 16;
        girl.height = 16;
        girl.anim = 0;

        set_sprite_tile(0, 0);
        girl.spritids[0] = 0;
        set_sprite_tile(1, 1);
        girl.spritids[1] = 1;
        set_sprite_tile(2, 2);
        girl.spritids[2] = 2;
        set_sprite_tile(3, 3);
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

        //set_sprite_palette(16, 0xE0);
        set_sprite_tile(16, 16);
        slime.spritids[0] = 16;
        
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
    set_sprite_tile(18, 18);
    sword.spritids[0] = 18;
    set_sprite_tile(19, 19);
    sword.spritids[1] = 19;
    
    //movesword(&sword, sword.x, sword.y);
}


void main()
{   
    room_0();

    while(1)
    {
        if(joypad() & J_START && gamestate == 0)
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
            setupslime();
            setupsword();

            
            OBP0_REG = 0xE0;
            OBP1_REG = 0xE0;
            SHOW_SPRITES;
            SHOW_BKG;
            SHOW_WIN;
            DISPLAY_ON;
        }
        if(joypad() & J_START && gamestate == 1)
        {
            gamestate = 2;
            DISPLAY_ON;
            HIDE_BKG;
            HIDE_SPRITES;
        }
        if(joypad() & J_START && gamestate == 2)
        {
            gamestate = 1;
            SHOW_SPRITES;
            SHOW_BKG;
            DISPLAY_OFF;
        }

        if (locktimer == 0)
        {
        if(joypad() & J_LEFT)
        {
            moveswordl(&sword, sword.x, sword.y);
            if(girl.x > MIN_GIRL_X)
            {
                moveswordl(&sword, sword.x, sword.y);
                girl.x -= 2;
                
            }
            if(girl.anim != 2 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
            {
                moveswordl(&sword, sword.x, sword.y);
                flipgirllw();
                girl.anim = 2;
            }
            else if(girl.anim != 3 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
            {
                moveswordl(&sword, sword.x, sword.y);
                flipgirlls();
                girl.anim = 3;
            }
            direction = 2;
        }
        if(joypad() & J_RIGHT)
        {
            moveswordr(&sword,sword.x, sword.y);
            if(girl.x < MAX_GIRL_X)
            {
                moveswordr(&sword,sword.x, sword.y);
                girl.x += 2;
                
            }
            
            if(girl.anim != 4 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
            {
                moveswordr(&sword, sword.x, sword.y);
                flipgirlrw();
                girl.anim = 4;
            }
            else if(girl.anim != 5 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
            {
                moveswordr(&sword, sword.x, sword.y);
                flipgirlrs();
                girl.anim = 5;
            }
            direction = 3;
        }
        if(joypad() & J_UP)
        {
            moveswordu(&sword, sword.x, sword.y);
            if(girl.y > MIN_GIRL_Y)
            {
                
                girl.y -= 2;
            }
            if(girl.anim != 6)
            {
                moveswordu(&sword, sword.x, sword.y);
                flipgirlu();
                girl.anim = 6;
            }
            else if(girl.anim != 7)
            {
                moveswordu(&sword, sword.x, sword.y);
                flipgirlun();
                girl.anim = 7;
            }
            direction = 1;
        }
        if(joypad() & J_DOWN)
        {
            moveswordd(&sword, sword.x, sword.y);
            if(girl.y < MAX_GIRL_Y)
            {
                
                girl.y += 2;
            }
            
            if(girl.anim != 0)
            {
                moveswordd(&sword, sword.x, sword.y);
                flipgirl();
                girl.anim = 0;
            }
            else if(girl.anim != 1)
            {
                moveswordd(&sword, sword.x, sword.y);
                flipgirln();
                girl.anim = 1;
            }
            direction = 0;
        }        

        if(joypad() & J_A)
        {
            attack();
        }
        }
        
        if(locktimer > 0)
        {
            sword_slimecolision();
            moveslime(&slime, slime.x, slime.y);
            locktimer++;
        }
        if(locktimer == ATTACK_LOCK_TIME)
        {
            locktimer = 0;
            swordreset();
        }

        if(slime.death == 0)
        {
            animslime();
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
        }
        spawntimer++;
        if(spawntimer == SPAWN_TIMER_MAX)
        {
            spawntimer = 0;
            slime.death = 0;
            setupslime();
        }
        girl_slimecolision();
        performantdelay(5);
        //animdelay(30);
    }
}