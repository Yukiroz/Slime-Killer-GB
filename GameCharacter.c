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
};