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
	.globl _flipgirlun
	.globl _flipgirlu
	.globl _flipgirlrs
	.globl _flipgirlrw
	.globl _flipgirlls
	.globl _flipgirllw
	.globl _flipgirln
	.globl _flipgirl
	.globl _animslime
	.globl _swordreset
	.globl _attack
	.globl _moveswordd
	.globl _moveswordu
	.globl _moveswordr
	.globl _moveswordl
	.globl _movegirl
	.globl _sword_slimecolision
	.globl _girl_slimecolision
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
;main.c:94: void room_0()
;	---------------------------------
; Function room_0
; ---------------------------------
_room_0::
;main.c:96: if (room == 0)
	ld	a, (#_room)
	or	a, a
	ret	NZ
;main.c:99: slime_0.x = 26;
	ld	hl, #(_slime_0 + 2)
	ld	(hl), #0x1a
;main.c:100: slime_0.y = 26;
	ld	bc, #_slime_0 + 3
;main.c:101: slime_0.width = 8;
	inc	hl
	inc	hl
	ld	a, #0x1a
	ld	(bc), a
	ld	(hl), #0x08
;main.c:102: slime_0.height = 8;
	ld	hl, #_slime_0 + 5
	ld	(hl), #0x08
;main.c:103: slime_0.anim = 0;
	ld	hl, #_slime_0 + 6
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 66)
	ld	(hl), #0x10
;main.c:107: slime_0.spritids[0] = 16;
	ld	hl, #_slime_0
	ld	(hl), #0x10
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 70)
	ld	(hl), #0x11
;main.c:109: slime_0.spritids[1] = 17;
	ld	hl, #_slime_0 + 1
	ld	(hl), #0x11
;main.c:111: moveslime(&slime_0, slime_0.x, slime_0.y);
	ld	a, (bc)
	ld	hl, #(_slime_0 + 2)
	ld	c, (hl)
	push	af
	inc	sp
	ld	a, c
	ld	de, #_slime_0
	call	_moveslime
;main.c:113: slime_1.x = 26;
	ld	hl, #(_slime_1 + 2)
	ld	(hl), #0x1a
;main.c:114: slime_1.y = 26;
	ld	bc, #_slime_1 + 3
;main.c:115: slime_1.width = 8;
	inc	hl
	inc	hl
	ld	a, #0x1a
	ld	(bc), a
	ld	(hl), #0x08
;main.c:116: slime_1.height = 8;
	ld	hl, #_slime_1 + 5
	ld	(hl), #0x08
;main.c:117: slime_1.anim = 0;
	ld	hl, #_slime_1 + 6
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 66)
	ld	(hl), #0x10
;main.c:121: slime_1.spritids[0] = 16;
	ld	hl, #_slime_1
	ld	(hl), #0x10
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 70)
	ld	(hl), #0x11
;main.c:123: slime_1.spritids[1] = 17;
	ld	hl, #_slime_1 + 1
	ld	(hl), #0x11
;main.c:125: moveslime(&slime_1, slime_1.x, slime_1.y);
	ld	a, (bc)
	ld	hl, #(_slime_1 + 2)
	ld	c, (hl)
	push	af
	inc	sp
	ld	a, c
	ld	de, #_slime_1
	call	_moveslime
;main.c:127: }
	ret
;main.c:131: void performantdelay(UINT8 numloops)
;	---------------------------------
; Function performantdelay
; ---------------------------------
_performantdelay::
	ld	c, a
;main.c:134: for(i = 0; i < numloops; i++)
	ld	b, #0x00
00103$:
	ld	a, b
	sub	a, c
	ret	NC
;main.c:136: wait_vbl_done();
	call	_wait_vbl_done
;main.c:134: for(i = 0; i < numloops; i++)
	inc	b
;main.c:138: }
	jr	00103$
;main.c:156: void girl_slimecolision()
;	---------------------------------
; Function girl_slimecolision
; ---------------------------------
_girl_slimecolision::
	add	sp, #-7
;main.c:158: if (girl.x < slime.x + slime.width - pad &&
	ld	a, (#(_girl + 4) + 0)
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, (#(_slime + 2) + 0)
	ldhl	sp,	#3
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #_slime + 4
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#3
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (#_pad)
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), #0x00
	pop	de
	push	de
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ldhl	sp,	#6
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,	#2
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#5
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
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
;main.c:159: girl.x + girl.width - pad > slime.x &&
	ld	hl, #_girl + 6
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	pop	de
	push	de
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ld	b, a
	ld	c, e
	ldhl	sp,	#3
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
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
;main.c:160: girl.y < slime.y + slime.height - pad &&
	ld	a, (#(_girl + 5) + 0)
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, (#(_slime + 3) + 0)
	ldhl	sp,	#3
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #_slime + 5
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#3
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	pop	de
	push	de
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ldhl	sp,	#6
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,	#2
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#5
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
	jr	NC, 00110$
;main.c:161: girl.y + girl.height - pad > slime.y)
	ld	hl, #_girl + 7
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	pop	de
	push	de
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ld	b, a
	ld	c, e
	ldhl	sp,	#3
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
;main.c:164: hide_sprite(girl.spritids[0]);
	ld	hl, #_girl
	ld	c, (hl)
;c:\gbdk\include\gb\gb.h:2001: shadow_OAM[nb].y = 0;
	ld	de, #_shadow_OAM+0
	xor	a, a
	ld	l, c
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	(hl), #0x00
;main.c:165: hide_sprite(girl.spritids[1]);
	ld	hl, #_girl + 1
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
;main.c:166: hide_sprite(girl.spritids[2]);
	ld	hl, #_girl + 2
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
;main.c:167: hide_sprite(girl.spritids[3]);
	ld	hl, #_girl + 3
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
;main.c:167: hide_sprite(girl.spritids[3]);
00110$:
;main.c:170: }
	add	sp, #7
	ret
;main.c:171: void sword_slimecolision()
;	---------------------------------
; Function sword_slimecolision
; ---------------------------------
_sword_slimecolision::
	add	sp, #-4
;main.c:173: if (sword.x < slime.x + slime.width &&
	ld	hl, #_sword + 2
	ld	c, (hl)
	ld	a, (#(_slime + 2) + 0)
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #_slime + 4
	ld	e, (hl)
	ld	d, #0x00
	pop	hl
	push	hl
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	b, #0x00
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	jr	NC, 00106$
;main.c:174: sword.x + sword.width > slime.x &&
	ld	hl, #_sword + 4
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#0
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	jr	NC, 00106$
;main.c:175: sword.y < slime.y + slime.height &&
	ld	hl, #_sword + 3
	ld	c, (hl)
	ld	a, (#(_slime + 3) + 0)
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), #0x00
	ld	hl, #_slime + 5
	ld	e, (hl)
	ld	d, #0x00
	pop	hl
	push	hl
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	b, #0x00
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	jr	NC, 00106$
;main.c:176: sword.y + sword.height > slime.y)
	ld	hl, #_sword + 5
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#0
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	jr	NC, 00106$
;main.c:179: slime.death = 1;
	ld	hl, #_slime + 7
	ld	(hl), #0x01
;main.c:180: slime.x = 0;
	ld	hl, #(_slime + 2)
;main.c:181: slime.y = 0;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;main.c:182: score = score ++;
00106$:
;main.c:185: }
	add	sp, #4
	ret
;main.c:186: void movegirl(struct GameCharacter* character, UINT8 x, UINT8 y)
;	---------------------------------
; Function movegirl
; ---------------------------------
_movegirl::
	dec	sp
	ldhl	sp,	#0
	ld	(hl), a
;main.c:188: move_sprite(character->spritids[0], x, y);
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
;main.c:189: move_sprite(character->spritids[1], x + spritesize, y);
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
;main.c:190: move_sprite(character->spritids[2], x, y + spritesize);
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
;main.c:191: move_sprite(character->spritids[3], x + spritesize, y + spritesize);
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
;main.c:191: move_sprite(character->spritids[3], x + spritesize, y + spritesize);
;main.c:192: }
	inc	sp
	pop	hl
	inc	sp
	jp	(hl)
;main.c:195: void moveswordl(struct Weapon* character, UINT8 x, UINT8 y)
;	---------------------------------
; Function moveswordl
; ---------------------------------
_moveswordl::
	dec	sp
	ld	c, e
	ld	b, d
	ldhl	sp,	#0
	ld	(hl), a
;main.c:198: sword.x = girl.x - 3;
	ld	a, (#(_girl + 4) + 0)
	add	a, #0xfd
	ld	hl, #(_sword + 2)
;main.c:199: sword.y = girl.y + 8;
	ld	(hl+), a
	ld	a, (#(_girl + 5) + 0)
	add	a, #0x08
	ld	(hl), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 74)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x12
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:202: sword.spritids[0] = 18;
	ld	hl, #_sword
	ld	(hl), #0x12
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 78)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x13
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:205: sword.spritids[1] = 19;
	ld	hl, #_sword + 1
	ld	(hl), #0x13
;main.c:206: move_sprite(character->spritids[0], x, y);
	ldhl	sp,	#3
	ld	d, (hl)
	ld	a, (bc)
	ld	e, a
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	a, #<(_shadow_OAM)
	add	a, l
	ld	l, a
	ld	a, #>(_shadow_OAM)
	adc	a, h
	ld	h, a
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, d
	ld	(hl+), a
	push	hl
	ldhl	sp,	#2
	ld	a, (hl)
	pop	hl
	ld	(hl), a
;main.c:207: move_sprite(character->spritids[1], x - spritesize, y);
	ldhl	sp,	#0
	ld	a, (hl)
	ld	hl, #_spritesize
	sub	a, (hl)
	ld	e, a
	inc	bc
	ld	a, (bc)
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl), d
	inc	hl
	ld	(hl), e
;c:\gbdk\include\gb\gb.h:2001: shadow_OAM[nb].y = 0;
	ld	hl, #(_shadow_OAM + 80)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 84)
	ld	(hl), #0x00
;main.c:209: hide_sprite(21);
;main.c:211: }
	inc	sp
	pop	hl
	inc	sp
	jp	(hl)
;main.c:212: void moveswordr(struct Weapon* character, UINT8 x, UINT8 y)
;	---------------------------------
; Function moveswordr
; ---------------------------------
_moveswordr::
	dec	sp
	ld	c, e
	ld	b, d
	ldhl	sp,	#0
	ld	(hl), a
;main.c:214: sword.x = girl.x + 21;
	ld	a, (#(_girl + 4) + 0)
	add	a, #0x15
	ld	hl, #(_sword + 2)
;main.c:215: sword.y = girl.y + 8;
	ld	(hl+), a
	ld	a, (#(_girl + 5) + 0)
	add	a, #0x08
	ld	(hl), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 74)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x12
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:218: sword.spritids[1] = 18;
	ld	hl, #_sword + 1
	ld	(hl), #0x12
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 78)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x13
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:221: sword.spritids[0] = 19;
	ld	hl, #_sword
	ld	(hl), #0x13
;main.c:222: move_sprite(character->spritids[0], x, y);
	ldhl	sp,	#3
	ld	d, (hl)
	ld	a, (bc)
	ld	e, a
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	a, #<(_shadow_OAM)
	add	a, l
	ld	l, a
	ld	a, #>(_shadow_OAM)
	adc	a, h
	ld	h, a
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, d
	ld	(hl+), a
	push	hl
	ldhl	sp,	#2
	ld	a, (hl)
	pop	hl
	ld	(hl), a
;main.c:223: move_sprite(character->spritids[1], x - spritesize, y);
	ldhl	sp,	#0
	ld	a, (hl)
	ld	hl, #_spritesize
	sub	a, (hl)
	ld	e, a
	inc	bc
	ld	a, (bc)
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl), d
	inc	hl
	ld	(hl), e
;c:\gbdk\include\gb\gb.h:2001: shadow_OAM[nb].y = 0;
	ld	hl, #(_shadow_OAM + 80)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 84)
	ld	(hl), #0x00
;main.c:225: hide_sprite(21);
;main.c:226: }
	inc	sp
	pop	hl
	inc	sp
	jp	(hl)
;main.c:227: void moveswordu(struct Weapon* character, UINT8 x, UINT8 y)
;	---------------------------------
; Function moveswordu
; ---------------------------------
_moveswordu::
	dec	sp
	ld	c, e
	ld	b, d
	ldhl	sp,	#0
	ld	(hl), a
;main.c:229: sword.x = girl.x + 9;
	ld	a, (#(_girl + 4) + 0)
	add	a, #0x09
	ld	hl, #(_sword + 2)
;main.c:230: sword.y = girl.y;
	ld	(hl+), a
	ld	a, (#(_girl + 5) + 0)
	ld	(hl), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 82)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x14
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:233: sword.spritids[0] = 20;
	ld	hl, #_sword
	ld	(hl), #0x14
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 86)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x15
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:236: sword.spritids[1] = 21;
	ld	hl, #_sword + 1
	ld	(hl), #0x15
;main.c:237: move_sprite(character->spritids[0], x, y);
	ldhl	sp,	#3
	ld	e, (hl)
	ld	a, (bc)
	ld	d, a
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, d
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	a, #<(_shadow_OAM)
	add	a, l
	ld	l, a
	ld	a, #>(_shadow_OAM)
	adc	a, h
	ld	h, a
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	push	hl
	ldhl	sp,	#2
	ld	a, (hl)
	pop	hl
	ld	(hl), a
;main.c:238: move_sprite(character->spritids[1], x, y - spritesize);
	ld	a, e
	ld	hl, #_spritesize
	sub	a, (hl)
	ld	e, a
	inc	bc
	ld	a, (bc)
	ld	d, a
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+0
	ld	l, d
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, bc
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	c, l
	ld	b, h
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:2001: shadow_OAM[nb].y = 0;
	ld	hl, #(_shadow_OAM + 72)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 76)
	ld	(hl), #0x00
;main.c:240: hide_sprite(19);
;main.c:241: }
	inc	sp
	pop	hl
	inc	sp
	jp	(hl)
;main.c:242: void moveswordd(struct Weapon* character, UINT8 x, UINT8 y)
;	---------------------------------
; Function moveswordd
; ---------------------------------
_moveswordd::
	dec	sp
	ld	c, e
	ld	b, d
	ldhl	sp,	#0
	ld	(hl), a
;main.c:244: sword.x = girl.x - 2;
	ld	a, (#(_girl + 4) + 0)
	dec	a
	dec	a
	ld	hl, #(_sword + 2)
;main.c:245: sword.y = girl.y + 20;
	ld	(hl+), a
	ld	a, (#(_girl + 5) + 0)
	add	a, #0x14
	ld	(hl), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 82)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x14
	ld	(hl+), a
	ld	(hl), #0x40
;main.c:248: sword.spritids[1] = 20;
	ld	hl, #_sword + 1
	ld	(hl), #0x14
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 86)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x15
	ld	(hl+), a
	ld	(hl), #0x40
;main.c:251: sword.spritids[0] = 21;
	ld	hl, #_sword
	ld	(hl), #0x15
;main.c:252: move_sprite(character->spritids[0], x, y);
	ldhl	sp,	#3
	ld	e, (hl)
	ld	a, (bc)
	ld	d, a
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, d
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	a, #<(_shadow_OAM)
	add	a, l
	ld	l, a
	ld	a, #>(_shadow_OAM)
	adc	a, h
	ld	h, a
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	push	hl
	ldhl	sp,	#2
	ld	a, (hl)
	pop	hl
	ld	(hl), a
;main.c:253: move_sprite(character->spritids[1], x , y - spritesize);
	ld	a, e
	ld	hl, #_spritesize
	sub	a, (hl)
	ld	e, a
	inc	bc
	ld	a, (bc)
	ld	d, a
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+0
	ld	l, d
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, bc
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	c, l
	ld	b, h
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:2001: shadow_OAM[nb].y = 0;
	ld	hl, #(_shadow_OAM + 72)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 76)
	ld	(hl), #0x00
;main.c:255: hide_sprite(19);
;main.c:256: }
	inc	sp
	pop	hl
	inc	sp
	jp	(hl)
;main.c:257: void attack()
;	---------------------------------
; Function attack
; ---------------------------------
_attack::
;main.c:259: if(direction == 0)
	ld	a, (#_direction)
	or	a, a
	jr	NZ, 00110$
;main.c:261: moveswordd(&sword, sword.x, sword.y);
	ld	bc, #_sword + 3
	ld	a, (bc)
	ld	hl, #_sword + 2
	ld	e, (hl)
	push	bc
	push	af
	inc	sp
	ld	a, e
	ld	de, #_sword
	call	_moveswordd
	pop	bc
;main.c:262: sword.y = sword.y + 6;
	ld	a, (bc)
	add	a, #0x06
	ld	(bc), a
	jr	00111$
00110$:
;main.c:264: else if(direction == 1)
	ld	a, (#_direction)
	dec	a
	jr	NZ, 00107$
;main.c:266: moveswordu(&sword, sword.x, sword.y);
	ld	hl, #_sword + 3
	ld	b, (hl)
	ld	de, #_sword + 2
	ld	a, (de)
	push	hl
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordu
	pop	hl
;main.c:267: sword.y = sword.y - 6;
	ld	a, (hl)
	add	a, #0xfa
	ld	(hl), a
	jr	00111$
00107$:
;main.c:269: else if(direction == 2)
	ld	a, (#_direction)
	sub	a, #0x02
	jr	NZ, 00104$
;main.c:271: moveswordl(&sword, sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	hl, #_sword + 2
	ld	a, (hl)
	push	hl
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordl
	pop	hl
;main.c:272: sword.x = sword.x - 6;
	ld	a, (hl)
	add	a, #0xfa
	ld	(hl), a
	jr	00111$
00104$:
;main.c:274: else if(direction == 3)
	ld	a, (#_direction)
	sub	a, #0x03
	jr	NZ, 00111$
;main.c:276: moveswordr(&sword, sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	hl, #_sword + 2
	ld	a, (hl)
	push	hl
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordr
	pop	hl
;main.c:277: sword.x = sword.x + 6;
	ld	a, (hl)
	add	a, #0x06
	ld	(hl), a
00111$:
;main.c:279: if (locktimer == 0)
	ld	hl, #_locktimer
	ld	a, (hl)
	or	a, a
	ret	NZ
;main.c:281: locktimer ++;
	inc	(hl)
;main.c:283: }
	ret
;main.c:284: void swordreset()
;	---------------------------------
; Function swordreset
; ---------------------------------
_swordreset::
;main.c:286: if(direction == 0)
	ld	a, (#_direction)
	or	a, a
	jr	NZ, 00110$
;main.c:288: sword.y = sword.y - 8;
	ld	hl, #_sword + 3
	ld	a, (hl)
	add	a, #0xf8
	ld	(hl), a
;main.c:289: moveswordd(&sword, sword.x, sword.y);
	ld	h, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	hl
	inc	sp
	ld	de, #_sword
	call	_moveswordd
	ret
00110$:
;main.c:291: else if(direction == 1)
	ld	a, (#_direction)
	dec	a
	jr	NZ, 00107$
;main.c:293: sword.y = sword.y + 8;
	ld	hl, #_sword + 3
	ld	a, (hl)
	add	a, #0x08
	ld	(hl), a
;main.c:294: moveswordu(&sword, sword.x, sword.y);
	ld	b, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordu
	ret
00107$:
;main.c:296: else if(direction == 2)
	ld	a, (#_direction)
	sub	a, #0x02
	jr	NZ, 00104$
;main.c:298: sword.x = sword.x + 8;
	ld	hl, #_sword + 2
	ld	a, (hl)
	add	a, #0x08
	ld	(hl), a
;main.c:299: moveswordl(&sword, sword.x, sword.y);
	ld	bc, #_sword + 3
	ld	a, (bc)
	ld	c, (hl)
	push	af
	inc	sp
	ld	a, c
	ld	de, #_sword
	call	_moveswordl
	ret
00104$:
;main.c:301: else if(direction == 3)
	ld	a, (#_direction)
	sub	a, #0x03
	ret	NZ
;main.c:303: sword.x = sword.x - 8;
	ld	hl, #_sword + 2
	ld	a, (hl)
	add	a, #0xf8
	ld	(hl), a
;main.c:304: moveswordr(&sword, sword.x, sword.y);
	ld	bc, #_sword + 3
	ld	a, (bc)
	ld	c, (hl)
	push	af
	inc	sp
	ld	a, c
	ld	de, #_sword
	call	_moveswordr
;main.c:306: }
	ret
;main.c:307: void moveslime(struct Enemy* character, UINT8 x, UINT8 y)
;	---------------------------------
; Function moveslime
; ---------------------------------
_moveslime::
	ld	c, a
;main.c:309: move_sprite(character->spritids[0], x, y);
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
;main.c:309: move_sprite(character->spritids[0], x, y);
;main.c:310: }
	pop	hl
	inc	sp
	jp	(hl)
;main.c:311: void animslime()
;	---------------------------------
; Function animslime
; ---------------------------------
_animslime::
;main.c:313: if(slime.anim == 0)
	ld	bc, #_slime+0
	ld	a, (#(_slime + 6) + 0)
	or	a, a
	jr	NZ, 00104$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 70)
	ld	(hl), #0x11
;main.c:316: slime.spritids[0] = 17;
	ld	a, #0x11
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:2001: shadow_OAM[nb].y = 0;
	ld	hl, #(_shadow_OAM + 64)
	ld	(hl), #0x00
;main.c:318: moveslime(&slime, slime.x, slime.y);
	ld	a, (#(_slime + 3) + 0)
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	e, (hl)
	push	af
	inc	sp
	ld	a, e
	ld	e, c
	ld	d, b
	call	_moveslime
	ret
00104$:
;main.c:320: else if(slime.anim == 1)
	dec	a
	ret	NZ
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 66)
;main.c:323: slime.spritids[0] = 16;
;c:\gbdk\include\gb\gb.h:2001: shadow_OAM[nb].y = 0;
	ld	a, #0x10
	ld	(hl+), a
	inc	hl
	ld	a, #0x10
	ld	(bc), a
	ld	(hl), #0x00
;main.c:325: moveslime(&slime, slime.x, slime.y);
	ld	hl, #(_slime + 3)
	ld	h, (hl)
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	a, (de)
	push	hl
	inc	sp
	ld	e, c
	ld	d, b
	call	_moveslime
;main.c:327: }
	ret
;main.c:330: void flipgirl()
;	---------------------------------
; Function flipgirl
; ---------------------------------
_flipgirl::
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
;main.c:334: girl.spritids[0] = 0;
	ld	hl, #_girl
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x01
;main.c:337: girl.spritids[1] = 1;
	ld	hl, #_girl + 1
	ld	(hl), #0x01
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x02
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:340: girl.spritids[3] = 2;
	ld	hl, #_girl + 3
	ld	(hl), #0x02
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x03
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:343: girl.spritids[2] = 3;
	ld	hl, #_girl + 2
	ld	(hl), #0x03
;c:\gbdk\include\gb\gb.h:2001: shadow_OAM[nb].y = 0;
	ld	hl, #(_shadow_OAM + 16)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 20)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 24)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 28)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 32)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 36)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 40)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 44)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 48)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 52)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 56)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 60)
	ld	(hl), #0x00
;main.c:358: movegirl(&girl, girl.x, girl.y);
	ld	hl, #_girl + 5
	ld	b, (hl)
	ld	a, (#(_girl + 4) + 0)
	push	bc
	inc	sp
	ld	de, #_girl
	call	_movegirl
;main.c:361: }
	ret
;main.c:364: void flipgirln()
;	---------------------------------
; Function flipgirln
; ---------------------------------
_flipgirln::
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;main.c:368: girl.spritids[0] = 0;
	ld	hl, #_girl
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:371: girl.spritids[1] = 1;
	ld	hl, #_girl + 1
	ld	(hl), #0x01
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x02
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:374: girl.spritids[2] = 2;
	ld	hl, #_girl + 2
	ld	(hl), #0x02
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x03
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:377: girl.spritids[3] = 3;
	ld	hl, #_girl + 3
	ld	(hl), #0x03
;c:\gbdk\include\gb\gb.h:2001: shadow_OAM[nb].y = 0;
	ld	hl, #(_shadow_OAM + 16)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 20)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 24)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 28)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 32)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 36)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 40)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 44)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 48)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 52)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 56)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 60)
	ld	(hl), #0x00
;main.c:393: movegirl(&girl, girl.x, girl.y);
	ld	hl, #_girl + 5
	ld	b, (hl)
	ld	a, (#(_girl + 4) + 0)
	push	bc
	inc	sp
	ld	de, #_girl
	call	_movegirl
;main.c:394: }
	ret
;main.c:397: void flipgirllw()
;	---------------------------------
; Function flipgirllw
; ---------------------------------
_flipgirllw::
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x04
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:401: girl.spritids[0] = 4;
	ld	hl, #_girl
	ld	(hl), #0x04
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x05
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:404: girl.spritids[1] = 5;
	ld	hl, #_girl + 1
	ld	(hl), #0x05
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 26)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x06
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:407: girl.spritids[2] = 6;
	ld	hl, #_girl + 2
	ld	(hl), #0x06
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 30)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x07
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:410: girl.spritids[3] = 7;
	ld	hl, #_girl + 3
	ld	(hl), #0x07
;c:\gbdk\include\gb\gb.h:2001: shadow_OAM[nb].y = 0;
	ld	hl, #_shadow_OAM
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 4)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 8)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 12)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 32)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 36)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 40)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 44)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 48)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 52)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 56)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 60)
	ld	(hl), #0x00
;main.c:425: movegirl(&girl, girl.x, girl.y);
	ld	hl, #_girl + 5
	ld	b, (hl)
	ld	a, (#(_girl + 4) + 0)
	push	bc
	inc	sp
	ld	de, #_girl
	call	_movegirl
;main.c:426: }
	ret
;main.c:429: void flipgirlls()
;	---------------------------------
; Function flipgirlls
; ---------------------------------
_flipgirlls::
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 34)
	ld	(hl), #0x08
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	inc	hl
	ld	(hl), #0x00
;main.c:433: girl.spritids[0] = 8;
	ld	hl, #_girl
	ld	(hl), #0x08
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 38)
	ld	(hl), #0x09
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	inc	hl
	ld	(hl), #0x00
;main.c:436: girl.spritids[1] = 9;
	ld	hl, #_girl + 1
	ld	(hl), #0x09
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 42)
	ld	(hl), #0x0a
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	inc	hl
	ld	(hl), #0x00
;main.c:439: girl.spritids[2] = 10;
	ld	hl, #_girl + 2
	ld	(hl), #0x0a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 46)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0b
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:442: girl.spritids[3] = 11;
	ld	hl, #_girl + 3
	ld	(hl), #0x0b
;c:\gbdk\include\gb\gb.h:2001: shadow_OAM[nb].y = 0;
	ld	hl, #_shadow_OAM
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 4)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 8)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 12)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 16)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 20)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 24)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 28)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 48)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 52)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 56)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 60)
	ld	(hl), #0x00
;main.c:457: movegirl(&girl, girl.x, girl.y);
	ld	hl, #_girl + 5
	ld	b, (hl)
	ld	a, (#(_girl + 4) + 0)
	push	bc
	inc	sp
	ld	de, #_girl
	call	_movegirl
;main.c:458: }
	ret
;main.c:461: void flipgirlrw()
;	---------------------------------
; Function flipgirlrw
; ---------------------------------
_flipgirlrw::
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x04
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:465: girl.spritids[1] = 4;
	ld	hl, #_girl + 1
	ld	(hl), #0x04
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x05
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:468: girl.spritids[0] = 5;
	ld	hl, #_girl
	ld	(hl), #0x05
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 26)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x06
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:471: girl.spritids[3] = 6;
	ld	hl, #_girl + 3
	ld	(hl), #0x06
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 30)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x07
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:474: girl.spritids[2] = 7;
	ld	hl, #_girl + 2
	ld	(hl), #0x07
;c:\gbdk\include\gb\gb.h:2001: shadow_OAM[nb].y = 0;
	ld	hl, #_shadow_OAM
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 4)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 8)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 12)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 32)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 36)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 40)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 44)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 48)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 52)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 56)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 60)
	ld	(hl), #0x00
;main.c:489: movegirl(&girl, girl.x, girl.y);
	ld	hl, #_girl + 5
	ld	b, (hl)
	ld	a, (#(_girl + 4) + 0)
	push	bc
	inc	sp
	ld	de, #_girl
	call	_movegirl
;main.c:490: }
	ret
;main.c:493: void flipgirlrs()
;	---------------------------------
; Function flipgirlrs
; ---------------------------------
_flipgirlrs::
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 34)
	ld	(hl), #0x08
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	inc	hl
	ld	(hl), #0x20
;main.c:497: girl.spritids[1] = 8;
	ld	hl, #_girl + 1
	ld	(hl), #0x08
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 38)
	ld	(hl), #0x09
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	inc	hl
	ld	(hl), #0x20
;main.c:500: girl.spritids[0] = 9;
	ld	hl, #_girl
	ld	(hl), #0x09
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 42)
	ld	(hl), #0x0a
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	inc	hl
	ld	(hl), #0x20
;main.c:503: girl.spritids[3] = 10;
	ld	hl, #_girl + 3
	ld	(hl), #0x0a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 46)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0b
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:506: girl.spritids[2] = 11;
	ld	hl, #_girl + 2
	ld	(hl), #0x0b
;c:\gbdk\include\gb\gb.h:2001: shadow_OAM[nb].y = 0;
	ld	hl, #_shadow_OAM
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 4)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 8)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 12)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 16)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 20)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 24)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 28)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 32)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 52)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 56)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 60)
	ld	(hl), #0x00
;main.c:521: movegirl(&girl, girl.x, girl.y);
	ld	hl, #_girl + 5
	ld	b, (hl)
	ld	a, (#(_girl + 4) + 0)
	push	bc
	inc	sp
	ld	de, #_girl
	call	_movegirl
;main.c:522: }
	ret
;main.c:525: void flipgirlu()
;	---------------------------------
; Function flipgirlu
; ---------------------------------
_flipgirlu::
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 50)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0c
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:529: girl.spritids[0] = 12;
	ld	hl, #_girl
	ld	(hl), #0x0c
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 54)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0d
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:532: girl.spritids[1] = 13;
	ld	hl, #_girl + 1
	ld	(hl), #0x0d
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 58)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0e
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:535: girl.spritids[2] = 14;
	ld	hl, #_girl + 2
	ld	(hl), #0x0e
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 62)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0f
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:538: girl.spritids[3] = 15;
	ld	hl, #_girl + 3
	ld	(hl), #0x0f
;c:\gbdk\include\gb\gb.h:2001: shadow_OAM[nb].y = 0;
	ld	hl, #_shadow_OAM
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 4)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 8)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 12)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 16)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 20)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 24)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 28)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 32)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 36)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 40)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 44)
	ld	(hl), #0x00
;main.c:554: movegirl(&girl, girl.x, girl.y);
	ld	hl, #_girl + 5
	ld	b, (hl)
	ld	a, (#(_girl + 4) + 0)
	push	bc
	inc	sp
	ld	de, #_girl
	call	_movegirl
;main.c:555: }
	ret
;main.c:558: void flipgirlun()
;	---------------------------------
; Function flipgirlun
; ---------------------------------
_flipgirlun::
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 50)
	ld	(hl), #0x0c
;main.c:562: girl.spritids[0] = 12;
	ld	hl, #_girl
	ld	(hl), #0x0c
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 54)
	ld	(hl), #0x0d
;main.c:565: girl.spritids[1] = 13;
	ld	hl, #_girl + 1
	ld	(hl), #0x0d
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 58)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0e
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:568: girl.spritids[3] = 14;
	ld	hl, #_girl + 3
	ld	(hl), #0x0e
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 62)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0f
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:571: girl.spritids[2] = 15;
	ld	hl, #_girl + 2
	ld	(hl), #0x0f
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x03
;c:\gbdk\include\gb\gb.h:2001: shadow_OAM[nb].y = 0;
	ld	hl, #_shadow_OAM
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 4)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 8)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 12)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 16)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 20)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 24)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 28)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 32)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 36)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 40)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 44)
	ld	(hl), #0x00
;main.c:587: movegirl(&girl, girl.x, girl.y);
	ld	hl, #_girl + 5
	ld	b, (hl)
	ld	a, (#(_girl + 4) + 0)
	push	bc
	inc	sp
	ld	de, #_girl
	call	_movegirl
;main.c:589: }
	ret
;main.c:591: void setupgirl()
;	---------------------------------
; Function setupgirl
; ---------------------------------
_setupgirl::
;main.c:593: girl.x = 80;
	ld	bc, #_girl + 4
	ld	a, #0x50
	ld	(bc), a
;main.c:594: girl.y = 36;
	ld	hl, #(_girl + 5)
;main.c:595: girl.width = 16;
	ld	a, #0x24
	ld	(hl+), a
	ld	(hl), #0x10
;main.c:596: girl.height = 16;
	ld	hl, #_girl + 7
	ld	(hl), #0x10
;main.c:597: girl.anim = 0;
	ld	hl, #_girl + 8
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
;main.c:600: girl.spritids[0] = 0;
	ld	hl, #_girl
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x01
;main.c:602: girl.spritids[1] = 1;
	ld	hl, #_girl + 1
	ld	(hl), #0x01
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), #0x02
;main.c:604: girl.spritids[2] = 2;
	ld	hl, #_girl + 2
	ld	(hl), #0x02
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x03
;main.c:606: girl.spritids[3] = 3;
	ld	hl, #_girl + 3
	ld	(hl), #0x03
;main.c:608: movegirl(&girl, girl.x, girl.y);
	ld	hl, #(_girl + 5)
	ld	h, (hl)
	ld	a, (bc)
	push	hl
	inc	sp
	ld	de, #_girl
	call	_movegirl
;main.c:609: }
	ret
;main.c:611: void setupslime()
;	---------------------------------
; Function setupslime
; ---------------------------------
_setupslime::
;main.c:613: slime.x = rand() % 128 + 16;
	call	_rand
	ld	a, e
	res	7, a
	add	a, #0x10
	ld	(#(_slime + 2)),a
;main.c:614: slime.y = rand() % 96 + 24;
	call	_rand
	ld	a, e
	ld	e, #0x60
	call	__moduchar
	ld	a, c
	add	a, #0x18
	ld	hl, #(_slime + 3)
;main.c:615: slime.width = 8;
	ld	(hl+), a
	ld	(hl), #0x08
;main.c:616: slime.height = 8;
	ld	hl, #_slime + 5
	ld	(hl), #0x08
;main.c:617: slime.anim = 0;
	ld	hl, #_slime + 6
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 66)
	ld	(hl), #0x10
;main.c:621: slime.spritids[0] = 16;
	ld	hl, #_slime
	ld	(hl), #0x10
;main.c:623: moveslime(&slime, slime.x, slime.y);
	ld	hl, #(_slime + 3)
	ld	b, (hl)
	ld	a, (#(_slime + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_slime
	call	_moveslime
;main.c:624: }
	ret
;main.c:626: void setupsword()
;	---------------------------------
; Function setupsword
; ---------------------------------
_setupsword::
;main.c:628: sword.x = 100;
	ld	hl, #_sword + 2
	ld	(hl), #0x64
;main.c:629: sword.y = 100;
	ld	hl, #_sword + 3
	ld	(hl), #0x64
;main.c:630: sword.width = 8;
	ld	hl, #_sword + 4
	ld	(hl), #0x08
;main.c:631: sword.height = 8;
	ld	hl, #_sword + 5
	ld	(hl), #0x08
;main.c:632: sword.anim = 0;
	ld	hl, #_sword + 6
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 74)
	ld	(hl), #0x12
;main.c:636: sword.spritids[0] = 18;
	ld	hl, #_sword
	ld	(hl), #0x12
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 78)
	ld	(hl), #0x13
;main.c:638: sword.spritids[1] = 19;
	ld	hl, #_sword + 1
	ld	(hl), #0x13
;main.c:641: }
	ret
;main.c:644: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
	dec	sp
	dec	sp
;main.c:646: room_0();
	call	_room_0
;main.c:648: while(1)
00179$:
;main.c:650: UINT8 current_pad = joypad();
	call	_joypad
	ldhl	sp,	#0
	ld	(hl), a
;main.c:652: if((current_pad & J_START) && !(prev_pad & J_START))
	push	hl
	ldhl	sp,	#2
	bit	7, (hl)
	pop	hl
	jp	Z, 00110$
	ld	a, (_prev_pad)
	rlca
	jp	C, 00110$
;main.c:654: if(gamestate == 0)
	ld	hl, #_gamestate
	ld	a, (hl)
	or	a, a
	jp	NZ, 00107$
;main.c:656: gamestate = 1;
	ld	(hl), #0x01
;main.c:657: initrand(DIV_REG);
	ldh	a, (_DIV_REG + 0)
	ld	b, #0x00
	ld	c, a
	push	bc
	call	_initrand
	pop	hl
;main.c:660: font_init();
	call	_font_init
;main.c:661: min_font = font_load(font_min);
	ld	de, #_font_min
	push	de
	call	_font_load
	pop	hl
;main.c:662: font_set(min_font);
	push	de
	call	_font_set
	pop	hl
;main.c:664: set_bkg_data(37, 8, backgroundtiles);
	ld	de, #_backgroundtiles
	push	de
	ld	hl, #0x825
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:665: set_bkg_tiles(0, 0, 20, 16, backgroundmap);
	ld	de, #_backgroundmap
	push	de
	ld	hl, #0x1014
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:667: set_win_tiles(0, 0, 20, 2, windowmap);
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
;main.c:672: set_sprite_data(0, 22, Girl);
	ld	de, #_Girl
	push	de
	ld	hl, #0x1600
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:673: setupgirl();
	call	_setupgirl
;main.c:674: setupslime();
	call	_setupslime
;main.c:675: setupsword();
	call	_setupsword
;main.c:678: OBP0_REG = 0xE0;
	ld	a, #0xe0
	ldh	(_OBP0_REG + 0), a
;main.c:679: OBP1_REG = 0xE0;
	ld	a, #0xe0
	ldh	(_OBP1_REG + 0), a
;main.c:680: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:681: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:682: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;main.c:683: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
	jr	00110$
00107$:
;main.c:685: else if(gamestate == 1)
	ld	a, (#_gamestate)
	dec	a
	jr	NZ, 00104$
;main.c:687: gamestate = 2;
	ld	hl, #_gamestate
	ld	(hl), #0x02
;main.c:688: HIDE_BKG;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfe
	ldh	(_LCDC_REG + 0), a
;main.c:689: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
	jr	00110$
00104$:
;main.c:691: else if(gamestate == 2)
	ld	a, (#_gamestate)
	sub	a, #0x02
	jr	NZ, 00110$
;main.c:693: gamestate = 1;
	ld	hl, #_gamestate
	ld	(hl), #0x01
;main.c:694: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:695: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
00110$:
;main.c:699: if (locktimer == 0)
	ld	a, (#_locktimer)
	or	a, a
	jp	NZ, 00159$
;main.c:701: if(joypad() & J_LEFT)
	call	_joypad
	bit	1, a
	jp	Z, 00124$
;main.c:703: moveswordl(&sword, sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordl
;main.c:704: if(girl.x > MIN_GIRL_X)
	ld	a, (#(_girl + 4) + 0)
	cp	a, #0x18
	jr	C, 00113$
;main.c:706: moveswordl(&sword, sword.x, sword.y);
	ld	a, (#(_sword + 3) + 0)
	ldhl	sp,	#1
	ld	(hl), a
	ld	a, (#(_sword + 2) + 0)
	ldhl	sp,	#1
	ld	h, (hl)
	push	hl
	inc	sp
	ld	de, #_sword
	call	_moveswordl
;main.c:707: girl.x -= 2;
	ld	a, (#(_girl + 4) + 0)
	dec	a
	dec	a
	ld	(#(_girl + 4)),a
00113$:
;main.c:710: if(girl.anim != 2 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	ld	a, (#(_girl + 8) + 0)
	sub	a, #0x02
	jr	Z, 00119$
	call	_joypad
	bit	2, a
	jr	NZ, 00119$
	call	_joypad
	bit	3, a
	jr	NZ, 00119$
;main.c:712: moveswordl(&sword, sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordl
;main.c:713: flipgirllw();
	call	_flipgirllw
;main.c:714: girl.anim = 2;
	ld	hl, #(_girl + 8)
	ld	(hl), #0x02
	jr	00120$
00119$:
;main.c:716: else if(girl.anim != 3 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	ld	a, (#(_girl + 8) + 0)
	sub	a, #0x03
	jr	Z, 00120$
	call	_joypad
	bit	2, a
	jr	NZ, 00120$
	call	_joypad
	bit	3, a
	jr	NZ, 00120$
;main.c:718: moveswordl(&sword, sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordl
;main.c:719: flipgirlls();
	call	_flipgirlls
;main.c:720: girl.anim = 3;
	ld	hl, #(_girl + 8)
	ld	(hl), #0x03
00120$:
;main.c:722: direction = 2;
	ld	hl, #_direction
	ld	(hl), #0x02
00124$:
;main.c:724: if(joypad() & J_RIGHT)
	call	_joypad
	rrca
	jp	NC, 00137$
;main.c:726: moveswordr(&sword,sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordr
;main.c:727: if(girl.x < MAX_GIRL_X)
	ld	a, (#(_girl + 4) + 0)
	sub	a, #0x8a
	jr	NC, 00126$
;main.c:729: moveswordr(&sword,sword.x, sword.y);
	ld	a, (#(_sword + 3) + 0)
	ldhl	sp,	#1
	ld	(hl), a
	ld	a, (#(_sword + 2) + 0)
	ldhl	sp,	#1
	ld	h, (hl)
	push	hl
	inc	sp
	ld	de, #_sword
	call	_moveswordr
;main.c:730: girl.x += 2;
	ld	a, (#(_girl + 4) + 0)
	add	a, #0x02
	ld	(#(_girl + 4)),a
00126$:
;main.c:734: if(girl.anim != 4 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	ld	a, (#(_girl + 8) + 0)
	sub	a, #0x04
	jr	Z, 00132$
	call	_joypad
	bit	2, a
	jr	NZ, 00132$
	call	_joypad
	bit	3, a
	jr	NZ, 00132$
;main.c:736: moveswordr(&sword, sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordr
;main.c:737: flipgirlrw();
	call	_flipgirlrw
;main.c:738: girl.anim = 4;
	ld	hl, #(_girl + 8)
	ld	(hl), #0x04
	jr	00133$
00132$:
;main.c:740: else if(girl.anim != 5 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	ld	a, (#(_girl + 8) + 0)
	sub	a, #0x05
	jr	Z, 00133$
	call	_joypad
	bit	2, a
	jr	NZ, 00133$
	call	_joypad
	bit	3, a
	jr	NZ, 00133$
;main.c:742: moveswordr(&sword, sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordr
;main.c:743: flipgirlrs();
	call	_flipgirlrs
;main.c:744: girl.anim = 5;
	ld	hl, #(_girl + 8)
	ld	(hl), #0x05
00133$:
;main.c:746: direction = 3;
	ld	hl, #_direction
	ld	(hl), #0x03
00137$:
;main.c:748: if(joypad() & J_UP)
	call	_joypad
	bit	2, a
	jr	Z, 00146$
;main.c:750: moveswordu(&sword, sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordu
;main.c:751: if(girl.y > MIN_GIRL_Y)
	ld	hl, #_girl + 5
	ld	a, (hl)
	cp	a, #0x15
	jr	C, 00139$
;main.c:754: girl.y -= 2;
	dec	a
	dec	a
	ld	(hl), a
00139$:
;main.c:756: if(girl.anim != 6)
	ld	a, (#(_girl + 8) + 0)
	cp	a, #0x06
	jr	Z, 00143$
;main.c:758: moveswordu(&sword, sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordu
;main.c:759: flipgirlu();
	call	_flipgirlu
;main.c:760: girl.anim = 6;
	ld	hl, #(_girl + 8)
	ld	(hl), #0x06
	jr	00144$
00143$:
;main.c:762: else if(girl.anim != 7)
	sub	a, #0x07
	jr	Z, 00144$
;main.c:764: moveswordu(&sword, sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordu
;main.c:765: flipgirlun();
	call	_flipgirlun
;main.c:766: girl.anim = 7;
	ld	hl, #(_girl + 8)
	ld	(hl), #0x07
00144$:
;main.c:768: direction = 1;
	ld	hl, #_direction
	ld	(hl), #0x01
00146$:
;main.c:770: if(joypad() & J_DOWN)
	call	_joypad
	bit	3, a
	jr	Z, 00155$
;main.c:772: moveswordd(&sword, sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordd
;main.c:773: if(girl.y < MAX_GIRL_Y)
	ld	hl, #_girl + 5
	ld	a, (hl)
	cp	a, #0x71
	jr	NC, 00148$
;main.c:776: girl.y += 2;
	add	a, #0x02
	ld	(hl), a
00148$:
;main.c:779: if(girl.anim != 0)
	ld	a, (#(_girl + 8) + 0)
	or	a, a
	jr	Z, 00152$
;main.c:781: moveswordd(&sword, sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordd
;main.c:782: flipgirl();
	call	_flipgirl
;main.c:783: girl.anim = 0;
	ld	hl, #(_girl + 8)
	ld	(hl), #0x00
	jr	00153$
00152$:
;main.c:785: else if(girl.anim != 1)
	dec	a
	jr	Z, 00153$
;main.c:787: moveswordd(&sword, sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordd
;main.c:788: flipgirln();
	call	_flipgirln
;main.c:789: girl.anim = 1;
	ld	hl, #(_girl + 8)
	ld	(hl), #0x01
00153$:
;main.c:791: direction = 0;
	xor	a, a
	ld	(#_direction),a
00155$:
;main.c:794: if(joypad() & J_A)
	call	_joypad
	bit	4, a
	jr	Z, 00159$
;main.c:796: attack();
	call	_attack
00159$:
;main.c:800: if(locktimer > 0)
	ld	a, (#_locktimer)
	or	a, a
	jr	Z, 00161$
;main.c:802: sword_slimecolision();
	call	_sword_slimecolision
;main.c:803: moveslime(&slime, slime.x, slime.y);
	ld	hl, #_slime + 3
	ld	b, (hl)
	ld	a, (#(_slime + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_slime
	call	_moveslime
;main.c:804: locktimer++;
	ld	hl, #_locktimer
	inc	(hl)
00161$:
;main.c:806: if(locktimer == ATTACK_LOCK_TIME)
	ld	a, (#_locktimer)
	sub	a, #0x0a
	jr	NZ, 00163$
;main.c:808: locktimer = 0;
	xor	a, a
	ld	(#_locktimer),a
;main.c:809: swordreset();
	call	_swordreset
00163$:
;main.c:812: if(slime.death == 0)
	ld	hl, #_slime + 7
	ld	e, (hl)
	ld	a, e
	or	a, a
	jr	NZ, 00174$
;main.c:814: animslime();
	call	_animslime
;main.c:815: animtimer++;
	ld	hl, #_animtimer
	inc	(hl)
;main.c:816: if(animtimer == ANIM_TIMER_MAX)
	ld	a, (hl)
	sub	a, #0x14
	jr	NZ, 00175$
;main.c:818: animtimer = 0;
	xor	a, a
	ld	(#_animtimer),a
;main.c:819: if(slime.anim == 0)
	ld	hl, #_slime + 6
	ld	a, (hl)
	or	a, a
	jr	NZ, 00167$
;main.c:821: slime.anim = 1;
	ld	(hl), #0x01
	jr	00175$
00167$:
;main.c:823: else if(slime.anim == 1)
;main.c:825: slime.anim = 0;
	dec	a
	jr	NZ, 00175$
	ld	(hl), a
	jr	00175$
00174$:
;main.c:830: else if(slime.death == 1)
	dec	e
	jr	NZ, 00175$
;main.c:832: slime.x = 0;
	ld	hl, #_slime + 2
	ld	(hl), #0x00
;main.c:833: slime.y = 0;
	ld	bc, #_slime + 3
	xor	a, a
	ld	(bc), a
;main.c:834: moveslime(&slime, slime.x, slime.y);
	ld	a, (hl)
	ld	h, #0x00
	push	hl
	inc	sp
	ld	de, #_slime
	call	_moveslime
00175$:
;main.c:836: spawntimer++;
	ld	hl, #_spawntimer
	inc	(hl)
;main.c:843: girl_slimecolision();
	call	_girl_slimecolision
;main.c:844: prev_pad = current_pad;
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(#_prev_pad),a
;main.c:845: performantdelay(5);
	ld	a, #0x05
	call	_performantdelay
	jp	00179$
;main.c:848: }
	inc	sp
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
