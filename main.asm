;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module main
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _font_set
	.globl _font_load
	.globl _font_init
	.globl _rand
	.globl _initrand
	.globl _set_sprite_data
	.globl _set_win_tiles
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _display_off
	.globl _wait_vbl_done
	.globl _joypad
	.globl _prev_pad
	.globl _room
	.globl _direction
	.globl _spawntimer
	.globl _locktimer
	.globl _animtimer
	.globl _pad
	.globl _collision
	.globl _spritesize
	.globl _score
	.globl _gamestate
	.globl _windowmap
	.globl _backgroundmap
	.globl _backgroundtiles
	.globl _Girl
	.globl _hit_this_attack
	.globl _enemies
	.globl _slime
	.globl _sword
	.globl _girl
	.globl _setup_enemy
	.globl _room_0
	.globl _performantdelay
	.globl _character_enemy_collision
	.globl _weapon_enemy_collision
	.globl _movegirl
	.globl _sword_set_direction
	.globl _attack
	.globl _swordreset
	.globl _moveslime
	.globl _animate_enemy
	.globl _enemy_check_borders
	.globl _character_set_sprite
	.globl _setupgirl
	.globl _setupslime
	.globl _setupsword
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area _HRAM
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_girl::
	.ds 9
_sword::
	.ds 7
_slime::
	.ds 10
_enemies::
	.ds 80
_hit_this_attack::
	.ds 8
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_Girl::
	.ds 368
_backgroundtiles::
	.ds 144
_backgroundmap::
	.ds 360
_windowmap::
	.ds 50
_gamestate::
	.ds 1
_score::
	.ds 1
_spritesize::
	.ds 1
_collision::
	.ds 1
_pad::
	.ds 1
_animtimer::
	.ds 1
_locktimer::
	.ds 1
_spawntimer::
	.ds 1
_direction::
	.ds 1
_room::
	.ds 1
_prev_pad::
	.ds 1
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;main.c:139: void setup_enemy(struct Enemy* enemy, UINT8 oam_slot, UINT8 x, UINT8 y)
;	---------------------------------
; Function setup_enemy
; ---------------------------------
_setup_enemy::
	dec	sp
	ldhl	sp,	#0
	ld	(hl), a
;main.c:141: enemy->x = x;
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(bc), a
;main.c:142: enemy->y = y;
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(bc), a
;main.c:143: enemy->width = 8;
	ld	hl, #0x0006
	add	hl, de
	ld	(hl), #0x08
;main.c:144: enemy->height = 8;
	ld	hl, #0x0007
	add	hl, de
	ld	(hl), #0x08
;main.c:145: enemy->anim = 0;
	ld	hl, #0x0008
	add	hl, de
	ld	(hl), #0x00
;main.c:146: enemy->death = 0;
	ld	hl, #0x0009
	add	hl, de
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ldhl	sp,	#0
	ld	c, (hl)
	xor	a, a
	ld	b, a
	sla	c
	rl	b
	sla	c
	rl	b
	ld	hl,#_shadow_OAM + 1
	add	hl,bc
	inc	hl
	ld	(hl), #0x10
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	hl,#_shadow_OAM + 1
	add	hl,bc
	inc	hl
	inc	hl
	ld	(hl), #0x10
;main.c:150: enemy->spritids[0] = oam_slot;
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
;main.c:152: moveslime(enemy, x, y);
	ldhl	sp,	#4
	ld	a, (hl-)
	push	af
	inc	sp
	ld	a, (hl)
	call	_moveslime
;main.c:153: }
	inc	sp
	pop	hl
	pop	af
	jp	(hl)
;main.c:156: void room_0(void)
;	---------------------------------
; Function room_0
; ---------------------------------
_room_0::
;main.c:158: if (room == 0)
	ld	a, (#_room)
	or	a, a
	ret	NZ
;main.c:161: setup_enemy(&enemies[0], 22, 26, 50);   // Left top
	ld	hl, #0x321a
	push	hl
	ld	a, #0x16
	ld	de, #_enemies
	call	_setup_enemy
;main.c:162: setup_enemy(&enemies[1], 23, 26, 70);   // Left bottom
	ld	hl, #0x461a
	push	hl
	ld	a, #0x17
	ld	de, #(_enemies + 10)
	call	_setup_enemy
;main.c:163: setup_enemy(&enemies[2], 24, 134, 50);  // Right top
	ld	hl, #0x3286
	push	hl
	ld	a, #0x18
	ld	de, #(_enemies + 20)
	call	_setup_enemy
;main.c:164: setup_enemy(&enemies[3], 25, 134, 70);  // Right bottom
	ld	hl, #0x4686
	push	hl
	ld	a, #0x19
	ld	de, #(_enemies + 30)
	call	_setup_enemy
;main.c:166: }
	ret
;main.c:170: void performantdelay(UINT8 numloops)
;	---------------------------------
; Function performantdelay
; ---------------------------------
_performantdelay::
	ld	c, a
;main.c:173: for(i = 0; i < numloops; i++)
	ld	b, #0x00
00103$:
	ld	a, b
	sub	a, c
	ret	NC
;main.c:175: wait_vbl_done();
	call	_wait_vbl_done
;main.c:173: for(i = 0; i < numloops; i++)
	inc	b
;main.c:177: }
	jr	00103$
;main.c:195: void character_enemy_collision(struct GameCharacter* character, struct Enemy* enemy)
;	---------------------------------
; Function character_enemy_collision
; ---------------------------------
_character_enemy_collision::
	add	sp, #-12
	ldhl	sp,	#10
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:198: if(enemy->death == 1)
	ld	hl, #0x0009
	add	hl, bc
	ld	a, (hl)
	dec	a
	jp	Z, 00114$
;main.c:200: return;
;main.c:204: if(locktimer > 0)
	ld	a, (#_locktimer)
	or	a, a
;main.c:206: return;
	jp	NZ, 00114$
;main.c:209: if (character->x < enemy->x + enemy->width - pad &&
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#9
	ld	(hl), a
	ld	hl, #0x0004
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #0x0006
	add	hl, bc
	ld	e, (hl)
	ld	d, #0x00
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	inc	sp
	inc	sp
	push	hl
	ld	a, (#_pad)
	ldhl	sp,	#4
	ld	(hl+), a
	ld	(hl), #0x00
	pop	de
	push	de
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,	#9
	ld	a, (hl-)
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,	#8
	ld	e, l
	ld	d, h
	ldhl	sp,	#6
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00160$
	bit	7, d
	jr	NZ, 00161$
	cp	a, a
	jr	00161$
00160$:
	bit	7, d
	jr	Z, 00161$
	scf
00161$:
	jp	NC, 00114$
;main.c:210: character->x + character->width - pad > enemy->x &&
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	d, #0x00
	ld	e, a
	ldhl	sp,	#8
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#9
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,	#2
	ld	e, l
	ld	d, h
	ldhl	sp,	#8
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00162$
	bit	7, d
	jr	NZ, 00163$
	cp	a, a
	jr	00163$
00162$:
	bit	7, d
	jr	Z, 00163$
	scf
00163$:
	jp	NC, 00114$
;main.c:211: character->y < enemy->y + enemy->height - pad &&
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#3
	ld	(hl), a
	ld	hl, #0x0005
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #0x0007
	add	hl, bc
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#6
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ldhl	sp,	#9
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,	#3
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#8
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00164$
	bit	7, d
	jr	NZ, 00165$
	cp	a, a
	jr	00165$
00164$:
	bit	7, d
	jr	Z, 00165$
	scf
00165$:
	jp	NC, 00114$
;main.c:212: character->y + character->height - pad > enemy->y)
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ld	b, a
	ld	c, e
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00166$
	bit	7, d
	jr	NZ, 00167$
	cp	a, a
	jr	00167$
00166$:
	bit	7, d
	jr	Z, 00167$
	scf
00167$:
	jr	NC, 00114$
;main.c:215: hide_sprite(character->spritids[0]);
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
;c:\gbdk\include\gb\gb.h:2001: shadow_OAM[nb].y = 0;
	ld	de, #_shadow_OAM+0
	xor	a, a
	ld	l, c
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	(hl), #0x00
;main.c:216: hide_sprite(character->spritids[1]);
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	ld	e, (hl)
;c:\gbdk\include\gb\gb.h:2001: shadow_OAM[nb].y = 0;
	ld	bc, #_shadow_OAM+0
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	(hl), #0x00
;main.c:217: hide_sprite(character->spritids[2]);
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	inc	hl
	ld	e, (hl)
;c:\gbdk\include\gb\gb.h:2001: shadow_OAM[nb].y = 0;
	ld	bc, #_shadow_OAM+0
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	(hl), #0x00
;main.c:218: hide_sprite(character->spritids[3]);
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	inc	hl
	inc	hl
	ld	e, (hl)
;c:\gbdk\include\gb\gb.h:2001: shadow_OAM[nb].y = 0;
	ld	bc, #_shadow_OAM+0
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	(hl), #0x00
;main.c:218: hide_sprite(character->spritids[3]);
00114$:
;main.c:221: }
	add	sp, #12
	ret
;main.c:222: void weapon_enemy_collision(struct Weapon* weapon, struct Enemy* enemy, UINT8 enemy_index)
;	---------------------------------
; Function weapon_enemy_collision
; ---------------------------------
_weapon_enemy_collision::
	add	sp, #-18
	ldhl	sp,	#16
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ldhl	sp,	#14
	ld	a, c
	ld	(hl+), a
;main.c:225: if(enemy->death == 1)
	ld	a, b
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0009
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	dec	a
	jp	Z, 00114$
;main.c:227: return;
;main.c:231: if(hit_this_attack[enemy_index] == 1)
	ld	de, #_hit_this_attack
	ldhl	sp,	#20
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	dec	a
	jp	Z, 00114$
;main.c:233: return;
;main.c:240: UINT8 collision_x = weapon->x;
	ldhl	sp,	#16
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	ld	a, (bc)
	ldhl	sp,	#8
	ld	(hl), a
	ldhl	sp,	#12
	ld	(hl), a
;main.c:241: UINT8 collision_y = weapon->y;
	ldhl	sp,#16
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0003
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#12
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#11
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#13
	ld	(hl), a
;main.c:242: UINT8 collision_width = weapon->width;
	ldhl	sp,#16
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#12
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#11
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
;main.c:243: UINT8 collision_height = weapon->height;
	ldhl	sp,#16
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	b, a
;main.c:246: if(direction == 2 || direction == 3) // left or right
	ld	a,(#_direction)
	cp	a,#0x02
	jr	Z, 00105$
	sub	a, #0x03
	jr	NZ, 00106$
00105$:
;main.c:248: collision_x = weapon->x - 8;  // Start 8px to the left
	ldhl	sp,	#8
	ld	a, (hl)
	add	a, #0xf8
	ldhl	sp,	#12
	ld	(hl), a
;main.c:249: collision_width = 16;  // 2 sprites wide
	ld	c, #0x10
	jr	00107$
00106$:
;main.c:253: collision_y = weapon->y - 8;  // Start 8px up
	ldhl	sp,	#9
	ld	a, (hl)
	add	a, #0xf8
	ldhl	sp,	#13
	ld	(hl), a
;main.c:254: collision_height = 16;  // 2 sprites tall
	ld	b, #0x10
00107$:
;main.c:257: if (collision_x < enemy->x + enemy->width &&
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (de)
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	d, #0x00
	ld	e, a
	ldhl	sp,	#7
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#11
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#10
	ld	(hl+), a
	inc	hl
	ld	a, (hl-)
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,	#11
	ld	e, l
	ld	d, h
	ldhl	sp,	#9
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jp	NC, 00114$
;main.c:258: collision_x + collision_width > enemy->x &&
	ld	d, #0x00
	ld	e, c
	ldhl	sp,	#11
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#11
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,	#7
	ld	e, l
	ld	d, h
	ldhl	sp,	#9
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00114$
;main.c:259: collision_y < enemy->y + enemy->height &&
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	d, #0x00
	ld	e, a
	ldhl	sp,	#8
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#12
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#11
	ld	(hl+), a
	inc	hl
	ld	a, (hl-)
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,	#12
	ld	e, l
	ld	d, h
	ldhl	sp,	#10
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00114$
;main.c:260: collision_y + collision_height > enemy->y)
	ld	c, b
	ld	b, #0x00
	ldhl	sp,	#12
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#8
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	jr	NC, 00114$
;main.c:263: hit_this_attack[enemy_index] = 1;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x01
;main.c:264: enemy->death = 1;
	pop	hl
	ld	(hl), #0x01
	push	hl
;main.c:265: enemy->x = 0;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;main.c:266: enemy->y = 0;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;main.c:267: score = score ++;
00114$:
;main.c:270: }
	add	sp, #18
	pop	hl
	inc	sp
	jp	(hl)
;main.c:271: void movegirl(struct GameCharacter* character, UINT8 x, UINT8 y)
;	---------------------------------
; Function movegirl
; ---------------------------------
_movegirl::
	dec	sp
	ldhl	sp,	#0
	ld	(hl), a
;main.c:273: move_sprite(character->spritids[0], x, y);
	ld	a, (de)
	ld	c, a
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, c
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
	ld	c, l
	ld	b, h
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(bc), a
	inc	bc
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(bc), a
;main.c:274: move_sprite(character->spritids[1], x + spritesize, y);
	ld	a, (hl)
	ld	hl, #_spritesize
	add	a, (hl)
	ld	c, a
	ld	l, e
	ld	h, d
	inc	hl
	ld	b, (hl)
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, b
	ld	h, a
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	pop	de
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	push	hl
	ldhl	sp,	#5
	ld	a, (hl)
	pop	hl
	ld	(hl+), a
	ld	(hl), c
;main.c:275: move_sprite(character->spritids[2], x, y + spritesize);
	ldhl	sp,	#3
	ld	a, (hl)
	ld	hl, #_spritesize
	add	a, (hl)
	ld	c, a
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	b, (hl)
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, b
	ld	h, a
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	pop	de
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	c, l
	ld	b, h
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(bc), a
;main.c:276: move_sprite(character->spritids[3], x + spritesize, y + spritesize);
	ldhl	sp,	#3
	ld	a, (hl)
	ld	hl, #_spritesize
	add	a, (hl)
	ld	b, a
	ldhl	sp,	#0
	ld	a, (hl)
	ld	hl, #_spritesize
	add	a, (hl)
	ld	c, a
	inc	de
	inc	de
	inc	de
	ld	a, (de)
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl), b
	inc	hl
	ld	(hl), c
;main.c:276: move_sprite(character->spritids[3], x + spritesize, y + spritesize);
;main.c:277: }
	inc	sp
	pop	hl
	inc	sp
	jp	(hl)
;main.c:278: void sword_set_direction(struct Weapon* weapon)
;	---------------------------------
; Function sword_set_direction
; ---------------------------------
_sword_set_direction::
	add	sp, #-3
	ldhl	sp,	#1
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:282: if(direction == 2) // left
	ld	a, (#_direction)
	sub	a, #0x02
	jr	NZ, 00110$
;main.c:284: sword.x = girl.x - 3;
	ld	a, (#(_girl + 4) + 0)
	add	a, #0xfd
	ld	hl, #(_sword + 2)
;main.c:285: sword.y = girl.y + 8;
	ld	(hl+), a
	ld	a, (#(_girl + 5) + 0)
	add	a, #0x08
	ld	(hl), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x12
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:288: sword.spritids[0] = 4;
	ld	hl, #_sword
	ld	(hl), #0x04
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x13
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:291: sword.spritids[1] = 5;
	ld	hl, #_sword + 1
	ld	(hl), #0x05
;main.c:292: move_sprite(weapon->spritids[0], sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	hl, #(_sword + 2)
	ld	c, (hl)
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	ld	d, a
	ld	a, (de)
	ld	(hl), a
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:293: move_sprite(weapon->spritids[1], sword.x - spritesize, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	a, (#(_sword + 2) + 0)
	ld	hl, #_spritesize
	sub	a, (hl)
	ld	c, a
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:293: move_sprite(weapon->spritids[1], sword.x - spritesize, sword.y);
	jp	00136$
00110$:
;main.c:295: else if(direction == 3) // right
	ld	a, (#_direction)
	sub	a, #0x03
	jr	NZ, 00107$
;main.c:297: sword.x = girl.x + 21;
	ld	a, (#(_girl + 4) + 0)
	add	a, #0x15
	ld	hl, #(_sword + 2)
;main.c:298: sword.y = girl.y + 8;
	ld	(hl+), a
	ld	a, (#(_girl + 5) + 0)
	add	a, #0x08
	ld	(hl), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x12
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:301: sword.spritids[1] = 4;
	ld	hl, #_sword + 1
	ld	(hl), #0x04
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x13
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:304: sword.spritids[0] = 5;
	ld	hl, #_sword
	ld	(hl), #0x05
;main.c:305: move_sprite(weapon->spritids[0], sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	hl, #(_sword + 2)
	ld	c, (hl)
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	ld	d, a
	ld	a, (de)
	ld	(hl), a
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:306: move_sprite(weapon->spritids[1], sword.x - spritesize, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	a, (#(_sword + 2) + 0)
	ld	hl, #_spritesize
	sub	a, (hl)
	ld	c, a
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:306: move_sprite(weapon->spritids[1], sword.x - spritesize, sword.y);
	jp	00136$
00107$:
;main.c:308: else if(direction == 1) // up
	ld	a, (#_direction)
	dec	a
	jr	NZ, 00104$
;main.c:310: sword.x = girl.x + 9;
	ld	a, (#(_girl + 4) + 0)
	add	a, #0x09
	ld	hl, #(_sword + 2)
;main.c:311: sword.y = girl.y;
	ld	(hl+), a
	ld	a, (#(_girl + 5) + 0)
	ld	(hl), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x14
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:314: sword.spritids[0] = 4;
	ld	hl, #_sword
	ld	(hl), #0x04
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x15
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:317: sword.spritids[1] = 5;
	ld	hl, #_sword + 1
	ld	(hl), #0x05
;main.c:318: move_sprite(weapon->spritids[0], sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	hl, #(_sword + 2)
	ld	c, (hl)
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	ld	d, a
	ld	a, (de)
	ld	(hl), a
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:319: move_sprite(weapon->spritids[1], sword.x, sword.y - spritesize);
	ld	a, (#(_sword + 3) + 0)
	ld	hl, #_spritesize
	sub	a, (hl)
	ld	b, a
	ld	hl, #(_sword + 2)
	ld	c, (hl)
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:319: move_sprite(weapon->spritids[1], sword.x, sword.y - spritesize);
	jr	00136$
00104$:
;main.c:321: else if(direction == 0) // down
	ld	a, (#_direction)
	or	a, a
	jr	NZ, 00136$
;main.c:323: sword.x = girl.x - 2;
	ld	a, (#(_girl + 4) + 0)
	dec	a
	dec	a
	ld	hl, #(_sword + 2)
;main.c:324: sword.y = girl.y + 20;
	ld	(hl+), a
	ld	a, (#(_girl + 5) + 0)
	add	a, #0x14
	ld	(hl), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x14
	ld	(hl+), a
	ld	(hl), #0x40
;main.c:327: sword.spritids[1] = 4;
	ld	hl, #_sword + 1
	ld	(hl), #0x04
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x15
	ld	(hl+), a
	ld	(hl), #0x40
;main.c:330: sword.spritids[0] = 5;
	ld	hl, #_sword
	ld	(hl), #0x05
;main.c:331: move_sprite(weapon->spritids[0], sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	hl, #(_sword + 2)
	ld	c, (hl)
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	ld	d, a
	ld	a, (de)
	ld	(hl), a
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:332: move_sprite(weapon->spritids[1], sword.x, sword.y - spritesize);
	ld	a, (#(_sword + 3) + 0)
	ld	hl, #_spritesize
	sub	a, (hl)
	ld	b, a
	ld	hl, #(_sword + 2)
	ld	c, (hl)
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:332: move_sprite(weapon->spritids[1], sword.x, sword.y - spritesize);
00136$:
;main.c:334: }
	add	sp, #3
	ret
;main.c:335: void attack(void)
;	---------------------------------
; Function attack
; ---------------------------------
_attack::
;main.c:338: for(UINT8 i = 0; i < MAX_ENEMIES; i++)
	ld	c, #0x00
00116$:
	ld	a, c
	sub	a, #0x08
	jr	NC, 00101$
;main.c:340: hit_this_attack[i] = 0;
	ld	hl, #_hit_this_attack
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x00
;main.c:338: for(UINT8 i = 0; i < MAX_ENEMIES; i++)
	inc	c
	jr	00116$
00101$:
;main.c:343: sword_set_direction(&sword);
	ld	bc, #_sword+0
	ld	e, c
	ld	d, b
	push	bc
	call	_sword_set_direction
	pop	bc
;main.c:346: sword.y = sword.y + 6;
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
;main.c:344: if(direction == 0)
	ld	a, (#_direction)
	or	a, a
	jr	NZ, 00111$
;main.c:346: sword.y = sword.y + 6;
	ld	a, (de)
	add	a, #0x06
	ld	(de), a
	jr	00112$
00111$:
;main.c:348: else if(direction == 1)
	ld	a, (#_direction)
	dec	a
	jr	NZ, 00108$
;main.c:350: sword.y = sword.y - 6;
	ld	a, (de)
	add	a, #0xfa
	ld	(de), a
	jr	00112$
00108$:
;main.c:354: sword.x = sword.x - 6;
	inc	bc
	inc	bc
;main.c:352: else if(direction == 2)
	ld	a, (#_direction)
	sub	a, #0x02
	jr	NZ, 00105$
;main.c:354: sword.x = sword.x - 6;
	ld	a, (bc)
	add	a, #0xfa
	ld	(bc), a
	jr	00112$
00105$:
;main.c:356: else if(direction == 3)
	ld	a, (#_direction)
	sub	a, #0x03
	jr	NZ, 00112$
;main.c:358: sword.x = sword.x + 6;
	ld	a, (bc)
	add	a, #0x06
	ld	(bc), a
00112$:
;main.c:360: if (locktimer == 0)
	ld	hl, #_locktimer
	ld	a, (hl)
	or	a, a
	ret	NZ
;main.c:362: locktimer ++;
	inc	(hl)
;main.c:364: }
	ret
;main.c:365: void swordreset(void)
;	---------------------------------
; Function swordreset
; ---------------------------------
_swordreset::
;main.c:368: for(UINT8 i = 0; i < MAX_ENEMIES; i++)
	ld	c, #0x00
00114$:
	ld	a, c
	sub	a, #0x08
	jr	NC, 00101$
;main.c:370: hit_this_attack[i] = 0;
	ld	hl, #_hit_this_attack
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x00
;main.c:368: for(UINT8 i = 0; i < MAX_ENEMIES; i++)
	inc	c
	jr	00114$
00101$:
;main.c:373: if(direction == 0)
	ld	a, (#_direction)
	or	a, a
	jr	NZ, 00111$
;main.c:375: sword.y = sword.y - 8;
	ld	bc, #_sword+3
	ld	a, (bc)
	add	a, #0xf8
	ld	(bc), a
	jr	00112$
00111$:
;main.c:377: else if(direction == 1)
	ld	a, (#_direction)
	dec	a
	jr	NZ, 00108$
;main.c:379: sword.y = sword.y + 8;
	ld	bc, #_sword+3
	ld	a, (bc)
	add	a, #0x08
	ld	(bc), a
	jr	00112$
00108$:
;main.c:381: else if(direction == 2)
	ld	a, (#_direction)
	sub	a, #0x02
	jr	NZ, 00105$
;main.c:383: sword.x = sword.x + 8;
	ld	bc, #_sword+2
	ld	a, (bc)
	add	a, #0x08
	ld	(bc), a
	jr	00112$
00105$:
;main.c:385: else if(direction == 3)
	ld	a, (#_direction)
	sub	a, #0x03
	jr	NZ, 00112$
;main.c:387: sword.x = sword.x - 8;
	ld	bc, #_sword+2
	ld	a, (bc)
	add	a, #0xf8
	ld	(bc), a
00112$:
;main.c:389: sword_set_direction(&sword);
	ld	de, #_sword
;main.c:390: }
	jp	_sword_set_direction
;main.c:391: void moveslime(struct Enemy* character, UINT8 x, UINT8 y)
;	---------------------------------
; Function moveslime
; ---------------------------------
_moveslime::
	ld	c, a
;main.c:393: move_sprite(character->spritids[0], x, y);
	ldhl	sp,	#2
	ld	b, (hl)
	ld	a, (de)
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl), b
	inc	hl
	ld	(hl), c
;main.c:393: move_sprite(character->spritids[0], x, y);
;main.c:394: }
	pop	hl
	inc	sp
	jp	(hl)
;main.c:395: void animate_enemy(struct Enemy* enemy, UINT8 tile0, UINT8 tile1)
;	---------------------------------
; Function animate_enemy
; ---------------------------------
_animate_enemy::
	dec	sp
	dec	sp
	ld	c, a
;main.c:398: if(enemy->anim == 0)
	ld	hl, #0x0008
	add	hl, de
	ld	b, (hl)
;main.c:400: set_sprite_tile(enemy->spritids[0], tile0);
	inc	sp
	inc	sp
	push	de
;main.c:398: if(enemy->anim == 0)
	ld	a, b
	or	a, a
	jr	NZ, 00104$
;main.c:400: set_sprite_tile(enemy->spritids[0], tile0);
	pop	de
	push	de
	ld	a, (de)
	ld	b, a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	de, #_shadow_OAM+0
	xor	a, a
	ld	l, b
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), c
;main.c:400: set_sprite_tile(enemy->spritids[0], tile0);
	jr	00108$
00104$:
;main.c:402: else if(enemy->anim == 1)
	dec	b
	jr	NZ, 00108$
;main.c:404: set_sprite_tile(enemy->spritids[0], tile1);
	ldhl	sp,	#4
	ld	c, (hl)
	pop	de
	push	de
	ld	a, (de)
	ld	b, a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	de, #_shadow_OAM+0
	ld	l, b
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), c
;main.c:404: set_sprite_tile(enemy->spritids[0], tile1);
00108$:
;main.c:406: }
	inc	sp
	inc	sp
	pop	hl
	inc	sp
	jp	(hl)
;main.c:407: void enemy_check_borders(struct Enemy* enemy)
;	---------------------------------
; Function enemy_check_borders
; ---------------------------------
_enemy_check_borders::
;main.c:409: if (enemy->x < MIN_ENEMY_X)
	ld	hl, #0x0004
	add	hl, de
	ld	a, (hl)
	sub	a, #0x10
	jr	NC, 00102$
;main.c:411: enemy->x = MIN_ENEMY_X;
	ld	(hl), #0x10
00102$:
;main.c:413: if (enemy->x > MAX_ENEMY_X)
	ld	a, (hl)
	cp	a, #0x99
	jr	C, 00104$
;main.c:415: enemy->x = MAX_ENEMY_X;
	ld	(hl), #0x98
00104$:
;main.c:417: if (enemy->y < MIN_ENEMY_Y)
	ld	hl, #0x0005
	add	hl, de
	ld	a, (hl)
	sub	a, #0x14
	jr	NC, 00106$
;main.c:419: enemy->y = MIN_ENEMY_Y;
	ld	(hl), #0x14
00106$:
;main.c:421: if (enemy->y > MAX_ENEMY_Y)
	ld	a, (hl)
	cp	a, #0x81
	ret	C
;main.c:423: enemy->y = MAX_ENEMY_Y;
	ld	(hl), #0x80
;main.c:425: }
	ret
;main.c:428: void character_set_sprite(struct GameCharacter* character, UINT8 anim_state)
;	---------------------------------
; Function character_set_sprite
; ---------------------------------
_character_set_sprite::
	ld	c, e
	ld	b, d
	ld	e, a
;main.c:433: character->anim = anim_state;  // Set animation state in struct
	ld	hl, #0x0008
	add	hl, bc
	ld	(hl), e
;main.c:435: if(anim_state == 0) // down walking
	ld	a, e
	or	a, a
	jr	NZ, 00122$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;main.c:439: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:442: character->spritids[1] = 1;
	ld	l, c
	ld	h, b
	inc	hl
	ld	(hl), #0x01
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x02
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:445: character->spritids[3] = 2;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x02
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x03
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:448: character->spritids[2] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jp	00123$
00122$:
;main.c:450: else if(anim_state == 1) // down standing
	ld	a, e
	dec	a
	jr	NZ, 00119$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;main.c:454: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:457: character->spritids[1] = 1;
	ld	l, c
	ld	h, b
	inc	hl
	ld	(hl), #0x01
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x02
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:460: character->spritids[2] = 2;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	(hl), #0x02
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x03
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:463: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jp	00123$
00119$:
;main.c:465: else if(anim_state == 2) // left walking
	ld	a, e
	sub	a, #0x02
	jr	NZ, 00116$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x04
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:469: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x05
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:472: character->spritids[1] = 1;
	ld	l, c
	ld	h, b
	inc	hl
	ld	(hl), #0x01
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x06
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:475: character->spritids[2] = 2;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	(hl), #0x02
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x07
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:478: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jp	00123$
00116$:
;main.c:480: else if(anim_state == 3) // left standing
	ld	a, e
	sub	a, #0x03
	jr	NZ, 00113$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x08
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:484: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x09
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:487: character->spritids[1] = 1;
	ld	l, c
	ld	h, b
	inc	hl
	ld	(hl), #0x01
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0a
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:490: character->spritids[2] = 2;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	(hl), #0x02
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0b
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:493: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jp	00123$
00113$:
;main.c:495: else if(anim_state == 4) // right walking
	ld	a, e
	sub	a, #0x04
	jr	NZ, 00110$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x05
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:499: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x04
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:502: character->spritids[1] = 1;
	ld	l, c
	ld	h, b
	inc	hl
	ld	(hl), #0x01
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x07
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:505: character->spritids[2] = 2;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	(hl), #0x02
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x06
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:508: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jp	00123$
00110$:
;main.c:510: else if(anim_state == 5) // right standing
	ld	a, e
	sub	a, #0x05
	jr	NZ, 00107$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x09
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:514: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x08
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:517: character->spritids[1] = 1;
	ld	l, c
	ld	h, b
	inc	hl
	ld	(hl), #0x01
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0b
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:520: character->spritids[2] = 2;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	(hl), #0x02
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0a
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:523: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jr	00123$
00107$:
;main.c:525: else if(anim_state == 6) // up walking
	ld	a, e
	sub	a, #0x06
	jr	NZ, 00104$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0c
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:529: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0d
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:532: character->spritids[1] = 1;
	ld	l, c
	ld	h, b
	inc	hl
	ld	(hl), #0x01
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0e
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:535: character->spritids[2] = 2;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	(hl), #0x02
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0f
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:538: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jr	00123$
00104$:
;main.c:540: else if(anim_state == 7) // up standing
	ld	a, e
	sub	a, #0x07
	jr	NZ, 00123$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0c
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:544: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0d
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:547: character->spritids[1] = 1;
	ld	l, c
	ld	h, b
	inc	hl
	ld	(hl), #0x01
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0f
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:550: character->spritids[2] = 2;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	(hl), #0x02
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0e
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:553: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
00123$:
;main.c:556: movegirl(character, character->x, character->y);
	ld	hl, #0x0005
	add	hl, bc
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, bc
	ld	a, (hl)
	push	de
	inc	sp
	ld	e, c
	ld	d, b
	call	_movegirl
;main.c:557: }
	ret
;main.c:559: void setupgirl(void)
;	---------------------------------
; Function setupgirl
; ---------------------------------
_setupgirl::
;main.c:561: girl.x = 80;
	ld	bc, #_girl + 4
	ld	a, #0x50
	ld	(bc), a
;main.c:562: girl.y = 36;
	ld	hl, #(_girl + 5)
;main.c:563: girl.width = 16;
	ld	a, #0x24
	ld	(hl+), a
	ld	(hl), #0x10
;main.c:564: girl.height = 16;
	ld	hl, #_girl + 7
	ld	(hl), #0x10
;main.c:565: girl.anim = 0;
	ld	hl, #_girl + 8
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;main.c:569: girl.spritids[0] = 0;
	ld	hl, #_girl
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:572: girl.spritids[1] = 1;
	ld	hl, #_girl + 1
	ld	(hl), #0x01
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x02
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:575: girl.spritids[2] = 2;
	ld	hl, #_girl + 2
	ld	(hl), #0x02
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x03
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:578: girl.spritids[3] = 3;
	ld	hl, #_girl + 3
	ld	(hl), #0x03
;main.c:580: movegirl(&girl, girl.x, girl.y);
	ld	hl, #(_girl + 5)
	ld	h, (hl)
	ld	a, (bc)
	push	hl
	inc	sp
	ld	de, #_girl
	call	_movegirl
;main.c:581: }
	ret
;main.c:583: void setupslime(void)
;	---------------------------------
; Function setupslime
; ---------------------------------
_setupslime::
;main.c:585: slime.x = rand() % 128 + 16;
	call	_rand
	ld	a, e
	res	7, a
	add	a, #0x10
	ld	(#(_slime + 4)),a
;main.c:586: slime.y = rand() % 96 + 24;
	call	_rand
	ld	a, e
	ld	e, #0x60
	call	__moduchar
	ld	a, c
	add	a, #0x18
	ld	hl, #(_slime + 5)
;main.c:587: slime.width = 8;
	ld	(hl+), a
	ld	(hl), #0x08
;main.c:588: slime.height = 8;
	ld	hl, #_slime + 7
	ld	(hl), #0x08
;main.c:589: slime.anim = 0;
	ld	hl, #_slime + 8
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 90)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x10
	ld	(hl+), a
	ld	(hl), #0x10
;main.c:593: slime.spritids[0] = 22;
	ld	hl, #_slime
	ld	(hl), #0x16
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 94)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x11
	ld	(hl+), a
	ld	(hl), #0x10
;main.c:596: slime.spritids[1] = 23;
	ld	hl, #_slime + 1
	ld	(hl), #0x17
;main.c:598: moveslime(&slime, slime.x, slime.y);
	ld	hl, #(_slime + 5)
	ld	b, (hl)
	ld	a, (#(_slime + 4) + 0)
	push	bc
	inc	sp
	ld	de, #_slime
	call	_moveslime
;main.c:599: }
	ret
;main.c:601: void setupsword(void)
;	---------------------------------
; Function setupsword
; ---------------------------------
_setupsword::
;main.c:603: sword.x = 100;
	ld	hl, #_sword + 2
	ld	(hl), #0x64
;main.c:604: sword.y = 100;
	ld	hl, #_sword + 3
	ld	(hl), #0x64
;main.c:605: sword.width = 8;
	ld	hl, #_sword + 4
	ld	(hl), #0x08
;main.c:606: sword.height = 8;
	ld	hl, #_sword + 5
	ld	(hl), #0x08
;main.c:607: sword.anim = 0;
	ld	hl, #_sword + 6
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x12
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:612: sword.spritids[0] = 4;
	ld	hl, #_sword
	ld	(hl), #0x04
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x13
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:615: sword.spritids[1] = 5;
	ld	hl, #_sword + 1
	ld	(hl), #0x05
;main.c:618: }
	ret
;main.c:621: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
	add	sp, #-6
;main.c:624: DISPLAY_OFF;
	call	_display_off
;main.c:626: while(1)
00178$:
;main.c:628: UINT8 current_pad = joypad();
	call	_joypad
	ldhl	sp,	#0
	ld	(hl), a
;main.c:630: if((current_pad & J_START) && !(prev_pad & J_START))
	push	hl
	ldhl	sp,	#2
	bit	7, (hl)
	pop	hl
	jp	Z, 00110$
	ld	a, (_prev_pad)
	rlca
	jp	C, 00110$
;main.c:632: if(gamestate == 0)
	ld	hl, #_gamestate
	ld	a, (hl)
	or	a, a
	jp	NZ, 00107$
;main.c:634: gamestate = 1;
	ld	(hl), #0x01
;main.c:635: initrand(DIV_REG);
	ldh	a, (_DIV_REG + 0)
	ld	c, a
	ld	b, #0x00
	push	bc
	call	_initrand
	pop	hl
;main.c:638: font_init();
	call	_font_init
;main.c:639: min_font = font_load(font_min);
	ld	de, #_font_min
	push	de
	call	_font_load
	pop	hl
;main.c:640: font_set(min_font);
	push	de
	call	_font_set
	pop	hl
;main.c:642: set_bkg_data(37, 8, backgroundtiles);
	ld	de, #_backgroundtiles
	push	de
	ld	hl, #0x825
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:643: set_bkg_tiles(0, 0, 20, 16, backgroundmap);
	ld	de, #_backgroundmap
	push	de
	ld	hl, #0x1014
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:645: set_win_tiles(0, 0, 20, 2, windowmap);
	ld	de, #_windowmap
	push	de
	ld	hl, #0x214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
;c:\gbdk\include\gb\gb.h:1739: WX_REG=x, WY_REG=y;
	ld	a, #0x08
	ldh	(_WX_REG + 0), a
	ld	a, #0x80
	ldh	(_WY_REG + 0), a
;main.c:650: set_sprite_data(0, 22, Girl);
	ld	de, #_Girl
	push	de
	ld	hl, #0x1600
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:651: setupgirl();
	call	_setupgirl
;main.c:653: setupsword();
	call	_setupsword
;main.c:654: room_0();  // Initialize room after sprite data is loaded
	call	_room_0
;main.c:662: BGP_REG  = 0xE4; // Background palette (light fill uses C1)
	ld	a, #0xe4
	ldh	(_BGP_REG + 0), a
;main.c:663: OBP0_REG = 0xE0; // Sprite palette 0: Girl/Sword (old colors)
	ld	a, #0xe0
	ldh	(_OBP0_REG + 0), a
;main.c:664: OBP1_REG = 0xE4; // Sprite palette 1: Slimes (clear, light, dark, black)
	ld	a, #0xe4
	ldh	(_OBP1_REG + 0), a
;main.c:665: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:666: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:667: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;main.c:668: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
	jr	00110$
00107$:
;main.c:670: else if(gamestate == 1)
	ld	a, (#_gamestate)
	dec	a
	jr	NZ, 00104$
;main.c:672: gamestate = 2;
	ld	hl, #_gamestate
	ld	(hl), #0x02
;main.c:673: HIDE_BKG;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfe
	ldh	(_LCDC_REG + 0), a
;main.c:674: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
	jr	00110$
00104$:
;main.c:676: else if(gamestate == 2)
	ld	a, (#_gamestate)
	sub	a, #0x02
	jr	NZ, 00110$
;main.c:678: gamestate = 1;
	ld	hl, #_gamestate
	ld	(hl), #0x01
;main.c:679: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:680: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
00110$:
;main.c:684: if(gamestate == 1)
	ld	a, (#_gamestate)
	dec	a
	jp	NZ, 00176$
;main.c:686: if (locktimer == 0)
	ld	a, (#_locktimer)
	or	a, a
	jp	NZ, 00159$
;main.c:688: if(joypad() & J_LEFT)
	call	_joypad
	bit	1, a
	jr	Z, 00124$
;main.c:690: direction = 2;
	ld	hl, #_direction
	ld	(hl), #0x02
;main.c:691: sword_set_direction(&sword);
	ld	de, #_sword
	call	_sword_set_direction
;main.c:692: if(girl.x > MIN_GIRL_X)
	ld	hl, #_girl + 4
	ld	a, (hl)
	cp	a, #0x18
	jr	C, 00113$
;main.c:694: girl.x -= 2;
	dec	a
	dec	a
	ld	(hl), a
00113$:
;main.c:697: if(girl.anim != 2 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	ld	hl, #_girl + 8
	ld	a, (hl)
;main.c:699: character_set_sprite(&girl, 2);
;main.c:697: if(girl.anim != 2 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	sub	a, #0x02
	jr	Z, 00119$
	call	_joypad
	bit	2, a
	jr	NZ, 00119$
	call	_joypad
	bit	3, a
	jr	NZ, 00119$
;main.c:699: character_set_sprite(&girl, 2);
	ld	a, #0x02
	ld	de, #_girl
	call	_character_set_sprite
	jr	00124$
00119$:
;main.c:701: else if(girl.anim != 3 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	ld	a, (hl)
	sub	a, #0x03
	jr	Z, 00124$
	call	_joypad
	bit	2, a
	jr	NZ, 00124$
	call	_joypad
	bit	3, a
	jr	NZ, 00124$
;main.c:703: character_set_sprite(&girl, 3);
	ld	a, #0x03
	ld	de, #_girl
	call	_character_set_sprite
00124$:
;main.c:706: if(joypad() & J_RIGHT)
	call	_joypad
	rrca
	jr	NC, 00137$
;main.c:708: direction = 3;
	ld	hl, #_direction
	ld	(hl), #0x03
;main.c:709: sword_set_direction(&sword);
	ld	de, #_sword
	call	_sword_set_direction
;main.c:710: if(girl.x < MAX_GIRL_X)
	ld	bc, #_girl + 4
	ld	a, (bc)
	cp	a, #0x8a
	jr	NC, 00126$
;main.c:712: girl.x += 2;
	add	a, #0x02
	ld	(bc), a
00126$:
;main.c:716: if(girl.anim != 4 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	ld	hl, #_girl + 8
	ld	a, (hl)
;main.c:718: character_set_sprite(&girl, 4);
;main.c:716: if(girl.anim != 4 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	sub	a, #0x04
	jr	Z, 00132$
	call	_joypad
	bit	2, a
	jr	NZ, 00132$
	call	_joypad
	bit	3, a
	jr	NZ, 00132$
;main.c:718: character_set_sprite(&girl, 4);
	ld	a, #0x04
	ld	de, #_girl
	call	_character_set_sprite
	jr	00137$
00132$:
;main.c:720: else if(girl.anim != 5 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00137$
	call	_joypad
	bit	2, a
	jr	NZ, 00137$
	call	_joypad
	bit	3, a
	jr	NZ, 00137$
;main.c:722: character_set_sprite(&girl, 5);
	ld	a, #0x05
	ld	de, #_girl
	call	_character_set_sprite
00137$:
;main.c:725: if(joypad() & J_UP)
	call	_joypad
	bit	2, a
	jr	Z, 00146$
;main.c:727: direction = 1;
	ld	hl, #_direction
	ld	(hl), #0x01
;main.c:728: sword_set_direction(&sword);
	ld	de, #_sword
	call	_sword_set_direction
;main.c:729: if(girl.y > MIN_GIRL_Y)
	ld	hl, #_girl + 5
	ld	a, (hl)
	cp	a, #0x15
	jr	C, 00139$
;main.c:732: girl.y -= 2;
	dec	a
	dec	a
	ld	(hl), a
00139$:
;main.c:734: if(girl.anim != 6)
	ld	a, (#(_girl + 8) + 0)
;main.c:736: character_set_sprite(&girl, 6);
	ld	de, #_girl
;main.c:734: if(girl.anim != 6)
	cp	a, #0x06
	jr	Z, 00143$
;main.c:736: character_set_sprite(&girl, 6);
	ld	a, #0x06
	call	_character_set_sprite
	jr	00146$
00143$:
;main.c:738: else if(girl.anim != 7)
	sub	a, #0x07
	jr	Z, 00146$
;main.c:740: character_set_sprite(&girl, 7);
	ld	a, #0x07
	call	_character_set_sprite
00146$:
;main.c:743: if(joypad() & J_DOWN)
	call	_joypad
	bit	3, a
	jr	Z, 00155$
;main.c:745: direction = 0;
	xor	a, a
	ld	(#_direction),a
;main.c:746: sword_set_direction(&sword);
	ld	de, #_sword
	call	_sword_set_direction
;main.c:747: if(girl.y < MAX_GIRL_Y)
	ld	hl, #_girl + 5
	ld	a, (hl)
	cp	a, #0x71
	jr	NC, 00148$
;main.c:750: girl.y += 2;
	add	a, #0x02
	ld	(hl), a
00148$:
;main.c:753: if(girl.anim != 0)
	ld	a, (#(_girl + 8) + 0)
;main.c:755: character_set_sprite(&girl, 0);
	ld	de, #_girl
;main.c:753: if(girl.anim != 0)
	or	a, a
	jr	Z, 00152$
;main.c:755: character_set_sprite(&girl, 0);
	xor	a, a
	call	_character_set_sprite
	jr	00155$
00152$:
;main.c:757: else if(girl.anim != 1)
	dec	a
	jr	Z, 00155$
;main.c:759: character_set_sprite(&girl, 1);
	ld	a, #0x01
	call	_character_set_sprite
00155$:
;main.c:763: if(joypad() & J_A)
	call	_joypad
	bit	4, a
	jr	Z, 00159$
;main.c:765: attack();
	call	_attack
00159$:
;main.c:769: if(locktimer > 0)
	ld	a, (#_locktimer)
	or	a, a
	jr	Z, 00162$
;main.c:772: for(UINT8 i = 0; i < 4; i++) {
	ldhl	sp,	#5
	ld	(hl), #0x00
00182$:
	ldhl	sp,	#5
	ld	a, (hl)
	sub	a, #0x04
	jr	NC, 00160$
;main.c:773: weapon_enemy_collision(&sword, &enemies[i], i);
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	de, #_enemies
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	ld	de, #_sword
	call	_weapon_enemy_collision
;main.c:772: for(UINT8 i = 0; i < 4; i++) {
	ldhl	sp,	#5
	inc	(hl)
	jr	00182$
00160$:
;main.c:775: locktimer++;
	ld	hl, #_locktimer
	inc	(hl)
00162$:
;main.c:777: if(locktimer == ATTACK_LOCK_TIME)
	ld	a, (#_locktimer)
	sub	a, #0x0a
	jr	NZ, 00236$
;main.c:779: locktimer = 0;
	xor	a, a
	ld	(#_locktimer),a
;main.c:780: swordreset();
	call	_swordreset
;main.c:784: for(UINT8 i = 0; i < 4; i++)
00236$:
	ld	bc, #_enemies+0
	ldhl	sp,	#5
	ld	(hl), #0x00
00185$:
	ldhl	sp,	#5
	ld	a, (hl)
	sub	a, #0x04
	jr	NC, 00170$
;main.c:786: if(enemies[i].death == 0)
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#3
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#2
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0009
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	e, a
;main.c:788: animate_enemy(&enemies[i], 16, 17);
	ldhl	sp,	#1
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
;main.c:786: if(enemies[i].death == 0)
	ld	a, e
	or	a, a
	jr	NZ, 00168$
;main.c:788: animate_enemy(&enemies[i], 16, 17);
	dec	hl
	push	bc
	ld	a, #0x11
	push	af
	inc	sp
	ld	a, #0x10
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_animate_enemy
	pop	bc
	jr	00186$
00168$:
;main.c:790: else if(enemies[i].death == 1)
	dec	e
	jr	NZ, 00186$
;main.c:792: enemies[i].x = 0;
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	e, l
	ld	d, h
	xor	a, a
	ld	(de), a
;main.c:793: enemies[i].y = 0;
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	e, l
	ld	d, h
	xor	a, a
	ld	(de), a
;main.c:794: moveslime(&enemies[i], 0, 0);
	push	bc
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	ldhl	sp,	#6
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_moveslime
	pop	bc
00186$:
;main.c:784: for(UINT8 i = 0; i < 4; i++)
	ldhl	sp,	#5
	inc	(hl)
	jp	00185$
00170$:
;main.c:799: animtimer++;
	ld	hl, #_animtimer
	inc	(hl)
;main.c:800: if(animtimer == ANIM_TIMER_MAX)
	ld	a, (hl)
	sub	a, #0x14
	jr	NZ, 00242$
;main.c:802: animtimer = 0;
	xor	a, a
	ld	(#_animtimer),a
;main.c:803: for(UINT8 i = 0; i < 4; i++)
	ldhl	sp,	#5
	ld	(hl), #0x00
00188$:
	ldhl	sp,	#5
	ld	a, (hl)
	sub	a, #0x04
	jr	NC, 00242$
;main.c:805: enemies[i].anim = (enemies[i].anim == 0) ? 1 : 0;
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	ld	de, #_enemies
	add	hl, de
	ld	de, #0x8
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	or	a, a
	ld	a, #0x01
	jr	Z, 00196$
	xor	a, a
00196$:
	ld	(de), a
;main.c:803: for(UINT8 i = 0; i < 4; i++)
	ldhl	sp,	#5
	inc	(hl)
	jr	00188$
;main.c:810: for(UINT8 i = 0; i < 4; i++)
00242$:
	ldhl	sp,	#5
	ld	(hl), #0x00
00191$:
	ldhl	sp,	#5
	ld	a, (hl)
	sub	a, #0x04
	jr	NC, 00176$
;main.c:812: character_enemy_collision(&girl, &enemies[i]);
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	de, #_enemies
	add	hl, de
	ld	c, l
	ld	b, h
	ld	de, #_girl
	call	_character_enemy_collision
;main.c:810: for(UINT8 i = 0; i < 4; i++)
	ldhl	sp,	#5
	inc	(hl)
	jr	00191$
00176$:
;main.c:854: prev_pad = current_pad;
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(#_prev_pad),a
;main.c:855: performantdelay(5);
	ld	a, #0x05
	call	_performantdelay
	jp	00178$
;main.c:858: }
	add	sp, #6
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__Girl:
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x1b	; 27
	.db #0x1f	; 31
	.db #0x37	; 55	'7'
	.db #0x3f	; 63
	.db #0x6f	; 111	'o'
	.db #0x7f	; 127
	.db #0x5f	; 95
	.db #0x7e	; 126
	.db #0x7f	; 127
	.db #0x78	; 120	'x'
	.db #0x7f	; 127
	.db #0x72	; 114	'r'
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x7e	; 126
	.db #0xfe	; 254
	.db #0x1e	; 30
	.db #0xfe	; 254
	.db #0x4e	; 78	'N'
	.db #0x3f	; 63
	.db #0x32	; 50	'2'
	.db #0x3f	; 63
	.db #0x38	; 56	'8'
	.db #0x6f	; 111	'o'
	.db #0x7f	; 127
	.db #0x79	; 121	'y'
	.db #0x5f	; 95
	.db #0x36	; 54	'6'
	.db #0x3f	; 63
	.db #0x1d	; 29
	.db #0x1f	; 31
	.db #0x33	; 51	'3'
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0xf8	; 248
	.db #0x48	; 72	'H'
	.db #0xf4	; 244
	.db #0x1c	; 28
	.db #0xf6	; 246
	.db #0xfa	; 250
	.db #0xbe	; 190
	.db #0xfa	; 250
	.db #0x7c	; 124
	.db #0xfc	; 252
	.db #0xb8	; 184
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x1b	; 27
	.db #0x1f	; 31
	.db #0x37	; 55	'7'
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x6f	; 111	'o'
	.db #0x7f	; 127
	.db #0x4b	; 75	'K'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xb0	; 176
	.db #0xf0	; 240
	.db #0xd8	; 216
	.db #0xf8	; 248
	.db #0xec	; 236
	.db #0xfc	; 252
	.db #0xec	; 236
	.db #0x7c	; 124
	.db #0xfc	; 252
	.db #0x7c	; 124
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x09	; 9
	.db #0x1f	; 31
	.db #0x19	; 25
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x4f	; 79	'O'
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7c	; 124
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xec	; 236
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xdc	; 220
	.db #0xfc	; 252
	.db #0xdc	; 220
	.db #0xfc	; 252
	.db #0x90	; 144
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x1b	; 27
	.db #0x1f	; 31
	.db #0x37	; 55	'7'
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x6f	; 111	'o'
	.db #0x7f	; 127
	.db #0x4b	; 75	'K'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xb0	; 176
	.db #0xf0	; 240
	.db #0xd8	; 216
	.db #0xf8	; 248
	.db #0xec	; 236
	.db #0xfc	; 252
	.db #0xec	; 236
	.db #0x7c	; 124
	.db #0xfc	; 252
	.db #0x7c	; 124
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x09	; 9
	.db #0x1f	; 31
	.db #0x19	; 25
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1c	; 28
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x7c	; 124
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xec	; 236
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x20	; 32
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x0d	; 13
	.db #0x0f	; 15
	.db #0x1b	; 27
	.db #0x1f	; 31
	.db #0x37	; 55	'7'
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7b	; 123
	.db #0x7f	; 127
	.db #0x76	; 118	'v'
	.db #0x3f	; 63
	.db #0x6d	; 109	'm'
	.db #0x7f	; 127
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x6f	; 111	'o'
	.db #0x7f	; 127
	.db #0x79	; 121	'y'
	.db #0x5f	; 95
	.db #0x36	; 54	'6'
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x33	; 51	'3'
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xf4	; 244
	.db #0xfc	; 252
	.db #0xf6	; 246
	.db #0xfa	; 250
	.db #0xfe	; 254
	.db #0xfa	; 250
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x36	; 54	'6'
	.db #0x3e	; 62
	.db #0x51	; 81	'Q'
	.db #0x6f	; 111	'o'
	.db #0xa1	; 161
	.db #0xdf	; 223
	.db #0x83	; 131
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x66	; 102	'f'
	.db #0x7e	; 126
	.db #0xa1	; 161
	.db #0xdf	; 223
	.db #0x83	; 131
	.db #0xff	; 255
	.db #0x87	; 135
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x8b	; 139
	.db #0x7f	; 127
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x3c	; 60
	.db #0x23	; 35
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x36	; 54	'6'
	.db #0x3e	; 62
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__backgroundtiles:
	.db #0xfb	; 251
	.db #0x00	; 0
	.db #0xfd	; 253
	.db #0x00	; 0
	.db #0xed	; 237
	.db #0x00	; 0
	.db #0xb5	; 181
	.db #0x4a	; 74	'J'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xd7	; 215
	.db #0x00	; 0
	.db #0xdb	; 219
	.db #0x24	; 36
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xbf	; 191
	.db #0x00	; 0
	.db #0xdd	; 221
	.db #0x02	; 2
	.db #0xdf	; 223
	.db #0x20	; 32
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0xdd	; 221
	.db #0x02	; 2
	.db #0xdf	; 223
	.db #0x00	; 0
	.db #0xdf	; 223
	.db #0x20	; 32
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xb7	; 183
	.db #0x00	; 0
	.db #0xbb	; 187
	.db #0x40	; 64
	.db #0xfb	; 251
	.db #0x00	; 0
	.db #0xfb	; 251
	.db #0x04	; 4
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xbb	; 187
	.db #0x40	; 64
	.db #0xfb	; 251
	.db #0x04	; 4
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xbd	; 189
	.db #0x00	; 0
	.db #0xbd	; 189
	.db #0x42	; 66	'B'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xd7	; 215
	.db #0x20	; 32
	.db #0xfb	; 251
	.db #0x04	; 4
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfd	; 253
	.db #0x02	; 2
	.db #0xff	; 255
	.db #0x60	; 96
	.db #0xff	; 255
	.db #0x90	; 144
	.db #0xff	; 255
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0xf0	; 240
	.db #0x90	; 144
	.db #0xff	; 255
	.db #0x9f	; 159
	.db #0xff	; 255
	.db #0x9f	; 159
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x06	; 6
	.db #0xff	; 255
	.db #0x09	; 9
	.db #0xff	; 255
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x0f	; 15
	.db #0x0d	; 13
	.db #0xfb	; 251
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xf9	; 249
	.db #0xff	; 255
	.db #0x9f	; 159
	.db #0xff	; 255
	.db #0x9f	; 159
	.db #0xff	; 255
	.db #0x9f	; 159
	.db #0xf0	; 240
	.db #0xd0	; 208
	.db #0xb0	; 176
	.db #0xd0	; 208
	.db #0xff	; 255
	.db #0x9f	; 159
	.db #0xff	; 255
	.db #0x9f	; 159
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0x60	; 96
	.db #0xf9	; 249
	.db #0xff	; 255
	.db #0xf9	; 249
	.db #0xff	; 255
	.db #0xf9	; 249
	.db #0x0f	; 15
	.db #0x09	; 9
	.db #0x0f	; 15
	.db #0x09	; 9
	.db #0xff	; 255
	.db #0xf9	; 249
	.db #0xff	; 255
	.db #0xf9	; 249
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__backgroundmap:
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x26	; 38
__xinit__windowmap:
	.db #0x16	; 22
	.db #0x0f	; 15
	.db #0x20	; 32
	.db #0x0f	; 15
	.db #0x16	; 22
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x22	; 34
	.db #0x1a	; 26
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1d	; 29
	.db #0x0d	; 13
	.db #0x19	; 25
	.db #0x1c	; 28
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__gamestate:
	.db #0x00	; 0
__xinit__score:
	.db #0x00	; 0
__xinit__spritesize:
	.db #0x08	; 8
__xinit__collision:
	.db #0x00	; 0
__xinit__pad:
	.db #0x02	; 2
__xinit__animtimer:
	.db #0x00	; 0
__xinit__locktimer:
	.db #0x00	; 0
__xinit__spawntimer:
	.db #0x00	; 0
__xinit__direction:
	.db #0x00	; 0
__xinit__room:
	.db #0x00	; 0
__xinit__prev_pad:
	.db #0x00	; 0
	.area _CABS (ABS)
