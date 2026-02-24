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
#include "Boss.c"
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
#define HUD_DMG_X 5
#define HUD_RANGE_X 10
#define PAUSE_ROW 1
#define PAUSE_TEXT_X 7
#define ROOM_CLEAR_ROW 1
#define ROOM_CLEAR_X 5
#define ROOM_CLEAR_SHOW_FRAMES 15
#define READY_ROW 1
#define READY_X 7
#define REWARD_ROW 1
#define REWARD_X 7
#define STAGE_X 15

// TITLE SCREEN CONSTANTS
#define TITLE_X 4
#define TITLE_Y 6
#define START_X 5
#define START_Y 10
#define START_FLASH_FRAMES 4

// PLAYER SPAWN
#define PLAYER_SPAWN_X 80
#define PLAYER_SPAWN_Y 36

// ENTITY DIMENSIONS
#define GIRL_WIDTH 16
#define GIRL_HEIGHT 16
#define SLIME_WIDTH 8
#define SLIME_HEIGHT 8
#define SLIME_BASE_HP 10
#define BOSS_BASE_HP 100

// ENTITY LIMITS
#define MAX_ENEMIES 10
#define ACTIVE_ENEMY_COUNT 6
// update this when adding new room functions; originally 3 for 0-2
#define TOTAL_ROOMS 6

// TIMING CONSTANTS
#define ANIM_TIMER_MAX 20
#define ATTACK_LOCK_TIME 10
#define SPAWN_TIMER_MAX 1000
#define SLIME_MOVE_INTERVAL 3
#define SLIME_MOVE_INTERVAL_FAST 1
#define ENEMY_START_DELAY_FRAMES 15
#define SWORD_LUNGE_FRAMES 3
#define SWORD_LUNGE_MAX_OFFSET 8
#define PLAYER_LUNGE_STEP 3
#define TRANSITION_COOLDOWN_FRAMES 10

// SPAWNING BOUNDARIES
#define SPAWN_MIN_X 32
#define SPAWN_MAX_X 128
#define SPAWN_MIN_Y 44
#define SPAWN_MAX_Y 120

// RESPAWN TOGGLE (set to 0 to disable enemy respawning)
#define ENABLE_RESPAWN 0

// ENEMY MOVEMENT BOUNDARIES
#define MIN_ENEMY_X 24
#define MAX_ENEMY_X 144
#define MIN_ENEMY_Y 28
#define MAX_ENEMY_Y 120

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

// ENEMY TYPES
#define ENEMY_TYPE_SLIME 0
#define ENEMY_TYPE_BOSS 1

// BOSS BEHAVIOR
#define BOSS_SPAWN_MIN_FRAMES 20
#define BOSS_SPAWN_MAX_FRAMES 30
#define BOSS_MAX_SLIMES 6
#define BOSS_DEATH_SLIMES 4
#define BOSS_ATTACK_COOLDOWN 60  // Frames between attacks
#define BOSS_ATTACK_ANIM_FRAMES 5  // Number of animation frames before attack
#define BOSS_ATTACK_FRAME_DURATION 8  // Frames per animation frame

// SLIME JUMP BEHAVIOR
#define SLIME_JUMP_COOLDOWN 20  // Frames between jumps
#define SLIME_JUMP_DISTANCE 16  // Maximum jump distance in pixels

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
#define PLAYER_START_SPEED 3
#define PLAYER_START_INVULN_TIME 0
#define PLAYER_MAX_HP_CAP 30
#define PLAYER_SPEED_CAP (PLAYER_START_SPEED + 3)
#define HP_REWARD_AMOUNT 2
#define DMG_REWARD_AMOUNT 2
#define SPEED_REWARD_AMOUNT 1

#define REWARD_HP 0
#define REWARD_DMG 1
#define REWARD_SPEED 2

// Combat constants
#define KNOCKBACK_FRAMES 6
#define KNOCKBACK_STEP 2
#define ENEMY_KNOCKBACK_STEP 8

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

// stage tracking
UINT8 stage = 1;                // displayed stage number (1-based)
UINT8 enemy_hp_multiplier = 1;  // doubles each room clear

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
UINT8 current_enemy_count = 4;
UINT8 prev_pad = 0;
UINT8 spawned_enemies = 0;
UINT8 title_flash_timer = 0;
UINT8 title_flash_visible = 1;
UINT8 enemy_start_delay_timer = 0;
UINT8 room_cleared = 0;
UINT8 reward_active = 0;
UINT8 reward_claimed = 0;
UINT8 can_transition = 0;
UINT8 reward_type = REWARD_HP;
UINT8 room_clear_timer = 0;
UINT8 transition_cooldown_timer = 0;
font_t ui_font;
//Knockback variables
UINT8 knockback_timer = 0;
INT8 knockback_dx = 0;
INT8 knockback_dy = 0;

// Forward Declarations
void performantdelay(UINT8 numloops);
void character_enemy_collision(struct GameCharacter* character, struct Enemy* enemy);
void hide_character_sprites(struct GameCharacter* character);
void hide_sword_sprites(struct Weapon* weapon);
void hide_enemy_sprites(struct Enemy* enemy);
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
void setup_enemy(struct Enemy* enemy, UINT8 oam_slot, UINT8 x, UINT8 y, UINT8 type);
void attack(struct GameCharacter* owner, struct Weapon* weapon);
void swordreset(struct GameCharacter* owner, struct Weapon* weapon);
void move_sword_sprites_from_position(struct Weapon* weapon);
void room_0(void);
void room_1(void);
void room_2(void);
void room_3(void);
void room_4(void);
void room_5(void);
void load_room(UINT8 room_id);
void init_character_stats(struct PlayerStats* stats,
                         UINT8 max_health,
                         UINT8 damage,
                         UINT8 range,
                         UINT8 speed,
                         UINT8 invuln_time);
void init_player_stats(void);
UINT8 player_take_damage(UINT8 amount);
void audio_init(void);
void sfx_swing(void);
void sfx_enemy_hit(void);
void sfx_player_hurt(void);
void update_timers(struct GameCharacter* player, struct Weapon* weapon);
void write_window_2digits(UINT8 value, UINT8 x, UINT8 y);
void update_window_stats_ui(void);
void show_pause_ui(void);
void hide_pause_ui(void);
void show_room_clear_ui(void);
void hide_room_clear_ui(void);
void show_ready_ui(void);
void hide_ready_ui(void);
void show_reward_ui(UINT8 reward);
void hide_reward_ui(void);
void show_game_over_ui(void);
void roll_room_reward(void);
void apply_reward(UINT8 reward);
void draw_press_start(UINT8 visible);
void init_title_screen(void);
void update_title_screen(void);
void slime_ai(struct GameCharacter* girl, struct Enemy* enemy);
void boss_ai(struct GameCharacter* player, struct Enemy* boss);
void slime_can_move(struct Enemy* enemy, struct GameCharacter* target);
void resolve_enemy_collisions(void);
UINT8 count_alive_slimes(void);
void spawn_slime_near_boss(struct Enemy* boss);
void spawn_boss_death_slimes(struct Enemy* boss);

void draw_press_start(UINT8 visible)
{
    const UINT8 press_start_tiles[11] = {
        TILE_P, TILE_R, TILE_E, TILE_S, TILE_S,
        0,
        TILE_S, TILE_T, TILE_A, TILE_R, TILE_T
    };

    for(UINT8 i = 0; i < 11; i++)
    {
        set_bkg_tile_xy(START_X + i, START_Y, visible ? press_start_tiles[i] : 0);
    }
}

void init_title_screen(void)
{
    font_init();
    ui_font = font_load(font_min);
    font_set(ui_font);

    for(UINT8 y = 0; y < 18; y++)
    {
        for(UINT8 x = 0; x < 20; x++)
        {
            set_bkg_tile_xy(x, y, 0);
        }
    }

    set_bkg_tile_xy(TITLE_X + 0, TITLE_Y, TILE_S);
    set_bkg_tile_xy(TITLE_X + 1, TITLE_Y, TILE_L);
    set_bkg_tile_xy(TITLE_X + 2, TITLE_Y, TILE_I);
    set_bkg_tile_xy(TITLE_X + 3, TITLE_Y, TILE_M);
    set_bkg_tile_xy(TITLE_X + 4, TITLE_Y, TILE_E);
    set_bkg_tile_xy(TITLE_X + 5, TITLE_Y, 0);
    set_bkg_tile_xy(TITLE_X + 6, TITLE_Y, TILE_K);
    set_bkg_tile_xy(TITLE_X + 7, TITLE_Y, TILE_I);
    set_bkg_tile_xy(TITLE_X + 8, TITLE_Y, TILE_L);
    set_bkg_tile_xy(TITLE_X + 9, TITLE_Y, TILE_L);
    set_bkg_tile_xy(TITLE_X + 10, TITLE_Y, TILE_E);
    set_bkg_tile_xy(TITLE_X + 11, TITLE_Y, TILE_R);

    draw_press_start(1);
    title_flash_timer = 0;
    title_flash_visible = 1;

    HIDE_WIN;
    SHOW_BKG;
    DISPLAY_ON;
}

void update_title_screen(void)
{
    title_flash_timer++;
    if(title_flash_timer >= START_FLASH_FRAMES)
    {
        title_flash_timer = 0;
        title_flash_visible = !title_flash_visible;
        draw_press_start(title_flash_visible);
    }
}

void slime_can_move(struct Enemy* enemy, struct GameCharacter* target)
{
    // Fast interval in early rooms and the two intermediate rooms (3 & 4)
    // normal (slower) interval in boss room and later
    UINT8 move_interval;
    if(room < 2 || room == 3 || room == 4 || room == 5)
    {
        move_interval = SLIME_MOVE_INTERVAL_FAST;
    }
    else
    {
        move_interval = SLIME_MOVE_INTERVAL;
    }
    
    if(enemy->move_timer == move_interval)
    {
        enemy->move_timer = 0;
        
        // Use appropriate AI based on enemy type
        if(enemy->type == ENEMY_TYPE_SLIME)
        {
            slime_ai(target, enemy);
        }
        else if(enemy->type == ENEMY_TYPE_BOSS)
        {
            boss_ai(target, enemy);
            
            // Handle boss spawning slimes
            if(enemy->spawn_timer > 0)
            {
                enemy->spawn_timer--;
            }
            else
            {
                // Check if we can spawn more slimes (max 6)
                UINT8 slime_count = count_alive_slimes();
                if(slime_count < BOSS_MAX_SLIMES)
                {
                    spawn_slime_near_boss(enemy);
                }
                
                // Reset spawn timer for next spawn
                enemy->spawn_timer = BOSS_SPAWN_MIN_FRAMES + (rand() % (BOSS_SPAWN_MAX_FRAMES - BOSS_SPAWN_MIN_FRAMES + 1));
            }
        }
        
        enemy_check_borders(enemy);
        move_enemy_small(enemy, enemy->x, enemy->y);        
    }
    enemy->move_timer++;
}

void resolve_enemy_collisions(void)
{
    for(UINT8 i = 0; i < current_enemy_count; i++)
    {
        if(enemies[i].death == 1)
        {
            continue;
        }

        for(UINT8 j = i + 1; j < current_enemy_count; j++)
        {
            if(enemies[j].death == 1)
            {
                continue;
            }

            if(enemies[i].x < enemies[j].x + enemies[j].width &&
               enemies[i].x + enemies[i].width > enemies[j].x &&
               enemies[i].y < enemies[j].y + enemies[j].height &&
               enemies[i].y + enemies[i].height > enemies[j].y)
            {
                INT8 dx = (INT8)enemies[i].x - (INT8)enemies[j].x;
                INT8 dy = (INT8)enemies[i].y - (INT8)enemies[j].y;
                UINT8 abs_dx = (dx < 0) ? (UINT8)(-dx) : (UINT8)dx;
                UINT8 abs_dy = (dy < 0) ? (UINT8)(-dy) : (UINT8)dy;

                if(abs_dx >= abs_dy)
                {
                    if(dx >= 0)
                    {
                        enemies[i].x++;
                        enemies[j].x--;
                    }
                    else
                    {
                        enemies[i].x--;
                        enemies[j].x++;
                    }
                }
                else
                {
                    if(dy >= 0)
                    {
                        enemies[i].y++;
                        enemies[j].y--;
                    }
                    else
                    {
                        enemies[i].y--;
                        enemies[j].y++;
                    }
                }

                enemy_check_borders(&enemies[i]);
                enemy_check_borders(&enemies[j]);
            }
        }
    }
}


void slime_ai(struct GameCharacter* character, struct Enemy* enemy)
{
    // Jumper AI - slimes jump toward the player periodically
    if(enemy->jump_timer > 0)
    {
        enemy->jump_timer--;
        
        // Move toward jump target
        if(enemy->x != enemy->jump_target_x || enemy->y != enemy->jump_target_y)
        {
            // Fast movement toward target (4 pixels per frame)
            UINT8 moved = 0;
            for(UINT8 step = 0; step < 4; step++)
            {
                if(enemy->jump_target_x > enemy->x)
                {
                    enemy->x++;
                    moved = 1;
                }
                else if(enemy->jump_target_x < enemy->x)
                {
                    enemy->x--;
                    moved = 1;
                }
                
                if(enemy->jump_target_y > enemy->y)
                {
                    enemy->y++;
                    moved = 1;
                }
                else if(enemy->jump_target_y < enemy->y)
                {
                    enemy->y--;
                    moved = 1;
                }
                
                // Stop if we reached the target
                if(enemy->x == enemy->jump_target_x && enemy->y == enemy->jump_target_y)
                {
                    break;
                }
            }
            
            // Show jumping animation (frame 2) when moving
            enemy->anim = 1;
        }
        else
        {
            // Standing still - show idle animation (frame 1)
            enemy->anim = 0;
        }
    }
    else
    {
        // Jump cooldown complete - calculate new jump target toward player
        enemy->jump_timer = SLIME_JUMP_COOLDOWN  + (rand() % 5); // Add randomness (0-4 frames);
        
        // Calculate direction to player
        INT8 dx = (INT8)character->x - (INT8)enemy->x;
        INT8 dy = (INT8)character->y - (INT8)enemy->y;
        
        // Normalize and scale to jump distance
        if(dx > SLIME_JUMP_DISTANCE) dx = SLIME_JUMP_DISTANCE;
        if(dx < -SLIME_JUMP_DISTANCE) dx = -SLIME_JUMP_DISTANCE;
        if(dy > SLIME_JUMP_DISTANCE) dy = SLIME_JUMP_DISTANCE;
        if(dy < -SLIME_JUMP_DISTANCE) dy = -SLIME_JUMP_DISTANCE;
        
        // Set jump target
        enemy->jump_target_x = enemy->x + dx;
        enemy->jump_target_y = enemy->y + dy;
        
        // Show jumping animation when starting new jump
        enemy->anim = 1;
    }
}

void boss_ai(struct GameCharacter* player, struct Enemy* boss)
{
    // Handle attack animation timing
    if(boss->attack_timer > 0)
    {
        boss->attack_timer--;
        
        // Update animation frame based on timer
        // Calculate which frame we should be on (0-4)
        UINT8 total_anim_time = BOSS_ATTACK_ANIM_FRAMES * BOSS_ATTACK_FRAME_DURATION;
        if(boss->attack_timer < total_anim_time)
        {
            // During attack animation
            UINT8 time_into_anim = total_anim_time - boss->attack_timer;
            boss->attack_anim_frame = time_into_anim / BOSS_ATTACK_FRAME_DURATION;
            if(boss->attack_anim_frame >= BOSS_ATTACK_ANIM_FRAMES)
            {
                boss->attack_anim_frame = BOSS_ATTACK_ANIM_FRAMES - 1;
            }
        }
        else
        {
            // Not attacking yet, stay in idle
            boss->attack_anim_frame = 0;
        }
    }
    else
    {
        // Attack! Reset timer and animation
        boss->attack_timer = BOSS_ATTACK_COOLDOWN;
        boss->attack_anim_frame = 0;
    }
    
    // Chase AI - move toward player
    if (player->x > boss->x)
    {
        boss->x++;
    }
    if (player->x < boss->x)
    {
        boss->x--;
    }
    if (player->y > boss->y)
    {
        boss->y++;
    }
    if (player->y < boss->y)
    {
        boss->y--;
    }
}

UINT8 count_alive_slimes(void)
{
    UINT8 count = 0;
    for(UINT8 i = 0; i < MAX_ENEMIES; i++)
    {
        if(enemies[i].death == 0 && enemies[i].type == ENEMY_TYPE_SLIME)
        {
            count++;
        }
    }
    return count;
}

void spawn_slime_near_boss(struct Enemy* boss)
{
    // Find first available enemy slot
    for(UINT8 i = 0; i < MAX_ENEMIES; i++)
    {
        if(enemies[i].death == 1)
        {
            // Found empty slot - spawn slime near boss (with some offset)
            INT8 offset_x = (rand() % 32) - 16;  // Random offset -16 to +16
            INT8 offset_y = (rand() % 32) - 16;

            // Calculate spawn position with safe clamping
            UINT8 spawn_x, spawn_y;

            // Handle X coordinate
            if(offset_x < 0 && boss->x < (UINT8)(-offset_x))
            {
                spawn_x = SPAWN_MIN_X;  // Would underflow
            }
            else
            {
                spawn_x = boss->x + offset_x;
            }

            // Handle Y coordinate
            if(offset_y < 0 && boss->y < (UINT8)(-offset_y))
            {
                spawn_y = SPAWN_MIN_Y;  // Would underflow
            }
            else
            {
                spawn_y = boss->y + offset_y;
            }

            // Clamp to valid spawn range
            if(spawn_x < SPAWN_MIN_X) spawn_x = SPAWN_MIN_X;
            if(spawn_x > SPAWN_MAX_X) spawn_x = SPAWN_MAX_X;
            if(spawn_y < SPAWN_MIN_Y) spawn_y = SPAWN_MIN_Y;
            if(spawn_y > SPAWN_MAX_Y) spawn_y = SPAWN_MAX_Y;

            // Validate OAM slot range
            UINT8 oam_slot = 26 + i;
            if(oam_slot > 37) {
                continue; // Skip invalid OAM slots
            }

            setup_enemy(&enemies[i], oam_slot, spawn_x, spawn_y, ENEMY_TYPE_SLIME);
            current_enemy_count++;
            break;  // Only spawn one slime per call
        }
    }
}

void spawn_boss_death_slimes(struct Enemy* boss)
{
    UINT8 spawned = 0;
    const INT8 offsets[4][2] = {
        {-12, -12},  // Top-left
        {12, -12},   // Top-right
        {-12, 12},   // Bottom-left
        {12, 12}     // Bottom-right
    };
    
    // Find boss index to skip it when spawning
    UINT8 boss_index = MAX_ENEMIES;
    for(UINT8 i = 0; i < MAX_ENEMIES; i++)
    {
        if(&enemies[i] == boss)
        {
            boss_index = i;
            break;
        }
    }
    
    for(UINT8 i = 0; i < MAX_ENEMIES && spawned < BOSS_DEATH_SLIMES; i++)
    {
        // Skip the boss's own slot to avoid sprite ID conflicts
        if(i == boss_index)
        {
            continue;
        }
        
        if(enemies[i].death == 1)
        {
            INT8 offset_x = offsets[spawned][0];
            INT8 offset_y = offsets[spawned][1];
            UINT8 spawn_x, spawn_y;
            
            // Handle X coordinate with underflow protection
            if(offset_x < 0 && boss->x < (UINT8)(-offset_x))
            {
                spawn_x = MIN_ENEMY_X;
            }
            else
            {
                spawn_x = boss->x + offset_x;
            }
            
            // Handle Y coordinate with underflow protection
            if(offset_y < 0 && boss->y < (UINT8)(-offset_y))
            {
                spawn_y = MIN_ENEMY_Y;
            }
            else
            {
                spawn_y = boss->y + offset_y;
            }
            
            // Clamp to valid range
            if(spawn_x < MIN_ENEMY_X) spawn_x = MIN_ENEMY_X;
            if(spawn_x > MAX_ENEMY_X) spawn_x = MAX_ENEMY_X;
            if(spawn_y < MIN_ENEMY_Y) spawn_y = MIN_ENEMY_Y;
            if(spawn_y > MAX_ENEMY_Y) spawn_y = MAX_ENEMY_Y;
            
            UINT8 oam_slot = 26 + i;
            
            setup_enemy(&enemies[i], oam_slot, spawn_x, spawn_y, ENEMY_TYPE_SLIME);
            spawned++;
        }
    }
    
    // Update enemy count to include new slimes (cap at MAX_ENEMIES)
    current_enemy_count += spawned;
    if(current_enemy_count > MAX_ENEMIES)
    {
        current_enemy_count = MAX_ENEMIES;
    }
}

void update_window_stats_ui(void)
{
    set_win_tile_xy(HUD_HP_X, HUD_ROW, TILE_H); // HP label (heart tile)
    set_win_tile_xy(HUD_HP_X + 1, HUD_ROW, TILE_P); 
    write_window_2digits(player_stats.current_health, HUD_HP_X + 2, HUD_ROW);

    set_win_tile_xy(HUD_DMG_X, HUD_ROW, TILE_D);
    set_win_tile_xy(HUD_DMG_X + 1, HUD_ROW, TILE_M);
    write_window_2digits(player_stats.damage, HUD_DMG_X + 2, HUD_ROW);

    set_win_tile_xy(HUD_RANGE_X, HUD_ROW, TILE_S);
    set_win_tile_xy(HUD_RANGE_X + 1, HUD_ROW, TILE_P);
    write_window_2digits(player_stats.speed, HUD_RANGE_X + 2, HUD_ROW);

    // stage display
    set_win_tile_xy(STAGE_X, HUD_ROW, TILE_S);
    set_win_tile_xy(STAGE_X + 1, HUD_ROW, TILE_T);
    set_win_tile_xy(STAGE_X + 2, HUD_ROW, TILE_G);
    write_window_2digits(stage, STAGE_X + 3, HUD_ROW);
}

void show_pause_ui(void)
{
    set_win_tile_xy(PAUSE_TEXT_X + 0, PAUSE_ROW, TILE_P);
    set_win_tile_xy(PAUSE_TEXT_X + 1, PAUSE_ROW, TILE_A);
    set_win_tile_xy(PAUSE_TEXT_X + 2, PAUSE_ROW, TILE_U);
    set_win_tile_xy(PAUSE_TEXT_X + 3, PAUSE_ROW, TILE_S);
    set_win_tile_xy(PAUSE_TEXT_X + 4, PAUSE_ROW, TILE_E);
}

void hide_pause_ui(void)
{
    set_win_tile_xy(PAUSE_TEXT_X + 0, PAUSE_ROW, 0);
    set_win_tile_xy(PAUSE_TEXT_X + 1, PAUSE_ROW, 0);
    set_win_tile_xy(PAUSE_TEXT_X + 2, PAUSE_ROW, 0);
    set_win_tile_xy(PAUSE_TEXT_X + 3, PAUSE_ROW, 0);
    set_win_tile_xy(PAUSE_TEXT_X + 4, PAUSE_ROW, 0);
}

void show_room_clear_ui(void)
{
    set_win_tile_xy(ROOM_CLEAR_X + 0, ROOM_CLEAR_ROW, TILE_R);
    set_win_tile_xy(ROOM_CLEAR_X + 1, ROOM_CLEAR_ROW, TILE_O);
    set_win_tile_xy(ROOM_CLEAR_X + 2, ROOM_CLEAR_ROW, TILE_O);
    set_win_tile_xy(ROOM_CLEAR_X + 3, ROOM_CLEAR_ROW, TILE_M);
    set_win_tile_xy(ROOM_CLEAR_X + 4, ROOM_CLEAR_ROW, 0);
    set_win_tile_xy(ROOM_CLEAR_X + 5, ROOM_CLEAR_ROW, TILE_C);
    set_win_tile_xy(ROOM_CLEAR_X + 6, ROOM_CLEAR_ROW, TILE_L);
    set_win_tile_xy(ROOM_CLEAR_X + 7, ROOM_CLEAR_ROW, TILE_E);
    set_win_tile_xy(ROOM_CLEAR_X + 8, ROOM_CLEAR_ROW, TILE_A);
    set_win_tile_xy(ROOM_CLEAR_X + 9, ROOM_CLEAR_ROW, TILE_R);
}

void hide_room_clear_ui(void)
{
    for(UINT8 i = 0; i < 10; i++)
    {
        set_win_tile_xy(ROOM_CLEAR_X + i, ROOM_CLEAR_ROW, 0);
    }
}

void show_ready_ui(void)
{
    set_win_tile_xy(READY_X + 0, READY_ROW, TILE_R);
    set_win_tile_xy(READY_X + 1, READY_ROW, TILE_E);
    set_win_tile_xy(READY_X + 2, READY_ROW, TILE_A);
    set_win_tile_xy(READY_X + 3, READY_ROW, TILE_D);
    set_win_tile_xy(READY_X + 4, READY_ROW, TILE_Y);
}

void hide_ready_ui(void)
{
    for(UINT8 i = 0; i < 5; i++)
    {
        set_win_tile_xy(READY_X + i, READY_ROW, 0);
    }
}

void show_reward_ui(UINT8 reward)
{
    if(reward == REWARD_HP)
    {
        set_win_tile_xy(REWARD_X + 0, REWARD_ROW, TILE_H);
        set_win_tile_xy(REWARD_X + 1, REWARD_ROW, TILE_P);
        set_win_tile_xy(REWARD_X + 2, REWARD_ROW, 0);
        set_win_tile_xy(REWARD_X + 3, REWARD_ROW, TILE_U);
        set_win_tile_xy(REWARD_X + 4, REWARD_ROW, TILE_P);
    }
    else if(reward == REWARD_DMG)
    {
        set_win_tile_xy(REWARD_X + 0, REWARD_ROW, TILE_D);
        set_win_tile_xy(REWARD_X + 1, REWARD_ROW, TILE_M);
        set_win_tile_xy(REWARD_X + 2, REWARD_ROW, TILE_G);
        set_win_tile_xy(REWARD_X + 3, REWARD_ROW, 0);
        set_win_tile_xy(REWARD_X + 4, REWARD_ROW, TILE_U);
        set_win_tile_xy(REWARD_X + 5, REWARD_ROW, TILE_P);
    }
    else
    {
        set_win_tile_xy(REWARD_X + 0, REWARD_ROW, TILE_S);
        set_win_tile_xy(REWARD_X + 1, REWARD_ROW, TILE_P);
        set_win_tile_xy(REWARD_X + 2, REWARD_ROW, TILE_E);
        set_win_tile_xy(REWARD_X + 3, REWARD_ROW, TILE_E);
        set_win_tile_xy(REWARD_X + 4, REWARD_ROW, TILE_D);
        set_win_tile_xy(REWARD_X + 5, REWARD_ROW, 0);
        set_win_tile_xy(REWARD_X + 6, REWARD_ROW, TILE_U);
        set_win_tile_xy(REWARD_X + 7, REWARD_ROW, TILE_P);
    }
}

void hide_reward_ui(void)
{
    for(UINT8 i = 0; i < 10; i++)
    {
        set_win_tile_xy(REWARD_X + i, REWARD_ROW, 0);
    }
}

void show_game_over_ui(void)
{
    for(UINT8 x = 0; x < 20; x++)
    {
        set_win_tile_xy(x, 0, 0);
        set_win_tile_xy(x, 1, 0);
    }

    set_win_tile_xy(5, 1, TILE_G);
    set_win_tile_xy(6, 1, TILE_A);
    set_win_tile_xy(7, 1, TILE_M);
    set_win_tile_xy(8, 1, TILE_E);
    set_win_tile_xy(9, 1, 0);
    set_win_tile_xy(10, 1, TILE_O);
    set_win_tile_xy(11, 1, TILE_V);
    set_win_tile_xy(12, 1, TILE_E);
    set_win_tile_xy(13, 1, TILE_R);
}

void roll_room_reward(void)
{
    reward_type = rand() % 3;
}

void apply_reward(UINT8 reward)
{
    if(reward == REWARD_HP)
    {
        UINT8 boosted_max_hp = player_stats.max_health + HP_REWARD_AMOUNT;
        if(boosted_max_hp > PLAYER_MAX_HP_CAP)
        {
            player_stats.max_health = PLAYER_MAX_HP_CAP;
        }
        else
        {
            player_stats.max_health = boosted_max_hp;
        }

        UINT8 boosted_hp = player_stats.current_health + HP_REWARD_AMOUNT;
        if(boosted_hp > player_stats.max_health)
        {
            player_stats.current_health = player_stats.max_health;
        }
        else
        {
            player_stats.current_health = boosted_hp;
        }
    }
    else if(reward == REWARD_DMG)
    {
        player_stats.damage += DMG_REWARD_AMOUNT;
    }
    else
    {
        UINT8 boosted_speed = player_stats.speed + SPEED_REWARD_AMOUNT;
        if(boosted_speed > PLAYER_SPEED_CAP)
        {
            player_stats.speed = PLAYER_SPEED_CAP;
        }
        else
        {
            player_stats.speed = boosted_speed;
        }
    }
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
        sfx_player_hurt();
        player_stats.invuln_timer = INVULN_FRAMES;
        return 1;
    }
    return 0;
}            
void audio_init(void)
{
    NR52_REG = 0x80;
    NR50_REG = 0x77;
    NR51_REG = 0xFF;
}

void sfx_swing(void)
{
    NR41_REG = 0x00;
    NR42_REG = 0xF1;
    NR43_REG = 0x35;
    NR44_REG = 0x80;
}

void sfx_enemy_hit(void)
{
    // use square-channel pattern previously in player_hurt
    NR10_REG = 0x16;
    NR11_REG = 0x80;
    NR12_REG = 0xF2;
    NR13_REG = 0x40;
    NR14_REG = 0x87;
}

void sfx_player_hurt(void)
{
    // use noise-channel pattern previously in enemy_hit
    NR41_REG = 0x00;
    NR42_REG = 0xC2;
    NR43_REG = 0x20;
    NR44_REG = 0x80;
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

    if(locktimer > 0)
    {
        UINT8 lunge_offset = SWORD_LUNGE_MAX_OFFSET;

        if(locktimer == 1)
        {
            lunge_offset = 3;
        }
        else if(locktimer == 2)
        {
            lunge_offset = 6;
        }

        if(direction == 2)
        {
            if(player->x > MIN_GIRL_X)
            {
                UINT8 distance_to_min_x = player->x - MIN_GIRL_X;
                if(distance_to_min_x <= PLAYER_LUNGE_STEP)
                {
                    player->x = MIN_GIRL_X;
                }
                else
                {
                    player->x -= PLAYER_LUNGE_STEP;
                }
            }
        }
        else if(direction == 3)
        {
            if(player->x < MAX_GIRL_X)
            {
                UINT8 distance_to_max_x = MAX_GIRL_X - player->x;
                if(distance_to_max_x <= PLAYER_LUNGE_STEP)
                {
                    player->x = MAX_GIRL_X;
                }
                else
                {
                    player->x += PLAYER_LUNGE_STEP;
                }
            }
        }
        else if(direction == 1)
        {
            if(player->y > MIN_GIRL_Y)
            {
                UINT8 distance_to_min_y = player->y - MIN_GIRL_Y;
                if(distance_to_min_y <= PLAYER_LUNGE_STEP)
                {
                    player->y = MIN_GIRL_Y;
                }
                else
                {
                    player->y -= PLAYER_LUNGE_STEP;
                }
            }
        }
        else
        {
            if(player->y < MAX_GIRL_Y)
            {
                UINT8 distance_to_max_y = MAX_GIRL_Y - player->y;
                if(distance_to_max_y <= PLAYER_LUNGE_STEP)
                {
                    player->y = MAX_GIRL_Y;
                }
                else
                {
                    player->y += PLAYER_LUNGE_STEP;
                }
            }
        }

        move_weapon(weapon, player);

        if(direction == 2)
        {
            weapon->x -= lunge_offset;
        }
        else if(direction == 3)
        {
            weapon->x += lunge_offset;
        }
        else if(direction == 1)
        {
            weapon->y -= lunge_offset;
        }
        else
        {
            weapon->y += lunge_offset;
        }

        move_sword_sprites_from_position(weapon);

        UINT8 max_check = (current_enemy_count > MAX_ENEMIES) ? MAX_ENEMIES : current_enemy_count;
        for(UINT8 i = 0; i < max_check; i++)
        {
            // Skip dead enemies
            if(enemies[i].death == 0)
            {
                weapon_enemy_collision(weapon, &enemies[i], i);
            }
        }

        if(locktimer >= SWORD_LUNGE_FRAMES)
        {
            locktimer = 0;
            swordreset(player, weapon);
        }
        else
        {
            locktimer++;
        }
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

void setup_enemy(struct Enemy* enemy, UINT8 oam_slot, UINT8 x, UINT8 y, UINT8 type)
{
    enemy->type = type;
    enemy->x = x;
    enemy->y = y;
    enemy->anim = 0;
    enemy->death = 0;
    enemy->move_timer = 0;  // Initialize movement timer
    
    if(type == ENEMY_TYPE_SLIME)
    {
        enemy->width = 8;
        enemy->height = 8;
        // scale health based on current stage
        enemy->max_health = SLIME_BASE_HP * enemy_hp_multiplier;
        enemy->current_health = enemy->max_health;
        enemy->spawn_timer = 0;  // Slimes don't spawn others
        enemy->attack_timer = 0;
        enemy->attack_anim_frame = 0;
        enemy->jump_timer = SLIME_JUMP_COOLDOWN   + (rand() % 5);  // Initialize jump timer
        enemy->jump_target_x = x;
        enemy->jump_target_y = y;
        
        // Single sprite for slime
        set_sprite_tile(oam_slot, 16);
        set_sprite_prop(oam_slot, ENEMY_PALETTE);
        enemy->spritids[0] = oam_slot;
        
        // Clear unused sprite IDs to prevent stale data
        enemy->spritids[1] = 0xFF;
        enemy->spritids[2] = 0xFF;
        enemy->spritids[3] = 0xFF;
    }
    else if(type == ENEMY_TYPE_BOSS)
    {
        enemy->width = 16;
        enemy->height = 16;
        // scale boss HP as well
        enemy->max_health = BOSS_BASE_HP * enemy_hp_multiplier;
        enemy->current_health = enemy->max_health;
        
        // Initialize spawn timer with random value
        enemy->spawn_timer = BOSS_SPAWN_MIN_FRAMES + (rand() % (BOSS_SPAWN_MAX_FRAMES - BOSS_SPAWN_MIN_FRAMES + 1));
        
        // Initialize attack animation fields
        enemy->attack_timer = BOSS_ATTACK_COOLDOWN;
        enemy->attack_anim_frame = 0;
        enemy->jump_timer = 0;
        enemy->jump_target_x = x;
        enemy->jump_target_y = y;
        
        // 4 sprites in 2x2 grid for boss
        for(UINT8 i = 0; i < 4; i++)
        {
            set_sprite_tile(oam_slot + i, 22 + i);  // Boss tiles 22-25
            set_sprite_prop(oam_slot + i, ENEMY_PALETTE);
            enemy->spritids[i] = oam_slot + i;
        }
    }
    
    move_enemy_small(enemy, x, y);
}

//Room 0 Function
void room_0(void)
{
    current_enemy_count = 4;
    setup_enemy(&enemies[0], 22, 26, 50, ENEMY_TYPE_SLIME);   // Left top
    setup_enemy(&enemies[1], 23, 26, 70, ENEMY_TYPE_SLIME);   // Left bottom
    setup_enemy(&enemies[2], 24, 134, 50, ENEMY_TYPE_SLIME);  // Right top
    setup_enemy(&enemies[3], 25, 134, 70, ENEMY_TYPE_SLIME);  // Right bottom
    
    // Mark all other enemy slots as dead
    for(UINT8 i = 4; i < MAX_ENEMIES; i++)
    {
        enemies[i].death = 1;
        hide_enemy_sprites(&enemies[i]);
    }
    
    enemy_start_delay_timer = ENEMY_START_DELAY_FRAMES;
    room_cleared = 0;
    reward_active = 0;
    reward_claimed = 0;
    can_transition = 0;
    room_clear_timer = 0;
    transition_cooldown_timer = 0;
}

//Room 1 Function (currently duplicated from room_0 for upgrade testing)
void room_1(void)
{
    current_enemy_count = 6;
    setup_enemy(&enemies[0], 22, 26, 50, ENEMY_TYPE_SLIME);   // Left top
    setup_enemy(&enemies[1], 23, 26, 70, ENEMY_TYPE_SLIME);   // Left bottom
    setup_enemy(&enemies[2], 24, 26, 90, ENEMY_TYPE_SLIME);  // Right top
    setup_enemy(&enemies[3], 25, 134, 50, ENEMY_TYPE_SLIME);  // Right bottom
    setup_enemy(&enemies[4], 26, 134, 70, ENEMY_TYPE_SLIME);  
    setup_enemy(&enemies[5], 27, 134, 90, ENEMY_TYPE_SLIME);
    
    // Mark all other enemy slots as dead
    for(UINT8 i = 6; i < MAX_ENEMIES; i++)
    {
        enemies[i].death = 1;
        hide_enemy_sprites(&enemies[i]);
    }
    
    enemy_start_delay_timer = ENEMY_START_DELAY_FRAMES;
    room_cleared = 0;
    reward_active = 0;
    reward_claimed = 0;
    can_transition = 0;
    room_clear_timer = 0;
    transition_cooldown_timer = 0;
}

void room_3(void)
{
    current_enemy_count = 8;
    setup_enemy(&enemies[0], 22, 26, 50, ENEMY_TYPE_SLIME);   // Left top
    setup_enemy(&enemies[1], 23, 26, 70, ENEMY_TYPE_SLIME);   // Left bottom
    setup_enemy(&enemies[2], 24, 26, 90, ENEMY_TYPE_SLIME);  // Right top
    setup_enemy(&enemies[3], 25, 134, 50, ENEMY_TYPE_SLIME);  // Right bottom
    setup_enemy(&enemies[4], 26, 134, 70, ENEMY_TYPE_SLIME);  
    setup_enemy(&enemies[5], 27, 134, 90, ENEMY_TYPE_SLIME);
    setup_enemy(&enemies[6], 28, 26, 110, ENEMY_TYPE_SLIME);  
    setup_enemy(&enemies[7], 29, 134, 110, ENEMY_TYPE_SLIME);
    
    // Mark all other enemy slots as dead
    for(UINT8 i = 8; i < MAX_ENEMIES; i++)
    {
        enemies[i].death = 1;
        hide_enemy_sprites(&enemies[i]);
    }
    
    enemy_start_delay_timer = ENEMY_START_DELAY_FRAMES;
    room_cleared = 0;
    reward_active = 0;
    reward_claimed = 0;
    can_transition = 0;
    room_clear_timer = 0;
    transition_cooldown_timer = 0;
}

void room_4(void)
{
    current_enemy_count = 10;
    setup_enemy(&enemies[0], 22, 26, 50, ENEMY_TYPE_SLIME);   // Left top
    setup_enemy(&enemies[1], 23, 26, 70, ENEMY_TYPE_SLIME);   // Left bottom
    setup_enemy(&enemies[2], 24, 26, 90, ENEMY_TYPE_SLIME);  // Right top
    setup_enemy(&enemies[3], 25, 134, 50, ENEMY_TYPE_SLIME);  // Right bottom
    setup_enemy(&enemies[4], 26, 134, 70, ENEMY_TYPE_SLIME);  
    setup_enemy(&enemies[5], 27, 134, 90, ENEMY_TYPE_SLIME);
    setup_enemy(&enemies[6], 28, 26, 110, ENEMY_TYPE_SLIME);  
    setup_enemy(&enemies[7], 29, 134, 110, ENEMY_TYPE_SLIME);
    setup_enemy(&enemies[8], 30, 46, 110, ENEMY_TYPE_SLIME);  
    setup_enemy(&enemies[9], 31, 114, 110, ENEMY_TYPE_SLIME);
    
    // Mark all other enemy slots as dead
    for(UINT8 i = 10; i <= MAX_ENEMIES; i++)
    {
        enemies[i].death = 1;
        hide_enemy_sprites(&enemies[i]);
    }
    
    enemy_start_delay_timer = ENEMY_START_DELAY_FRAMES;
    room_cleared = 0;
    reward_active = 0;
    reward_claimed = 0;
    can_transition = 0;
    room_clear_timer = 0;
    transition_cooldown_timer = 0;
}

//Room 2 Function - Boss Room
void room_2(void)
{
    current_enemy_count = 1;  // Just the boss
    // Boss uses 4 OAM slots (22-25) for 16x16 sprite
    setup_enemy(&enemies[0], 22, 80, 60, ENEMY_TYPE_BOSS);
    
    // Mark all other enemies as dead and hide their sprites
    for(UINT8 i = 1; i < MAX_ENEMIES; i++)
    {
        enemies[i].death = 1;
        hide_enemy_sprites(&enemies[i]);
    }
    
    enemy_start_delay_timer = ENEMY_START_DELAY_FRAMES;
    room_cleared = 0;
    reward_active = 0;
    reward_claimed = 0;
    can_transition = 0;
    room_clear_timer = 0;
    transition_cooldown_timer = 0;
}

void room_5(void)
{
    current_enemy_count = 5;  // Boss and adds
    // Boss uses 4 OAM slots (22-25) for 16x16 sprite
    setup_enemy(&enemies[0], 22, 80, 60, ENEMY_TYPE_BOSS);
    setup_enemy(&enemies[1], 26, 26, 70, ENEMY_TYPE_SLIME);   // Left top
    setup_enemy(&enemies[2], 27, 134, 70, ENEMY_TYPE_SLIME);   // Left bottom
    setup_enemy(&enemies[3], 28, 26, 90, ENEMY_TYPE_SLIME);  // Right top
    setup_enemy(&enemies[4], 29, 134, 90, ENEMY_TYPE_SLIME);  // Right bottom

    current_enemy_count = 5;
    // Mark all other enemies as dead and hide their sprites
    for(UINT8 i = 5; i < MAX_ENEMIES; i++)
    {
        enemies[i].death = 1;
        hide_enemy_sprites(&enemies[i]);
    }
    
    enemy_start_delay_timer = ENEMY_START_DELAY_FRAMES;
    room_cleared = 0;
    reward_active = 0;
    reward_claimed = 0;
    can_transition = 0;
    room_clear_timer = 0;
    transition_cooldown_timer = 0;
}


void load_room(UINT8 room_id)
{
    if(room_id == 0)
    {
        room_0();
    }
    else if(room_id == 1)
    {
        room_1();
    }
    else if(room_id == 2)
    {
        room_2();
    }
    else if(room_id == 3)
    {
        room_3();
    }
    else if(room_id == 4)
    {
        room_4();
    } 
    else if(room_id == 5)
    {
        room_5();
    }       
    else
    {
        room_0();
    }

    setup_character(&girl, PLAYER_SPAWN_X, PLAYER_SPAWN_Y);
    direction = 0;
    move_weapon(&sword, &girl);
    hide_room_clear_ui();
    hide_reward_ui();
    hide_ready_ui();
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

void hide_sword_sprites(struct Weapon* weapon)
{
    hide_sprite(weapon->spritids[0]);
    hide_sprite(weapon->spritids[1]);
}

void hide_enemy_sprites(struct Enemy* enemy)
{
    if(enemy->type == ENEMY_TYPE_SLIME)
    {
        hide_sprite(enemy->spritids[0]);
        enemy->spritids[0] = 0xFF;  // Mark as unused
    }
    else if(enemy->type == ENEMY_TYPE_BOSS)
    {
        for(UINT8 i = 0; i < 4; i++)
        {
            hide_sprite(enemy->spritids[i]);
            enemy->spritids[i] = 0xFF;  // Mark as unused
        }
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
                if(enemy->current_health > 0)
                {
                    if(player_stats.damage >= enemy->current_health)
                    {
                        enemy->current_health = 0;
                    }
                    else
                    {
                        enemy->current_health -= player_stats.damage;
                    }

                    if(direction == 2) // left
                    {
                        enemy->x -= ENEMY_KNOCKBACK_STEP;
                    }
                    else if(direction == 3) // right
                    {
                        enemy->x += ENEMY_KNOCKBACK_STEP;
                    }
                    else if(direction == 1) // up
                    {
                        enemy->y -= ENEMY_KNOCKBACK_STEP;
                    }
                    else // down
                    {
                        enemy->y += ENEMY_KNOCKBACK_STEP;
                    }

                    enemy_check_borders(enemy);
                }

                sfx_enemy_hit();

                if(enemy->current_health == 0)
                {
                    enemy->death = 1;
                    hide_enemy_sprites(enemy);
                    
                    // Check if boss - spawn death slimes AFTER hiding boss sprites
                    if(enemy->type == ENEMY_TYPE_BOSS)
                    {
                        // Clamp boss position to valid range before spawning
                        if(enemy->x < MIN_ENEMY_X) enemy->x = MIN_ENEMY_X;
                        if(enemy->x > MAX_ENEMY_X) enemy->x = MAX_ENEMY_X;
                        if(enemy->y < MIN_ENEMY_Y) enemy->y = MIN_ENEMY_Y;
                        if(enemy->y > MAX_ENEMY_Y) enemy->y = MAX_ENEMY_Y;
                        
                        spawn_boss_death_slimes(enemy);
                    }
                    
                    score ++;
                }
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
        (void)owner;
        (void)weapon;
        // Reset hit tracking for new attack
        for(UINT8 i = 0; i < MAX_ENEMIES; i++)
        {
            hit_this_attack[i] = 0;
        }

        sfx_swing();

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
        if(character->type == ENEMY_TYPE_SLIME)
        {
            // Slime is 8x8 - single sprite
            move_sprite(character->spritids[0], x, y);
        }
        else if(character->type == ENEMY_TYPE_BOSS)
        {
            // Boss is 16x16 - 2x2 grid of sprites
            move_sprite(character->spritids[0], x, y);
            move_sprite(character->spritids[1], x + spritesize, y);
            move_sprite(character->spritids[2], x, y + spritesize);
            move_sprite(character->spritids[3], x + spritesize, y + spritesize);
        }
    }
void animate_enemy(struct Enemy* enemy, UINT8 tile0, UINT8 tile1)
    {
        if(enemy->type == ENEMY_TYPE_SLIME)
        {
            // Slime is single sprite - just swap between two tiles
            if(enemy->anim == 0)
            {
                set_sprite_tile(enemy->spritids[0], tile0);
            }
            else if(enemy->anim == 1)
            {
                set_sprite_tile(enemy->spritids[0], tile1);
            }
        }
        else if(enemy->type == ENEMY_TYPE_BOSS)
        {
            // Boss is 2x2 grid - static sprite (no animation for now)
            // Uses tiles 22-25 for the 2x2 grid
            for(UINT8 i = 0; i < 4; i++)
            {
                set_sprite_tile(enemy->spritids[i], 22 + i);
            }
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
    init_title_screen();

    while(1)
    {
        UINT8 current_pad = joypad();

        if((current_pad & J_START) && !(prev_pad & J_START))
        {
            if(gamestate == 0)
            {
                gamestate = 1;
                initrand(DIV_REG);
                font_set(ui_font);
                audio_init();

                set_bkg_data(37, 8, backgroundtiles);
                set_bkg_tiles(0, 0, 20, 16, backgroundmap);

                set_win_tiles(0, 0, 20, 2, windowmap);
                move_win(8,128);
                
                
                
                set_sprite_data(0, 22, Girl);  // Girl + Slime + Sword tiles (0-21)
                set_sprite_data(22, 9, Boss);   // Boss tiles (22-30) - includes attack animation frames
                setup_player();
                init_player_stats();
                // reset progression
                stage = 1;
                enemy_hp_multiplier = 1;
                update_window_stats_ui();
                setupsword();
                load_room(room);  // Initialize room after sprite data is loaded

                
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
            else if(gamestate == 1 && player_stats.is_dead == 1)
            {
                room = 0;
                locktimer = 0;
                knockback_timer = 0;
                knockback_dx = 0;
                knockback_dy = 0;
                room_cleared = 0;
                reward_active = 0;
                reward_claimed = 0;
                can_transition = 0;
                room_clear_timer = 0;
                transition_cooldown_timer = 0;

                setup_player();
                init_player_stats();
                // reset progression on death restart
                stage = 1;
                enemy_hp_multiplier = 1;
                setupsword();
                load_room(room);

                set_win_tiles(0, 0, 20, 2, windowmap);
                hide_pause_ui();
                hide_room_clear_ui();
                hide_reward_ui();
                hide_ready_ui();
                update_window_stats_ui();
            }
            else if(gamestate == 1 && room_cleared == 0 && reward_active == 0 && can_transition == 0)
            {
                gamestate = 2;
                show_pause_ui();
            }
            else if(gamestate == 2)
            {
                gamestate = 1;
                hide_pause_ui();
            }
        }

        if(gamestate == 0)
        {
            update_title_screen();
        }

        if(gamestate == 1)
        {
        struct GameCharacter* active_player = &girl;
        
        if(player_stats.is_dead == 0 && locktimer == 0 && knockback_timer == 0 && enemy_start_delay_timer == 0)
        {
        if(joypad() & J_LEFT)
        {
            direction = 2;
            move_weapon(&sword, active_player);
            if(active_player->x > MIN_GIRL_X)
            {
                UINT8 distance_to_min_x = active_player->x - MIN_GIRL_X;
                if(distance_to_min_x < player_stats.speed)
                {
                    active_player->x = MIN_GIRL_X;
                }
                else
                {
                    active_player->x -= player_stats.speed;
                }
                
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
                UINT8 distance_to_max_x = MAX_GIRL_X - active_player->x;
                if(distance_to_max_x < player_stats.speed)
                {
                    active_player->x = MAX_GIRL_X;
                }
                else
                {
                    active_player->x += player_stats.speed;
                }
                
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
                UINT8 distance_to_min_y = active_player->y - MIN_GIRL_Y;
                if(distance_to_min_y < player_stats.speed)
                {
                    active_player->y = MIN_GIRL_Y;
                }
                else
                {
                    active_player->y -= player_stats.speed;
                }
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
                UINT8 distance_to_max_y = MAX_GIRL_Y - active_player->y;
                if(distance_to_max_y < player_stats.speed)
                {
                    active_player->y = MAX_GIRL_Y;
                }
                else
                {
                    active_player->y += player_stats.speed;
                }
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

        if((joypad() & J_A) && !(prev_pad & J_A) && reward_active == 0)
        {
            attack(active_player, &sword);
        }
        }

        if(player_stats.is_dead == 1)
        {
            hide_character_sprites(active_player);
        }
        
        update_timers(active_player, &sword);

        if(player_stats.is_dead == 1)
        {
            hide_character_sprites(active_player);
            hide_sword_sprites(&sword);
            hide_pause_ui();
            hide_room_clear_ui();
            hide_reward_ui();
            hide_ready_ui();
            show_game_over_ui();

            prev_pad = current_pad;
            performantdelay(5);
            continue;
        }

        UINT8 can_enemies_move = 1;
        UINT8 delay_active = 0;
        if(enemy_start_delay_timer > 0)
        {
            delay_active = 1;
            enemy_start_delay_timer--;
            can_enemies_move = 0;
        }

        // Animate all enemies
        UINT8 all_enemies_dead = 1;
        for(UINT8 i = 0; i < current_enemy_count; i++)
        {
            if(enemies[i].death == 0)
            {
                all_enemies_dead = 0;
                if(can_enemies_move)
                {
                    slime_can_move(&enemies[i], active_player);
                }
                
                // Animate based on enemy type
                if(enemies[i].type == ENEMY_TYPE_SLIME)
                {
                    animate_enemy(&enemies[i], 16, 17);  // Slime tiles
                }
                else if(enemies[i].type == ENEMY_TYPE_BOSS)
                {
                    // Boss attack animation: cycles through frames before attacking
                    // Frames 0-1: idle (22-25), Frames 2-4: attack windup (26-29)
                    UINT8 base_tile = (enemies[i].attack_anim_frame < 2) ? 22 : 26;
                    
                    // Update all 4 sprite tiles for the 2x2 boss
                    for(UINT8 j = 0; j < 4; j++)
                    {
                        if(enemies[i].spritids[j] != 0xFF)
                        {
                            set_sprite_tile(enemies[i].spritids[j], base_tile + j);
                        }
                    }
                }
            }
            else if(enemies[i].death == 1)
            {
                hide_enemy_sprites(&enemies[i]);
            }
        }

        resolve_enemy_collisions();

        for(UINT8 i = 0; i < current_enemy_count; i++)
        {
            if(enemies[i].death == 0)
            {
                move_enemy_small(&enemies[i], enemies[i].x, enemies[i].y);
            }
        }

        if(all_enemies_dead)
        {
            hide_ready_ui();

            if(room_cleared == 0)
            {
                room_cleared = 1;
                room_clear_timer = ROOM_CLEAR_SHOW_FRAMES;
            }

            if(room_clear_timer > 0)
            {
                room_clear_timer--;
                hide_reward_ui();
                show_room_clear_ui();
            }
            else
            {
                if(reward_claimed == 0 && reward_active == 0)
                {
                    roll_room_reward();
                    reward_active = 1;
                }

                if(reward_active)
                {
                    hide_room_clear_ui();
                    show_reward_ui(reward_type);

                          if((current_pad & J_START) && !(prev_pad & J_START))
                    {
                        apply_reward(reward_type);
                        reward_active = 0;
                        reward_claimed = 1;
                        can_transition = 1;
                            transition_cooldown_timer = TRANSITION_COOLDOWN_FRAMES;
                        hide_reward_ui();
                        hide_room_clear_ui();
                        update_window_stats_ui();
                    }
                }
                else
                {
                    hide_reward_ui();
                    hide_room_clear_ui();
                }
            }
        }
        else
        {
            room_cleared = 0;
            reward_active = 0;
            reward_claimed = 0;
            can_transition = 0;
            room_clear_timer = 0;
            transition_cooldown_timer = 0;
            hide_room_clear_ui();
            hide_reward_ui();

            if(delay_active)
            {
                if(enemy_start_delay_timer & 0x04)
                {
                    show_ready_ui();
                }
                else
                {
                    hide_ready_ui();
                }
            }
            else
            {
                hide_ready_ui();
            }
        }
        
        // Animation timer for all enemies
        animtimer++;
        if(animtimer == ANIM_TIMER_MAX)
        {
            animtimer = 0;
            for(UINT8 i = 0; i < current_enemy_count; i++)
            {
                enemies[i].anim = (enemies[i].anim == 0) ? 1 : 0;
            }
        }
        
        // Character collision with all enemies
        if(player_stats.is_dead == 0)
        {
            UINT8 max_check = (current_enemy_count > MAX_ENEMIES) ? MAX_ENEMIES : current_enemy_count;
            for(UINT8 i = 0; i < max_check; i++)
            {
                // Skip dead enemies entirely
                if(enemies[i].death == 0)
                {
                    character_enemy_collision(active_player, &enemies[i]);
                }
            }
        }

        if(can_transition == 1)
        {
            if(transition_cooldown_timer > 0)
            {
                transition_cooldown_timer--;
            }
            else if(((current_pad & J_A) && !(prev_pad & J_A)) ||
                    ((current_pad & J_START) && !(prev_pad & J_START)))
            {
                // calculate next room and wrap
                UINT8 next_room = (room + 1) % TOTAL_ROOMS;
                if(next_room == 0)
                {
                    // completed a full cycle: advance stage and double HP
                    stage++;
                    enemy_hp_multiplier <<= 1;  // double
                    update_window_stats_ui();
                }
                room = next_room;
                load_room(room);
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