;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module main
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _setupsword
	.globl _setupslime
	.globl _setupgirl
	.globl _character_set_sprite
	.globl _enemy_check_borders
	.globl _animate_enemy
	.globl _swordreset
	.globl _attack
	.globl _sword_set_direction
	.globl _movegirl
	.globl _weapon_enemy_collision
	.globl _character_enemy_collision
	.globl _performantdelay
	.globl _room_0
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
	.globl _slime_1
	.globl _slime_0
	.globl _slime
	.globl _sword
	.globl _girl
	.globl _moveslime
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
	.ds 8
_slime_0::
	.ds 8
_slime_1::
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
;main.c:121: void room_0()
;	---------------------------------
; Function room_0
; ---------------------------------
_room_0::
;main.c:123: if (room == 0)
	ld	a, (#_room)
	or	a, a
	ret	NZ
;main.c:126: slime_0.x = 26;
	ld	hl, #(_slime_0 + 2)
	ld	(hl), #0x1a
;main.c:127: slime_0.y = 50;
	ld	bc, #_slime_0 + 3
;main.c:128: slime_0.width = 8;
	inc	hl
	inc	hl
	ld	a, #0x32
	ld	(bc), a
	ld	(hl), #0x08
;main.c:129: slime_0.height = 8;
	ld	hl, #_slime_0 + 5
	ld	(hl), #0x08
;main.c:130: slime_0.anim = 0;
	ld	hl, #_slime_0 + 6
	ld	(hl), #0x00
;main.c:131: slime_0.death = 0;
	ld	hl, #_slime_0 + 7
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 90)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x10
	ld	(hl+), a
	ld	(hl), #0x10
;main.c:136: slime_0.spritids[0] = 22;
	ld	hl, #_slime_0
	ld	(hl), #0x16
;main.c:138: moveslime(&slime_0, slime_0.x, slime_0.y);
	ld	a, (bc)
	ld	hl, #(_slime_0 + 2)
	ld	c, (hl)
	push	af
	inc	sp
	ld	a, c
	ld	de, #_slime_0
	call	_moveslime
;main.c:140: slime_1.x = 26;
	ld	hl, #(_slime_1 + 2)
	ld	(hl), #0x1a
;main.c:141: slime_1.y = 70;
	ld	bc, #_slime_1 + 3
;main.c:142: slime_1.width = 8;
	inc	hl
	inc	hl
	ld	a, #0x46
	ld	(bc), a
	ld	(hl), #0x08
;main.c:143: slime_1.height = 8;
	ld	hl, #_slime_1 + 5
	ld	(hl), #0x08
;main.c:144: slime_1.anim = 0;
	ld	hl, #_slime_1 + 6
	ld	(hl), #0x00
;main.c:145: slime_1.death = 0;
	ld	hl, #_slime_1 + 7
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 94)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x10
	ld	(hl+), a
	ld	(hl), #0x10
;main.c:150: slime_1.spritids[0] = 23;
	ld	hl, #_slime_1
	ld	(hl), #0x17
;main.c:152: moveslime(&slime_1, slime_1.x, slime_1.y);
	ld	a, (bc)
	ld	hl, #(_slime_1 + 2)
	ld	c, (hl)
	push	af
	inc	sp
	ld	a, c
	ld	de, #_slime_1
	call	_moveslime
;main.c:154: }
	ret
;main.c:158: void performantdelay(UINT8 numloops)
;	---------------------------------
; Function performantdelay
; ---------------------------------
_performantdelay::
	ld	c, a
;main.c:161: for(i = 0; i < numloops; i++)
	ld	b, #0x00
00103$:
	ld	a, b
	sub	a, c
	ret	NC
;main.c:163: wait_vbl_done();
	call	_wait_vbl_done
;main.c:161: for(i = 0; i < numloops; i++)
	inc	b
;main.c:165: }
	jr	00103$
;main.c:183: void character_enemy_collision(struct GameCharacter* character, struct Enemy* enemy)
;	---------------------------------
; Function character_enemy_collision
; ---------------------------------
_character_enemy_collision::
	add	sp, #-12
	ldhl	sp,	#10
	ld	a, e
	ld	(hl+), a
;main.c:185: if (character->x < enemy->x + enemy->width - pad &&
	ld	a, d
	ld	(hl-), a
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
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #0x0004
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
	jr	Z, 00140$
	bit	7, d
	jr	NZ, 00141$
	cp	a, a
	jr	00141$
00140$:
	bit	7, d
	jr	Z, 00141$
	scf
00141$:
	jp	NC, 00110$
;main.c:186: character->x + character->width - pad > enemy->x &&
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
	jr	Z, 00142$
	bit	7, d
	jr	NZ, 00143$
	cp	a, a
	jr	00143$
00142$:
	bit	7, d
	jr	Z, 00143$
	scf
00143$:
	jp	NC, 00110$
;main.c:187: character->y < enemy->y + enemy->height - pad &&
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
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #0x0005
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
	jr	Z, 00144$
	bit	7, d
	jr	NZ, 00145$
	cp	a, a
	jr	00145$
00144$:
	bit	7, d
	jr	Z, 00145$
	scf
00145$:
	jp	NC, 00110$
;main.c:188: character->y + character->height - pad > enemy->y)
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
	jr	Z, 00146$
	bit	7, d
	jr	NZ, 00147$
	cp	a, a
	jr	00147$
00146$:
	bit	7, d
	jr	Z, 00147$
	scf
00147$:
	jr	NC, 00110$
;main.c:191: hide_sprite(character->spritids[0]);
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
;main.c:192: hide_sprite(character->spritids[1]);
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
;main.c:193: hide_sprite(character->spritids[2]);
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
;main.c:194: hide_sprite(character->spritids[3]);
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
;main.c:194: hide_sprite(character->spritids[3]);
00110$:
;main.c:197: }
	add	sp, #12
	ret
;main.c:198: void weapon_enemy_collision(struct Weapon* weapon, struct Enemy* enemy)
;	---------------------------------
; Function weapon_enemy_collision
; ---------------------------------
_weapon_enemy_collision::
	add	sp, #-14
	ldhl	sp,	#12
	ld	a, e
	ld	(hl+), a
;main.c:200: if (weapon->x < enemy->x + enemy->width &&
	ld	a, d
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	ld	d, a
	inc	de
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	hl, #0x0002
	add	hl, bc
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ldhl	sp,	#6
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #0x0004
	add	hl, bc
	ld	e, (hl)
	ld	d, #0x00
	ldhl	sp,	#6
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl+), a
	inc	hl
	ld	a, (hl-)
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,	#10
	ld	e, l
	ld	d, h
	ldhl	sp,	#8
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jp	NC, 00106$
;main.c:201: weapon->x + weapon->width > enemy->x &&
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	d, #0x00
	ld	e, a
	ldhl	sp,	#10
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl), a
	ldhl	sp,	#6
	ld	e, l
	ld	d, h
	ldhl	sp,	#8
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jp	NC, 00106$
;main.c:202: weapon->y < enemy->y + enemy->height &&
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	ld	d, a
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	hl, #0x0003
	add	hl, bc
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
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #0x0005
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl+), a
	inc	hl
	ld	a, (hl-)
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,	#10
	ld	e, l
	ld	d, h
	ldhl	sp,	#8
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00106$
;main.c:203: weapon->y + enemy->height > enemy->y)
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#6
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl), a
	ldhl	sp,	#4
	ld	e, l
	ld	d, h
	ldhl	sp,	#8
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00106$
;main.c:206: enemy->death = 1;
	ld	hl, #0x0007
	add	hl, bc
	ld	(hl), #0x01
;main.c:207: enemy->x = 0;
	pop	hl
	ld	(hl), #0x00
	push	hl
;main.c:208: enemy->y = 0;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;main.c:209: score = score ++;
00106$:
;main.c:212: }
	add	sp, #14
	ret
;main.c:213: void movegirl(struct GameCharacter* character, UINT8 x, UINT8 y)
;	---------------------------------
; Function movegirl
; ---------------------------------
_movegirl::
	dec	sp
	ldhl	sp,	#0
	ld	(hl), a
;main.c:215: move_sprite(character->spritids[0], x, y);
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
;main.c:216: move_sprite(character->spritids[1], x + spritesize, y);
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
;main.c:217: move_sprite(character->spritids[2], x, y + spritesize);
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
;main.c:218: move_sprite(character->spritids[3], x + spritesize, y + spritesize);
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
;main.c:218: move_sprite(character->spritids[3], x + spritesize, y + spritesize);
;main.c:219: }
	inc	sp
	pop	hl
	inc	sp
	jp	(hl)
;main.c:222: void sword_set_direction(struct Weapon* weapon)
;	---------------------------------
; Function sword_set_direction
; ---------------------------------
_sword_set_direction::
	add	sp, #-3
	ldhl	sp,	#1
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:226: if(direction == 2) // left
	ld	a, (#_direction)
	sub	a, #0x02
	jr	NZ, 00110$
;main.c:228: sword.x = girl.x - 3;
	ld	a, (#(_girl + 4) + 0)
	add	a, #0xfd
	ld	hl, #(_sword + 2)
;main.c:229: sword.y = girl.y + 8;
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
;main.c:232: sword.spritids[0] = 4;
	ld	hl, #_sword
	ld	(hl), #0x04
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x13
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:235: sword.spritids[1] = 5;
	ld	hl, #_sword + 1
	ld	(hl), #0x05
;main.c:236: move_sprite(weapon->spritids[0], sword.x, sword.y);
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
;main.c:237: move_sprite(weapon->spritids[1], sword.x - spritesize, sword.y);
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
;main.c:237: move_sprite(weapon->spritids[1], sword.x - spritesize, sword.y);
	jp	00136$
00110$:
;main.c:239: else if(direction == 3) // right
	ld	a, (#_direction)
	sub	a, #0x03
	jr	NZ, 00107$
;main.c:241: sword.x = girl.x + 21;
	ld	a, (#(_girl + 4) + 0)
	add	a, #0x15
	ld	hl, #(_sword + 2)
;main.c:242: sword.y = girl.y + 8;
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
;main.c:245: sword.spritids[1] = 4;
	ld	hl, #_sword + 1
	ld	(hl), #0x04
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x13
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:248: sword.spritids[0] = 5;
	ld	hl, #_sword
	ld	(hl), #0x05
;main.c:249: move_sprite(weapon->spritids[0], sword.x, sword.y);
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
;main.c:250: move_sprite(weapon->spritids[1], sword.x - spritesize, sword.y);
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
;main.c:250: move_sprite(weapon->spritids[1], sword.x - spritesize, sword.y);
	jp	00136$
00107$:
;main.c:252: else if(direction == 1) // up
	ld	a, (#_direction)
	dec	a
	jr	NZ, 00104$
;main.c:254: sword.x = girl.x + 9;
	ld	a, (#(_girl + 4) + 0)
	add	a, #0x09
	ld	hl, #(_sword + 2)
;main.c:255: sword.y = girl.y;
	ld	(hl+), a
	ld	a, (#(_girl + 5) + 0)
	ld	(hl), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x14
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:258: sword.spritids[0] = 4;
	ld	hl, #_sword
	ld	(hl), #0x04
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x15
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:261: sword.spritids[1] = 5;
	ld	hl, #_sword + 1
	ld	(hl), #0x05
;main.c:262: move_sprite(weapon->spritids[0], sword.x, sword.y);
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
;main.c:263: move_sprite(weapon->spritids[1], sword.x, sword.y - spritesize);
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
;main.c:263: move_sprite(weapon->spritids[1], sword.x, sword.y - spritesize);
	jr	00136$
00104$:
;main.c:265: else if(direction == 0) // down
	ld	a, (#_direction)
	or	a, a
	jr	NZ, 00136$
;main.c:267: sword.x = girl.x - 2;
	ld	a, (#(_girl + 4) + 0)
	dec	a
	dec	a
	ld	hl, #(_sword + 2)
;main.c:268: sword.y = girl.y + 20;
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
;main.c:271: sword.spritids[1] = 4;
	ld	hl, #_sword + 1
	ld	(hl), #0x04
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x15
	ld	(hl+), a
	ld	(hl), #0x40
;main.c:274: sword.spritids[0] = 5;
	ld	hl, #_sword
	ld	(hl), #0x05
;main.c:275: move_sprite(weapon->spritids[0], sword.x, sword.y);
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
;main.c:276: move_sprite(weapon->spritids[1], sword.x, sword.y - spritesize);
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
;main.c:276: move_sprite(weapon->spritids[1], sword.x, sword.y - spritesize);
00136$:
;main.c:278: }
	add	sp, #3
	ret
;main.c:279: void attack()
;	---------------------------------
; Function attack
; ---------------------------------
_attack::
;main.c:281: sword_set_direction(&sword);
	ld	de, #_sword
	call	_sword_set_direction
;main.c:284: sword.y = sword.y + 6;
	ld	bc, #_sword + 3
;main.c:282: if(direction == 0)
	ld	a, (#_direction)
	or	a, a
	jr	NZ, 00110$
;main.c:284: sword.y = sword.y + 6;
	ld	a, (bc)
	add	a, #0x06
	ld	(bc), a
	jr	00111$
00110$:
;main.c:286: else if(direction == 1)
	ld	a, (#_direction)
	dec	a
	jr	NZ, 00107$
;main.c:288: sword.y = sword.y - 6;
	ld	a, (bc)
	add	a, #0xfa
	ld	(bc), a
	jr	00111$
00107$:
;main.c:292: sword.x = sword.x - 6;
	ld	bc, #_sword + 2
;main.c:290: else if(direction == 2)
	ld	a, (#_direction)
	sub	a, #0x02
	jr	NZ, 00104$
;main.c:292: sword.x = sword.x - 6;
	ld	a, (bc)
	add	a, #0xfa
	ld	(bc), a
	jr	00111$
00104$:
;main.c:294: else if(direction == 3)
	ld	a, (#_direction)
	sub	a, #0x03
	jr	NZ, 00111$
;main.c:296: sword.x = sword.x + 6;
	ld	a, (bc)
	add	a, #0x06
	ld	(bc), a
00111$:
;main.c:298: if (locktimer == 0)
	ld	hl, #_locktimer
	ld	a, (hl)
	or	a, a
	ret	NZ
;main.c:300: locktimer ++;
	inc	(hl)
;main.c:302: }
	ret
;main.c:303: void swordreset()
;	---------------------------------
; Function swordreset
; ---------------------------------
_swordreset::
;main.c:305: if(direction == 0)
	ld	a, (#_direction)
	or	a, a
	jr	NZ, 00110$
;main.c:307: sword.y = sword.y - 8;
	ld	bc, #_sword+3
	ld	a, (bc)
	add	a, #0xf8
	ld	(bc), a
	jr	00111$
00110$:
;main.c:309: else if(direction == 1)
	ld	a, (#_direction)
	dec	a
	jr	NZ, 00107$
;main.c:311: sword.y = sword.y + 8;
	ld	bc, #_sword+3
	ld	a, (bc)
	add	a, #0x08
	ld	(bc), a
	jr	00111$
00107$:
;main.c:313: else if(direction == 2)
	ld	a, (#_direction)
	sub	a, #0x02
	jr	NZ, 00104$
;main.c:315: sword.x = sword.x + 8;
	ld	bc, #_sword+2
	ld	a, (bc)
	add	a, #0x08
	ld	(bc), a
	jr	00111$
00104$:
;main.c:317: else if(direction == 3)
	ld	a, (#_direction)
	sub	a, #0x03
	jr	NZ, 00111$
;main.c:319: sword.x = sword.x - 8;
	ld	bc, #_sword+2
	ld	a, (bc)
	add	a, #0xf8
	ld	(bc), a
00111$:
;main.c:321: sword_set_direction(&sword);
	ld	de, #_sword
;main.c:322: }
	jp	_sword_set_direction
;main.c:323: void moveslime(struct Enemy* character, UINT8 x, UINT8 y)
;	---------------------------------
; Function moveslime
; ---------------------------------
_moveslime::
	ld	c, a
;main.c:325: move_sprite(character->spritids[0], x, y);
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
;main.c:325: move_sprite(character->spritids[0], x, y);
;main.c:326: }
	pop	hl
	inc	sp
	jp	(hl)
;main.c:327: void animate_enemy(struct Enemy* enemy, UINT8 tile0, UINT8 tile1)
;	---------------------------------
; Function animate_enemy
; ---------------------------------
_animate_enemy::
	dec	sp
	dec	sp
	ld	c, a
;main.c:330: if(enemy->anim == 0)
	ld	hl, #0x0006
	add	hl, de
	ld	b, (hl)
;main.c:332: set_sprite_tile(enemy->spritids[0], tile0);
	inc	sp
	inc	sp
	push	de
;main.c:330: if(enemy->anim == 0)
	ld	a, b
	or	a, a
	jr	NZ, 00104$
;main.c:332: set_sprite_tile(enemy->spritids[0], tile0);
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
;main.c:332: set_sprite_tile(enemy->spritids[0], tile0);
	jr	00108$
00104$:
;main.c:334: else if(enemy->anim == 1)
	dec	b
	jr	NZ, 00108$
;main.c:336: set_sprite_tile(enemy->spritids[0], tile1);
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
;main.c:336: set_sprite_tile(enemy->spritids[0], tile1);
00108$:
;main.c:338: }
	inc	sp
	inc	sp
	pop	hl
	inc	sp
	jp	(hl)
;main.c:340: void enemy_check_borders(struct Enemy* enemy)
;	---------------------------------
; Function enemy_check_borders
; ---------------------------------
_enemy_check_borders::
;main.c:342: if (enemy->x < MIN_ENEMY_X)
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	a, (hl)
	sub	a, #0x10
	jr	NC, 00102$
;main.c:344: enemy->x = MIN_ENEMY_X;
	ld	(hl), #0x10
00102$:
;main.c:346: if (enemy->x > MAX_ENEMY_X)
	ld	a, (hl)
	cp	a, #0x99
	jr	C, 00104$
;main.c:348: enemy->x = MAX_ENEMY_X;
	ld	(hl), #0x98
00104$:
;main.c:350: if (enemy->y < MIN_ENEMY_Y)
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	sub	a, #0x14
	jr	NC, 00106$
;main.c:352: enemy->y = MIN_ENEMY_Y;
	ld	(hl), #0x14
00106$:
;main.c:354: if (enemy->y > MAX_ENEMY_Y)
	ld	a, (hl)
	cp	a, #0x81
	ret	C
;main.c:356: enemy->y = MAX_ENEMY_Y;
	ld	(hl), #0x80
;main.c:358: }
	ret
;main.c:361: void character_set_sprite(struct GameCharacter* character, UINT8 anim_state)
;	---------------------------------
; Function character_set_sprite
; ---------------------------------
_character_set_sprite::
	ld	c, e
	ld	b, d
;main.c:366: if(anim_state == 0) // down walking
	or	a, a
	jr	NZ, 00122$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;main.c:370: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:373: character->spritids[1] = 1;
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
;main.c:376: character->spritids[3] = 2;
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
;main.c:379: character->spritids[2] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jp	00123$
00122$:
;main.c:381: else if(anim_state == 1) // down standing
	cp	a, #0x01
	jr	NZ, 00119$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;main.c:385: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:388: character->spritids[1] = 1;
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
;main.c:391: character->spritids[2] = 2;
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
;main.c:394: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jp	00123$
00119$:
;main.c:396: else if(anim_state == 2) // left walking
	cp	a, #0x02
	jr	NZ, 00116$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x04
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:400: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x05
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:403: character->spritids[1] = 1;
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
;main.c:406: character->spritids[2] = 2;
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
;main.c:409: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jp	00123$
00116$:
;main.c:411: else if(anim_state == 3) // left standing
	cp	a, #0x03
	jr	NZ, 00113$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x08
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:415: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x09
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:418: character->spritids[1] = 1;
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
;main.c:421: character->spritids[2] = 2;
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
;main.c:424: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jp	00123$
00113$:
;main.c:426: else if(anim_state == 4) // right walking
	cp	a, #0x04
	jr	NZ, 00110$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x05
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:430: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x04
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:433: character->spritids[1] = 1;
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
;main.c:436: character->spritids[2] = 2;
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
;main.c:439: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jp	00123$
00110$:
;main.c:441: else if(anim_state == 5) // right standing
	cp	a, #0x05
	jr	NZ, 00107$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x09
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:445: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x08
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:448: character->spritids[1] = 1;
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
;main.c:451: character->spritids[2] = 2;
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
;main.c:454: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jr	00123$
00107$:
;main.c:456: else if(anim_state == 6) // up walking
	cp	a, #0x06
	jr	NZ, 00104$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0c
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:460: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0d
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:463: character->spritids[1] = 1;
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
;main.c:466: character->spritids[2] = 2;
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
;main.c:469: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jr	00123$
00104$:
;main.c:471: else if(anim_state == 7) // up standing
	sub	a, #0x07
	jr	NZ, 00123$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0c
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:475: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0d
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:478: character->spritids[1] = 1;
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
;main.c:481: character->spritids[2] = 2;
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
;main.c:484: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
00123$:
;main.c:487: movegirl(character, character->x, character->y);
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
;main.c:488: }
	ret
;main.c:490: void setupgirl()
;	---------------------------------
; Function setupgirl
; ---------------------------------
_setupgirl::
;main.c:492: girl.x = 80;
	ld	bc, #_girl + 4
	ld	a, #0x50
	ld	(bc), a
;main.c:493: girl.y = 36;
	ld	hl, #(_girl + 5)
;main.c:494: girl.width = 16;
	ld	a, #0x24
	ld	(hl+), a
	ld	(hl), #0x10
;main.c:495: girl.height = 16;
	ld	hl, #_girl + 7
	ld	(hl), #0x10
;main.c:496: girl.anim = 0;
	ld	hl, #_girl + 8
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;main.c:500: girl.spritids[0] = 0;
	ld	hl, #_girl
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:503: girl.spritids[1] = 1;
	ld	hl, #_girl + 1
	ld	(hl), #0x01
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x02
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:506: girl.spritids[2] = 2;
	ld	hl, #_girl + 2
	ld	(hl), #0x02
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x03
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:509: girl.spritids[3] = 3;
	ld	hl, #_girl + 3
	ld	(hl), #0x03
;main.c:511: movegirl(&girl, girl.x, girl.y);
	ld	hl, #(_girl + 5)
	ld	h, (hl)
	ld	a, (bc)
	push	hl
	inc	sp
	ld	de, #_girl
	call	_movegirl
;main.c:512: }
	ret
;main.c:514: void setupslime()
;	---------------------------------
; Function setupslime
; ---------------------------------
_setupslime::
;main.c:516: slime.x = rand() % 128 + 16;
	call	_rand
	ld	a, e
	res	7, a
	add	a, #0x10
	ld	(#(_slime + 2)),a
;main.c:517: slime.y = rand() % 96 + 24;
	call	_rand
	ld	a, e
	ld	e, #0x60
	call	__moduchar
	ld	a, c
	add	a, #0x18
	ld	hl, #(_slime + 3)
;main.c:518: slime.width = 8;
	ld	(hl+), a
	ld	(hl), #0x08
;main.c:519: slime.height = 8;
	ld	hl, #_slime + 5
	ld	(hl), #0x08
;main.c:520: slime.anim = 0;
	ld	hl, #_slime + 6
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 90)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x10
	ld	(hl+), a
	ld	(hl), #0x10
;main.c:524: slime.spritids[0] = 22;
	ld	hl, #_slime
	ld	(hl), #0x16
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 94)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x11
	ld	(hl+), a
	ld	(hl), #0x10
;main.c:527: slime.spritids[1] = 23;
	ld	hl, #_slime + 1
	ld	(hl), #0x17
;main.c:529: moveslime(&slime, slime.x, slime.y);
	ld	hl, #(_slime + 3)
	ld	b, (hl)
	ld	a, (#(_slime + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_slime
	call	_moveslime
;main.c:530: }
	ret
;main.c:532: void setupsword()
;	---------------------------------
; Function setupsword
; ---------------------------------
_setupsword::
;main.c:534: sword.x = 100;
	ld	hl, #_sword + 2
	ld	(hl), #0x64
;main.c:535: sword.y = 100;
	ld	hl, #_sword + 3
	ld	(hl), #0x64
;main.c:536: sword.width = 8;
	ld	hl, #_sword + 4
	ld	(hl), #0x08
;main.c:537: sword.height = 8;
	ld	hl, #_sword + 5
	ld	(hl), #0x08
;main.c:538: sword.anim = 0;
	ld	hl, #_sword + 6
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x12
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:543: sword.spritids[0] = 4;
	ld	hl, #_sword
	ld	(hl), #0x04
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x13
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:546: sword.spritids[1] = 5;
	ld	hl, #_sword + 1
	ld	(hl), #0x05
;main.c:549: }
	ret
;main.c:552: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
	dec	sp
;main.c:555: DISPLAY_OFF;
	call	_display_off
;main.c:557: while(1)
00189$:
;main.c:559: UINT8 current_pad = joypad();
	call	_joypad
	ldhl	sp,	#0
	ld	(hl), a
;main.c:561: if((current_pad & J_START) && !(prev_pad & J_START))
	push	hl
	ldhl	sp,	#2
	bit	7, (hl)
	pop	hl
	jp	Z, 00110$
	ld	a, (_prev_pad)
	rlca
	jp	C, 00110$
;main.c:563: if(gamestate == 0)
	ld	hl, #_gamestate
	ld	a, (hl)
	or	a, a
	jp	NZ, 00107$
;main.c:565: gamestate = 1;
	ld	(hl), #0x01
;main.c:566: initrand(DIV_REG);
	ldh	a, (_DIV_REG + 0)
	ld	b, #0x00
	ld	c, a
	push	bc
	call	_initrand
	pop	hl
;main.c:569: font_init();
	call	_font_init
;main.c:570: min_font = font_load(font_min);
	ld	de, #_font_min
	push	de
	call	_font_load
	pop	hl
;main.c:571: font_set(min_font);
	push	de
	call	_font_set
	pop	hl
;main.c:573: set_bkg_data(37, 8, backgroundtiles);
	ld	de, #_backgroundtiles
	push	de
	ld	hl, #0x825
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:574: set_bkg_tiles(0, 0, 20, 16, backgroundmap);
	ld	de, #_backgroundmap
	push	de
	ld	hl, #0x1014
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:576: set_win_tiles(0, 0, 20, 2, windowmap);
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
;main.c:581: set_sprite_data(0, 22, Girl);
	ld	de, #_Girl
	push	de
	ld	hl, #0x1600
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:582: setupgirl();
	call	_setupgirl
;main.c:584: setupsword();
	call	_setupsword
;main.c:585: room_0();  // Initialize room after sprite data is loaded
	call	_room_0
;main.c:593: BGP_REG  = 0xE4; // Background palette (light fill uses C1)
	ld	a, #0xe4
	ldh	(_BGP_REG + 0), a
;main.c:594: OBP0_REG = 0xE0; // Sprite palette 0: Girl/Sword (old colors)
	ld	a, #0xe0
	ldh	(_OBP0_REG + 0), a
;main.c:595: OBP1_REG = 0xE4; // Sprite palette 1: Slimes (clear, light, dark, black)
	ld	a, #0xe4
	ldh	(_OBP1_REG + 0), a
;main.c:596: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:597: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:598: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;main.c:599: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
	jr	00110$
00107$:
;main.c:601: else if(gamestate == 1)
	ld	a, (#_gamestate)
	dec	a
	jr	NZ, 00104$
;main.c:603: gamestate = 2;
	ld	hl, #_gamestate
	ld	(hl), #0x02
;main.c:604: HIDE_BKG;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfe
	ldh	(_LCDC_REG + 0), a
;main.c:605: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
	jr	00110$
00104$:
;main.c:607: else if(gamestate == 2)
	ld	a, (#_gamestate)
	sub	a, #0x02
	jr	NZ, 00110$
;main.c:609: gamestate = 1;
	ld	hl, #_gamestate
	ld	(hl), #0x01
;main.c:610: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:611: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
00110$:
;main.c:615: if(gamestate == 1)
	ld	a, (#_gamestate)
	dec	a
	jp	NZ, 00187$
;main.c:617: if (locktimer == 0)
	ld	a, (#_locktimer)
	or	a, a
	jp	NZ, 00159$
;main.c:619: if(joypad() & J_LEFT)
	call	_joypad
	bit	1, a
	jr	Z, 00124$
;main.c:621: direction = 2;
	ld	hl, #_direction
	ld	(hl), #0x02
;main.c:622: sword_set_direction(&sword);
	ld	de, #_sword
	call	_sword_set_direction
;main.c:623: if(girl.x > MIN_GIRL_X)
	ld	hl, #_girl + 4
	ld	a, (hl)
	cp	a, #0x18
	jr	C, 00113$
;main.c:625: girl.x -= 2;
	dec	a
	dec	a
	ld	(hl), a
00113$:
;main.c:628: if(girl.anim != 2 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	ld	hl, #_girl + 8
	ld	a, (hl)
;main.c:630: character_set_sprite(&girl, 2);
;main.c:628: if(girl.anim != 2 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	sub	a, #0x02
	jr	Z, 00119$
	call	_joypad
	bit	2, a
	jr	NZ, 00119$
	call	_joypad
	bit	3, a
	jr	NZ, 00119$
;main.c:630: character_set_sprite(&girl, 2);
	push	hl
	ld	a, #0x02
	ld	de, #_girl
	call	_character_set_sprite
	pop	hl
;main.c:631: girl.anim = 2;
	ld	(hl), #0x02
	jr	00124$
00119$:
;main.c:633: else if(girl.anim != 3 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	ld	a, (hl)
	sub	a, #0x03
	jr	Z, 00124$
	call	_joypad
	bit	2, a
	jr	NZ, 00124$
	call	_joypad
	bit	3, a
	jr	NZ, 00124$
;main.c:635: character_set_sprite(&girl, 3);
	push	hl
	ld	a, #0x03
	ld	de, #_girl
	call	_character_set_sprite
	pop	hl
;main.c:636: girl.anim = 3;
	ld	(hl), #0x03
00124$:
;main.c:639: if(joypad() & J_RIGHT)
	call	_joypad
	rrca
	jr	NC, 00137$
;main.c:641: direction = 3;
	ld	hl, #_direction
	ld	(hl), #0x03
;main.c:642: sword_set_direction(&sword);
	ld	de, #_sword
	call	_sword_set_direction
;main.c:643: if(girl.x < MAX_GIRL_X)
	ld	bc, #_girl + 4
	ld	a, (bc)
	cp	a, #0x8a
	jr	NC, 00126$
;main.c:645: girl.x += 2;
	add	a, #0x02
	ld	(bc), a
00126$:
;main.c:649: if(girl.anim != 4 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	ld	hl, #_girl + 8
	ld	a, (hl)
;main.c:651: character_set_sprite(&girl, 4);
;main.c:649: if(girl.anim != 4 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	sub	a, #0x04
	jr	Z, 00132$
	call	_joypad
	bit	2, a
	jr	NZ, 00132$
	call	_joypad
	bit	3, a
	jr	NZ, 00132$
;main.c:651: character_set_sprite(&girl, 4);
	push	hl
	ld	a, #0x04
	ld	de, #_girl
	call	_character_set_sprite
	pop	hl
;main.c:652: girl.anim = 4;
	ld	(hl), #0x04
	jr	00137$
00132$:
;main.c:654: else if(girl.anim != 5 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00137$
	call	_joypad
	bit	2, a
	jr	NZ, 00137$
	call	_joypad
	bit	3, a
	jr	NZ, 00137$
;main.c:656: character_set_sprite(&girl, 5);
	push	hl
	ld	a, #0x05
	ld	de, #_girl
	call	_character_set_sprite
	pop	hl
;main.c:657: girl.anim = 5;
	ld	(hl), #0x05
00137$:
;main.c:660: if(joypad() & J_UP)
	call	_joypad
	bit	2, a
	jr	Z, 00146$
;main.c:662: direction = 1;
	ld	hl, #_direction
	ld	(hl), #0x01
;main.c:663: sword_set_direction(&sword);
	ld	de, #_sword
	call	_sword_set_direction
;main.c:664: if(girl.y > MIN_GIRL_Y)
	ld	hl, #_girl + 5
	ld	a, (hl)
	cp	a, #0x15
	jr	C, 00139$
;main.c:667: girl.y -= 2;
	dec	a
	dec	a
	ld	(hl), a
00139$:
;main.c:669: if(girl.anim != 6)
	ld	a, (#(_girl + 8) + 0)
;main.c:671: character_set_sprite(&girl, 6);
	ld	de, #_girl
;main.c:669: if(girl.anim != 6)
	cp	a, #0x06
	jr	Z, 00143$
;main.c:671: character_set_sprite(&girl, 6);
	ld	a, #0x06
	call	_character_set_sprite
;main.c:672: girl.anim = 6;
	ld	hl, #(_girl + 8)
	ld	(hl), #0x06
	jr	00146$
00143$:
;main.c:674: else if(girl.anim != 7)
	sub	a, #0x07
	jr	Z, 00146$
;main.c:676: character_set_sprite(&girl, 7);
	ld	a, #0x07
	call	_character_set_sprite
;main.c:677: girl.anim = 7;
	ld	hl, #(_girl + 8)
	ld	(hl), #0x07
00146$:
;main.c:680: if(joypad() & J_DOWN)
	call	_joypad
	bit	3, a
	jr	Z, 00155$
;main.c:682: direction = 0;
	xor	a, a
	ld	(#_direction),a
;main.c:683: sword_set_direction(&sword);
	ld	de, #_sword
	call	_sword_set_direction
;main.c:684: if(girl.y < MAX_GIRL_Y)
	ld	hl, #_girl + 5
	ld	a, (hl)
	cp	a, #0x71
	jr	NC, 00148$
;main.c:687: girl.y += 2;
	add	a, #0x02
	ld	(hl), a
00148$:
;main.c:690: if(girl.anim != 0)
	ld	a, (#(_girl + 8) + 0)
;main.c:692: character_set_sprite(&girl, 0);
	ld	de, #_girl
;main.c:690: if(girl.anim != 0)
	or	a, a
	jr	Z, 00152$
;main.c:692: character_set_sprite(&girl, 0);
	xor	a, a
	call	_character_set_sprite
;main.c:693: girl.anim = 0;
	ld	hl, #(_girl + 8)
	ld	(hl), #0x00
	jr	00155$
00152$:
;main.c:695: else if(girl.anim != 1)
	dec	a
	jr	Z, 00155$
;main.c:697: character_set_sprite(&girl, 1);
	ld	a, #0x01
	call	_character_set_sprite
;main.c:698: girl.anim = 1;
	ld	hl, #(_girl + 8)
	ld	(hl), #0x01
00155$:
;main.c:702: if(joypad() & J_A)
	call	_joypad
	bit	4, a
	jr	Z, 00159$
;main.c:704: attack();
	call	_attack
00159$:
;main.c:708: if(locktimer > 0)
	ld	a, (#_locktimer)
	or	a, a
	jr	Z, 00161$
;main.c:710: weapon_enemy_collision(&sword, &slime_0);
	ld	bc, #_slime_0
	ld	de, #_sword
	call	_weapon_enemy_collision
;main.c:711: weapon_enemy_collision(&sword, &slime_1);
	ld	bc, #_slime_1
	ld	de, #_sword
	call	_weapon_enemy_collision
;main.c:712: locktimer++;
	ld	hl, #_locktimer
	inc	(hl)
00161$:
;main.c:714: if(locktimer == ATTACK_LOCK_TIME)
	ld	a, (#_locktimer)
	sub	a, #0x0a
	jr	NZ, 00163$
;main.c:716: locktimer = 0;
	xor	a, a
	ld	(#_locktimer),a
;main.c:717: swordreset();
	call	_swordreset
00163$:
;main.c:721: if(slime_0.death == 0)
	ld	a, (#(_slime_0 + 7) + 0)
;main.c:723: animate_enemy(&slime_0, 16, 17);
;main.c:721: if(slime_0.death == 0)
	or	a, a
	jr	NZ, 00167$
;main.c:723: animate_enemy(&slime_0, 16, 17);
	ld	a, #0x11
	push	af
	inc	sp
	ld	a, #0x10
	ld	de, #_slime_0
	call	_animate_enemy
	jr	00168$
00167$:
;main.c:725: else if(slime_0.death == 1)
	dec	a
	jr	NZ, 00168$
;main.c:727: slime_0.x = 0;
	ld	hl, #_slime_0 + 2
	ld	(hl), #0x00
;main.c:728: slime_0.y = 0;
	ld	bc, #_slime_0 + 3
	xor	a, a
	ld	(bc), a
;main.c:729: moveslime(&slime_0, slime_0.x, slime_0.y);
	ld	a, (hl)
	ld	h, #0x00
	push	hl
	inc	sp
	ld	de, #_slime_0
	call	_moveslime
00168$:
;main.c:733: if(slime_1.death == 0)
	ld	a, (#(_slime_1 + 7) + 0)
;main.c:735: animate_enemy(&slime_1, 16, 17);
;main.c:733: if(slime_1.death == 0)
	or	a, a
	jr	NZ, 00172$
;main.c:735: animate_enemy(&slime_1, 16, 17);
	ld	a, #0x11
	push	af
	inc	sp
	ld	a, #0x10
	ld	de, #_slime_1
	call	_animate_enemy
	jr	00173$
00172$:
;main.c:737: else if(slime_1.death == 1)
	dec	a
	jr	NZ, 00173$
;main.c:739: slime_1.x = 0;
	ld	hl, #_slime_1 + 2
	ld	(hl), #0x00
;main.c:740: slime_1.y = 0;
	ld	bc, #_slime_1 + 3
	xor	a, a
	ld	(bc), a
;main.c:741: moveslime(&slime_1, slime_1.x, slime_1.y);
	ld	a, (hl)
	ld	h, #0x00
	push	hl
	inc	sp
	ld	de, #_slime_1
	call	_moveslime
00173$:
;main.c:745: animtimer++;
	ld	hl, #_animtimer
	inc	(hl)
;main.c:746: if(animtimer == ANIM_TIMER_MAX)
	ld	a, (hl)
	sub	a, #0x14
	jr	NZ, 00185$
;main.c:748: animtimer = 0;
	xor	a, a
	ld	(#_animtimer),a
;main.c:749: if(slime_0.anim == 0)
	ld	hl, #_slime_0 + 6
	ld	a, (hl)
	or	a, a
	jr	NZ, 00177$
;main.c:751: slime_0.anim = 1;
	ld	(hl), #0x01
	jr	00178$
00177$:
;main.c:753: else if(slime_0.anim == 1)
;main.c:755: slime_0.anim = 0;
	dec	a
	jr	NZ, 00178$
	ld	(hl), a
00178$:
;main.c:758: if(slime_1.anim == 0)
	ld	hl, #_slime_1 + 6
	ld	a, (hl)
	or	a, a
	jr	NZ, 00182$
;main.c:760: slime_1.anim = 1;
	ld	(hl), #0x01
	jr	00185$
00182$:
;main.c:762: else if(slime_1.anim == 1)
;main.c:764: slime_1.anim = 0;
	dec	a
	jr	NZ, 00185$
	ld	(hl), a
00185$:
;main.c:768: character_enemy_collision(&girl, &slime_0);
	ld	bc, #_slime_0
	ld	de, #_girl
	call	_character_enemy_collision
;main.c:769: character_enemy_collision(&girl, &slime_1);
	ld	bc, #_slime_1
	ld	de, #_girl
	call	_character_enemy_collision
00187$:
;main.c:810: prev_pad = current_pad;
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(#_prev_pad),a
;main.c:811: performantdelay(5);
	ld	a, #0x05
	call	_performantdelay
	jp	00189$
;main.c:814: }
	inc	sp
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
