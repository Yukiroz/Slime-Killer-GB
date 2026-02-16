#include <gb/gb.h>

#if defined(__PORT_sm83)
#include <types.h>
#else
#include <stdint.h>
typedef uint8_t UINT8;
typedef uint16_t UINT16;
typedef uint8_t UBYTE;
#endif

struct PlayerStats {
    UINT8 max_health;
    UINT8 current_health;
    UINT8 damage;
    UINT8 range;
    UINT8 speed;
    UINT8 invuln_timer;
    UINT8 is_dead; // 0 = alive, 1 = dead
};


struct GameCharacter {
    UBYTE spritids[4];
    UINT8 x;
    UINT8 y;
    UINT8 width;
    UINT8 height;
    UINT8 anim;
};

struct Weapon {
    UBYTE spritids[2];
    UINT8 x;
    UINT8 y;
    UINT8 width;
    UINT8 height;
    UINT8 anim;
};

struct Enemy {
    UBYTE spritids[4];  // Support up to 16x16 enemies (4 sprites for 2x2 grid)
    UINT8 x;
    UINT8 y;
    UINT8 width;
    UINT8 height;
    UINT8 anim;
    UINT8 death;
    UINT8 max_health;
    UINT8 current_health;
    UINT8 move_timer;
    UINT8 type;  // 0=slime, 1=boss
    UINT8 spawn_timer;  // For boss: countdown to spawn next slime
    UINT8 attack_timer;  // Boss: countdown to attack animation
    UINT8 attack_anim_frame;  // Boss: current attack animation frame (0-4)
    UINT8 jump_timer;  // Slime: countdown to next jump
    UINT8 jump_target_x;  // Slime: target x position for jump
    UINT8 jump_target_y;  // Slime: target y position for jump
};