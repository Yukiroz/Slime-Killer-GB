#include <gb/gb.h>
#include <rand.h>
#include <stdio.h>
#include <stdint.h>
#include <types.h>
#include <gbdk/font.h>

#if !defined(__PORT_sm83)
#ifndef UINT8
typedef uint8_t UINT8;
#endif
#ifndef UINT16
typedef uint16_t UINT16;
#endif
#ifndef INT8
typedef int8_t INT8;
#endif
#endif

#include "GameCharacter.c"
#include "Girl.c"
#include "BackgroundTiles.c"
#include "BackgroundMap.c"
#include "windowmap.c"

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

// WINDOW CONSTANTS
#define DIGIT_TILE_BASE 1
#define HUD_ROW 0
#define HUD_HP_X 0
#define HUD_DMG_X 4
#define HUD_RANGE_X 8

// PLAYER SPAWN
#define PLAYER_SPAWN_X 80
#define PLAYER_SPAWN_Y 36

// ENTITY DIMENSIONS
#define GIRL_WIDTH 16
#define GIRL_HEIGHT 16
#define SLIME_WIDTH 8
#define SLIME_HEIGHT 8

// ENTITY LIMITS
#define MAX_ENEMIES 8
#define ACTIVE_ENEMY_COUNT 4

// TIMING CONSTANTS
#define ANIM_TIMER_MAX 20
#define ATTACK_LOCK_TIME 10
#define SPAWN_TIMER_MAX 1000
#define SLIME_MOVE_INTERVAL 3

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

// Window/font tile IDs (A-Z)
#define TILE_A 0x0B
#define TILE_B 0x0C
#define TILE_C 0x0D
#define TILE_D 0x0E
#define TILE_E 0x0F
#define TILE_F 0x10
#define TILE_G 0x11
#define TILE_H 0x12
#define TILE_I 0x13
#define TILE_J 0x14
#define TILE_K 0x15
#define TILE_L 0x16
#define TILE_M 0x17
#define TILE_N 0x18
#define TILE_O 0x19
#define TILE_P 0x1A
#define TILE_Q 0x1B
#define TILE_R 0x1C
#define TILE_S 0x1D
#define TILE_T 0x1E
#define TILE_U 0x1F
#define TILE_V 0x20
#define TILE_W 0x21
#define TILE_X 0x22
#define TILE_Y 0x23
#define TILE_Z 0x24

// Player stat on start constants
#define PLAYER_START_MAX_HP 6
#define PLAYER_START_DAMAGE 5
#define PLAYER_START_RANGE 5
#define PLAYER_START_SPEED 2
#define PLAYER_START_INVULN_TIME 0

// Combat constants
#define KNOCKBACK_FRAMES 6
#define KNOCKBACK_STEP 2

// Timer constants
#define INVULN_FRAMES 10
#define INVULN_FLASH_PERIOD 2 // Player flashes every frame when invulnerable


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
//   Slots 8-13:   Stat sprites (6 slots for future use: hearts, score, etc.)
//   Slots 14-21:  Placeholders (8 slots reserved for future use)
//   Slots 22-39:  Enemies (18 slots, each enemy uses 1 slot with tile animation)
//                 Currently: slime_0 (22), slime_1 (23), slime_2 (24), slime_3 (25)
//
// NOTE: Enemies now use single sprite slots with tile swapping for animation
//
// PALETTES:
//   Palette 0 (OBP0_REG): Girl and Sword colors
//   Palette 1 (OBP1_REG): Enemy colors (different from girl)
//
// ============================================

// ============================================
// GAME ENTITIES (Struct Instances)
// ============================================
struct GameCharacter girl;
struct Weapon sword;
struct Enemy slime;  // Legacy enemy (disabled, kept for reference)
struct PlayerStats player_stats;

// ============================================
// ARRAYS
// ============================================
struct Enemy enemies[MAX_ENEMIES];  // Active enemies array
UINT8 hit_this_attack[MAX_ENEMIES];  // Track which enemies were hit during current attack

// ============================================
// CONSTANTS & GLOBAL STATE
// ============================================
UINT8 gamestate = 0;
UINT8 score = 0;
UBYTE spritesize = 8;
UINT8 collision = 0;
UINT8 pad = 2;
UINT8 animtimer = 0;
UINT8 locktimer = 0;
UINT8 spawntimer = 0;
UINT8 movetimer = 0;
UINT8 direction = 0; // 0 = down, 1 = up, 2 = left, 3 = right
UINT8 room = 0;
UINT8 prev_pad = 0;
UINT8 spawned_enemies = 0;
//Knockback variables
UINT8 knockback_timer = 0;
INT8 knockback_dx = 0;
INT8 knockback_dy = 0;

// Forward Declarations
void performantdelay(UINT8 numloops);
void character_enemy_collision(struct GameCharacter* character, struct Enemy* enemy);
void hide_character_sprites(struct GameCharacter* character);
void weapon_enemy_collision(struct Weapon* weapon, struct Enemy* enemy, UINT8 enemy_index);
void move_weapon(struct Weapon* weapon, struct GameCharacter* owner);
void animate_enemy(struct Enemy* enemy, UINT8 tile0, UINT8 tile1);
void enemy_check_borders(struct Enemy* enemy);
void character_set_sprite(struct GameCharacter* character, UINT8 anim_state);
void move_enemy_small(struct Enemy* character, UINT8 x, UINT8 y);
void move_player(struct GameCharacter* character, UINT8 x, UINT8 y);
void setup_character(struct GameCharacter* character, UINT8 x, UINT8 y);
void setup_player(void);
void setupslime(void);
void setupsword(void);
void setup_enemy(struct Enemy* enemy, UINT8 oam_slot, UINT8 x, UINT8 y);
void attack(struct GameCharacter* owner, struct Weapon* weapon);
void swordreset(struct GameCharacter* owner, struct Weapon* weapon);
void move_sword_sprites_from_position(struct Weapon* weapon);
void room_0(void);
void init_character_stats(struct PlayerStats* stats,
                         UINT8 max_health,
                         UINT8 damage,
                         UINT8 range,
                         UINT8 speed,
                         UINT8 invuln_time);
void init_player_stats(void);
UINT8 player_take_damage(UINT8 amount);
void update_timers(struct GameCharacter* player, struct Weapon* weapon);
void write_window_2digits(UINT8 value, UINT8 x, UINT8 y);
void update_window_stats_ui(void);
void slime_ai(struct GameCharacter* girl, struct Enemy* enemy);
void slime_can_move(struct Enemy* enemy, struct GameCharacter* target);

void slime_can_move(struct Enemy* enemy, struct GameCharacter* target)
{

    if(enemy->move_timer == SLIME_MOVE_INTERVAL)
    {
        enemy->move_timer = 0;
        slime_ai(target, enemy);
        enemy_check_borders(enemy);
        move_enemy_small(enemy, enemy->x, enemy->y);        
    }
    enemy->move_timer++;
}


void slime_ai(struct GameCharacter* character, struct Enemy* enemy)
{
    if (character->x > enemy->x)
    {
        enemy->x++;
    }
    if (character->x < enemy->x)
    {
        enemy->x--;
    }
    if (character-> y> enemy->y)
    {
        enemy->y++;
    }
    if (character->y < enemy->y)
    {
        enemy->y--;
    }    
}
void update_window_stats_ui(void)
{
    set_win_tile_xy(HUD_HP_X, HUD_ROW, TILE_H); // HP label (heart tile)
    set_win_tile_xy(HUD_HP_X + 1, HUD_ROW, TILE_P); 
    write_window_2digits(player_stats.current_health, HUD_HP_X + 2, HUD_ROW);
    //write_window_2digits(player_stats.damage, HUD_DMG_X, HUD_ROW);
    //write_window_2digits(player_stats.range, HUD_RANGE_X, HUD_ROW);
}

void write_window_2digits(UINT8 value, UINT8 x, UINT8 y)
{
    // Write a two-digit number to the window at the specified position
    // If value is less than 10, it will display as "0X"
    UINT8 tens = value / 10;
    UINT8 ones = value % 10;
    
    set_win_tile_xy(x, y, DIGIT_TILE_BASE + tens);
    set_win_tile_xy(x + 1, y, DIGIT_TILE_BASE + ones);
}
UINT8 player_take_damage(UINT8 amount)
{
    if(player_stats.invuln_timer == 0 && player_stats.is_dead == 0)
    {
        if(amount >= player_stats.current_health)
        {
            player_stats.current_health = 0;
            player_stats.is_dead = 1;
        }
        else
        {
            player_stats.current_health -= amount;
        }
        player_stats.invuln_timer = INVULN_FRAMES;
        return 1;
    }
    return 0;
}            
void init_player_stats(void)
{
    init_character_stats(&player_stats,
                         PLAYER_START_MAX_HP,
                         PLAYER_START_DAMAGE,
                         PLAYER_START_RANGE,
                         PLAYER_START_SPEED,
                         PLAYER_START_INVULN_TIME);
}

void init_character_stats(struct PlayerStats* stats,
                         UINT8 max_health,
                         UINT8 damage,
                         UINT8 range,
                         UINT8 speed,
                         UINT8 invuln_time)
{
    stats->max_health = max_health;
    stats->current_health = max_health;
    stats->damage = damage;
    stats->range = range;
    stats->speed = speed;
    stats->invuln_timer = invuln_time;
    stats->is_dead = 0;
}

void update_timers(struct GameCharacter* player, struct Weapon* weapon)
{
    if(player_stats.invuln_timer > 0 && player_stats.is_dead == 0)
    {
        player_stats.invuln_timer--;
    }

    if(knockback_timer > 0 && player_stats.is_dead == 0)
    {
        player->x += knockback_dx;
        player->y += knockback_dy;

        if(player->x < MIN_GIRL_X)
        {
            player->x = MIN_GIRL_X;
        }
        if(player->x > MAX_GIRL_X)
        {
            player->x = MAX_GIRL_X;
        }
        if(player->y < MIN_GIRL_Y)
        {
            player->y = MIN_GIRL_Y;
        }
        if(player->y > MAX_GIRL_Y)
        {
            player->y = MAX_GIRL_Y;
        }

        if(locktimer == 0)
        {
            move_weapon(weapon, player);
        }
        else
        {
            weapon->x += knockback_dx;
            weapon->y += knockback_dy;
            move_sword_sprites_from_position(weapon);
        }

        knockback_timer--;
    }

    if(locktimer == ATTACK_LOCK_TIME)
    {
        locktimer = 0;
        swordreset(player, weapon);
    }

    if(locktimer > 0)
    {
        for(UINT8 i = 0; i < ACTIVE_ENEMY_COUNT; i++)
        {
            weapon_enemy_collision(weapon, &enemies[i], i);
        }
        locktimer++;
    }

    if(player_stats.is_dead == 1)
    {
        hide_character_sprites(player);
    }
    else if(player_stats.invuln_timer > 0)
    {
        if(player_stats.invuln_timer % INVULN_FLASH_PERIOD == 0)
        {
            hide_character_sprites(player);
        }
        else
        {
            move_player(player, player->x, player->y);
        }
    }
    else
    {
        move_player(player, player->x, player->y);
    }

    if(player_stats.is_dead == 0 && locktimer == 0)
    {
        move_weapon(weapon, player);
    }
}

void setup_enemy(struct Enemy* enemy, UINT8 oam_slot, UINT8 x, UINT8 y)
{
    enemy->x = x;
    enemy->y = y;
    enemy->width = 8;
    enemy->height = 8;
    enemy->anim = 0;
    enemy->death = 0;
    
    set_sprite_tile(oam_slot, 16);
    set_sprite_prop(oam_slot, ENEMY_PALETTE);
    enemy->spritids[0] = oam_slot;
    
    move_enemy_small(enemy, x, y);
}

//Room 0 Function
void room_0(void)
{
    setup_enemy(&enemies[0], 22, 26, 50);   // Left top
    setup_enemy(&enemies[1], 23, 26, 70);   // Left bottom
    setup_enemy(&enemies[2], 24, 134, 50);  // Right top
    setup_enemy(&enemies[3], 25, 134, 70);  // Right bottom
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

void character_enemy_collision(struct GameCharacter* character, struct Enemy* enemy)
    {
        // Only check collision if enemy is alive
        if(enemy->death == 1)
        {
            return;
        }
        
        if (character->x < enemy->x + enemy->width - pad &&
        character->x + character->width - pad > enemy->x &&
        character->y < enemy->y + enemy->height - pad &&
        character->y + character->height - pad > enemy->y)
        {
            UINT8 took_damage = player_take_damage(1);
            if(took_damage)
            {
                UINT8 dx = (character->x > enemy->x) ? (character->x - enemy->x) : (enemy->x - character->x);
                UINT8 dy = (character->y > enemy->y) ? (character->y - enemy->y) : (enemy->y - character->y);

                if (character->x < enemy->x)
                {
                    knockback_dx = -KNOCKBACK_STEP;
                }
                else
                {
                    knockback_dx = KNOCKBACK_STEP;
                }
                if (character->y < enemy->y)
                {
                    knockback_dy = -KNOCKBACK_STEP;
                }
                else
                {
                    knockback_dy = KNOCKBACK_STEP;
                }

                if (dx < dy)
                {
                    knockback_dy = 0;
                }
                else
                {
                    knockback_dx = 0;
                }

                knockback_timer = KNOCKBACK_FRAMES;
            }
        }
    }

void hide_character_sprites(struct GameCharacter* character)
    {
        for(UINT8 i = 0; i < 4; i++)
        {
            hide_sprite(character->spritids[i]);
        }
    }
void weapon_enemy_collision(struct Weapon* weapon, struct Enemy* enemy, UINT8 enemy_index)
    {
        // Only check collision if enemy is alive
        if(enemy->death == 1)
        {
            return;
        }
        
        // Only hit each enemy once per attack
        if(hit_this_attack[enemy_index] == 1)
        {
            return;
        }
        
        // Sword uses 2 sprites, so we need to check a larger collision box
        // For left/right: 16 wide x 8 tall (extends 8px left from sword.x)
        // For up/down: 8 wide x 16 tall (extends 8px up from sword.y)
        
        UINT8 collision_x = weapon->x;
        UINT8 collision_y = weapon->y;
        UINT8 collision_width = weapon->width;
        UINT8 collision_height = weapon->height;
        
        // Adjust collision box based on direction
        if(direction == 2 || direction == 3) // left or right
        {
            collision_x = weapon->x - 8;  // Start 8px to the left
            collision_width = 16;  // 2 sprites wide
        }
        else // up or down
        {
            collision_y = weapon->y - 8;  // Start 8px up
            collision_height = 16;  // 2 sprites tall
        }
        
        if (collision_x < enemy->x + enemy->width &&
        collision_x + collision_width > enemy->x &&
        collision_y < enemy->y + enemy->height &&
        collision_y + collision_height > enemy->y)
        {
            {
                hit_this_attack[enemy_index] = 1;
                enemy->death = 1;
                enemy->x = 0;
                enemy->y = 0;
                score = score ++;
            }
        }
    }
void move_player(struct GameCharacter* character, UINT8 x, UINT8 y)
    {
        move_sprite(character->spritids[0], x, y);
        move_sprite(character->spritids[1], x + spritesize, y);
        move_sprite(character->spritids[2], x, y + spritesize);
        move_sprite(character->spritids[3], x + spritesize, y + spritesize);
    }
void move_weapon(struct Weapon* weapon, struct GameCharacter* owner)
    {
        // Uses global direction variable: 0=down, 1=up, 2=left, 3=right
        // All directions now use OAM slots 4-5
        if(direction == 2) // left
        {
            weapon->x = owner->x;
            weapon->y = owner->y + 8;
            set_sprite_tile(4, 18);
            set_sprite_prop(4, 0);
            weapon->spritids[0] = 4;
            set_sprite_tile(5, 19);
            set_sprite_prop(5, 0);
            weapon->spritids[1] = 5;
            move_sprite(weapon->spritids[0], weapon->x, weapon->y);
            move_sprite(weapon->spritids[1], weapon->x - spritesize, weapon->y);
        }
        else if(direction == 3) // right
        {
            weapon->x = owner->x + 18;
            weapon->y = owner->y + 8;
            set_sprite_tile(4, 18);
            set_sprite_prop(4, S_FLIPX);
            weapon->spritids[1] = 4;
            set_sprite_tile(5, 19);
            set_sprite_prop(5, S_FLIPX);
            weapon->spritids[0] = 5;
            move_sprite(weapon->spritids[0], weapon->x, weapon->y);
            move_sprite(weapon->spritids[1], weapon->x - spritesize, weapon->y);
        }
        else if(direction == 1) // up
        {
            weapon->x = owner->x + 9;
            weapon->y = owner->y + 3;
            set_sprite_tile(4, 20);
            set_sprite_prop(4, S_FLIPX);
            weapon->spritids[0] = 4;
            set_sprite_tile(5, 21);
            set_sprite_prop(5, S_FLIPX);
            weapon->spritids[1] = 5;
            move_sprite(weapon->spritids[0], weapon->x, weapon->y);
            move_sprite(weapon->spritids[1], weapon->x, weapon->y - spritesize);
        }
        else if(direction == 0) // down
        {
            weapon->x = owner->x - 2;
            weapon->y = owner->y + 18;
            set_sprite_tile(4, 20);
            set_sprite_prop(4, S_FLIPY);
            weapon->spritids[1] = 4;
            set_sprite_tile(5, 21);
            set_sprite_prop(5, S_FLIPY);
            weapon->spritids[0] = 5;
            move_sprite(weapon->spritids[0], weapon->x, weapon->y);
            move_sprite(weapon->spritids[1], weapon->x, weapon->y - spritesize);
        }
    }

void move_sword_sprites_from_position(struct Weapon* weapon)
    {
        if(direction == 2 || direction == 3)
        {
            move_sprite(weapon->spritids[0], weapon->x, weapon->y);
            move_sprite(weapon->spritids[1], weapon->x - spritesize, weapon->y);
        }
        else
        {
            move_sprite(weapon->spritids[0], weapon->x, weapon->y);
            move_sprite(weapon->spritids[1], weapon->x, weapon->y - spritesize);
        }
    }

void attack(struct GameCharacter* owner, struct Weapon* weapon)
    {
        // Reset hit tracking for new attack
        for(UINT8 i = 0; i < MAX_ENEMIES; i++)
        {
            hit_this_attack[i] = 0;
        }
        
        move_weapon(weapon, owner);

        if(direction == 2) // left
        {
            weapon->x -= 8;
        }
        else if(direction == 3) // right
        {
            weapon->x += 8;
        }
        else if(direction == 1) // up
        {
            weapon->y -= 8;
        }
        else // down
        {
            weapon->y += 8;
        }

        move_sword_sprites_from_position(weapon);

        if (locktimer == 0)
        {
            locktimer ++;
        }
    }
void swordreset(struct GameCharacter* owner, struct Weapon* weapon)
    {
        // Reset hit tracking for next attack
        for(UINT8 i = 0; i < MAX_ENEMIES; i++)
        {
            hit_this_attack[i] = 0;
        }

        move_weapon(weapon, owner);
    }
void move_enemy_small(struct Enemy* character, UINT8 x, UINT8 y)
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
        
        character->anim = anim_state;  // Set animation state in struct
        
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
        
        move_player(character, character->x, character->y);
    }

void setup_character(struct GameCharacter* character, UINT8 x, UINT8 y)
    {
        character->x = x;
        character->y = y;
        character->width = 16;
        character->height = 16;
        character->anim = 0;

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
        
        move_player(character, character->x, character->y);
    }

void setup_player(void)
    {
        setup_character(&girl, PLAYER_SPAWN_X, PLAYER_SPAWN_Y);
    }

void setupslime(void)
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
        
        move_enemy_small(&slime, slime.x, slime.y);
    }

void setupsword(void)
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


void main(void)
{   
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
                setup_player();
                init_player_stats();
                update_window_stats_ui();
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
        struct GameCharacter* active_player = &girl;
        
        if(player_stats.is_dead == 0 && locktimer == 0 && knockback_timer == 0)
        {
        if(joypad() & J_LEFT)
        {
            direction = 2;
            move_weapon(&sword, active_player);
            if(active_player->x > MIN_GIRL_X)
            {
                active_player->x -= 2;
                
            }
            if(active_player->anim != 2 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
            {
                character_set_sprite(active_player, 2);
            }
            else if(active_player->anim != 3 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
            {
                character_set_sprite(active_player, 3);
            }
        }
        if(joypad() & J_RIGHT)
        {
            direction = 3;
            move_weapon(&sword, active_player);
            if(active_player->x < MAX_GIRL_X)
            {
                active_player->x += 2;
                
            }
            
            if(active_player->anim != 4 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
            {
                character_set_sprite(active_player, 4);
            }
            else if(active_player->anim != 5 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
            {
                character_set_sprite(active_player, 5);
            }
        }
        if(joypad() & J_UP)
        {
            direction = 1;
            move_weapon(&sword, active_player);
            if(active_player->y > MIN_GIRL_Y)
            {
                
                active_player->y -= 2;
            }
            if(active_player->anim != 6)
            {
                character_set_sprite(active_player, 6);
            }
            else if(active_player->anim != 7)
            {
                character_set_sprite(active_player, 7);
            }
        }
        if(joypad() & J_DOWN)
        {
            direction = 0;
            move_weapon(&sword, active_player);
            if(active_player->y < MAX_GIRL_Y)
            {
                
                active_player->y += 2;
            }
            
            if(active_player->anim != 0)
            {
                character_set_sprite(active_player, 0);
            }
            else if(active_player->anim != 1)
            {
                character_set_sprite(active_player, 1);
            }
        }        

        if(joypad() & J_A && !(prev_pad & J_A))
        {
            attack(active_player, &sword);
        }
        }

        if(player_stats.is_dead == 1)
        {
            hide_character_sprites(active_player);
        }
        
        update_timers(active_player, &sword);

        
        // Animate all enemies
        for(UINT8 i = 0; i < ACTIVE_ENEMY_COUNT; i++)
        {
            if(enemies[i].death == 0)
            {
                slime_can_move(&enemies[i], active_player);
                animate_enemy(&enemies[i], 16, 17);
            }
            else if(enemies[i].death == 1)
            {
                enemies[i].x = 0;
                enemies[i].y = 0;
                move_enemy_small(&enemies[i], 0, 0);
            }
        }
        
        // Animation timer for all enemies
        animtimer++;
        if(animtimer == ANIM_TIMER_MAX)
        {
            animtimer = 0;
            for(UINT8 i = 0; i < ACTIVE_ENEMY_COUNT; i++)
            {
                enemies[i].anim = (enemies[i].anim == 0) ? 1 : 0;
            }
        }
        
        // Character collision with all enemies
        if(player_stats.is_dead == 0)
        {
            for(UINT8 i = 0; i < ACTIVE_ENEMY_COUNT; i++)
            {
                character_enemy_collision(active_player, &enemies[i]);
            }
        }
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
            move_enemy_small(&slime, slime.x, slime.y);
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
        update_window_stats_ui();
        performantdelay(5);
        //animdelay(30);
    }
}