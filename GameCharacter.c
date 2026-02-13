#include <gb/gb.h>

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
    UBYTE spritids[2];
    UINT8 x;
    UINT8 y;
    UINT8 width;
    UINT8 height;
    UINT8 anim;
    UINT8 death;
};