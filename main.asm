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
	.globl _moveslime
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
	.globl _slime
	.globl _sword
	.globl _girl
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
;main.c:31: void performantdelay(UINT8 numloops)
;	---------------------------------
; Function performantdelay
; ---------------------------------
_performantdelay::
	ld	c, a
;main.c:34: for(i = 0; i < numloops; i++)
	ld	b, #0x00
00103$:
	ld	a, b
	sub	a, c
	ret	NC
;main.c:36: wait_vbl_done();
	call	_wait_vbl_done
;main.c:34: for(i = 0; i < numloops; i++)
	inc	b
;main.c:38: }
	jr	00103$
;main.c:56: void girl_slimecolision()
;	---------------------------------
; Function girl_slimecolision
; ---------------------------------
_girl_slimecolision::
	add	sp, #-7
;main.c:58: if (girl.x < slime.x + slime.width - pad &&
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
;main.c:59: girl.x + girl.width - pad > slime.x &&
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
;main.c:60: girl.y < slime.y + slime.height - pad &&
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
;main.c:61: girl.y + girl.height - pad > slime.y)
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
;main.c:64: hide_sprite(girl.spritids[0]);
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
;main.c:65: hide_sprite(girl.spritids[1]);
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
;main.c:66: hide_sprite(girl.spritids[2]);
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
;main.c:67: hide_sprite(girl.spritids[3]);
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
;main.c:67: hide_sprite(girl.spritids[3]);
00110$:
;main.c:70: }
	add	sp, #7
	ret
;main.c:71: void sword_slimecolision()
;	---------------------------------
; Function sword_slimecolision
; ---------------------------------
_sword_slimecolision::
	add	sp, #-4
;main.c:73: if (sword.x < slime.x + slime.width &&
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
;main.c:74: sword.x + sword.width > slime.x &&
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
;main.c:75: sword.y < slime.y + slime.height &&
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
;main.c:76: sword.y + sword.height > slime.y)
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
;main.c:79: slime.death = 1;
	ld	hl, #_slime + 7
	ld	(hl), #0x01
;main.c:80: slime.x = 0;
	ld	hl, #(_slime + 2)
;main.c:81: slime.y = 0;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;main.c:82: score = score ++;
00106$:
;main.c:85: }
	add	sp, #4
	ret
;main.c:86: void movegirl(struct GameCharacter* character, UINT8 x, UINT8 y)
;	---------------------------------
; Function movegirl
; ---------------------------------
_movegirl::
	dec	sp
	ldhl	sp,	#0
	ld	(hl), a
;main.c:88: move_sprite(character->spritids[0], x, y);
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
;main.c:89: move_sprite(character->spritids[1], x + spritesize, y);
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
;main.c:90: move_sprite(character->spritids[2], x, y + spritesize);
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
;main.c:91: move_sprite(character->spritids[3], x + spritesize, y + spritesize);
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
;main.c:91: move_sprite(character->spritids[3], x + spritesize, y + spritesize);
;main.c:92: }
	inc	sp
	pop	hl
	inc	sp
	jp	(hl)
;main.c:95: void moveswordl(struct Weapon* character, UINT8 x, UINT8 y)
;	---------------------------------
; Function moveswordl
; ---------------------------------
_moveswordl::
	dec	sp
	ld	c, e
	ld	b, d
	ldhl	sp,	#0
	ld	(hl), a
;main.c:98: sword.x = girl.x - 3;
	ld	a, (#(_girl + 4) + 0)
	add	a, #0xfd
	ld	hl, #(_sword + 2)
;main.c:99: sword.y = girl.y + 8;
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
;main.c:102: sword.spritids[0] = 18;
	ld	hl, #_sword
	ld	(hl), #0x12
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 78)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x13
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:105: sword.spritids[1] = 19;
	ld	hl, #_sword + 1
	ld	(hl), #0x13
;main.c:106: move_sprite(character->spritids[0], x, y);
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
;main.c:107: move_sprite(character->spritids[1], x - spritesize, y);
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
;main.c:109: hide_sprite(21);
;main.c:111: }
	inc	sp
	pop	hl
	inc	sp
	jp	(hl)
;main.c:112: void moveswordr(struct Weapon* character, UINT8 x, UINT8 y)
;	---------------------------------
; Function moveswordr
; ---------------------------------
_moveswordr::
	dec	sp
	ld	c, e
	ld	b, d
	ldhl	sp,	#0
	ld	(hl), a
;main.c:114: sword.x = girl.x + 21;
	ld	a, (#(_girl + 4) + 0)
	add	a, #0x15
	ld	hl, #(_sword + 2)
;main.c:115: sword.y = girl.y + 8;
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
;main.c:118: sword.spritids[1] = 18;
	ld	hl, #_sword + 1
	ld	(hl), #0x12
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 78)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x13
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:121: sword.spritids[0] = 19;
	ld	hl, #_sword
	ld	(hl), #0x13
;main.c:122: move_sprite(character->spritids[0], x, y);
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
;main.c:123: move_sprite(character->spritids[1], x - spritesize, y);
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
;main.c:125: hide_sprite(21);
;main.c:126: }
	inc	sp
	pop	hl
	inc	sp
	jp	(hl)
;main.c:127: void moveswordu(struct Weapon* character, UINT8 x, UINT8 y)
;	---------------------------------
; Function moveswordu
; ---------------------------------
_moveswordu::
	dec	sp
	ld	c, e
	ld	b, d
	ldhl	sp,	#0
	ld	(hl), a
;main.c:129: sword.x = girl.x + 9;
	ld	a, (#(_girl + 4) + 0)
	add	a, #0x09
	ld	hl, #(_sword + 2)
;main.c:130: sword.y = girl.y;
	ld	(hl+), a
	ld	a, (#(_girl + 5) + 0)
	ld	(hl), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 82)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x14
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:133: sword.spritids[0] = 20;
	ld	hl, #_sword
	ld	(hl), #0x14
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 86)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x15
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:136: sword.spritids[1] = 21;
	ld	hl, #_sword + 1
	ld	(hl), #0x15
;main.c:137: move_sprite(character->spritids[0], x, y);
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
;main.c:138: move_sprite(character->spritids[1], x, y - spritesize);
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
;main.c:140: hide_sprite(19);
;main.c:141: }
	inc	sp
	pop	hl
	inc	sp
	jp	(hl)
;main.c:142: void moveswordd(struct Weapon* character, UINT8 x, UINT8 y)
;	---------------------------------
; Function moveswordd
; ---------------------------------
_moveswordd::
	dec	sp
	ld	c, e
	ld	b, d
	ldhl	sp,	#0
	ld	(hl), a
;main.c:144: sword.x = girl.x - 2;
	ld	a, (#(_girl + 4) + 0)
	dec	a
	dec	a
	ld	hl, #(_sword + 2)
;main.c:145: sword.y = girl.y + 20;
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
;main.c:148: sword.spritids[1] = 20;
	ld	hl, #_sword + 1
	ld	(hl), #0x14
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 86)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x15
	ld	(hl+), a
	ld	(hl), #0x40
;main.c:151: sword.spritids[0] = 21;
	ld	hl, #_sword
	ld	(hl), #0x15
;main.c:152: move_sprite(character->spritids[0], x, y);
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
;main.c:153: move_sprite(character->spritids[1], x , y - spritesize);
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
;main.c:155: hide_sprite(19);
;main.c:156: }
	inc	sp
	pop	hl
	inc	sp
	jp	(hl)
;main.c:157: void attack()
;	---------------------------------
; Function attack
; ---------------------------------
_attack::
;main.c:159: if(direction == 0)
	ld	a, (#_direction)
	or	a, a
	jr	NZ, 00110$
;main.c:161: moveswordd(&sword, sword.x, sword.y);
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
;main.c:162: sword.y = sword.y + 6;
	ld	a, (bc)
	add	a, #0x06
	ld	(bc), a
	jr	00111$
00110$:
;main.c:164: else if(direction == 1)
	ld	a, (#_direction)
	dec	a
	jr	NZ, 00107$
;main.c:166: moveswordu(&sword, sword.x, sword.y);
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
;main.c:167: sword.y = sword.y - 6;
	ld	a, (hl)
	add	a, #0xfa
	ld	(hl), a
	jr	00111$
00107$:
;main.c:169: else if(direction == 2)
	ld	a, (#_direction)
	sub	a, #0x02
	jr	NZ, 00104$
;main.c:171: moveswordl(&sword, sword.x, sword.y);
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
;main.c:172: sword.x = sword.x - 6;
	ld	a, (hl)
	add	a, #0xfa
	ld	(hl), a
	jr	00111$
00104$:
;main.c:174: else if(direction == 3)
	ld	a, (#_direction)
	sub	a, #0x03
	jr	NZ, 00111$
;main.c:176: moveswordr(&sword, sword.x, sword.y);
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
;main.c:177: sword.x = sword.x + 6;
	ld	a, (hl)
	add	a, #0x06
	ld	(hl), a
00111$:
;main.c:179: if (locktimer == 0)
	ld	hl, #_locktimer
	ld	a, (hl)
	or	a, a
	ret	NZ
;main.c:181: locktimer ++;
	inc	(hl)
;main.c:183: }
	ret
;main.c:184: void swordreset()
;	---------------------------------
; Function swordreset
; ---------------------------------
_swordreset::
;main.c:186: if(direction == 0)
	ld	a, (#_direction)
	or	a, a
	jr	NZ, 00110$
;main.c:188: sword.y = sword.y - 8;
	ld	hl, #_sword + 3
	ld	a, (hl)
	add	a, #0xf8
	ld	(hl), a
;main.c:189: moveswordd(&sword, sword.x, sword.y);
	ld	h, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	hl
	inc	sp
	ld	de, #_sword
	call	_moveswordd
	ret
00110$:
;main.c:191: else if(direction == 1)
	ld	a, (#_direction)
	dec	a
	jr	NZ, 00107$
;main.c:193: sword.y = sword.y + 8;
	ld	hl, #_sword + 3
	ld	a, (hl)
	add	a, #0x08
	ld	(hl), a
;main.c:194: moveswordu(&sword, sword.x, sword.y);
	ld	b, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordu
	ret
00107$:
;main.c:196: else if(direction == 2)
	ld	a, (#_direction)
	sub	a, #0x02
	jr	NZ, 00104$
;main.c:198: sword.x = sword.x + 8;
	ld	hl, #_sword + 2
	ld	a, (hl)
	add	a, #0x08
	ld	(hl), a
;main.c:199: moveswordl(&sword, sword.x, sword.y);
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
;main.c:201: else if(direction == 3)
	ld	a, (#_direction)
	sub	a, #0x03
	ret	NZ
;main.c:203: sword.x = sword.x - 8;
	ld	hl, #_sword + 2
	ld	a, (hl)
	add	a, #0xf8
	ld	(hl), a
;main.c:204: moveswordr(&sword, sword.x, sword.y);
	ld	bc, #_sword + 3
	ld	a, (bc)
	ld	c, (hl)
	push	af
	inc	sp
	ld	a, c
	ld	de, #_sword
	call	_moveswordr
;main.c:206: }
	ret
;main.c:207: void moveslime(struct Enemy* character, UINT8 x, UINT8 y)
;	---------------------------------
; Function moveslime
; ---------------------------------
_moveslime::
	ld	c, a
;main.c:209: move_sprite(character->spritids[0], x, y);
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
;main.c:209: move_sprite(character->spritids[0], x, y);
;main.c:210: }
	pop	hl
	inc	sp
	jp	(hl)
;main.c:211: void animslime()
;	---------------------------------
; Function animslime
; ---------------------------------
_animslime::
;main.c:213: if(slime.anim == 0)
	ld	bc, #_slime+0
	ld	a, (#(_slime + 6) + 0)
	or	a, a
	jr	NZ, 00104$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 70)
	ld	(hl), #0x11
;main.c:216: slime.spritids[0] = 17;
	ld	a, #0x11
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:2001: shadow_OAM[nb].y = 0;
	ld	hl, #(_shadow_OAM + 64)
	ld	(hl), #0x00
;main.c:218: moveslime(&slime, slime.x, slime.y);
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
;main.c:220: else if(slime.anim == 1)
	dec	a
	ret	NZ
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 66)
;main.c:223: slime.spritids[0] = 16;
;c:\gbdk\include\gb\gb.h:2001: shadow_OAM[nb].y = 0;
	ld	a, #0x10
	ld	(hl+), a
	inc	hl
	ld	a, #0x10
	ld	(bc), a
	ld	(hl), #0x00
;main.c:225: moveslime(&slime, slime.x, slime.y);
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
;main.c:227: }
	ret
;main.c:230: void flipgirl()
;	---------------------------------
; Function flipgirl
; ---------------------------------
_flipgirl::
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
;main.c:234: girl.spritids[0] = 0;
	ld	hl, #_girl
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x01
;main.c:237: girl.spritids[1] = 1;
	ld	hl, #_girl + 1
	ld	(hl), #0x01
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x02
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:240: girl.spritids[3] = 2;
	ld	hl, #_girl + 3
	ld	(hl), #0x02
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x03
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:243: girl.spritids[2] = 3;
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
;main.c:258: movegirl(&girl, girl.x, girl.y);
	ld	hl, #_girl + 5
	ld	b, (hl)
	ld	a, (#(_girl + 4) + 0)
	push	bc
	inc	sp
	ld	de, #_girl
	call	_movegirl
;main.c:261: }
	ret
;main.c:264: void flipgirln()
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
;main.c:268: girl.spritids[0] = 0;
	ld	hl, #_girl
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:271: girl.spritids[1] = 1;
	ld	hl, #_girl + 1
	ld	(hl), #0x01
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x02
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:274: girl.spritids[2] = 2;
	ld	hl, #_girl + 2
	ld	(hl), #0x02
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x03
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:277: girl.spritids[3] = 3;
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
;main.c:293: movegirl(&girl, girl.x, girl.y);
	ld	hl, #_girl + 5
	ld	b, (hl)
	ld	a, (#(_girl + 4) + 0)
	push	bc
	inc	sp
	ld	de, #_girl
	call	_movegirl
;main.c:294: }
	ret
;main.c:297: void flipgirllw()
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
;main.c:301: girl.spritids[0] = 4;
	ld	hl, #_girl
	ld	(hl), #0x04
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x05
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:304: girl.spritids[1] = 5;
	ld	hl, #_girl + 1
	ld	(hl), #0x05
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 26)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x06
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:307: girl.spritids[2] = 6;
	ld	hl, #_girl + 2
	ld	(hl), #0x06
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 30)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x07
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:310: girl.spritids[3] = 7;
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
;main.c:325: movegirl(&girl, girl.x, girl.y);
	ld	hl, #_girl + 5
	ld	b, (hl)
	ld	a, (#(_girl + 4) + 0)
	push	bc
	inc	sp
	ld	de, #_girl
	call	_movegirl
;main.c:326: }
	ret
;main.c:329: void flipgirlls()
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
;main.c:333: girl.spritids[0] = 8;
	ld	hl, #_girl
	ld	(hl), #0x08
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 38)
	ld	(hl), #0x09
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	inc	hl
	ld	(hl), #0x00
;main.c:336: girl.spritids[1] = 9;
	ld	hl, #_girl + 1
	ld	(hl), #0x09
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 42)
	ld	(hl), #0x0a
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	inc	hl
	ld	(hl), #0x00
;main.c:339: girl.spritids[2] = 10;
	ld	hl, #_girl + 2
	ld	(hl), #0x0a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 46)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0b
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:342: girl.spritids[3] = 11;
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
;main.c:357: movegirl(&girl, girl.x, girl.y);
	ld	hl, #_girl + 5
	ld	b, (hl)
	ld	a, (#(_girl + 4) + 0)
	push	bc
	inc	sp
	ld	de, #_girl
	call	_movegirl
;main.c:358: }
	ret
;main.c:361: void flipgirlrw()
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
;main.c:365: girl.spritids[1] = 4;
	ld	hl, #_girl + 1
	ld	(hl), #0x04
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x05
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:368: girl.spritids[0] = 5;
	ld	hl, #_girl
	ld	(hl), #0x05
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 26)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x06
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:371: girl.spritids[3] = 6;
	ld	hl, #_girl + 3
	ld	(hl), #0x06
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 30)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x07
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:374: girl.spritids[2] = 7;
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
;main.c:389: movegirl(&girl, girl.x, girl.y);
	ld	hl, #_girl + 5
	ld	b, (hl)
	ld	a, (#(_girl + 4) + 0)
	push	bc
	inc	sp
	ld	de, #_girl
	call	_movegirl
;main.c:390: }
	ret
;main.c:393: void flipgirlrs()
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
;main.c:397: girl.spritids[1] = 8;
	ld	hl, #_girl + 1
	ld	(hl), #0x08
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 38)
	ld	(hl), #0x09
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	inc	hl
	ld	(hl), #0x20
;main.c:400: girl.spritids[0] = 9;
	ld	hl, #_girl
	ld	(hl), #0x09
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 42)
	ld	(hl), #0x0a
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	inc	hl
	ld	(hl), #0x20
;main.c:403: girl.spritids[3] = 10;
	ld	hl, #_girl + 3
	ld	(hl), #0x0a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 46)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0b
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:406: girl.spritids[2] = 11;
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
;main.c:421: movegirl(&girl, girl.x, girl.y);
	ld	hl, #_girl + 5
	ld	b, (hl)
	ld	a, (#(_girl + 4) + 0)
	push	bc
	inc	sp
	ld	de, #_girl
	call	_movegirl
;main.c:422: }
	ret
;main.c:425: void flipgirlu()
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
;main.c:429: girl.spritids[0] = 12;
	ld	hl, #_girl
	ld	(hl), #0x0c
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 54)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0d
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:432: girl.spritids[1] = 13;
	ld	hl, #_girl + 1
	ld	(hl), #0x0d
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 58)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0e
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:435: girl.spritids[2] = 14;
	ld	hl, #_girl + 2
	ld	(hl), #0x0e
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 62)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0f
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:438: girl.spritids[3] = 15;
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
;main.c:454: movegirl(&girl, girl.x, girl.y);
	ld	hl, #_girl + 5
	ld	b, (hl)
	ld	a, (#(_girl + 4) + 0)
	push	bc
	inc	sp
	ld	de, #_girl
	call	_movegirl
;main.c:455: }
	ret
;main.c:458: void flipgirlun()
;	---------------------------------
; Function flipgirlun
; ---------------------------------
_flipgirlun::
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 50)
	ld	(hl), #0x0c
;main.c:462: girl.spritids[0] = 12;
	ld	hl, #_girl
	ld	(hl), #0x0c
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 54)
	ld	(hl), #0x0d
;main.c:465: girl.spritids[1] = 13;
	ld	hl, #_girl + 1
	ld	(hl), #0x0d
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 58)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0e
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:468: girl.spritids[3] = 14;
	ld	hl, #_girl + 3
	ld	(hl), #0x0e
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 62)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0f
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:471: girl.spritids[2] = 15;
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
;main.c:487: movegirl(&girl, girl.x, girl.y);
	ld	hl, #_girl + 5
	ld	b, (hl)
	ld	a, (#(_girl + 4) + 0)
	push	bc
	inc	sp
	ld	de, #_girl
	call	_movegirl
;main.c:489: }
	ret
;main.c:491: void setupgirl()
;	---------------------------------
; Function setupgirl
; ---------------------------------
_setupgirl::
;main.c:493: girl.x = 80;
	ld	bc, #_girl + 4
	ld	a, #0x50
	ld	(bc), a
;main.c:494: girl.y = 36;
	ld	hl, #(_girl + 5)
;main.c:495: girl.width = 16;
	ld	a, #0x24
	ld	(hl+), a
	ld	(hl), #0x10
;main.c:496: girl.height = 16;
	ld	hl, #_girl + 7
	ld	(hl), #0x10
;main.c:497: girl.anim = 0;
	ld	hl, #_girl + 8
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
;main.c:500: girl.spritids[0] = 0;
	ld	hl, #_girl
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x01
;main.c:502: girl.spritids[1] = 1;
	ld	hl, #_girl + 1
	ld	(hl), #0x01
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), #0x02
;main.c:504: girl.spritids[2] = 2;
	ld	hl, #_girl + 2
	ld	(hl), #0x02
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x03
;main.c:506: girl.spritids[3] = 3;
	ld	hl, #_girl + 3
	ld	(hl), #0x03
;main.c:508: movegirl(&girl, girl.x, girl.y);
	ld	hl, #(_girl + 5)
	ld	h, (hl)
	ld	a, (bc)
	push	hl
	inc	sp
	ld	de, #_girl
	call	_movegirl
;main.c:509: }
	ret
;main.c:511: void setupslime()
;	---------------------------------
; Function setupslime
; ---------------------------------
_setupslime::
;main.c:513: slime.x = rand() % 128 + 16;
	call	_rand
	ld	a, e
	res	7, a
	add	a, #0x10
	ld	(#(_slime + 2)),a
;main.c:514: slime.y = rand() % 96 + 24;
	call	_rand
	ld	a, e
	ld	e, #0x60
	call	__moduchar
	ld	a, c
	add	a, #0x18
	ld	hl, #(_slime + 3)
;main.c:515: slime.width = 8;
	ld	(hl+), a
	ld	(hl), #0x08
;main.c:516: slime.height = 8;
	ld	hl, #_slime + 5
	ld	(hl), #0x08
;main.c:517: slime.anim = 0;
	ld	hl, #_slime + 6
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 66)
	ld	(hl), #0x10
;main.c:521: slime.spritids[0] = 16;
	ld	hl, #_slime
	ld	(hl), #0x10
;main.c:523: moveslime(&slime, slime.x, slime.y);
	ld	hl, #(_slime + 3)
	ld	b, (hl)
	ld	a, (#(_slime + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_slime
	call	_moveslime
;main.c:524: }
	ret
;main.c:526: void setupsword()
;	---------------------------------
; Function setupsword
; ---------------------------------
_setupsword::
;main.c:528: sword.x = 100;
	ld	hl, #_sword + 2
	ld	(hl), #0x64
;main.c:529: sword.y = 100;
	ld	hl, #_sword + 3
	ld	(hl), #0x64
;main.c:530: sword.width = 8;
	ld	hl, #_sword + 4
	ld	(hl), #0x08
;main.c:531: sword.height = 8;
	ld	hl, #_sword + 5
	ld	(hl), #0x08
;main.c:532: sword.anim = 0;
	ld	hl, #_sword + 6
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 74)
	ld	(hl), #0x12
;main.c:536: sword.spritids[0] = 18;
	ld	hl, #_sword
	ld	(hl), #0x12
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 78)
	ld	(hl), #0x13
;main.c:538: sword.spritids[1] = 19;
	ld	hl, #_sword + 1
	ld	(hl), #0x13
;main.c:541: }
	ret
;main.c:544: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
	dec	sp
;main.c:548: while(1)
00177$:
;main.c:550: if(joypad() & J_START && gamestate == 0)
	call	_joypad
	rlca
	jp	NC, 00102$
	ld	hl, #_gamestate
	ld	a, (hl)
	or	a, a
	jp	NZ, 00102$
;main.c:553: gamestate = 1;
	ld	(hl), #0x01
;main.c:554: initrand(DIV_REG);
	ldh	a, (_DIV_REG + 0)
	ld	b, #0x00
	ld	c, a
	push	bc
	call	_initrand
	pop	hl
;main.c:557: font_init();
	call	_font_init
;main.c:558: min_font = font_load(font_min);
	ld	de, #_font_min
	push	de
	call	_font_load
	pop	hl
;main.c:559: font_set(min_font);
	push	de
	call	_font_set
	pop	hl
;main.c:561: set_bkg_data(37, 8, backgroundtiles);
	ld	de, #_backgroundtiles
	push	de
	ld	hl, #0x825
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:562: set_bkg_tiles(0, 0, 20, 16, backgroundmap);
	ld	de, #_backgroundmap
	push	de
	ld	hl, #0x1014
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:564: set_win_tiles(0, 0, 20, 2, windowmap);
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
;main.c:569: set_sprite_data(0, 22, Girl);
	ld	de, #_Girl
	push	de
	ld	hl, #0x1600
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:570: setupgirl();
	call	_setupgirl
;main.c:571: setupslime();
	call	_setupslime
;main.c:572: setupsword();
	call	_setupsword
;main.c:575: OBP0_REG = 0xE0;
	ld	a, #0xe0
	ldh	(_OBP0_REG + 0), a
;main.c:576: OBP1_REG = 0xE0;
	ld	a, #0xe0
	ldh	(_OBP1_REG + 0), a
;main.c:577: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:578: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:579: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;main.c:580: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
00102$:
;main.c:582: if(joypad() & J_START && gamestate == 1)
	call	_joypad
	rlca
	jr	NC, 00105$
	ld	a, (#_gamestate)
	dec	a
	jr	NZ, 00105$
;main.c:584: gamestate = 2;
	ld	hl, #_gamestate
	ld	(hl), #0x02
;main.c:585: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:586: HIDE_BKG;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfe
	ldh	(_LCDC_REG + 0), a
;main.c:587: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
00105$:
;main.c:589: if(joypad() & J_START && gamestate == 2)
	call	_joypad
	rlca
	jr	NC, 00108$
	ld	a, (#_gamestate)
	sub	a, #0x02
	jr	NZ, 00108$
;main.c:591: gamestate = 1;
	ld	hl, #_gamestate
	ld	(hl), #0x01
;main.c:592: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:593: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:594: DISPLAY_OFF;
	call	_display_off
00108$:
;main.c:597: if (locktimer == 0)
	ld	a, (#_locktimer)
	or	a, a
	jp	NZ, 00157$
;main.c:599: if(joypad() & J_LEFT)
	call	_joypad
	bit	1, a
	jp	Z, 00122$
;main.c:601: moveswordl(&sword, sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordl
;main.c:602: if(girl.x > 23)
	ld	a, (#(_girl + 4) + 0)
	cp	a, #0x18
	jr	C, 00111$
;main.c:604: moveswordl(&sword, sword.x, sword.y);
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
;main.c:605: girl.x -= 2;
	ld	a, (#(_girl + 4) + 0)
	dec	a
	dec	a
	ld	(#(_girl + 4)),a
00111$:
;main.c:608: if(girl.anim != 2 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	ld	a, (#(_girl + 8) + 0)
	sub	a, #0x02
	jr	Z, 00117$
	call	_joypad
	bit	2, a
	jr	NZ, 00117$
	call	_joypad
	bit	3, a
	jr	NZ, 00117$
;main.c:610: moveswordl(&sword, sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordl
;main.c:611: flipgirllw();
	call	_flipgirllw
;main.c:612: girl.anim = 2;
	ld	hl, #(_girl + 8)
	ld	(hl), #0x02
	jr	00118$
00117$:
;main.c:614: else if(girl.anim != 3 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	ld	a, (#(_girl + 8) + 0)
	sub	a, #0x03
	jr	Z, 00118$
	call	_joypad
	bit	2, a
	jr	NZ, 00118$
	call	_joypad
	bit	3, a
	jr	NZ, 00118$
;main.c:616: moveswordl(&sword, sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordl
;main.c:617: flipgirlls();
	call	_flipgirlls
;main.c:618: girl.anim = 3;
	ld	hl, #(_girl + 8)
	ld	(hl), #0x03
00118$:
;main.c:620: direction = 2;
	ld	hl, #_direction
	ld	(hl), #0x02
00122$:
;main.c:622: if(joypad() & J_RIGHT)
	call	_joypad
	rrca
	jp	NC, 00135$
;main.c:624: moveswordr(&sword,sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordr
;main.c:625: if(girl.x < 138)
	ld	a, (#(_girl + 4) + 0)
	sub	a, #0x8a
	jr	NC, 00124$
;main.c:627: moveswordr(&sword,sword.x, sword.y);
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
;main.c:628: girl.x += 2;
	ld	a, (#(_girl + 4) + 0)
	add	a, #0x02
	ld	(#(_girl + 4)),a
00124$:
;main.c:632: if(girl.anim != 4 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	ld	a, (#(_girl + 8) + 0)
	sub	a, #0x04
	jr	Z, 00130$
	call	_joypad
	bit	2, a
	jr	NZ, 00130$
	call	_joypad
	bit	3, a
	jr	NZ, 00130$
;main.c:634: moveswordr(&sword, sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordr
;main.c:635: flipgirlrw();
	call	_flipgirlrw
;main.c:636: girl.anim = 4;
	ld	hl, #(_girl + 8)
	ld	(hl), #0x04
	jr	00131$
00130$:
;main.c:638: else if(girl.anim != 5 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	ld	a, (#(_girl + 8) + 0)
	sub	a, #0x05
	jr	Z, 00131$
	call	_joypad
	bit	2, a
	jr	NZ, 00131$
	call	_joypad
	bit	3, a
	jr	NZ, 00131$
;main.c:640: moveswordr(&sword, sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordr
;main.c:641: flipgirlrs();
	call	_flipgirlrs
;main.c:642: girl.anim = 5;
	ld	hl, #(_girl + 8)
	ld	(hl), #0x05
00131$:
;main.c:644: direction = 3;
	ld	hl, #_direction
	ld	(hl), #0x03
00135$:
;main.c:646: if(joypad() & J_UP)
	call	_joypad
	bit	2, a
	jr	Z, 00144$
;main.c:648: moveswordu(&sword, sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordu
;main.c:649: if(girl.y > 20)
	ld	a, (#(_girl + 5) + 0)
	cp	a, #0x15
	jr	C, 00137$
;main.c:652: girl.y -= 2;
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (hl)
	dec	a
	dec	a
	ld	(#(_girl + 5)),a
00137$:
;main.c:654: if(girl.anim != 6)
	ld	a, (#(_girl + 8) + 0)
	cp	a, #0x06
	jr	Z, 00141$
;main.c:656: moveswordu(&sword, sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordu
;main.c:657: flipgirlu();
	call	_flipgirlu
;main.c:658: girl.anim = 6;
	ld	hl, #(_girl + 8)
	ld	(hl), #0x06
	jr	00142$
00141$:
;main.c:660: else if(girl.anim != 7)
	sub	a, #0x07
	jr	Z, 00142$
;main.c:662: moveswordu(&sword, sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordu
;main.c:663: flipgirlun();
	call	_flipgirlun
;main.c:664: girl.anim = 7;
	ld	hl, #(_girl + 8)
	ld	(hl), #0x07
00142$:
;main.c:666: direction = 1;
	ld	hl, #_direction
	ld	(hl), #0x01
00144$:
;main.c:668: if(joypad() & J_DOWN)
	call	_joypad
	bit	3, a
	jr	Z, 00153$
;main.c:670: moveswordd(&sword, sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordd
;main.c:671: if(girl.y < 113)
	ld	hl, #_girl + 5
	ld	a, (hl)
	cp	a, #0x71
	jr	NC, 00146$
;main.c:674: girl.y += 2;
	add	a, #0x02
	ld	(hl), a
00146$:
;main.c:677: if(girl.anim != 0)
	ld	a, (#(_girl + 8) + 0)
	or	a, a
	jr	Z, 00150$
;main.c:679: moveswordd(&sword, sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordd
;main.c:680: flipgirl();
	call	_flipgirl
;main.c:681: girl.anim = 0;
	ld	hl, #(_girl + 8)
	ld	(hl), #0x00
	jr	00151$
00150$:
;main.c:683: else if(girl.anim != 1)
	dec	a
	jr	Z, 00151$
;main.c:685: moveswordd(&sword, sword.x, sword.y);
	ld	hl, #(_sword + 3)
	ld	b, (hl)
	ld	a, (#(_sword + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_sword
	call	_moveswordd
;main.c:686: flipgirln();
	call	_flipgirln
;main.c:687: girl.anim = 1;
	ld	hl, #(_girl + 8)
	ld	(hl), #0x01
00151$:
;main.c:689: direction = 0;
	xor	a, a
	ld	(#_direction),a
00153$:
;main.c:692: if(joypad() & J_A)
	call	_joypad
	bit	4, a
	jr	Z, 00157$
;main.c:694: attack();
	call	_attack
00157$:
;main.c:698: if(locktimer > 0)
	ld	a, (#_locktimer)
	or	a, a
	jr	Z, 00159$
;main.c:700: sword_slimecolision();
	call	_sword_slimecolision
;main.c:701: moveslime(&slime, slime.x, slime.y);
	ld	hl, #_slime + 3
	ld	b, (hl)
	ld	a, (#(_slime + 2) + 0)
	push	bc
	inc	sp
	ld	de, #_slime
	call	_moveslime
;main.c:702: locktimer++;
	ld	hl, #_locktimer
	inc	(hl)
00159$:
;main.c:704: if(locktimer == 10)
	ld	a, (#_locktimer)
	sub	a, #0x0a
	jr	NZ, 00161$
;main.c:706: locktimer = 0;
	xor	a, a
	ld	(#_locktimer),a
;main.c:707: swordreset();
	call	_swordreset
00161$:
;main.c:710: if(slime.death == 0)
	ld	a, (#(_slime + 7) + 0)
	ldhl	sp,#0
	ld	(hl), a
	ld	a, (hl)
	or	a, a
	jr	NZ, 00172$
;main.c:712: animslime();
	call	_animslime
;main.c:713: animtimer++;
	ld	hl, #_animtimer
	inc	(hl)
;main.c:714: if(animtimer == 20)
	ld	a, (hl)
	sub	a, #0x14
	jr	NZ, 00173$
;main.c:716: animtimer = 0;
	xor	a, a
	ld	(#_animtimer),a
;main.c:717: if(slime.anim == 0)
	ld	a, (#(_slime + 6) + 0)
	or	a, a
	jr	NZ, 00165$
;main.c:719: slime.anim = 1;
	ld	hl, #(_slime + 6)
	ld	(hl), #0x01
	jr	00173$
00165$:
;main.c:721: else if(slime.anim == 1)
	dec	a
	jr	NZ, 00173$
;main.c:723: slime.anim = 0;
	ld	hl, #(_slime + 6)
	ld	(hl), #0x00
	jr	00173$
00172$:
;main.c:728: else if(slime.death == 1)
	ldhl	sp,	#0
	ld	a, (hl)
	dec	a
	jr	NZ, 00173$
;main.c:730: slime.x = 0;
	ld	hl, #_slime + 2
	ld	(hl), #0x00
;main.c:731: slime.y = 0;
	ld	bc, #_slime + 3
	xor	a, a
	ld	(bc), a
;main.c:732: moveslime(&slime, slime.x, slime.y);
	ld	a, (hl)
	ld	h, #0x00
	push	hl
	inc	sp
	ld	de, #_slime
	call	_moveslime
00173$:
;main.c:734: spawntimer++;
	ld	hl, #_spawntimer
	inc	(hl)
;main.c:735: if(spawntimer == 100)
	ld	a, (hl)
	sub	a, #0x64
	jr	NZ, 00175$
;main.c:737: spawntimer = 0;
	xor	a, a
	ld	(#_spawntimer),a
;main.c:738: slime.death = 0;
	ld	hl, #(_slime + 7)
	ld	(hl), #0x00
;main.c:739: setupslime();
	call	_setupslime
00175$:
;main.c:741: girl_slimecolision();
	call	_girl_slimecolision
;main.c:742: performantdelay(5);
	ld	a, #0x05
	call	_performantdelay
	jp	00177$
;main.c:745: }
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
	.area _CABS (ABS)
