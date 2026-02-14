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
	.globl _display_off
	.globl _wait_vbl_done
	.globl _joypad
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
;main.c:39: void room_0()
;	---------------------------------
; Function room_0
; ---------------------------------
_room_0::
;main.c:41: if (room == 0)
	ld	a, (#_room)
	or	a, a
	ret	NZ
;main.c:44: slime_0.x = 26;
	ld	hl, #(_slime_0 + 2)
	ld	(hl), #0x1a
;main.c:45: slime_0.y = 26;
	ld	bc, #_slime_0 + 3
;main.c:46: slime_0.width = 8;
	inc	hl
	inc	hl
	ld	a, #0x1a
	ld	(bc), a
	ld	(hl), #0x08
;main.c:47: slime_0.height = 8;
	ld	hl, #_slime_0 + 5
	ld	(hl), #0x08
;main.c:48: slime_0.anim = 0;
	ld	hl, #_slime_0 + 6
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 66)
	ld	(hl), #0x10
;main.c:52: slime_0.spritids[0] = 16;
	ld	hl, #_slime_0
	ld	(hl), #0x10
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 70)
	ld	(hl), #0x11
;main.c:54: slime_0.spritids[1] = 17;
	ld	hl, #_slime_0 + 1
	ld	(hl), #0x11
;main.c:56: moveslime(&slime_0, slime_0.x, slime_0.y);
	ld	a, (bc)
	ld	hl, #(_slime_0 + 2)
	ld	c, (hl)
	push	af
	inc	sp
	ld	a, c
	ld	de, #_slime_0
	call	_moveslime
;main.c:58: slime_1.x = 26;
	ld	hl, #(_slime_1 + 2)
	ld	(hl), #0x1a
;main.c:59: slime_1.y = 26;
	ld	bc, #_slime_1 + 3
;main.c:60: slime_1.width = 8;
	inc	hl
	inc	hl
	ld	a, #0x1a
	ld	(bc), a
	ld	(hl), #0x08
;main.c:61: slime_1.height = 8;
	ld	hl, #_slime_1 + 5
	ld	(hl), #0x08
;main.c:62: slime_1.anim = 0;
	ld	hl, #_slime_1 + 6
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 66)
	ld	(hl), #0x10
;main.c:66: slime_1.spritids[0] = 16;
	ld	hl, #_slime_1
	ld	(hl), #0x10
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 70)
	ld	(hl), #0x11
;main.c:68: slime_1.spritids[1] = 17;
	ld	hl, #_slime_1 + 1
	ld	(hl), #0x11
;main.c:70: moveslime(&slime_1, slime_1.x, slime_1.y);
	ld	a, (bc)
	ld	hl, #(_slime_1 + 2)
	ld	c, (hl)
	push	af
	inc	sp
	ld	a, c
	ld	de, #_slime_1
	call	_moveslime
;main.c:72: }
	ret
;main.c:76: void performantdelay(UINT8 numloops)
;	---------------------------------
; Function performantdelay
; ---------------------------------
_performantdelay::
	ld	c, a
;main.c:79: for(i = 0; i < numloops; i++)
	ld	b, #0x00
00103$:
	ld	a, b
	sub	a, c
	ret	NC
;main.c:81: wait_vbl_done();
	call	_wait_vbl_done
;main.c:79: for(i = 0; i < numloops; i++)
	inc	b
;main.c:83: }
	jr	00103$
;main.c:101: void girl_slimecolision()
;	---------------------------------
; Function girl_slimecolision
; ---------------------------------
_girl_slimecolision::
	add	sp, #-7
;main.c:103: if (girl.x < slime.x + slime.width - pad &&
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
;main.c:104: girl.x + girl.width - pad > slime.x &&
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
;main.c:105: girl.y < slime.y + slime.height - pad &&
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
;main.c:106: girl.y + girl.height - pad > slime.y)
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
;main.c:109: hide_sprite(girl.spritids[0]);
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
;main.c:110: hide_sprite(girl.spritids[1]);
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
;main.c:111: hide_sprite(girl.spritids[2]);
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
;main.c:112: hide_sprite(girl.spritids[3]);
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
;main.c:112: hide_sprite(girl.spritids[3]);
00110$:
;main.c:115: }
	add	sp, #7
	ret
;main.c:116: void sword_slimecolision()
;	---------------------------------
; Function sword_slimecolision
; ---------------------------------
_sword_slimecolision::
	add	sp, #-4
;main.c:118: if (sword.x < slime.x + slime.width &&
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
;main.c:119: sword.x + sword.width > slime.x &&
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
;main.c:120: sword.y < slime.y + slime.height &&
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
;main.c:121: sword.y + sword.height > slime.y)
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
;main.c:124: slime.death = 1;
	ld	hl, #_slime + 7
	ld	(hl), #0x01
;main.c:125: slime.x = 0;
	ld	hl, #(_slime + 2)
;main.c:126: slime.y = 0;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;main.c:127: score = score ++;
00106$:
;main.c:130: }
	add	sp, #4
	ret
;main.c:131: void movegirl(struct GameCharacter* character, UINT8 x, UINT8 y)
;	---------------------------------
; Function movegirl
; ---------------------------------
_movegirl::
	dec	sp
	ldhl	sp,	#0
	ld	(hl), a
;main.c:133: move_sprite(character->spritids[0], x, y);
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
;main.c:134: move_sprite(character->spritids[1], x + spritesize, y);
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
;main.c:135: move_sprite(character->spritids[2], x, y + spritesize);
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
;main.c:136: move_sprite(character->spritids[3], x + spritesize, y + spritesize);
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
;main.c:136: move_sprite(character->spritids[3], x + spritesize, y + spritesize);
;main.c:137: }
	inc	sp
	pop	hl
	inc	sp
	jp	(hl)
;main.c:140: void moveswordl(struct Weapon* character, UINT8 x, UINT8 y)
;	---------------------------------
; Function moveswordl
; ---------------------------------
_moveswordl::
	dec	sp
	ld	c, e
	ld	b, d
	ldhl	sp,	#0
	ld	(hl), a
;main.c:143: sword.x = girl.x - 3;
	ld	a, (#(_girl + 4) + 0)
	add	a, #0xfd
	ld	hl, #(_sword + 2)
;main.c:144: sword.y = girl.y + 8;
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
;main.c:147: sword.spritids[0] = 18;
	ld	hl, #_sword
	ld	(hl), #0x12
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 78)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x13
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:150: sword.spritids[1] = 19;
	ld	hl, #_sword + 1
	ld	(hl), #0x13
;main.c:151: move_sprite(character->spritids[0], x, y);
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
;main.c:152: move_sprite(character->spritids[1], x - spritesize, y);
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
;main.c:154: hide_sprite(21);
;main.c:156: }
	inc	sp
	pop	hl
	inc	sp
	jp	(hl)
;main.c:157: void moveswordr(struct Weapon* character, UINT8 x, UINT8 y)
;	---------------------------------
; Function moveswordr
; ---------------------------------
_moveswordr::
	dec	sp
	ld	c, e
	ld	b, d
	ldhl	sp,	#0
	ld	(hl), a
;main.c:159: sword.x = girl.x + 21;
	ld	a, (#(_girl + 4) + 0)
	add	a, #0x15
	ld	hl, #(_sword + 2)
;main.c:160: sword.y = girl.y + 8;
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
;main.c:163: sword.spritids[1] = 18;
	ld	hl, #_sword + 1
	ld	(hl), #0x12
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 78)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x13
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:166: sword.spritids[0] = 19;
	ld	hl, #_sword
	ld	(hl), #0x13
;main.c:167: move_sprite(character->spritids[0], x, y);
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
;main.c:168: move_sprite(character->spritids[1], x - spritesize, y);
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
;main.c:170: hide_sprite(21);
;main.c:171: }
	inc	sp
	pop	hl
	inc	sp
	jp	(hl)
;main.c:172: void moveswordu(struct Weapon* character, UINT8 x, UINT8 y)
;	---------------------------------
; Function moveswordu
; ---------------------------------
_moveswordu::
	dec	sp
	ld	c, e
	ld	b, d
	ldhl	sp,	#0
	ld	(hl), a
;main.c:174: sword.x = girl.x + 9;
	ld	a, (#(_girl + 4) + 0)
	add	a, #0x09
	ld	hl, #(_sword + 2)
;main.c:175: sword.y = girl.y;
	ld	(hl+), a
	ld	a, (#(_girl + 5) + 0)
	ld	(hl), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 82)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x14
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:178: sword.spritids[0] = 20;
	ld	hl, #_sword
	ld	(hl), #0x14
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 86)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x15
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:181: sword.spritids[1] = 21;
	ld	hl, #_sword + 1
	ld	(hl), #0x15
;main.c:182: move_sprite(character->spritids[0], x, y);
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
;main.c:183: move_sprite(character->spritids[1], x, y - spritesize);
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
;main.c:185: hide_sprite(19);
;main.c:186: }
	inc	sp
	pop	hl
	inc	sp
	jp	(hl)
;main.c:187: void moveswordd(struct Weapon* character, UINT8 x, UINT8 y)
;	---------------------------------
; Function moveswordd
; ---------------------------------
_moveswordd::
	dec	sp
	ld	c, e
	ld	b, d
	ldhl	sp,	#0
	ld	(hl), a
;main.c:189: sword.x = girl.x - 2;
	ld	a, (#(_girl + 4) + 0)
	dec	a
	dec	a
	ld	hl, #(_sword + 2)
;main.c:190: sword.y = girl.y + 20;
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
;main.c:193: sword.spritids[1] = 20;
	ld	hl, #_sword + 1
	ld	(hl), #0x14
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 86)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x15
	ld	(hl+), a
	ld	(hl), #0x40
;main.c:196: sword.spritids[0] = 21;
	ld	hl, #_sword
	ld	(hl), #0x15
;main.c:197: move_sprite(character->spritids[0], x, y);
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
;main.c:198: move_sprite(character->spritids[1], x , y - spritesize);
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
;main.c:200: hide_sprite(19);
;main.c:201: }
	inc	sp
	pop	hl
	inc	sp
	jp	(hl)
;main.c:202: void attack()
;	---------------------------------
; Function attack
; ---------------------------------
_attack::
;main.c:204: if(direction == 0)
	ld	a, (#_direction)
	or	a, a
	jr	NZ, 00110$
;main.c:206: moveswordd(&sword, sword.x, sword.y);
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
;main.c:207: sword.y = sword.y + 6;
	ld	a, (bc)
	add	a, #0x06
	ld	(bc), a
	jr	00111$
00110$:
;main.c:209: else if(direction == 1)
	ld	a, (#_direction)
	dec	a
	jr	NZ, 00107$
;main.c:211: moveswordu(&sword, sword.x, sword.y);
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
;main.c:212: sword.y = sword.y - 6;
	ld	a, (hl)
	add	a, #0xfa
	ld	(hl), a
	jr	00111$
00107$:
;main.c:214: else if(direction == 2)
	ld	a, (#_direction)
	sub	a, #0x02
	jr	NZ, 00104$
;main.c:216: moveswordl(&sword, sword.x, sword.y);
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
;main.c:217: sword.x = sword.x - 6;
	ld	a, (hl)
	add	a, #0xfa
	ld	(hl), a
	jr	00111$
00104$:
;main.c:219: else if(direction == 3)
	ld	a, (#_direction)
	sub	a, #0x03
	jr	NZ, 00111$
;main.c:221: moveswordr(&sword, sword.x, sword.y);
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
;main.c:222: sword.x = sword.x + 6;
	ld	a, (hl)
	add	a, #0x06
	ld	(hl), a
00111$:
;main.c:224: if (locktimer == 0)
	ld	hl, #_locktimer
	ld	a, (hl)
	or	a, a
	ret	NZ
;main.c:226: locktimer ++;
	inc	(hl)
;main.c:228: }
	ret
;main.c:229: void swordreset()
;	---------------------------------
; Function swordreset
; ---------------------------------
_swordreset::
;main.c:231: if(direction == 0)
	ld	a, (#_direction)
	or	a, a
	jr	NZ, 00110$
;main.c:233: sword.y = sword.y - 8;
	ld	hl, #_sword + 3
	ld	a, (hl)
	add	a, #0xf8
	ld	(hl), a
;main.c:234: moveswordd(&sword, sword.x, sword.y);
	ld	h, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	hl
	inc	sp
	ld	de, #_sword
	call	_moveswordd
	ret
00110$:
;main.c:236: else if(direction == 1)
	ld	a, (#_direction)
	dec	a
	jr	NZ, 00107$
;main.c:238: sword.y = sword.y + 8;
	ld	hl, #_sword + 3
	ld	a, (hl)
	add	a, #0x08
	ld	(hl), a
;main.c:239: moveswordu(&sword, sword.x, sword.y);
	ld	b, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordu
	ret
00107$:
;main.c:241: else if(direction == 2)
	ld	a, (#_direction)
	sub	a, #0x02
	jr	NZ, 00104$
;main.c:243: sword.x = sword.x + 8;
	ld	hl, #_sword + 2
	ld	a, (hl)
	add	a, #0x08
	ld	(hl), a
;main.c:244: moveswordl(&sword, sword.x, sword.y);
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
;main.c:246: else if(direction == 3)
	ld	a, (#_direction)
	sub	a, #0x03
	ret	NZ
;main.c:248: sword.x = sword.x - 8;
	ld	hl, #_sword + 2
	ld	a, (hl)
	add	a, #0xf8
	ld	(hl), a
;main.c:249: moveswordr(&sword, sword.x, sword.y);
	ld	bc, #_sword + 3
	ld	a, (bc)
	ld	c, (hl)
	push	af
	inc	sp
	ld	a, c
	ld	de, #_sword
	call	_moveswordr
;main.c:251: }
	ret
;main.c:252: void moveslime(struct Enemy* character, UINT8 x, UINT8 y)
;	---------------------------------
; Function moveslime
; ---------------------------------
_moveslime::
	ld	c, a
;main.c:254: move_sprite(character->spritids[0], x, y);
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
;main.c:254: move_sprite(character->spritids[0], x, y);
;main.c:255: }
	pop	hl
	inc	sp
	jp	(hl)
;main.c:256: void animslime()
;	---------------------------------
; Function animslime
; ---------------------------------
_animslime::
;main.c:258: if(slime.anim == 0)
	ld	bc, #_slime+0
	ld	a, (#(_slime + 6) + 0)
	or	a, a
	jr	NZ, 00104$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 70)
	ld	(hl), #0x11
;main.c:261: slime.spritids[0] = 17;
	ld	a, #0x11
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:2001: shadow_OAM[nb].y = 0;
	ld	hl, #(_shadow_OAM + 64)
	ld	(hl), #0x00
;main.c:263: moveslime(&slime, slime.x, slime.y);
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
;main.c:265: else if(slime.anim == 1)
	dec	a
	ret	NZ
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 66)
;main.c:268: slime.spritids[0] = 16;
;c:\gbdk\include\gb\gb.h:2001: shadow_OAM[nb].y = 0;
	ld	a, #0x10
	ld	(hl+), a
	inc	hl
	ld	a, #0x10
	ld	(bc), a
	ld	(hl), #0x00
;main.c:270: moveslime(&slime, slime.x, slime.y);
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
;main.c:272: }
	ret
;main.c:275: void flipgirl()
;	---------------------------------
; Function flipgirl
; ---------------------------------
_flipgirl::
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
;main.c:279: girl.spritids[0] = 0;
	ld	hl, #_girl
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x01
;main.c:282: girl.spritids[1] = 1;
	ld	hl, #_girl + 1
	ld	(hl), #0x01
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x02
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:285: girl.spritids[3] = 2;
	ld	hl, #_girl + 3
	ld	(hl), #0x02
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x03
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:288: girl.spritids[2] = 3;
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
;main.c:303: movegirl(&girl, girl.x, girl.y);
	ld	hl, #_girl + 5
	ld	b, (hl)
	ld	a, (#(_girl + 4) + 0)
	push	bc
	inc	sp
	ld	de, #_girl
	call	_movegirl
;main.c:306: }
	ret
;main.c:309: void flipgirln()
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
;main.c:313: girl.spritids[0] = 0;
	ld	hl, #_girl
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:316: girl.spritids[1] = 1;
	ld	hl, #_girl + 1
	ld	(hl), #0x01
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x02
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:319: girl.spritids[2] = 2;
	ld	hl, #_girl + 2
	ld	(hl), #0x02
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x03
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:322: girl.spritids[3] = 3;
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
;main.c:338: movegirl(&girl, girl.x, girl.y);
	ld	hl, #_girl + 5
	ld	b, (hl)
	ld	a, (#(_girl + 4) + 0)
	push	bc
	inc	sp
	ld	de, #_girl
	call	_movegirl
;main.c:339: }
	ret
;main.c:342: void flipgirllw()
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
;main.c:346: girl.spritids[0] = 4;
	ld	hl, #_girl
	ld	(hl), #0x04
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x05
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:349: girl.spritids[1] = 5;
	ld	hl, #_girl + 1
	ld	(hl), #0x05
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 26)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x06
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:352: girl.spritids[2] = 6;
	ld	hl, #_girl + 2
	ld	(hl), #0x06
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 30)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x07
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:355: girl.spritids[3] = 7;
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
;main.c:370: movegirl(&girl, girl.x, girl.y);
	ld	hl, #_girl + 5
	ld	b, (hl)
	ld	a, (#(_girl + 4) + 0)
	push	bc
	inc	sp
	ld	de, #_girl
	call	_movegirl
;main.c:371: }
	ret
;main.c:374: void flipgirlls()
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
;main.c:378: girl.spritids[0] = 8;
	ld	hl, #_girl
	ld	(hl), #0x08
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 38)
	ld	(hl), #0x09
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	inc	hl
	ld	(hl), #0x00
;main.c:381: girl.spritids[1] = 9;
	ld	hl, #_girl + 1
	ld	(hl), #0x09
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 42)
	ld	(hl), #0x0a
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	inc	hl
	ld	(hl), #0x00
;main.c:384: girl.spritids[2] = 10;
	ld	hl, #_girl + 2
	ld	(hl), #0x0a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 46)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0b
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:387: girl.spritids[3] = 11;
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
;main.c:402: movegirl(&girl, girl.x, girl.y);
	ld	hl, #_girl + 5
	ld	b, (hl)
	ld	a, (#(_girl + 4) + 0)
	push	bc
	inc	sp
	ld	de, #_girl
	call	_movegirl
;main.c:403: }
	ret
;main.c:406: void flipgirlrw()
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
;main.c:410: girl.spritids[1] = 4;
	ld	hl, #_girl + 1
	ld	(hl), #0x04
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x05
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:413: girl.spritids[0] = 5;
	ld	hl, #_girl
	ld	(hl), #0x05
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 26)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x06
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:416: girl.spritids[3] = 6;
	ld	hl, #_girl + 3
	ld	(hl), #0x06
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 30)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x07
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:419: girl.spritids[2] = 7;
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
;main.c:434: movegirl(&girl, girl.x, girl.y);
	ld	hl, #_girl + 5
	ld	b, (hl)
	ld	a, (#(_girl + 4) + 0)
	push	bc
	inc	sp
	ld	de, #_girl
	call	_movegirl
;main.c:435: }
	ret
;main.c:438: void flipgirlrs()
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
;main.c:442: girl.spritids[1] = 8;
	ld	hl, #_girl + 1
	ld	(hl), #0x08
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 38)
	ld	(hl), #0x09
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	inc	hl
	ld	(hl), #0x20
;main.c:445: girl.spritids[0] = 9;
	ld	hl, #_girl
	ld	(hl), #0x09
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 42)
	ld	(hl), #0x0a
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	inc	hl
	ld	(hl), #0x20
;main.c:448: girl.spritids[3] = 10;
	ld	hl, #_girl + 3
	ld	(hl), #0x0a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 46)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0b
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:451: girl.spritids[2] = 11;
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
;main.c:466: movegirl(&girl, girl.x, girl.y);
	ld	hl, #_girl + 5
	ld	b, (hl)
	ld	a, (#(_girl + 4) + 0)
	push	bc
	inc	sp
	ld	de, #_girl
	call	_movegirl
;main.c:467: }
	ret
;main.c:470: void flipgirlu()
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
;main.c:474: girl.spritids[0] = 12;
	ld	hl, #_girl
	ld	(hl), #0x0c
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 54)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0d
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:477: girl.spritids[1] = 13;
	ld	hl, #_girl + 1
	ld	(hl), #0x0d
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 58)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0e
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:480: girl.spritids[2] = 14;
	ld	hl, #_girl + 2
	ld	(hl), #0x0e
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 62)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0f
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:483: girl.spritids[3] = 15;
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
;main.c:499: movegirl(&girl, girl.x, girl.y);
	ld	hl, #_girl + 5
	ld	b, (hl)
	ld	a, (#(_girl + 4) + 0)
	push	bc
	inc	sp
	ld	de, #_girl
	call	_movegirl
;main.c:500: }
	ret
;main.c:503: void flipgirlun()
;	---------------------------------
; Function flipgirlun
; ---------------------------------
_flipgirlun::
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 50)
	ld	(hl), #0x0c
;main.c:507: girl.spritids[0] = 12;
	ld	hl, #_girl
	ld	(hl), #0x0c
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 54)
	ld	(hl), #0x0d
;main.c:510: girl.spritids[1] = 13;
	ld	hl, #_girl + 1
	ld	(hl), #0x0d
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 58)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0e
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:513: girl.spritids[3] = 14;
	ld	hl, #_girl + 3
	ld	(hl), #0x0e
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 62)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0f
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:516: girl.spritids[2] = 15;
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
;main.c:532: movegirl(&girl, girl.x, girl.y);
	ld	hl, #_girl + 5
	ld	b, (hl)
	ld	a, (#(_girl + 4) + 0)
	push	bc
	inc	sp
	ld	de, #_girl
	call	_movegirl
;main.c:534: }
	ret
;main.c:536: void setupgirl()
;	---------------------------------
; Function setupgirl
; ---------------------------------
_setupgirl::
;main.c:538: girl.x = 80;
	ld	bc, #_girl + 4
	ld	a, #0x50
	ld	(bc), a
;main.c:539: girl.y = 36;
	ld	hl, #(_girl + 5)
;main.c:540: girl.width = 16;
	ld	a, #0x24
	ld	(hl+), a
	ld	(hl), #0x10
;main.c:541: girl.height = 16;
	ld	hl, #_girl + 7
	ld	(hl), #0x10
;main.c:542: girl.anim = 0;
	ld	hl, #_girl + 8
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
;main.c:545: girl.spritids[0] = 0;
	ld	hl, #_girl
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x01
;main.c:547: girl.spritids[1] = 1;
	ld	hl, #_girl + 1
	ld	(hl), #0x01
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), #0x02
;main.c:549: girl.spritids[2] = 2;
	ld	hl, #_girl + 2
	ld	(hl), #0x02
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x03
;main.c:551: girl.spritids[3] = 3;
	ld	hl, #_girl + 3
	ld	(hl), #0x03
;main.c:553: movegirl(&girl, girl.x, girl.y);
	ld	hl, #(_girl + 5)
	ld	h, (hl)
	ld	a, (bc)
	push	hl
	inc	sp
	ld	de, #_girl
	call	_movegirl
;main.c:554: }
	ret
;main.c:556: void setupslime()
;	---------------------------------
; Function setupslime
; ---------------------------------
_setupslime::
;main.c:558: slime.x = rand() % 128 + 16;
	call	_rand
	ld	a, e
	res	7, a
	add	a, #0x10
	ld	(#(_slime + 2)),a
;main.c:559: slime.y = rand() % 96 + 24;
	call	_rand
	ld	a, e
	ld	e, #0x60
	call	__moduchar
	ld	a, c
	add	a, #0x18
	ld	hl, #(_slime + 3)
;main.c:560: slime.width = 8;
	ld	(hl+), a
	ld	(hl), #0x08
;main.c:561: slime.height = 8;
	ld	hl, #_slime + 5
	ld	(hl), #0x08
;main.c:562: slime.anim = 0;
	ld	hl, #_slime + 6
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 66)
	ld	(hl), #0x10
;main.c:566: slime.spritids[0] = 16;
	ld	hl, #_slime
	ld	(hl), #0x10
;main.c:568: moveslime(&slime, slime.x, slime.y);
	ld	hl, #(_slime + 3)
	ld	b, (hl)
	ld	a, (#(_slime + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_slime
	call	_moveslime
;main.c:569: }
	ret
;main.c:571: void setupsword()
;	---------------------------------
; Function setupsword
; ---------------------------------
_setupsword::
;main.c:573: sword.x = 100;
	ld	hl, #_sword + 2
	ld	(hl), #0x64
;main.c:574: sword.y = 100;
	ld	hl, #_sword + 3
	ld	(hl), #0x64
;main.c:575: sword.width = 8;
	ld	hl, #_sword + 4
	ld	(hl), #0x08
;main.c:576: sword.height = 8;
	ld	hl, #_sword + 5
	ld	(hl), #0x08
;main.c:577: sword.anim = 0;
	ld	hl, #_sword + 6
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 74)
	ld	(hl), #0x12
;main.c:581: sword.spritids[0] = 18;
	ld	hl, #_sword
	ld	(hl), #0x12
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 78)
	ld	(hl), #0x13
;main.c:583: sword.spritids[1] = 19;
	ld	hl, #_sword + 1
	ld	(hl), #0x13
;main.c:586: }
	ret
;main.c:589: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
	dec	sp
;main.c:591: room_0();
	call	_room_0
;main.c:593: while(1)
00177$:
;main.c:595: if(joypad() & J_START && gamestate == 0)
	call	_joypad
	rlca
	jp	NC, 00102$
	ld	hl, #_gamestate
	ld	a, (hl)
	or	a, a
	jp	NZ, 00102$
;main.c:598: gamestate = 1;
	ld	(hl), #0x01
;main.c:599: initrand(DIV_REG);
	ldh	a, (_DIV_REG + 0)
	ld	b, #0x00
	ld	c, a
	push	bc
	call	_initrand
	pop	hl
;main.c:602: font_init();
	call	_font_init
;main.c:603: min_font = font_load(font_min);
	ld	de, #_font_min
	push	de
	call	_font_load
	pop	hl
;main.c:604: font_set(min_font);
	push	de
	call	_font_set
	pop	hl
;main.c:606: set_bkg_data(37, 8, backgroundtiles);
	ld	de, #_backgroundtiles
	push	de
	ld	hl, #0x825
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:607: set_bkg_tiles(0, 0, 20, 16, backgroundmap);
	ld	de, #_backgroundmap
	push	de
	ld	hl, #0x1014
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:609: set_win_tiles(0, 0, 20, 2, windowmap);
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
;main.c:614: set_sprite_data(0, 22, Girl);
	ld	de, #_Girl
	push	de
	ld	hl, #0x1600
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:615: setupgirl();
	call	_setupgirl
;main.c:616: setupslime();
	call	_setupslime
;main.c:617: setupsword();
	call	_setupsword
;main.c:620: OBP0_REG = 0xE0;
	ld	a, #0xe0
	ldh	(_OBP0_REG + 0), a
;main.c:621: OBP1_REG = 0xE0;
	ld	a, #0xe0
	ldh	(_OBP1_REG + 0), a
;main.c:622: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:623: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:624: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;main.c:625: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
00102$:
;main.c:627: if(joypad() & J_START && gamestate == 1)
	call	_joypad
	rlca
	jr	NC, 00105$
	ld	a, (#_gamestate)
	dec	a
	jr	NZ, 00105$
;main.c:629: gamestate = 2;
	ld	hl, #_gamestate
	ld	(hl), #0x02
;main.c:630: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:631: HIDE_BKG;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfe
	ldh	(_LCDC_REG + 0), a
;main.c:632: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
00105$:
;main.c:634: if(joypad() & J_START && gamestate == 2)
	call	_joypad
	rlca
	jr	NC, 00108$
	ld	a, (#_gamestate)
	sub	a, #0x02
	jr	NZ, 00108$
;main.c:636: gamestate = 1;
	ld	hl, #_gamestate
	ld	(hl), #0x01
;main.c:637: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:638: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:639: DISPLAY_OFF;
	call	_display_off
00108$:
;main.c:642: if (locktimer == 0)
	ld	a, (#_locktimer)
	or	a, a
	jp	NZ, 00157$
;main.c:644: if(joypad() & J_LEFT)
	call	_joypad
	bit	1, a
	jp	Z, 00122$
;main.c:646: moveswordl(&sword, sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordl
;main.c:647: if(girl.x > 23)
	ld	a, (#(_girl + 4) + 0)
	cp	a, #0x18
	jr	C, 00111$
;main.c:649: moveswordl(&sword, sword.x, sword.y);
	ld	a, (#(_sword + 3) + 0)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (#(_sword + 2) + 0)
	ldhl	sp,	#0
	ld	h, (hl)
	push	hl
	inc	sp
	ld	de, #_sword
	call	_moveswordl
;main.c:650: girl.x -= 2;
	ld	a, (#(_girl + 4) + 0)
	dec	a
	dec	a
	ld	(#(_girl + 4)),a
00111$:
;main.c:653: if(girl.anim != 2 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	ld	a, (#(_girl + 8) + 0)
	sub	a, #0x02
	jr	Z, 00117$
	call	_joypad
	bit	2, a
	jr	NZ, 00117$
	call	_joypad
	bit	3, a
	jr	NZ, 00117$
;main.c:655: moveswordl(&sword, sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordl
;main.c:656: flipgirllw();
	call	_flipgirllw
;main.c:657: girl.anim = 2;
	ld	hl, #(_girl + 8)
	ld	(hl), #0x02
	jr	00118$
00117$:
;main.c:659: else if(girl.anim != 3 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	ld	a, (#(_girl + 8) + 0)
	sub	a, #0x03
	jr	Z, 00118$
	call	_joypad
	bit	2, a
	jr	NZ, 00118$
	call	_joypad
	bit	3, a
	jr	NZ, 00118$
;main.c:661: moveswordl(&sword, sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordl
;main.c:662: flipgirlls();
	call	_flipgirlls
;main.c:663: girl.anim = 3;
	ld	hl, #(_girl + 8)
	ld	(hl), #0x03
00118$:
;main.c:665: direction = 2;
	ld	hl, #_direction
	ld	(hl), #0x02
00122$:
;main.c:667: if(joypad() & J_RIGHT)
	call	_joypad
	rrca
	jp	NC, 00135$
;main.c:669: moveswordr(&sword,sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordr
;main.c:670: if(girl.x < 138)
	ld	a, (#(_girl + 4) + 0)
	sub	a, #0x8a
	jr	NC, 00124$
;main.c:672: moveswordr(&sword,sword.x, sword.y);
	ld	a, (#(_sword + 3) + 0)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (#(_sword + 2) + 0)
	ldhl	sp,	#0
	ld	h, (hl)
	push	hl
	inc	sp
	ld	de, #_sword
	call	_moveswordr
;main.c:673: girl.x += 2;
	ld	a, (#(_girl + 4) + 0)
	add	a, #0x02
	ld	(#(_girl + 4)),a
00124$:
;main.c:677: if(girl.anim != 4 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	ld	a, (#(_girl + 8) + 0)
	sub	a, #0x04
	jr	Z, 00130$
	call	_joypad
	bit	2, a
	jr	NZ, 00130$
	call	_joypad
	bit	3, a
	jr	NZ, 00130$
;main.c:679: moveswordr(&sword, sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordr
;main.c:680: flipgirlrw();
	call	_flipgirlrw
;main.c:681: girl.anim = 4;
	ld	hl, #(_girl + 8)
	ld	(hl), #0x04
	jr	00131$
00130$:
;main.c:683: else if(girl.anim != 5 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	ld	a, (#(_girl + 8) + 0)
	sub	a, #0x05
	jr	Z, 00131$
	call	_joypad
	bit	2, a
	jr	NZ, 00131$
	call	_joypad
	bit	3, a
	jr	NZ, 00131$
;main.c:685: moveswordr(&sword, sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordr
;main.c:686: flipgirlrs();
	call	_flipgirlrs
;main.c:687: girl.anim = 5;
	ld	hl, #(_girl + 8)
	ld	(hl), #0x05
00131$:
;main.c:689: direction = 3;
	ld	hl, #_direction
	ld	(hl), #0x03
00135$:
;main.c:691: if(joypad() & J_UP)
	call	_joypad
	bit	2, a
	jr	Z, 00144$
;main.c:693: moveswordu(&sword, sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordu
;main.c:694: if(girl.y > 20)
	ld	a, (#(_girl + 5) + 0)
	cp	a, #0x15
	jr	C, 00137$
;main.c:697: girl.y -= 2;
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (hl)
	dec	a
	dec	a
	ld	(#(_girl + 5)),a
00137$:
;main.c:699: if(girl.anim != 6)
	ld	a, (#(_girl + 8) + 0)
	cp	a, #0x06
	jr	Z, 00141$
;main.c:701: moveswordu(&sword, sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordu
;main.c:702: flipgirlu();
	call	_flipgirlu
;main.c:703: girl.anim = 6;
	ld	hl, #(_girl + 8)
	ld	(hl), #0x06
	jr	00142$
00141$:
;main.c:705: else if(girl.anim != 7)
	sub	a, #0x07
	jr	Z, 00142$
;main.c:707: moveswordu(&sword, sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordu
;main.c:708: flipgirlun();
	call	_flipgirlun
;main.c:709: girl.anim = 7;
	ld	hl, #(_girl + 8)
	ld	(hl), #0x07
00142$:
;main.c:711: direction = 1;
	ld	hl, #_direction
	ld	(hl), #0x01
00144$:
;main.c:713: if(joypad() & J_DOWN)
	call	_joypad
	bit	3, a
	jr	Z, 00153$
;main.c:715: moveswordd(&sword, sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordd
;main.c:716: if(girl.y < 113)
	ld	hl, #_girl + 5
	ld	a, (hl)
	cp	a, #0x71
	jr	NC, 00146$
;main.c:719: girl.y += 2;
	add	a, #0x02
	ld	(hl), a
00146$:
;main.c:722: if(girl.anim != 0)
	ld	a, (#(_girl + 8) + 0)
	or	a, a
	jr	Z, 00150$
;main.c:724: moveswordd(&sword, sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordd
;main.c:725: flipgirl();
	call	_flipgirl
;main.c:726: girl.anim = 0;
	ld	hl, #(_girl + 8)
	ld	(hl), #0x00
	jr	00151$
00150$:
;main.c:728: else if(girl.anim != 1)
	dec	a
	jr	Z, 00151$
;main.c:730: moveswordd(&sword, sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordd
;main.c:731: flipgirln();
	call	_flipgirln
;main.c:732: girl.anim = 1;
	ld	hl, #(_girl + 8)
	ld	(hl), #0x01
00151$:
;main.c:734: direction = 0;
	xor	a, a
	ld	(#_direction),a
00153$:
;main.c:737: if(joypad() & J_A)
	call	_joypad
	bit	4, a
	jr	Z, 00157$
;main.c:739: attack();
	call	_attack
00157$:
;main.c:743: if(locktimer > 0)
	ld	a, (#_locktimer)
	or	a, a
	jr	Z, 00159$
;main.c:745: sword_slimecolision();
	call	_sword_slimecolision
;main.c:746: moveslime(&slime, slime.x, slime.y);
	ld	hl, #_slime + 3
	ld	b, (hl)
	ld	a, (#(_slime + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_slime
	call	_moveslime
;main.c:747: locktimer++;
	ld	hl, #_locktimer
	inc	(hl)
00159$:
;main.c:749: if(locktimer == 10)
	ld	a, (#_locktimer)
	sub	a, #0x0a
	jr	NZ, 00161$
;main.c:751: locktimer = 0;
	xor	a, a
	ld	(#_locktimer),a
;main.c:752: swordreset();
	call	_swordreset
00161$:
;main.c:755: if(slime.death == 0)
	ld	hl, #_slime + 7
	ld	e, (hl)
	ld	a, e
	or	a, a
	jr	NZ, 00172$
;main.c:757: animslime();
	call	_animslime
;main.c:758: animtimer++;
	ld	hl, #_animtimer
	inc	(hl)
;main.c:759: if(animtimer == 20)
	ld	a, (hl)
	sub	a, #0x14
	jr	NZ, 00173$
;main.c:761: animtimer = 0;
	xor	a, a
	ld	(#_animtimer),a
;main.c:762: if(slime.anim == 0)
	ld	hl, #_slime + 6
	ld	a, (hl)
	or	a, a
	jr	NZ, 00165$
;main.c:764: slime.anim = 1;
	ld	(hl), #0x01
	jr	00173$
00165$:
;main.c:766: else if(slime.anim == 1)
;main.c:768: slime.anim = 0;
	dec	a
	jr	NZ, 00173$
	ld	(hl), a
	jr	00173$
00172$:
;main.c:773: else if(slime.death == 1)
	dec	e
	jr	NZ, 00173$
;main.c:775: slime.x = 0;
	ld	hl, #_slime + 2
	ld	(hl), #0x00
;main.c:776: slime.y = 0;
	ld	bc, #_slime + 3
	xor	a, a
	ld	(bc), a
;main.c:777: moveslime(&slime, slime.x, slime.y);
	ld	a, (hl)
	ld	h, #0x00
	push	hl
	inc	sp
	ld	de, #_slime
	call	_moveslime
00173$:
;main.c:779: spawntimer++;
	ld	hl, #_spawntimer
	inc	(hl)
;main.c:786: girl_slimecolision();
	call	_girl_slimecolision
;main.c:787: performantdelay(5);
	ld	a, #0x05
	call	_performantdelay
	jp	00177$
;main.c:790: }
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
	.area _CABS (ABS)
