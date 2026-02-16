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
	.globl _set_win_tile_xy
	.globl _set_win_tiles
	.globl _set_bkg_tile_xy
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _wait_vbl_done
	.globl _joypad
	.globl _knockback_dy
	.globl _knockback_dx
	.globl _knockback_timer
	.globl _enemy_start_delay_timer
	.globl _title_flash_visible
	.globl _title_flash_timer
	.globl _spawned_enemies
	.globl _prev_pad
	.globl _room
	.globl _direction
	.globl _movetimer
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
	.globl _ui_font
	.globl _hit_this_attack
	.globl _enemies
	.globl _player_stats
	.globl _slime
	.globl _sword
	.globl _girl
	.globl _draw_press_start
	.globl _init_title_screen
	.globl _update_title_screen
	.globl _slime_can_move
	.globl _resolve_enemy_collisions
	.globl _slime_ai
	.globl _update_window_stats_ui
	.globl _show_pause_ui
	.globl _hide_pause_ui
	.globl _show_room_clear_ui
	.globl _hide_room_clear_ui
	.globl _write_window_2digits
	.globl _player_take_damage
	.globl _audio_init
	.globl _sfx_swing
	.globl _sfx_enemy_hit
	.globl _sfx_player_hurt
	.globl _init_player_stats
	.globl _init_character_stats
	.globl _update_timers
	.globl _setup_enemy
	.globl _room_0
	.globl _performantdelay
	.globl _character_enemy_collision
	.globl _hide_character_sprites
	.globl _weapon_enemy_collision
	.globl _move_player
	.globl _move_weapon
	.globl _move_sword_sprites_from_position
	.globl _attack
	.globl _swordreset
	.globl _move_enemy_small
	.globl _animate_enemy
	.globl _enemy_check_borders
	.globl _character_set_sprite
	.globl _setup_character
	.globl _setup_player
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
	.ds 13
_player_stats::
	.ds 7
_enemies::
	.ds 104
_hit_this_attack::
	.ds 8
_ui_font::
	.ds 2
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
	.ds 40
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
_movetimer::
	.ds 1
_direction::
	.ds 1
_room::
	.ds 1
_prev_pad::
	.ds 1
_spawned_enemies::
	.ds 1
_title_flash_timer::
	.ds 1
_title_flash_visible::
	.ds 1
_enemy_start_delay_timer::
	.ds 1
_knockback_timer::
	.ds 1
_knockback_dx::
	.ds 1
_knockback_dy::
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
;main.c:265: void draw_press_start(UINT8 visible)
;	---------------------------------
; Function draw_press_start
; ---------------------------------
_draw_press_start::
	add	sp, #-11
	ld	c, a
;main.c:267: const UINT8 press_start_tiles[11] = {
	ldhl	sp,	#0
	ld	a, #0x1a
	ld	(hl+), a
	ld	a, #0x1c
	ld	(hl+), a
	ld	a, #0x0f
	ld	(hl+), a
	ld	a,#0x1d
	ld	(hl+),a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	a, #0x1d
	ld	(hl+), a
	ld	a, #0x1e
	ld	(hl+), a
	ld	a, #0x0b
	ld	(hl+), a
	ld	a, #0x1c
	ld	(hl+), a
	ld	(hl), #0x1e
;main.c:273: for(UINT8 i = 0; i < 11; i++)
	ld	b, #0x00
00103$:
	ld	a, b
	sub	a, #0x0b
	jr	NC, 00105$
;main.c:275: set_bkg_tile_xy(START_X + i, START_Y, visible ? press_start_tiles[i] : 0);
	ld	a, c
	or	a, a
	jr	Z, 00107$
	ld	e, b
	ld	d, #0x00
	ld	hl, #0
	add	hl, sp
	add	hl, de
	ld	a, (hl)
	jr	00108$
00107$:
	xor	a, a
00108$:
	ld	d, a
	ld	a, b
	add	a, #0x05
	push	bc
	push	de
	inc	sp
	ld	e, #0x0a
	call	_set_bkg_tile_xy
	pop	bc
;main.c:273: for(UINT8 i = 0; i < 11; i++)
	inc	b
	jr	00103$
00105$:
;main.c:277: }
	add	sp, #11
	ret
;main.c:279: void init_title_screen(void)
;	---------------------------------
; Function init_title_screen
; ---------------------------------
_init_title_screen::
;main.c:281: font_init();
	call	_font_init
;main.c:282: ui_font = font_load(font_min);
	ld	de, #_font_min
	push	de
	call	_font_load
	pop	hl
	ld	hl, #_ui_font
	ld	a, e
	ld	(hl+), a
;main.c:283: font_set(ui_font);
	ld	a, d
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_font_set
	pop	hl
;main.c:285: for(UINT8 y = 0; y < 18; y++)
	ld	e, #0x00
00107$:
	ld	a, e
	sub	a, #0x12
	jr	NC, 00102$
;main.c:287: for(UINT8 x = 0; x < 20; x++)
	ld	d, #0x00
00104$:
	ld	a, d
	sub	a, #0x14
	jr	NC, 00108$
;main.c:289: set_bkg_tile_xy(x, y, 0);
	push	de
	xor	a, a
	push	af
	inc	sp
	ld	a, d
	call	_set_bkg_tile_xy
	pop	de
;main.c:287: for(UINT8 x = 0; x < 20; x++)
	inc	d
	jr	00104$
00108$:
;main.c:285: for(UINT8 y = 0; y < 18; y++)
	inc	e
	jr	00107$
00102$:
;main.c:293: set_bkg_tile_xy(TITLE_X + 0, TITLE_Y, TILE_S);
	ld	a, #0x1d
	push	af
	inc	sp
	ld	e, #0x06
	ld	a, #0x04
	call	_set_bkg_tile_xy
;main.c:294: set_bkg_tile_xy(TITLE_X + 1, TITLE_Y, TILE_L);
	ld	a, #0x16
	push	af
	inc	sp
	ld	e, #0x06
	ld	a, #0x05
	call	_set_bkg_tile_xy
;main.c:295: set_bkg_tile_xy(TITLE_X + 2, TITLE_Y, TILE_I);
	ld	a, #0x13
	push	af
	inc	sp
	ld	a,#0x06
	ld	e,a
	call	_set_bkg_tile_xy
;main.c:296: set_bkg_tile_xy(TITLE_X + 3, TITLE_Y, TILE_M);
	ld	a, #0x17
	push	af
	inc	sp
	ld	e, #0x06
	ld	a, #0x07
	call	_set_bkg_tile_xy
;main.c:297: set_bkg_tile_xy(TITLE_X + 4, TITLE_Y, TILE_E);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	e, #0x06
	ld	a, #0x08
	call	_set_bkg_tile_xy
;main.c:298: set_bkg_tile_xy(TITLE_X + 5, TITLE_Y, 0);
	xor	a, a
	push	af
	inc	sp
	ld	e, #0x06
	ld	a, #0x09
	call	_set_bkg_tile_xy
;main.c:299: set_bkg_tile_xy(TITLE_X + 6, TITLE_Y, TILE_K);
	ld	a, #0x15
	push	af
	inc	sp
	ld	e, #0x06
	ld	a, #0x0a
	call	_set_bkg_tile_xy
;main.c:300: set_bkg_tile_xy(TITLE_X + 7, TITLE_Y, TILE_I);
	ld	a, #0x13
	push	af
	inc	sp
	ld	e, #0x06
	ld	a, #0x0b
	call	_set_bkg_tile_xy
;main.c:301: set_bkg_tile_xy(TITLE_X + 8, TITLE_Y, TILE_L);
	ld	a, #0x16
	push	af
	inc	sp
	ld	e, #0x06
	ld	a, #0x0c
	call	_set_bkg_tile_xy
;main.c:302: set_bkg_tile_xy(TITLE_X + 9, TITLE_Y, TILE_L);
	ld	a, #0x16
	push	af
	inc	sp
	ld	e, #0x06
	ld	a, #0x0d
	call	_set_bkg_tile_xy
;main.c:303: set_bkg_tile_xy(TITLE_X + 10, TITLE_Y, TILE_E);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	e, #0x06
	ld	a, #0x0e
	call	_set_bkg_tile_xy
;main.c:304: set_bkg_tile_xy(TITLE_X + 11, TITLE_Y, TILE_R);
	ld	a, #0x1c
	push	af
	inc	sp
	ld	e, #0x06
	ld	a, #0x0f
	call	_set_bkg_tile_xy
;main.c:306: draw_press_start(1);
	ld	a, #0x01
	call	_draw_press_start
;main.c:307: title_flash_timer = 0;
	xor	a, a
	ld	(#_title_flash_timer),a
;main.c:308: title_flash_visible = 1;
	ld	hl, #_title_flash_visible
	ld	(hl), #0x01
;main.c:310: HIDE_WIN;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xdf
	ldh	(_LCDC_REG + 0), a
;main.c:311: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:312: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:313: }
	ret
;main.c:315: void update_title_screen(void)
;	---------------------------------
; Function update_title_screen
; ---------------------------------
_update_title_screen::
;main.c:317: title_flash_timer++;
	ld	hl, #_title_flash_timer
	inc	(hl)
;main.c:318: if(title_flash_timer >= START_FLASH_FRAMES)
	ld	a, (hl)
	sub	a, #0x04
	ret	C
;main.c:320: title_flash_timer = 0;
	ld	(hl), #0x00
;main.c:321: title_flash_visible = !title_flash_visible;
	ld	hl, #_title_flash_visible
	ld	a, (hl)
	sub	a, #0x01
	ld	a, #0x00
	rla
;main.c:322: draw_press_start(title_flash_visible);
	ld	(hl), a
;main.c:324: }
	jp	_draw_press_start
;main.c:326: void slime_can_move(struct Enemy* enemy, struct GameCharacter* target)
;	---------------------------------
; Function slime_can_move
; ---------------------------------
_slime_can_move::
	add	sp, #-5
	ldhl	sp,	#3
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ldhl	sp,	#1
	ld	a, c
	ld	(hl+), a
;main.c:329: if(enemy->move_timer == SLIME_MOVE_INTERVAL)
	ld	a, b
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000c
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	sub	a, #0x03
	jr	NZ, 00102$
;main.c:331: enemy->move_timer = 0;
	xor	a, a
	ld	(de), a
;main.c:332: slime_ai(target, enemy);
	push	de
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_slime_ai
;main.c:333: enemy_check_borders(enemy);
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_enemy_check_borders
;main.c:334: move_enemy_small(enemy, enemy->x, enemy->y);        
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	pop	de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#0
	ld	(hl), a
	push	de
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	pop	de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	push	de
	ldhl	sp,	#2
	ld	h, (hl)
	push	hl
	inc	sp
	ldhl	sp,	#6
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_move_enemy_small
	pop	de
00102$:
;main.c:336: enemy->move_timer++;
	ld	a, (de)
	inc	a
	ld	(de), a
;main.c:337: }
	add	sp, #5
	ret
;main.c:339: void resolve_enemy_collisions(void)
;	---------------------------------
; Function resolve_enemy_collisions
; ---------------------------------
_resolve_enemy_collisions::
	add	sp, #-22
;main.c:341: for(UINT8 i = 0; i < ACTIVE_ENEMY_COUNT; i++)
	ldhl	sp,	#20
	ld	(hl), #0x00
00126$:
	ldhl	sp,	#20
	ld	a, (hl)
	sub	a, #0x04
	jp	NC, 00127$
;main.c:343: if(enemies[i].death == 1)
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc, #_enemies
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#20
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#19
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0009
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	dec	a
	jp	Z, 00121$
;main.c:348: for(UINT8 j = i + 1; j < ACTIVE_ENEMY_COUNT; j++)
	ldhl	sp,	#20
	ld	a, (hl+)
	ld	(hl), a
	inc	(hl)
	ldhl	sp,	#18
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#19
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
00124$:
	ldhl	sp,	#21
	ld	a, (hl)
	sub	a, #0x04
	jp	NC, 00121$
;main.c:350: if(enemies[j].death == 1)
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#20
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#19
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_enemies
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
	ld	hl, #0x0009
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#20
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#19
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	dec	a
	jp	Z, 00119$
;main.c:355: if(enemies[i].x < enemies[j].x + enemies[j].width &&
	pop	de
	push	de
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
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#16
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	ld	b, #0x00
	ldhl	sp,	#16
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#18
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	jp	NC, 00119$
;main.c:356: enemies[i].x + enemies[i].width > enemies[j].x &&
	pop	de
	push	de
	ld	hl, #0x0006
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	d, #0x00
	ld	e, a
	ldhl	sp,	#18
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#16
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	jp	NC, 00119$
;main.c:357: enemies[i].y < enemies[j].y + enemies[j].height &&
	pop	de
	push	de
	ld	hl, #0x0005
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
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#15
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#14
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	ld	a, (hl+)
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	ld	b, #0x00
	ldhl	sp,	#16
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#12
	ld	a, (hl)
	ldhl	sp,	#18
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	jp	NC, 00119$
;main.c:358: enemies[i].y + enemies[i].height > enemies[j].y)
	pop	de
	push	de
	ld	hl, #0x0007
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	d, #0x00
	ld	e, a
	ldhl	sp,	#18
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#16
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	jp	NC, 00119$
;main.c:360: INT8 dx = (INT8)enemies[i].x - (INT8)enemies[j].x;
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#9
	ld	c, (hl)
	sub	a, c
	ld	c, a
;main.c:361: INT8 dy = (INT8)enemies[i].y - (INT8)enemies[j].y;
	ldhl	sp,	#12
	ld	a, (hl)
	ldhl	sp,	#15
	ld	b, (hl)
	inc	hl
	inc	hl
	sub	a, b
;main.c:362: UINT8 abs_dx = (dx < 0) ? (UINT8)(-dx) : (UINT8)dx;
	ld	(hl+), a
	ld	a, c
	rlca
	and	a,#0x01
	ld	(hl), a
	or	a, a
	jr	Z, 00129$
	xor	a, a
	sub	a, c
	ld	c, a
00129$:
;main.c:363: UINT8 abs_dy = (dy < 0) ? (UINT8)(-dy) : (UINT8)dy;
	ldhl	sp,	#17
	ld	a, (hl+)
	inc	hl
	rlca
	and	a,#0x01
	ld	(hl), a
	or	a, a
	jr	Z, 00131$
	dec	hl
	dec	hl
	xor	a, a
	sub	a, (hl)
	ld	b, a
	jr	00132$
00131$:
	ldhl	sp,	#17
	ld	b, (hl)
00132$:
;main.c:365: if(abs_dx >= abs_dy)
	ld	a, c
	sub	a, b
	jr	C, 00112$
;main.c:367: if(dx >= 0)
	ldhl	sp,	#18
	bit	0, (hl)
	jr	NZ, 00106$
;main.c:369: enemies[i].x++;
	ldhl	sp,	#6
	ld	a, (hl-)
	dec	hl
	inc	a
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;main.c:370: enemies[j].x--;
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	ld	a, (de)
	dec	a
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
	jr	00113$
00106$:
;main.c:374: enemies[i].x--;
	ldhl	sp,	#6
	ld	a, (hl-)
	dec	hl
	dec	a
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;main.c:375: enemies[j].x++;
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	ld	a, (de)
	inc	a
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
	jr	00113$
00112$:
;main.c:380: if(dy >= 0)
	ldhl	sp,	#19
	bit	0, (hl)
	jr	NZ, 00109$
;main.c:382: enemies[i].y++;
	ldhl	sp,	#12
	ld	a, (hl-)
	dec	hl
	inc	a
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;main.c:383: enemies[j].y--;
	ldhl	sp,#13
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	ld	a, (de)
	dec	a
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
	jr	00113$
00109$:
;main.c:387: enemies[i].y--;
	ldhl	sp,	#12
	ld	a, (hl-)
	dec	hl
	dec	a
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;main.c:388: enemies[j].y++;
	ldhl	sp,#13
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	ld	a, (de)
	inc	a
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
00113$:
;main.c:392: enemy_check_borders(&enemies[i]);
	pop	de
	push	de
	call	_enemy_check_borders
;main.c:393: enemy_check_borders(&enemies[j]);
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_enemy_check_borders
00119$:
;main.c:348: for(UINT8 j = i + 1; j < ACTIVE_ENEMY_COUNT; j++)
	ldhl	sp,	#21
	inc	(hl)
	jp	00124$
00121$:
;main.c:341: for(UINT8 i = 0; i < ACTIVE_ENEMY_COUNT; i++)
	ldhl	sp,	#20
	inc	(hl)
	jp	00126$
00127$:
;main.c:397: }
	add	sp, #22
	ret
;main.c:400: void slime_ai(struct GameCharacter* character, struct Enemy* enemy)
;	---------------------------------
; Function slime_ai
; ---------------------------------
_slime_ai::
	add	sp, #-6
	ldhl	sp,	#4
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ldhl	sp,	#2
	ld	a, c
	ld	(hl+), a
;main.c:402: if (character->x > enemy->x)
	ld	a, b
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#1
	ld	(hl), a
	ld	a, (hl-)
	sub	a, (hl)
	jr	NC, 00102$
;main.c:404: enemy->x++;
	inc	hl
	ld	a, (hl)
	inc	a
	ld	(de), a
00102$:
;main.c:406: if (character->x < enemy->x)
	ld	a, (bc)
	ld	b, a
;main.c:402: if (character->x > enemy->x)
	ld	a, (de)
	ld	c, a
;main.c:406: if (character->x < enemy->x)
	ld	a, b
	sub	a, c
	jr	NC, 00104$
;main.c:408: enemy->x--;
	ld	a, c
	dec	a
	ld	(de), a
00104$:
;main.c:410: if (character-> y> enemy->y)
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#1
	ld	(hl), a
	ld	a, (hl-)
	sub	a, (hl)
	jr	NC, 00106$
;main.c:412: enemy->y++;
	inc	hl
	ld	a, (hl)
	inc	a
	ld	(de), a
00106$:
;main.c:414: if (character->y < enemy->y)
	ld	a, (bc)
	ld	b, a
;main.c:410: if (character-> y> enemy->y)
	ld	a, (de)
	ld	c, a
;main.c:414: if (character->y < enemy->y)
	ld	a, b
	sub	a, c
	jr	NC, 00109$
;main.c:416: enemy->y--;
	ld	a, c
	dec	a
	ld	(de), a
00109$:
;main.c:418: }
	add	sp, #6
	ret
;main.c:419: void update_window_stats_ui(void)
;	---------------------------------
; Function update_window_stats_ui
; ---------------------------------
_update_window_stats_ui::
;main.c:421: set_win_tile_xy(HUD_HP_X, HUD_ROW, TILE_H); // HP label (heart tile)
	ld	a, #0x12
	push	af
	inc	sp
	xor	a, a
	ld	e, a
	call	_set_win_tile_xy
;main.c:422: set_win_tile_xy(HUD_HP_X + 1, HUD_ROW, TILE_P); 
	ld	a, #0x1a
	push	af
	inc	sp
	ld	e, #0x00
	ld	a, #0x01
	call	_set_win_tile_xy
;main.c:423: write_window_2digits(player_stats.current_health, HUD_HP_X + 2, HUD_ROW);
	ld	a, (#(_player_stats + 1) + 0)
	ld	h, #0x00
	push	hl
	inc	sp
	ld	e, #0x02
	call	_write_window_2digits
;main.c:426: }
	ret
;main.c:428: void show_pause_ui(void)
;	---------------------------------
; Function show_pause_ui
; ---------------------------------
_show_pause_ui::
;main.c:430: set_win_tile_xy(PAUSE_TEXT_X + 0, PAUSE_ROW, TILE_P);
	ld	a, #0x1a
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x07
	call	_set_win_tile_xy
;main.c:431: set_win_tile_xy(PAUSE_TEXT_X + 1, PAUSE_ROW, TILE_A);
	ld	a, #0x0b
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x08
	call	_set_win_tile_xy
;main.c:432: set_win_tile_xy(PAUSE_TEXT_X + 2, PAUSE_ROW, TILE_U);
	ld	a, #0x1f
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x09
	call	_set_win_tile_xy
;main.c:433: set_win_tile_xy(PAUSE_TEXT_X + 3, PAUSE_ROW, TILE_S);
	ld	a, #0x1d
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0a
	call	_set_win_tile_xy
;main.c:434: set_win_tile_xy(PAUSE_TEXT_X + 4, PAUSE_ROW, TILE_E);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0b
	call	_set_win_tile_xy
;main.c:435: }
	ret
;main.c:437: void hide_pause_ui(void)
;	---------------------------------
; Function hide_pause_ui
; ---------------------------------
_hide_pause_ui::
;main.c:439: set_win_tile_xy(PAUSE_TEXT_X + 0, PAUSE_ROW, 0);
	xor	a, a
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x07
	call	_set_win_tile_xy
;main.c:440: set_win_tile_xy(PAUSE_TEXT_X + 1, PAUSE_ROW, 0);
	xor	a, a
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x08
	call	_set_win_tile_xy
;main.c:441: set_win_tile_xy(PAUSE_TEXT_X + 2, PAUSE_ROW, 0);
	xor	a, a
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x09
	call	_set_win_tile_xy
;main.c:442: set_win_tile_xy(PAUSE_TEXT_X + 3, PAUSE_ROW, 0);
	xor	a, a
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0a
	call	_set_win_tile_xy
;main.c:443: set_win_tile_xy(PAUSE_TEXT_X + 4, PAUSE_ROW, 0);
	xor	a, a
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0b
	call	_set_win_tile_xy
;main.c:444: }
	ret
;main.c:446: void show_room_clear_ui(void)
;	---------------------------------
; Function show_room_clear_ui
; ---------------------------------
_show_room_clear_ui::
;main.c:448: set_win_tile_xy(ROOM_CLEAR_X + 0, ROOM_CLEAR_ROW, TILE_R);
	ld	a, #0x1c
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x05
	call	_set_win_tile_xy
;main.c:449: set_win_tile_xy(ROOM_CLEAR_X + 1, ROOM_CLEAR_ROW, TILE_O);
	ld	a, #0x19
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x06
	call	_set_win_tile_xy
;main.c:450: set_win_tile_xy(ROOM_CLEAR_X + 2, ROOM_CLEAR_ROW, TILE_O);
	ld	a, #0x19
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x07
	call	_set_win_tile_xy
;main.c:451: set_win_tile_xy(ROOM_CLEAR_X + 3, ROOM_CLEAR_ROW, TILE_M);
	ld	a, #0x17
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x08
	call	_set_win_tile_xy
;main.c:452: set_win_tile_xy(ROOM_CLEAR_X + 4, ROOM_CLEAR_ROW, 0);
	xor	a, a
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x09
	call	_set_win_tile_xy
;main.c:453: set_win_tile_xy(ROOM_CLEAR_X + 5, ROOM_CLEAR_ROW, TILE_C);
	ld	a, #0x0d
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0a
	call	_set_win_tile_xy
;main.c:454: set_win_tile_xy(ROOM_CLEAR_X + 6, ROOM_CLEAR_ROW, TILE_L);
	ld	a, #0x16
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0b
	call	_set_win_tile_xy
;main.c:455: set_win_tile_xy(ROOM_CLEAR_X + 7, ROOM_CLEAR_ROW, TILE_E);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0c
	call	_set_win_tile_xy
;main.c:456: set_win_tile_xy(ROOM_CLEAR_X + 8, ROOM_CLEAR_ROW, TILE_A);
	ld	a, #0x0b
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0d
	call	_set_win_tile_xy
;main.c:457: set_win_tile_xy(ROOM_CLEAR_X + 9, ROOM_CLEAR_ROW, TILE_R);
	ld	a, #0x1c
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0e
	call	_set_win_tile_xy
;main.c:458: }
	ret
;main.c:460: void hide_room_clear_ui(void)
;	---------------------------------
; Function hide_room_clear_ui
; ---------------------------------
_hide_room_clear_ui::
;main.c:462: for(UINT8 i = 0; i < 10; i++)
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x0a
	ret	NC
;main.c:464: set_win_tile_xy(ROOM_CLEAR_X + i, ROOM_CLEAR_ROW, 0);
	ld	a, c
	add	a, #0x05
	push	bc
	ld	h, #0x00
	push	hl
	inc	sp
	ld	e, #0x01
	call	_set_win_tile_xy
	pop	bc
;main.c:462: for(UINT8 i = 0; i < 10; i++)
	inc	c
;main.c:466: }
	jr	00103$
;main.c:468: void write_window_2digits(UINT8 value, UINT8 x, UINT8 y)
;	---------------------------------
; Function write_window_2digits
; ---------------------------------
_write_window_2digits::
	ld	b, e
;main.c:472: UINT8 tens = value / 10;
	ld	c, a
	push	bc
	ld	e, #0x0a
	ld	a, c
	call	__divuchar
	ld	l, c
	pop	bc
;main.c:473: UINT8 ones = value % 10;
	push	hl
	push	bc
	ld	e, #0x0a
	ld	a, c
	call	__moduchar
	pop	af
	ld	b, a
	pop	hl
;main.c:475: set_win_tile_xy(x, y, DIGIT_TILE_BASE + tens);
	ld	a, l
	inc	a
	push	bc
	push	af
	inc	sp
	ldhl	sp,	#5
	ld	e, (hl)
	ld	a, b
	call	_set_win_tile_xy
	pop	bc
;main.c:476: set_win_tile_xy(x + 1, y, DIGIT_TILE_BASE + ones);
	inc	c
	ld	a, b
	inc	a
	ld	h, c
	push	hl
	inc	sp
	ldhl	sp,	#3
	ld	e, (hl)
	call	_set_win_tile_xy
;main.c:477: }
	pop	hl
	inc	sp
	jp	(hl)
;main.c:478: UINT8 player_take_damage(UINT8 amount)
;	---------------------------------
; Function player_take_damage
; ---------------------------------
_player_take_damage::
	ld	c, a
;main.c:480: if(player_stats.invuln_timer == 0 && player_stats.is_dead == 0)
	ld	a, (#(_player_stats + 5) + 0)
	or	a, a
	jr	NZ, 00105$
	ld	a, (#(_player_stats + 6) + 0)
	or	a, a
	jr	NZ, 00105$
;main.c:482: if(amount >= player_stats.current_health)
	ld	hl, #(_player_stats + 1)
	ld	b, (hl)
	ld	a, c
	sub	a, b
	jr	C, 00102$
;main.c:484: player_stats.current_health = 0;
	ld	hl, #(_player_stats + 1)
	ld	(hl), #0x00
;main.c:485: player_stats.is_dead = 1;
	ld	hl, #(_player_stats + 6)
	ld	(hl), #0x01
	jr	00103$
00102$:
;main.c:489: player_stats.current_health -= amount;
	ld	a, b
	sub	a, c
	ld	(#(_player_stats + 1)),a
00103$:
;main.c:491: sfx_player_hurt();
	call	_sfx_player_hurt
;main.c:492: player_stats.invuln_timer = INVULN_FRAMES;
	ld	hl, #(_player_stats + 5)
	ld	(hl), #0x0a
;main.c:493: return 1;
	ld	a, #0x01
	ret
00105$:
;main.c:495: return 0;
	xor	a, a
;main.c:496: }            
	ret
;main.c:497: void audio_init(void)
;	---------------------------------
; Function audio_init
; ---------------------------------
_audio_init::
;main.c:499: NR52_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR52_REG + 0), a
;main.c:500: NR50_REG = 0x77;
	ld	a, #0x77
	ldh	(_NR50_REG + 0), a
;main.c:501: NR51_REG = 0xFF;
	ld	a, #0xff
	ldh	(_NR51_REG + 0), a
;main.c:502: }
	ret
;main.c:504: void sfx_swing(void)
;	---------------------------------
; Function sfx_swing
; ---------------------------------
_sfx_swing::
;main.c:506: NR41_REG = 0x00;
	xor	a, a
	ldh	(_NR41_REG + 0), a
;main.c:507: NR42_REG = 0xF1;
	ld	a, #0xf1
	ldh	(_NR42_REG + 0), a
;main.c:508: NR43_REG = 0x35;
	ld	a, #0x35
	ldh	(_NR43_REG + 0), a
;main.c:509: NR44_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR44_REG + 0), a
;main.c:510: }
	ret
;main.c:512: void sfx_enemy_hit(void)
;	---------------------------------
; Function sfx_enemy_hit
; ---------------------------------
_sfx_enemy_hit::
;main.c:514: NR41_REG = 0x00;
	xor	a, a
	ldh	(_NR41_REG + 0), a
;main.c:515: NR42_REG = 0xC2;
	ld	a, #0xc2
	ldh	(_NR42_REG + 0), a
;main.c:516: NR43_REG = 0x20;
	ld	a, #0x20
	ldh	(_NR43_REG + 0), a
;main.c:517: NR44_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR44_REG + 0), a
;main.c:518: }
	ret
;main.c:520: void sfx_player_hurt(void)
;	---------------------------------
; Function sfx_player_hurt
; ---------------------------------
_sfx_player_hurt::
;main.c:522: NR10_REG = 0x16;
	ld	a, #0x16
	ldh	(_NR10_REG + 0), a
;main.c:523: NR11_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR11_REG + 0), a
;main.c:524: NR12_REG = 0xF2;
	ld	a, #0xf2
	ldh	(_NR12_REG + 0), a
;main.c:525: NR13_REG = 0x40;
	ld	a, #0x40
	ldh	(_NR13_REG + 0), a
;main.c:526: NR14_REG = 0x87;
	ld	a, #0x87
	ldh	(_NR14_REG + 0), a
;main.c:527: }
	ret
;main.c:529: void init_player_stats(void)
;	---------------------------------
; Function init_player_stats
; ---------------------------------
_init_player_stats::
;main.c:531: init_character_stats(&player_stats,
	ld	hl, #0x02
	push	hl
	ld	hl, #0x505
	push	hl
	ld	a, #0x06
	ld	de, #_player_stats
	call	_init_character_stats
;main.c:537: }
	ret
;main.c:539: void init_character_stats(struct PlayerStats* stats,
;	---------------------------------
; Function init_character_stats
; ---------------------------------
_init_character_stats::
;main.c:546: stats->max_health = max_health;
	ld	(de), a
;main.c:547: stats->current_health = max_health;
	ld	c, e
	ld	b, d
	inc	bc
	ld	(bc), a
;main.c:548: stats->damage = damage;
	ld	c, e
	ld	b, d
	inc	bc
	inc	bc
	ldhl	sp,	#2
;main.c:549: stats->range = range;
	ld	a, (hl+)
	ld	(bc), a
	ld	c, e
	ld	b, d
	inc	bc
	inc	bc
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;main.c:550: stats->speed = speed;
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(bc), a
;main.c:551: stats->invuln_timer = invuln_time;
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#5
	ld	a, (hl)
	ld	(bc), a
;main.c:552: stats->is_dead = 0;
	ld	hl, #0x0006
	add	hl, de
	ld	(hl), #0x00
;main.c:553: }
	pop	hl
	add	sp, #4
	jp	(hl)
;main.c:555: void update_timers(struct GameCharacter* player, struct Weapon* weapon)
;	---------------------------------
; Function update_timers
; ---------------------------------
_update_timers::
	add	sp, #-11
	ldhl	sp,	#8
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ldhl	sp,	#6
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:557: if(player_stats.invuln_timer > 0 && player_stats.is_dead == 0)
	ld	hl, #(_player_stats + 5)
	ld	c, (hl)
	ld	a, c
	or	a, a
	jr	Z, 00102$
	ld	a, (#(_player_stats + 6) + 0)
	or	a, a
	jr	NZ, 00102$
;main.c:559: player_stats.invuln_timer--;
	dec	c
	ld	hl, #(_player_stats + 5)
	ld	(hl), c
00102$:
;main.c:564: player->x += knockback_dx;
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), a
;main.c:565: player->y += knockback_dy;
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl), a
;main.c:562: if(knockback_timer > 0 && player_stats.is_dead == 0)
	ld	a, (#_knockback_timer)
	or	a, a
	jp	Z, 00116$
	ld	a, (#(_player_stats + 6) + 0)
	or	a, a
	jp	NZ, 00116$
;main.c:564: player->x += knockback_dx;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	hl, #_knockback_dx
	add	a, (hl)
	ldhl	sp,	#2
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;main.c:565: player->y += knockback_dy;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	hl, #_knockback_dy
	add	a, (hl)
	ldhl	sp,	#4
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;main.c:567: if(player->x < MIN_GIRL_X)
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	sub	a, #0x17
	jr	NC, 00105$
;main.c:569: player->x = MIN_GIRL_X;
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), #0x17
00105$:
;main.c:571: if(player->x > MAX_GIRL_X)
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	cp	a, #0x8b
	jr	C, 00107$
;main.c:573: player->x = MAX_GIRL_X;
	dec	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x8a
00107$:
;main.c:575: if(player->y < MIN_GIRL_Y)
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	sub	a, #0x14
	jr	NC, 00109$
;main.c:577: player->y = MIN_GIRL_Y;
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), #0x14
00109$:
;main.c:579: if(player->y > MAX_GIRL_Y)
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	cp	a, #0x72
	jr	C, 00111$
;main.c:581: player->y = MAX_GIRL_Y;
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), #0x71
00111$:
;main.c:584: if(locktimer == 0)
	ld	a, (#_locktimer)
	or	a, a
	jr	NZ, 00113$
;main.c:586: move_weapon(weapon, player);
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_move_weapon
	jr	00114$
00113$:
;main.c:590: weapon->x += knockback_dx;
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ld	hl, #_knockback_dx
	add	a, (hl)
	pop	hl
	push	hl
	ld	(hl), a
;main.c:591: weapon->y += knockback_dy;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	hl, #_knockback_dy
	add	a, (hl)
	ld	(bc), a
;main.c:592: move_sword_sprites_from_position(weapon);
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_move_sword_sprites_from_position
00114$:
;main.c:595: knockback_timer--;
	ld	hl, #_knockback_timer
	dec	(hl)
00116$:
;main.c:598: if(locktimer == ATTACK_LOCK_TIME)
	ld	a, (#_locktimer)
	sub	a, #0x0a
	jr	NZ, 00119$
;main.c:600: locktimer = 0;
	xor	a, a
	ld	(#_locktimer),a
;main.c:601: swordreset(player, weapon);
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	ld	b, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_swordreset
00119$:
;main.c:604: if(locktimer > 0)
	ld	a, (#_locktimer)
	or	a, a
	jr	Z, 00122$
;main.c:606: for(UINT8 i = 0; i < ACTIVE_ENEMY_COUNT; i++)
	ldhl	sp,	#10
	ld	(hl), #0x00
00136$:
	ldhl	sp,	#10
	ld	a, (hl)
	sub	a, #0x04
	jr	NC, 00120$
;main.c:608: weapon_enemy_collision(weapon, &enemies[i], i);
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	de, #_enemies
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#10
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_weapon_enemy_collision
;main.c:606: for(UINT8 i = 0; i < ACTIVE_ENEMY_COUNT; i++)
	ldhl	sp,	#10
	inc	(hl)
	jr	00136$
00120$:
;main.c:610: locktimer++;
	ld	hl, #_locktimer
	inc	(hl)
00122$:
;main.c:613: if(player_stats.is_dead == 1)
	ld	a, (#(_player_stats + 6) + 0)
	dec	a
	jr	NZ, 00130$
;main.c:615: hide_character_sprites(player);
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_hide_character_sprites
	jr	00131$
00130$:
;main.c:557: if(player_stats.invuln_timer > 0 && player_stats.is_dead == 0)
	ld	a, (#(_player_stats + 5) + 0)
;main.c:617: else if(player_stats.invuln_timer > 0)
	or	a, a
	jr	Z, 00127$
;main.c:619: if(player_stats.invuln_timer % INVULN_FLASH_PERIOD == 0)
	and	a, #0x01
	jr	NZ, 00124$
;main.c:621: hide_character_sprites(player);
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_hide_character_sprites
	jr	00131$
00124$:
;main.c:625: move_player(player, player->x, player->y);
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	dec	hl
	ld	d, a
	ld	a, (de)
	ld	b, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	inc	sp
	ldhl	sp,	#9
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_move_player
	jr	00131$
00127$:
;main.c:630: move_player(player, player->x, player->y);
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	dec	hl
	ld	d, a
	ld	a, (de)
	ld	b, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	inc	sp
	ldhl	sp,	#9
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_move_player
00131$:
;main.c:633: if(player_stats.is_dead == 0 && locktimer == 0)
	ld	a, (#(_player_stats + 6) + 0)
	or	a, a
	jr	NZ, 00138$
	ld	a, (#_locktimer)
	or	a, a
	jr	NZ, 00138$
;main.c:635: move_weapon(weapon, player);
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_move_weapon
00138$:
;main.c:637: }
	add	sp, #11
	ret
;main.c:639: void setup_enemy(struct Enemy* enemy, UINT8 oam_slot, UINT8 x, UINT8 y)
;	---------------------------------
; Function setup_enemy
; ---------------------------------
_setup_enemy::
	dec	sp
	ldhl	sp,	#0
	ld	(hl), a
;main.c:641: enemy->x = x;
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(bc), a
;main.c:642: enemy->y = y;
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(bc), a
;main.c:643: enemy->width = 8;
	ld	hl, #0x0006
	add	hl, de
	ld	(hl), #0x08
;main.c:644: enemy->height = 8;
	ld	hl, #0x0007
	add	hl, de
	ld	(hl), #0x08
;main.c:645: enemy->anim = 0;
	ld	hl, #0x0008
	add	hl, de
	ld	(hl), #0x00
;main.c:646: enemy->death = 0;
	ld	hl, #0x0009
	add	hl, de
	ld	(hl), #0x00
;main.c:647: enemy->max_health = 2;
	ld	hl, #0x000a
	add	hl, de
	ld	(hl), #0x02
;main.c:648: enemy->current_health = 2;
	ld	hl, #0x000b
	add	hl, de
	ld	(hl), #0x02
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
;main.c:652: enemy->spritids[0] = oam_slot;
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
;main.c:654: move_enemy_small(enemy, x, y);
	ldhl	sp,	#4
	ld	a, (hl-)
	push	af
	inc	sp
	ld	a, (hl)
	call	_move_enemy_small
;main.c:655: }
	inc	sp
	pop	hl
	pop	af
	jp	(hl)
;main.c:658: void room_0(void)
;	---------------------------------
; Function room_0
; ---------------------------------
_room_0::
;main.c:660: setup_enemy(&enemies[0], 22, 26, 50);   // Left top
	ld	hl, #0x321a
	push	hl
	ld	a, #0x16
	ld	de, #_enemies
	call	_setup_enemy
;main.c:661: setup_enemy(&enemies[1], 23, 26, 70);   // Left bottom
	ld	hl, #0x461a
	push	hl
	ld	a, #0x17
	ld	de, #(_enemies + 13)
	call	_setup_enemy
;main.c:662: setup_enemy(&enemies[2], 24, 134, 50);  // Right top
	ld	hl, #0x3286
	push	hl
	ld	a, #0x18
	ld	de, #(_enemies + 26)
	call	_setup_enemy
;main.c:663: setup_enemy(&enemies[3], 25, 134, 70);  // Right bottom
	ld	hl, #0x4686
	push	hl
	ld	a, #0x19
	ld	de, #(_enemies + 39)
	call	_setup_enemy
;main.c:664: enemy_start_delay_timer = ENEMY_START_DELAY_FRAMES;
	ld	hl, #_enemy_start_delay_timer
	ld	(hl), #0x14
;main.c:665: }
	ret
;main.c:669: void performantdelay(UINT8 numloops)
;	---------------------------------
; Function performantdelay
; ---------------------------------
_performantdelay::
	ld	c, a
;main.c:672: for(i = 0; i < numloops; i++)
	ld	b, #0x00
00103$:
	ld	a, b
	sub	a, c
	ret	NC
;main.c:674: wait_vbl_done();
	call	_wait_vbl_done
;main.c:672: for(i = 0; i < numloops; i++)
	inc	b
;main.c:676: }
	jr	00103$
;main.c:678: void character_enemy_collision(struct GameCharacter* character, struct Enemy* enemy)
;	---------------------------------
; Function character_enemy_collision
; ---------------------------------
_character_enemy_collision::
	add	sp, #-19
	ldhl	sp,	#17
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ldhl	sp,	#15
	ld	a, c
	ld	(hl+), a
;main.c:681: if(enemy->death == 1)
	ld	a, b
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0009
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	dec	a
	jp	Z, 00119$
;main.c:683: return;
;main.c:686: if (character->x < enemy->x + enemy->width - pad &&
	ldhl	sp,#17
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ld	c, a
	ldhl	sp,#15
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
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
	ldhl	sp,	#9
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,#15
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	e, a
	ld	d, #0x00
	ldhl	sp,	#9
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#13
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#12
	ld	(hl), a
	ld	a, (#_pad)
	ldhl	sp,	#4
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,#11
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
	ldhl	sp,	#14
	ld	(hl-), a
	ld	(hl), e
	ld	b, #0x00
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00204$
	bit	7, d
	jr	NZ, 00205$
	cp	a, a
	jr	00205$
00204$:
	bit	7, d
	jr	Z, 00205$
	scf
00205$:
	jp	NC, 00119$
;main.c:687: character->x + character->width - pad > enemy->x &&
	ldhl	sp,#17
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
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
	ld	d, (hl)
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ld	b, a
	ld	c, e
	ldhl	sp,	#9
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00206$
	bit	7, d
	jr	NZ, 00207$
	cp	a, a
	jr	00207$
00206$:
	bit	7, d
	jr	Z, 00207$
	scf
00207$:
	jp	NC, 00119$
;main.c:688: character->y < enemy->y + enemy->height - pad &&
	ldhl	sp,#17
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
	ld	(hl), a
	ldhl	sp,#15
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#11
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#10
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,#15
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	ld	b, #0x00
	ldhl	sp,	#11
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
	ldhl	sp,	#14
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,	#8
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#13
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00208$
	bit	7, d
	jr	NZ, 00209$
	cp	a, a
	jr	00209$
00208$:
	bit	7, d
	jr	Z, 00209$
	scf
00209$:
	jp	NC, 00119$
;main.c:689: character->y + character->height - pad > enemy->y)
	ldhl	sp,#17
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
	ld	d, (hl)
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ld	b, a
	ld	c, e
	ldhl	sp,	#11
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00210$
	bit	7, d
	jr	NZ, 00211$
	cp	a, a
	jr	00211$
00210$:
	bit	7, d
	jr	Z, 00211$
	scf
00211$:
	jp	NC, 00119$
;main.c:691: UINT8 took_damage = player_take_damage(1);
	ld	a, #0x01
	call	_player_take_damage
;main.c:692: if(took_damage)
	or	a, a
	jp	Z, 00119$
;main.c:694: UINT8 dx = (character->x > enemy->x) ? (character->x - enemy->x) : (enemy->x - character->x);
	pop	de
	push	de
	ld	a, (de)
	ldhl	sp,	#14
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#13
	ld	(hl), a
	ld	a, (hl+)
	sub	a, (hl)
	jr	NC, 00121$
	ld	a, (hl-)
	sub	a, (hl)
	dec	hl
	ld	(hl), a
	jr	00122$
00121$:
	ldhl	sp,	#13
	ld	a, (hl+)
	sub	a, (hl)
	dec	hl
	dec	hl
	ld	(hl), a
00122$:
;main.c:695: UINT8 dy = (character->y > enemy->y) ? (character->y - enemy->y) : (enemy->y - character->y);
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
	sub	a, c
	jr	NC, 00123$
	ld	a, c
	sub	a, b
	jr	00124$
00123$:
	ld	a, b
	sub	a, c
00124$:
	ld	c, a
;main.c:697: if (character->x < enemy->x)
	ldhl	sp,	#14
	ld	a, (hl-)
	sub	a, (hl)
	jr	NC, 00104$
;main.c:699: knockback_dx = -KNOCKBACK_STEP;
	ld	hl, #_knockback_dx
	ld	(hl), #0xfe
	jr	00105$
00104$:
;main.c:703: knockback_dx = KNOCKBACK_STEP;
	ld	hl, #_knockback_dx
	ld	(hl), #0x02
00105$:
;main.c:705: if (character->y < enemy->y)
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	ld	a, b
	sub	a, l
	jr	NC, 00107$
;main.c:707: knockback_dy = -KNOCKBACK_STEP;
	ld	hl, #_knockback_dy
	ld	(hl), #0xfe
	jr	00108$
00107$:
;main.c:711: knockback_dy = KNOCKBACK_STEP;
	ld	hl, #_knockback_dy
	ld	(hl), #0x02
00108$:
;main.c:714: if (dx < dy)
	ldhl	sp,	#12
	ld	a, (hl)
	sub	a, c
	jr	NC, 00110$
;main.c:716: knockback_dy = 0;
	xor	a, a
	ld	(#_knockback_dy),a
	jr	00111$
00110$:
;main.c:720: knockback_dx = 0;
	xor	a, a
	ld	(#_knockback_dx),a
00111$:
;main.c:723: knockback_timer = KNOCKBACK_FRAMES;
	ld	hl, #_knockback_timer
	ld	(hl), #0x06
00119$:
;main.c:726: }
	add	sp, #19
	ret
;main.c:728: void hide_character_sprites(struct GameCharacter* character)
;	---------------------------------
; Function hide_character_sprites
; ---------------------------------
_hide_character_sprites::
;main.c:730: for(UINT8 i = 0; i < 4; i++)
	ld	c, #0x00
00104$:
	ld	a, c
	sub	a, #0x04
	ret	NC
;main.c:732: hide_sprite(character->spritids[i]);
	ld	l, c
	ld	h, #0x00
	add	hl, de
;c:\gbdk\include\gb\gb.h:2001: shadow_OAM[nb].y = 0;
	ld	l, (hl)
	xor	a, a
	ld	h, a
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	pop	de
	ld	(hl), #0x00
;main.c:730: for(UINT8 i = 0; i < 4; i++)
	inc	c
;main.c:734: }
	jr	00104$
;main.c:735: void weapon_enemy_collision(struct Weapon* weapon, struct Enemy* enemy, UINT8 enemy_index)
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
;main.c:738: if(enemy->death == 1)
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
	jp	Z, 00127$
;main.c:740: return;
;main.c:744: if(hit_this_attack[enemy_index] == 1)
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
	jp	Z, 00127$
;main.c:746: return;
;main.c:753: UINT8 collision_x = weapon->x;
	ldhl	sp,	#16
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	ld	a, (bc)
	ldhl	sp,	#11
	ld	(hl), a
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
;main.c:754: UINT8 collision_y = weapon->y;
	ldhl	sp,#16
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0003
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#11
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#10
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#4
	ld	(hl), a
;main.c:755: UINT8 collision_width = weapon->width;
	ldhl	sp,#16
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#11
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#10
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
;main.c:756: UINT8 collision_height = weapon->height;
	ldhl	sp,#16
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#5
	ld	(hl), a
;main.c:759: if(direction == 2 || direction == 3) // left or right
	ld	a,(#_direction)
	cp	a,#0x02
	jr	Z, 00105$
	sub	a, #0x03
	jr	NZ, 00106$
00105$:
;main.c:761: collision_x = weapon->x - 8;  // Start 8px to the left
	ldhl	sp,	#11
	ld	a, (hl+)
	inc	hl
	add	a, #0xf8
	ld	(hl), a
;main.c:762: collision_width = 16;  // 2 sprites wide
	ld	c, #0x10
	jr	00107$
00106$:
;main.c:766: collision_y = weapon->y - 8;  // Start 8px up
	ldhl	sp,	#12
	ld	a, (hl)
	add	a, #0xf8
	ldhl	sp,	#4
;main.c:767: collision_height = 16;  // 2 sprites tall
	ld	(hl+), a
	ld	(hl), #0x10
00107$:
;main.c:770: if (collision_x < enemy->x + enemy->width &&
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
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
	ld	hl, #0x0006
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	e, a
	ld	d, #0x00
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
	jp	NC, 00127$
;main.c:771: collision_x + collision_width > enemy->x &&
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
	jp	NC, 00127$
;main.c:772: collision_y < enemy->y + enemy->height &&
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
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
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	ld	b, #0x00
	ldhl	sp,	#10
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#12
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	jp	NC, 00127$
;main.c:773: collision_y + collision_height > enemy->y)
	ldhl	sp,	#5
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#12
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#10
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	jp	NC, 00127$
;main.c:776: hit_this_attack[enemy_index] = 1;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x01
;main.c:777: if(enemy->current_health > 0)
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000b
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
	jr	Z, 00119$
;main.c:779: enemy->current_health--;
	dec	a
	ld	(bc), a
;main.c:781: if(direction == 2) // left
	ld	a, (#_direction)
	sub	a, #0x02
	jr	NZ, 00116$
;main.c:783: enemy->x -= ENEMY_KNOCKBACK_STEP;
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	ld	a, (de)
	add	a, #0xf8
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
	jr	00117$
00116$:
;main.c:785: else if(direction == 3) // right
	ld	a, (#_direction)
	sub	a, #0x03
	jr	NZ, 00113$
;main.c:787: enemy->x += ENEMY_KNOCKBACK_STEP;
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	ld	a, (de)
	add	a, #0x08
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
	jr	00117$
00113$:
;main.c:772: collision_y < enemy->y + enemy->height &&
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
;main.c:791: enemy->y -= ENEMY_KNOCKBACK_STEP;
	ld	e, a
;main.c:789: else if(direction == 1) // up
	ld	a, (#_direction)
	dec	a
	jr	NZ, 00110$
;main.c:791: enemy->y -= ENEMY_KNOCKBACK_STEP;
	ld	a, e
	add	a, #0xf8
	ldhl	sp,	#8
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
	jr	00117$
00110$:
;main.c:795: enemy->y += ENEMY_KNOCKBACK_STEP;
	ld	a, e
	add	a, #0x08
	ldhl	sp,	#8
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
00117$:
;main.c:798: enemy_check_borders(enemy);
	push	bc
	ldhl	sp,	#16
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_enemy_check_borders
	pop	bc
00119$:
;main.c:801: sfx_enemy_hit();
	push	bc
	call	_sfx_enemy_hit
	pop	bc
;main.c:803: if(enemy->current_health == 0)
	ld	a, (bc)
	or	a, a
	jr	NZ, 00127$
;main.c:805: enemy->death = 1;
	pop	hl
	ld	(hl), #0x01
	push	hl
;main.c:806: enemy->x = 0;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;main.c:807: enemy->y = 0;
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;main.c:808: score = score ++;
00127$:
;main.c:812: }
	add	sp, #18
	pop	hl
	inc	sp
	jp	(hl)
;main.c:813: void move_player(struct GameCharacter* character, UINT8 x, UINT8 y)
;	---------------------------------
; Function move_player
; ---------------------------------
_move_player::
	dec	sp
	ldhl	sp,	#0
	ld	(hl), a
;main.c:815: move_sprite(character->spritids[0], x, y);
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
;main.c:816: move_sprite(character->spritids[1], x + spritesize, y);
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
;main.c:817: move_sprite(character->spritids[2], x, y + spritesize);
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
;main.c:818: move_sprite(character->spritids[3], x + spritesize, y + spritesize);
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
;main.c:818: move_sprite(character->spritids[3], x + spritesize, y + spritesize);
;main.c:819: }
	inc	sp
	pop	hl
	inc	sp
	jp	(hl)
;main.c:820: void move_weapon(struct Weapon* weapon, struct GameCharacter* owner)
;	---------------------------------
; Function move_weapon
; ---------------------------------
_move_weapon::
	add	sp, #-14
	ldhl	sp,	#12
	ld	a, e
	ld	(hl+), a
;main.c:826: weapon->x = owner->x;
	ld	a, d
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), a
	ld	hl, #0x0004
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl), a
;main.c:827: weapon->y = owner->y + 8;
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0003
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl), a
	ld	hl, #0x0005
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#11
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#10
	ld	(hl), a
;main.c:824: if(direction == 2) // left
	ld	a, (#_direction)
	sub	a, #0x02
	jp	NZ, 00110$
;main.c:826: weapon->x = owner->x;
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#2
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;main.c:827: weapon->y = owner->y + 8;
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x08
	ldhl	sp,	#4
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x12
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:830: weapon->spritids[0] = 4;
	ldhl	sp,	#12
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#13
	ld	a, (hl-)
	dec	hl
	ld	(hl-), a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x04
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x13
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:833: weapon->spritids[1] = 5;
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x05
;main.c:834: move_sprite(weapon->spritids[0], weapon->x, weapon->y);
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#8
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#9
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	(hl), a
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, (hl-)
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00168$:
	ldhl	sp,	#0
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00168$
	pop	de
	push	de
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#12
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#11
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#8
	ld	a, (hl+)
	inc	hl
	ld	(de), a
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	dec	hl
	ld	b, a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;main.c:835: move_sprite(weapon->spritids[1], weapon->x - spritesize, weapon->y);
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#11
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	hl, #_spritesize
	sub	a, (hl)
	ldhl	sp,	#9
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#10
	ld	(hl), a
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, (hl)
	ldhl	sp,	#7
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00169$:
	ldhl	sp,	#7
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00169$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#11
	ld	a, (hl)
	ld	(de), a
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
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
	ld	a, (hl)
	ld	(de), a
;main.c:835: move_sprite(weapon->spritids[1], weapon->x - spritesize, weapon->y);
	jp	00136$
00110$:
;main.c:837: else if(direction == 3) // right
	ld	a, (#_direction)
	sub	a, #0x03
	jp	NZ, 00107$
;main.c:839: weapon->x = owner->x + 18;
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#11
	ld	(hl), a
	ld	a, (hl)
	add	a, #0x12
	ldhl	sp,	#2
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;main.c:840: weapon->y = owner->y + 8;
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x08
	ldhl	sp,	#4
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x12
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:843: weapon->spritids[1] = 4;
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl-), a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x04
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x13
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:846: weapon->spritids[0] = 5;
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x05
;main.c:847: move_sprite(weapon->spritids[0], weapon->x, weapon->y);
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#11
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	de, #(_shadow_OAM + 20)
	ld	a, (hl+)
	ld	(de), a
	ld	de, #(_shadow_OAM + 21)
	ld	a, (hl)
	ld	(de), a
;main.c:848: move_sprite(weapon->spritids[1], weapon->x - spritesize, weapon->y);
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#11
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	hl, #_spritesize
	sub	a, (hl)
	ldhl	sp,	#7
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, (hl-)
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00172$:
	ldhl	sp,	#9
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00172$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#9
	ld	(hl), a
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#10
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl-)
	dec	hl
	ld	(de), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl)
	ld	(de), a
;main.c:848: move_sprite(weapon->spritids[1], weapon->x - spritesize, weapon->y);
	jp	00136$
00107$:
;main.c:850: else if(direction == 1) // up
	ld	a, (#_direction)
	dec	a
	jp	NZ, 00104$
;main.c:852: weapon->x = owner->x + 9;
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x09
	ldhl	sp,	#2
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;main.c:853: weapon->y = owner->y + 3;
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x03
	ldhl	sp,	#4
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x14
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:856: weapon->spritids[0] = 4;
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, #0x04
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x15
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:859: weapon->spritids[1] = 5;
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl-), a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x05
;main.c:860: move_sprite(weapon->spritids[0], weapon->x, weapon->y);
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#11
	ld	(hl), a
	ld	a, (bc)
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
	ld	bc, #_shadow_OAM+0
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;main.c:861: move_sprite(weapon->spritids[1], weapon->x, weapon->y - spritesize);
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	hl, #_spritesize
	sub	a, (hl)
	ld	b, a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
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
;main.c:861: move_sprite(weapon->spritids[1], weapon->x, weapon->y - spritesize);
	jp	00136$
00104$:
;main.c:863: else if(direction == 0) // down
	ld	a, (#_direction)
	or	a, a
	jp	NZ, 00136$
;main.c:865: weapon->x = owner->x - 2;
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	dec	a
	dec	a
	ldhl	sp,	#2
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;main.c:866: weapon->y = owner->y + 18;
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x12
	ldhl	sp,	#4
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x14
	ld	(hl+), a
	ld	(hl), #0x40
;main.c:869: weapon->spritids[1] = 4;
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	ld	a, #0x04
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x15
	ld	(hl+), a
	ld	(hl), #0x40
;main.c:872: weapon->spritids[0] = 5;
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x05
;main.c:873: move_sprite(weapon->spritids[0], weapon->x, weapon->y);
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#11
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	de, #_shadow_OAM+20
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;main.c:874: move_sprite(weapon->spritids[1], weapon->x, weapon->y - spritesize);
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	hl, #_spritesize
	sub	a, (hl)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#11
	ld	(hl), a
	ld	a, (bc)
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
	ld	bc, #_shadow_OAM+0
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;main.c:874: move_sprite(weapon->spritids[1], weapon->x, weapon->y - spritesize);
00136$:
;main.c:876: }
	add	sp, #14
	ret
;main.c:878: void move_sword_sprites_from_position(struct Weapon* weapon)
;	---------------------------------
; Function move_sword_sprites_from_position
; ---------------------------------
_move_sword_sprites_from_position::
	add	sp, #-6
	ld	c, e
	ld	b, d
;main.c:882: move_sprite(weapon->spritids[0], weapon->x, weapon->y);
	ld	hl, #0x0003
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
	ld	a, (hl-)
	dec	hl
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	ld	hl, #0x0002
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	ld	a, (bc)
	ld	e, a
;main.c:880: if(direction == 2 || direction == 3)
	ld	a, (#_direction)
	sub	a, #0x02
	jr	Z, 00101$
	ld	a, (#_direction)
	sub	a, #0x03
	jr	NZ, 00102$
00101$:
;main.c:882: move_sprite(weapon->spritids[0], weapon->x, weapon->y);
	ldhl	sp,	#0
	ld	d, (hl)
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	pop	de
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, d
	ld	(hl+), a
	ld	e, l
	ld	d, h
	ldhl	sp,	#5
	ld	a, (hl)
	ld	(de), a
;main.c:883: move_sprite(weapon->spritids[1], weapon->x - spritesize, weapon->y);
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#5
	ld	(hl-), a
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	hl, #_spritesize
	sub	a, (hl)
	ld	e, a
	inc	bc
	ld	a, (bc)
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
	ld	bc, #_shadow_OAM+0
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, bc
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	push	hl
	ldhl	sp,	#7
	ld	a, (hl)
	pop	hl
	ld	(hl+), a
	ld	(hl), e
;main.c:883: move_sprite(weapon->spritids[1], weapon->x - spritesize, weapon->y);
	jr	00109$
00102$:
;main.c:887: move_sprite(weapon->spritids[0], weapon->x, weapon->y);
	ldhl	sp,	#0
	ld	d, (hl)
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	pop	de
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, d
	ld	(hl+), a
	ld	e, l
	ld	d, h
	ldhl	sp,	#5
	ld	a, (hl)
	ld	(de), a
;main.c:888: move_sprite(weapon->spritids[1], weapon->x, weapon->y - spritesize);
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	hl, #_spritesize
	sub	a, (hl)
	ldhl	sp,	#2
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	inc	bc
	ld	a, (bc)
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
	ld	bc, #_shadow_OAM+0
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(bc), a
	inc	bc
	ldhl	sp,	#5
	ld	a, (hl)
	ld	(bc), a
;main.c:888: move_sprite(weapon->spritids[1], weapon->x, weapon->y - spritesize);
00109$:
;main.c:890: }
	add	sp, #6
	ret
;main.c:892: void attack(struct GameCharacter* owner, struct Weapon* weapon)
;	---------------------------------
; Function attack
; ---------------------------------
_attack::
	push	bc
;main.c:895: for(UINT8 i = 0; i < MAX_ENEMIES; i++)
	ld	c, #0x00
00114$:
	ld	a, c
	sub	a, #0x08
	jr	NC, 00101$
;main.c:897: hit_this_attack[i] = 0;
	ld	hl, #_hit_this_attack
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x00
;main.c:895: for(UINT8 i = 0; i < MAX_ENEMIES; i++)
	inc	c
	jr	00114$
00101$:
;main.c:900: sfx_swing();
	push	de
	call	_sfx_swing
;main.c:902: move_weapon(weapon, owner);
	pop	bc
	pop	de
	push	de
	call	_move_weapon
;main.c:906: weapon->x -= 8;
	pop	de
	push	de
	inc	de
	inc	de
;main.c:904: if(direction == 2) // left
	ld	a, (#_direction)
	sub	a, #0x02
	jr	NZ, 00109$
;main.c:906: weapon->x -= 8;
	ld	a, (de)
	add	a, #0xf8
	ld	(de), a
	jr	00110$
00109$:
;main.c:908: else if(direction == 3) // right
	ld	a, (#_direction)
	sub	a, #0x03
	jr	NZ, 00106$
;main.c:910: weapon->x += 8;
	ld	a, (de)
	add	a, #0x08
	ld	(de), a
	jr	00110$
00106$:
;main.c:914: weapon->y -= 8;
	pop	bc
	push	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	e, a
;main.c:912: else if(direction == 1) // up
	ld	a, (#_direction)
	dec	a
	jr	NZ, 00103$
;main.c:914: weapon->y -= 8;
	ld	a, e
	add	a, #0xf8
	ld	(bc), a
	jr	00110$
00103$:
;main.c:918: weapon->y += 8;
	ld	a, e
	add	a, #0x08
	ld	(bc), a
00110$:
;main.c:921: move_sword_sprites_from_position(weapon);
	pop	de
	push	de
	call	_move_sword_sprites_from_position
;main.c:923: if (locktimer == 0)
	ld	hl, #_locktimer
	ld	a, (hl)
	or	a, a
	jr	NZ, 00116$
;main.c:925: locktimer ++;
	inc	(hl)
00116$:
;main.c:927: }
	inc	sp
	inc	sp
	ret
;main.c:928: void swordreset(struct GameCharacter* owner, struct Weapon* weapon)
;	---------------------------------
; Function swordreset
; ---------------------------------
_swordreset::
	push	bc
;main.c:931: for(UINT8 i = 0; i < MAX_ENEMIES; i++)
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x08
	jr	NC, 00101$
;main.c:933: hit_this_attack[i] = 0;
	ld	hl, #_hit_this_attack
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x00
;main.c:931: for(UINT8 i = 0; i < MAX_ENEMIES; i++)
	inc	c
	jr	00103$
00101$:
;main.c:936: move_weapon(weapon, owner);
	ld	c, e
	ld	b, d
	pop	de
	jp	_move_weapon
;main.c:937: }
	inc	sp
	inc	sp
	ret
;main.c:938: void move_enemy_small(struct Enemy* character, UINT8 x, UINT8 y)
;	---------------------------------
; Function move_enemy_small
; ---------------------------------
_move_enemy_small::
	ld	c, a
;main.c:940: move_sprite(character->spritids[0], x, y);
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
;main.c:940: move_sprite(character->spritids[0], x, y);
;main.c:941: }
	pop	hl
	inc	sp
	jp	(hl)
;main.c:942: void animate_enemy(struct Enemy* enemy, UINT8 tile0, UINT8 tile1)
;	---------------------------------
; Function animate_enemy
; ---------------------------------
_animate_enemy::
	dec	sp
	dec	sp
	ld	c, a
;main.c:945: if(enemy->anim == 0)
	ld	hl, #0x0008
	add	hl, de
	ld	b, (hl)
;main.c:947: set_sprite_tile(enemy->spritids[0], tile0);
	inc	sp
	inc	sp
	push	de
;main.c:945: if(enemy->anim == 0)
	ld	a, b
	or	a, a
	jr	NZ, 00104$
;main.c:947: set_sprite_tile(enemy->spritids[0], tile0);
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
;main.c:947: set_sprite_tile(enemy->spritids[0], tile0);
	jr	00108$
00104$:
;main.c:949: else if(enemy->anim == 1)
	dec	b
	jr	NZ, 00108$
;main.c:951: set_sprite_tile(enemy->spritids[0], tile1);
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
;main.c:951: set_sprite_tile(enemy->spritids[0], tile1);
00108$:
;main.c:953: }
	inc	sp
	inc	sp
	pop	hl
	inc	sp
	jp	(hl)
;main.c:954: void enemy_check_borders(struct Enemy* enemy)
;	---------------------------------
; Function enemy_check_borders
; ---------------------------------
_enemy_check_borders::
;main.c:956: if (enemy->x < MIN_ENEMY_X)
	ld	hl, #0x0004
	add	hl, de
	ld	a, (hl)
	sub	a, #0x10
	jr	NC, 00102$
;main.c:958: enemy->x = MIN_ENEMY_X;
	ld	(hl), #0x10
00102$:
;main.c:960: if (enemy->x > MAX_ENEMY_X)
	ld	a, (hl)
	cp	a, #0x99
	jr	C, 00104$
;main.c:962: enemy->x = MAX_ENEMY_X;
	ld	(hl), #0x98
00104$:
;main.c:964: if (enemy->y < MIN_ENEMY_Y)
	ld	hl, #0x0005
	add	hl, de
	ld	a, (hl)
	sub	a, #0x14
	jr	NC, 00106$
;main.c:966: enemy->y = MIN_ENEMY_Y;
	ld	(hl), #0x14
00106$:
;main.c:968: if (enemy->y > MAX_ENEMY_Y)
	ld	a, (hl)
	cp	a, #0x81
	ret	C
;main.c:970: enemy->y = MAX_ENEMY_Y;
	ld	(hl), #0x80
;main.c:972: }
	ret
;main.c:975: void character_set_sprite(struct GameCharacter* character, UINT8 anim_state)
;	---------------------------------
; Function character_set_sprite
; ---------------------------------
_character_set_sprite::
	ld	c, e
	ld	b, d
	ld	e, a
;main.c:980: character->anim = anim_state;  // Set animation state in struct
	ld	hl, #0x0008
	add	hl, bc
	ld	(hl), e
;main.c:982: if(anim_state == 0) // down walking
	ld	a, e
	or	a, a
	jr	NZ, 00122$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;main.c:986: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:989: character->spritids[1] = 1;
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
;main.c:992: character->spritids[3] = 2;
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
;main.c:995: character->spritids[2] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jp	00123$
00122$:
;main.c:997: else if(anim_state == 1) // down standing
	ld	a, e
	dec	a
	jr	NZ, 00119$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;main.c:1001: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:1004: character->spritids[1] = 1;
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
;main.c:1007: character->spritids[2] = 2;
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
;main.c:1010: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jp	00123$
00119$:
;main.c:1012: else if(anim_state == 2) // left walking
	ld	a, e
	sub	a, #0x02
	jr	NZ, 00116$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x04
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:1016: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x05
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:1019: character->spritids[1] = 1;
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
;main.c:1022: character->spritids[2] = 2;
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
;main.c:1025: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jp	00123$
00116$:
;main.c:1027: else if(anim_state == 3) // left standing
	ld	a, e
	sub	a, #0x03
	jr	NZ, 00113$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x08
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:1031: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x09
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:1034: character->spritids[1] = 1;
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
;main.c:1037: character->spritids[2] = 2;
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
;main.c:1040: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jp	00123$
00113$:
;main.c:1042: else if(anim_state == 4) // right walking
	ld	a, e
	sub	a, #0x04
	jr	NZ, 00110$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x05
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:1046: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x04
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:1049: character->spritids[1] = 1;
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
;main.c:1052: character->spritids[2] = 2;
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
;main.c:1055: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jp	00123$
00110$:
;main.c:1057: else if(anim_state == 5) // right standing
	ld	a, e
	sub	a, #0x05
	jr	NZ, 00107$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x09
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:1061: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x08
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:1064: character->spritids[1] = 1;
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
;main.c:1067: character->spritids[2] = 2;
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
;main.c:1070: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jr	00123$
00107$:
;main.c:1072: else if(anim_state == 6) // up walking
	ld	a, e
	sub	a, #0x06
	jr	NZ, 00104$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0c
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:1076: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0d
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:1079: character->spritids[1] = 1;
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
;main.c:1082: character->spritids[2] = 2;
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
;main.c:1085: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jr	00123$
00104$:
;main.c:1087: else if(anim_state == 7) // up standing
	ld	a, e
	sub	a, #0x07
	jr	NZ, 00123$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0c
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:1091: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0d
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:1094: character->spritids[1] = 1;
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
;main.c:1097: character->spritids[2] = 2;
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
;main.c:1100: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
00123$:
;main.c:1103: move_player(character, character->x, character->y);
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
	call	_move_player
;main.c:1104: }
	ret
;main.c:1106: void setup_character(struct GameCharacter* character, UINT8 x, UINT8 y)
;	---------------------------------
; Function setup_character
; ---------------------------------
_setup_character::
	add	sp, #-5
	ld	c, e
	ld	b, d
	ldhl	sp,	#4
	ld	(hl), a
;main.c:1108: character->x = x;
	ld	hl, #0x0004
	add	hl, bc
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(de), a
;main.c:1109: character->y = y;
	ld	hl, #0x0005
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
	ld	d, (hl)
	ldhl	sp,	#7
	ld	a, (hl)
	ld	(de), a
;main.c:1110: character->width = 16;
	ld	hl, #0x0006
	add	hl, bc
	ld	(hl), #0x10
;main.c:1111: character->height = 16;
	ld	hl, #0x0007
	add	hl, bc
	ld	(hl), #0x10
;main.c:1112: character->anim = 0;
	ld	hl, #0x0008
	add	hl, bc
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;main.c:1116: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:1119: character->spritids[1] = 1;
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
;main.c:1122: character->spritids[2] = 2;
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
;main.c:1125: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
;main.c:1127: move_player(character, character->x, character->y);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	pop	de
	push	de
	push	af
	ld	a, (de)
	inc	sp
	ld	e, c
	ld	d, b
	call	_move_player
;main.c:1128: }
	add	sp, #5
	pop	hl
	inc	sp
	jp	(hl)
;main.c:1130: void setup_player(void)
;	---------------------------------
; Function setup_player
; ---------------------------------
_setup_player::
;main.c:1132: setup_character(&girl, PLAYER_SPAWN_X, PLAYER_SPAWN_Y);
	ld	a, #0x24
	push	af
	inc	sp
	ld	a, #0x50
	ld	de, #_girl
	call	_setup_character
;main.c:1133: }
	ret
;main.c:1135: void setupslime(void)
;	---------------------------------
; Function setupslime
; ---------------------------------
_setupslime::
;main.c:1137: slime.x = rand() % 128 + 16;
	call	_rand
	ld	a, e
	res	7, a
	add	a, #0x10
	ld	(#(_slime + 4)),a
;main.c:1138: slime.y = rand() % 96 + 24;
	call	_rand
	ld	a, e
	ld	e, #0x60
	call	__moduchar
	ld	a, c
	add	a, #0x18
	ld	hl, #(_slime + 5)
;main.c:1139: slime.width = 8;
	ld	(hl+), a
	ld	(hl), #0x08
;main.c:1140: slime.height = 8;
	ld	hl, #_slime + 7
	ld	(hl), #0x08
;main.c:1141: slime.anim = 0;
	ld	hl, #_slime + 8
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 90)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x10
	ld	(hl+), a
	ld	(hl), #0x10
;main.c:1145: slime.spritids[0] = 22;
	ld	hl, #_slime
	ld	(hl), #0x16
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 94)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x11
	ld	(hl+), a
	ld	(hl), #0x10
;main.c:1148: slime.spritids[1] = 23;
	ld	hl, #_slime + 1
	ld	(hl), #0x17
;main.c:1150: move_enemy_small(&slime, slime.x, slime.y);
	ld	hl, #(_slime + 5)
	ld	b, (hl)
	ld	a, (#(_slime + 4) + 0)
	push	bc
	inc	sp
	ld	de, #_slime
	call	_move_enemy_small
;main.c:1151: }
	ret
;main.c:1153: void setupsword(void)
;	---------------------------------
; Function setupsword
; ---------------------------------
_setupsword::
;main.c:1155: sword.x = 100;
	ld	hl, #_sword + 2
	ld	(hl), #0x64
;main.c:1156: sword.y = 100;
	ld	hl, #_sword + 3
	ld	(hl), #0x64
;main.c:1157: sword.width = 8;
	ld	hl, #_sword + 4
	ld	(hl), #0x08
;main.c:1158: sword.height = 8;
	ld	hl, #_sword + 5
	ld	(hl), #0x08
;main.c:1159: sword.anim = 0;
	ld	hl, #_sword + 6
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x12
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:1164: sword.spritids[0] = 4;
	ld	hl, #_sword
	ld	(hl), #0x04
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x13
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:1167: sword.spritids[1] = 5;
	ld	hl, #_sword + 1
	ld	(hl), #0x05
;main.c:1170: }
	ret
;main.c:1173: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
	add	sp, #-6
;main.c:1175: init_title_screen();
	call	_init_title_screen
;main.c:1177: while(1)
00192$:
;main.c:1179: UINT8 current_pad = joypad();
	call	_joypad
	ldhl	sp,	#0
	ld	(hl), a
;main.c:1181: if((current_pad & J_START) && !(prev_pad & J_START))
	push	hl
	ldhl	sp,	#2
	bit	7, (hl)
	pop	hl
	jp	Z, 00110$
	ld	a, (_prev_pad)
	rlca
	jp	C, 00110$
;main.c:1183: if(gamestate == 0)
	ld	hl, #_gamestate
	ld	a, (hl)
	or	a, a
	jp	NZ, 00107$
;main.c:1185: gamestate = 1;
	ld	(hl), #0x01
;main.c:1186: initrand(DIV_REG);
	ldh	a, (_DIV_REG + 0)
	ld	b, #0x00
	ld	c, a
	push	bc
	call	_initrand
	pop	hl
;main.c:1187: font_set(ui_font);
	ld	a, (_ui_font)
	ld	e, a
	ld	hl, #_ui_font + 1
	ld	d, (hl)
	push	de
	call	_font_set
	pop	hl
;main.c:1188: audio_init();
	call	_audio_init
;main.c:1190: set_bkg_data(37, 8, backgroundtiles);
	ld	de, #_backgroundtiles
	push	de
	ld	hl, #0x825
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:1191: set_bkg_tiles(0, 0, 20, 16, backgroundmap);
	ld	de, #_backgroundmap
	push	de
	ld	hl, #0x1014
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:1193: set_win_tiles(0, 0, 20, 2, windowmap);
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
;main.c:1198: set_sprite_data(0, 22, Girl);
	ld	de, #_Girl
	push	de
	ld	hl, #0x1600
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:1199: setup_player();
	call	_setup_player
;main.c:1200: init_player_stats();
	call	_init_player_stats
;main.c:1201: update_window_stats_ui();
	call	_update_window_stats_ui
;main.c:1202: setupsword();
	call	_setupsword
;main.c:1203: room_0();  // Initialize room after sprite data is loaded
	call	_room_0
;main.c:1211: BGP_REG  = 0xE4; // Background palette (light fill uses C1)
	ld	a, #0xe4
	ldh	(_BGP_REG + 0), a
;main.c:1212: OBP0_REG = 0xE0; // Sprite palette 0: Girl/Sword (old colors)
	ld	a, #0xe0
	ldh	(_OBP0_REG + 0), a
;main.c:1213: OBP1_REG = 0xE4; // Sprite palette 1: Slimes (clear, light, dark, black)
	ld	a, #0xe4
	ldh	(_OBP1_REG + 0), a
;main.c:1214: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:1215: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:1216: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;main.c:1217: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
	jr	00110$
00107$:
;main.c:1219: else if(gamestate == 1)
	ld	a, (#_gamestate)
	dec	a
	jr	NZ, 00104$
;main.c:1221: gamestate = 2;
	ld	hl, #_gamestate
	ld	(hl), #0x02
;main.c:1222: show_pause_ui();
	call	_show_pause_ui
	jr	00110$
00104$:
;main.c:1224: else if(gamestate == 2)
	ld	a, (#_gamestate)
	sub	a, #0x02
	jr	NZ, 00110$
;main.c:1226: gamestate = 1;
	ld	hl, #_gamestate
	ld	(hl), #0x01
;main.c:1227: hide_pause_ui();
	call	_hide_pause_ui
00110$:
;main.c:1231: if(gamestate == 0)
	ld	a, (#_gamestate)
	or	a, a
	jr	NZ, 00113$
;main.c:1233: update_title_screen();
	call	_update_title_screen
00113$:
;main.c:1236: if(gamestate == 1)
	ld	a, (#_gamestate)
	dec	a
	jp	NZ, 00190$
;main.c:1238: struct GameCharacter* active_player = &girl;
;main.c:1240: if(player_stats.is_dead == 0 && locktimer == 0 && knockback_timer == 0)
	ld	a, (#(_player_stats + 6) + 0)
	or	a, a
	jp	NZ, 00162$
	ld	a, (#_locktimer)
	or	a, a
	jp	NZ, 00162$
	ld	a, (#_knockback_timer)
	or	a, a
	jp	NZ, 00162$
;main.c:1242: if(joypad() & J_LEFT)
	call	_joypad
;main.c:1246: if(active_player->x > MIN_GIRL_X)
;main.c:1251: if(active_player->anim != 2 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
;main.c:1242: if(joypad() & J_LEFT)
	bit	1,a
	jr	Z, 00126$
;main.c:1244: direction = 2;
	ld	hl, #_direction
	ld	(hl), #0x02
;main.c:1245: move_weapon(&sword, active_player);
	ld	bc, #_girl
	ld	de, #_sword
	call	_move_weapon
;main.c:1246: if(active_player->x > MIN_GIRL_X)
	ld	a, (#(_girl + 4) + 0)
	cp	a, #0x18
	jr	C, 00115$
;main.c:1248: active_player->x -= 2;
	ldhl	sp,	#5
	ld	(hl), a
	dec	(hl)
	dec	(hl)
	ld	de, #(_girl + 4)
	ld	a, (hl)
	ld	(de), a
00115$:
;main.c:1251: if(active_player->anim != 2 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	ld	a, (#(_girl + 8) + 0)
	sub	a, #0x02
	jr	Z, 00121$
	call	_joypad
	bit	2, a
	jr	NZ, 00121$
	call	_joypad
	bit	3, a
	jr	NZ, 00121$
;main.c:1253: character_set_sprite(active_player, 2);
	ld	a, #0x02
	ld	de, #_girl
	call	_character_set_sprite
	jr	00126$
00121$:
;main.c:1255: else if(active_player->anim != 3 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	ld	a, (#(_girl + 8) + 0)
	sub	a, #0x03
	jr	Z, 00126$
	call	_joypad
	bit	2, a
	jr	NZ, 00126$
	call	_joypad
	bit	3, a
	jr	NZ, 00126$
;main.c:1257: character_set_sprite(active_player, 3);
	ld	a, #0x03
	ld	de, #_girl
	call	_character_set_sprite
00126$:
;main.c:1260: if(joypad() & J_RIGHT)
	call	_joypad
	rrca
	jr	NC, 00139$
;main.c:1262: direction = 3;
	ld	hl, #_direction
	ld	(hl), #0x03
;main.c:1263: move_weapon(&sword, active_player);
	ld	bc, #_girl
	ld	de, #_sword
	call	_move_weapon
;main.c:1264: if(active_player->x < MAX_GIRL_X)
	ld	a, (#(_girl + 4) + 0)
	cp	a, #0x8a
	jr	NC, 00128$
;main.c:1266: active_player->x += 2;
	ldhl	sp,	#5
	ld	(hl), a
	ld	a, (hl)
	inc	a
	inc	a
	ld	(#(_girl + 4)),a
00128$:
;main.c:1270: if(active_player->anim != 4 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	ld	a, (#(_girl + 8) + 0)
	sub	a, #0x04
	jr	Z, 00134$
	call	_joypad
	bit	2, a
	jr	NZ, 00134$
	call	_joypad
	bit	3, a
	jr	NZ, 00134$
;main.c:1272: character_set_sprite(active_player, 4);
	ld	a, #0x04
	ld	de, #_girl
	call	_character_set_sprite
	jr	00139$
00134$:
;main.c:1274: else if(active_player->anim != 5 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	ld	a, (#(_girl + 8) + 0)
	sub	a, #0x05
	jr	Z, 00139$
	call	_joypad
	bit	2, a
	jr	NZ, 00139$
	call	_joypad
	bit	3, a
	jr	NZ, 00139$
;main.c:1276: character_set_sprite(active_player, 5);
	ld	a, #0x05
	ld	de, #_girl
	call	_character_set_sprite
00139$:
;main.c:1279: if(joypad() & J_UP)
	call	_joypad
;main.c:1283: if(active_player->y > MIN_GIRL_Y)
;main.c:1279: if(joypad() & J_UP)
	bit	2,a
	jr	Z, 00148$
;main.c:1281: direction = 1;
	ld	hl, #_direction
	ld	(hl), #0x01
;main.c:1282: move_weapon(&sword, active_player);
	ld	bc, #_girl
	ld	de, #_sword
	call	_move_weapon
;main.c:1283: if(active_player->y > MIN_GIRL_Y)
	ld	a, (#(_girl + 5) + 0)
	cp	a, #0x15
	jr	C, 00141$
;main.c:1286: active_player->y -= 2;
	dec	a
	dec	a
	ld	(#(_girl + 5)),a
00141$:
;main.c:1288: if(active_player->anim != 6)
	ld	a, (#(_girl + 8) + 0)
	cp	a, #0x06
	jr	Z, 00145$
;main.c:1290: character_set_sprite(active_player, 6);
	ld	a, #0x06
	ld	de, #_girl
	call	_character_set_sprite
	jr	00148$
00145$:
;main.c:1292: else if(active_player->anim != 7)
	sub	a, #0x07
	jr	Z, 00148$
;main.c:1294: character_set_sprite(active_player, 7);
	ld	a, #0x07
	ld	de, #_girl
	call	_character_set_sprite
00148$:
;main.c:1297: if(joypad() & J_DOWN)
	call	_joypad
	bit	3, a
	jr	Z, 00157$
;main.c:1299: direction = 0;
	xor	a, a
	ld	(#_direction),a
;main.c:1300: move_weapon(&sword, active_player);
	ld	bc, #_girl
	ld	de, #_sword
	call	_move_weapon
;main.c:1301: if(active_player->y < MAX_GIRL_Y)
	ld	a, (#(_girl + 5) + 0)
	cp	a, #0x71
	jr	NC, 00150$
;main.c:1304: active_player->y += 2;
	add	a, #0x02
	ld	(#(_girl + 5)),a
00150$:
;main.c:1307: if(active_player->anim != 0)
	ld	a, (#(_girl + 8) + 0)
	or	a, a
	jr	Z, 00154$
;main.c:1309: character_set_sprite(active_player, 0);
	xor	a, a
	ld	de, #_girl
	call	_character_set_sprite
	jr	00157$
00154$:
;main.c:1311: else if(active_player->anim != 1)
	dec	a
	jr	Z, 00157$
;main.c:1313: character_set_sprite(active_player, 1);
	ld	a, #0x01
	ld	de, #_girl
	call	_character_set_sprite
00157$:
;main.c:1317: if(joypad() & J_A && !(prev_pad & J_A))
	call	_joypad
	bit	4, a
	jr	Z, 00162$
	ld	a, (_prev_pad)
	bit	4, a
	jr	NZ, 00162$
;main.c:1319: attack(active_player, &sword);
	ld	bc, #_sword
	ld	de, #_girl
	call	_attack
00162$:
;main.c:1323: if(player_stats.is_dead == 1)
	ld	a, (#(_player_stats + 6) + 0)
	dec	a
	jr	NZ, 00166$
;main.c:1325: hide_character_sprites(active_player);
	ld	de, #_girl
	call	_hide_character_sprites
00166$:
;main.c:1328: update_timers(active_player, &sword);
	ld	bc, #_sword
	ld	de, #_girl
	call	_update_timers
;main.c:1330: UINT8 can_enemies_move = 1;
	ldhl	sp,	#1
	ld	(hl), #0x01
;main.c:1331: if(enemy_start_delay_timer > 0)
	ld	hl, #_enemy_start_delay_timer
	ld	a, (hl)
	or	a, a
	jr	Z, 00168$
;main.c:1333: enemy_start_delay_timer--;
	dec	(hl)
;main.c:1334: can_enemies_move = 0;
	ldhl	sp,	#1
	ld	(hl), #0x00
00168$:
;main.c:1338: UINT8 all_enemies_dead = 1;
	ldhl	sp,	#2
	ld	(hl), #0x01
;main.c:1339: for(UINT8 i = 0; i < ACTIVE_ENEMY_COUNT; i++)
	ldhl	sp,	#5
	ld	(hl), #0x00
00196$:
	ldhl	sp,	#5
	ld	a, (hl)
	sub	a, #0x04
	jr	NC, 00176$
;main.c:1341: if(enemies[i].death == 0)
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	a, l
	add	a, #<(_enemies)
	ld	c, a
	ld	a, h
	adc	a, #>(_enemies)
	ld	b, a
	ld	hl, #0x0009
	add	hl, bc
	ld	a, (hl)
;main.c:1346: slime_can_move(&enemies[i], active_player);
	ldhl	sp,	#3
	ld	(hl), c
	inc	hl
	ld	(hl), b
;main.c:1341: if(enemies[i].death == 0)
	or	a, a
	jr	NZ, 00174$
;main.c:1343: all_enemies_dead = 0;
	dec	hl
	dec	hl
;main.c:1344: if(can_enemies_move)
	xor	a, a
	ld	(hl-), a
	ld	a, (hl)
	or	a, a
	jr	Z, 00170$
;main.c:1346: slime_can_move(&enemies[i], active_player);
	inc	hl
	inc	hl
	ld	bc, #_girl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_slime_can_move
00170$:
;main.c:1348: animate_enemy(&enemies[i], 16, 17);
	ld	a, #0x11
	push	af
	inc	sp
	ld	a, #0x10
	ldhl	sp,	#4
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_animate_enemy
	jr	00197$
00174$:
;main.c:1350: else if(enemies[i].death == 1)
	dec	a
	jr	NZ, 00197$
;main.c:1352: enemies[i].x = 0;
	ld	hl, #0x0004
	add	hl, bc
	ld	(hl), #0x00
;main.c:1353: enemies[i].y = 0;
	ld	hl, #0x0005
	add	hl, bc
	ld	(hl), #0x00
;main.c:1354: move_enemy_small(&enemies[i], 0, 0);
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	ldhl	sp,	#4
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_move_enemy_small
00197$:
;main.c:1339: for(UINT8 i = 0; i < ACTIVE_ENEMY_COUNT; i++)
	ldhl	sp,	#5
	inc	(hl)
	jr	00196$
00176$:
;main.c:1358: resolve_enemy_collisions();
	call	_resolve_enemy_collisions
;main.c:1360: for(UINT8 i = 0; i < ACTIVE_ENEMY_COUNT; i++)
	ld	c, #0x00
00199$:
	ld	a, c
	sub	a, #0x04
	jr	NC, 00179$
;main.c:1362: if(enemies[i].death == 0)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	a, l
	add	a, #<(_enemies)
	ld	e, a
	ld	a, h
	adc	a, #>(_enemies)
	ld	d, a
	ld	hl, #0x0009
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	NZ, 00200$
;main.c:1364: move_enemy_small(&enemies[i], enemies[i].x, enemies[i].y);
	ld	hl, #0x0005
	add	hl, de
	ld	b, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	a, (hl)
	push	bc
	push	bc
	inc	sp
	call	_move_enemy_small
	pop	bc
00200$:
;main.c:1360: for(UINT8 i = 0; i < ACTIVE_ENEMY_COUNT; i++)
	inc	c
	jr	00199$
00179$:
;main.c:1368: if(all_enemies_dead)
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00181$
;main.c:1370: show_room_clear_ui();
	call	_show_room_clear_ui
	jr	00182$
00181$:
;main.c:1374: hide_room_clear_ui();
	call	_hide_room_clear_ui
00182$:
;main.c:1378: animtimer++;
	ld	hl, #_animtimer
	inc	(hl)
;main.c:1379: if(animtimer == ANIM_TIMER_MAX)
	ld	a, (hl)
	sub	a, #0x14
	jr	NZ, 00185$
;main.c:1381: animtimer = 0;
	xor	a, a
	ld	(#_animtimer),a
;main.c:1382: for(UINT8 i = 0; i < ACTIVE_ENEMY_COUNT; i++)
	ld	bc, #_enemies
	ldhl	sp,	#5
	ld	(hl), #0x00
00202$:
	ldhl	sp,	#5
	ld	a, (hl)
	sub	a, #0x04
	jr	NC, 00185$
;main.c:1384: enemies[i].anim = (enemies[i].anim == 0) ? 1 : 0;
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	hl, #0x0008
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	ld	a, #0x01
	jr	Z, 00210$
	xor	a, a
00210$:
	ldhl	sp,	#3
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;main.c:1382: for(UINT8 i = 0; i < ACTIVE_ENEMY_COUNT; i++)
	ldhl	sp,	#5
	inc	(hl)
	jr	00202$
00185$:
;main.c:1389: if(player_stats.is_dead == 0)
	ld	a, (#(_player_stats + 6) + 0)
	or	a, a
	jr	NZ, 00190$
;main.c:1391: for(UINT8 i = 0; i < ACTIVE_ENEMY_COUNT; i++)
	ldhl	sp,	#5
	ld	(hl), #0x00
00205$:
	ldhl	sp,	#5
	ld	a, (hl)
	sub	a, #0x04
	jr	NC, 00190$
;main.c:1393: character_enemy_collision(active_player, &enemies[i]);
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	de, #_enemies
	add	hl, de
	ld	c, l
	ld	b, h
	ld	de, #_girl
	call	_character_enemy_collision
;main.c:1391: for(UINT8 i = 0; i < ACTIVE_ENEMY_COUNT; i++)
	ldhl	sp,	#5
	inc	(hl)
	jr	00205$
00190$:
;main.c:1435: prev_pad = current_pad;
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(#_prev_pad),a
;main.c:1436: update_window_stats_ui();
	call	_update_window_stats_ui
;main.c:1437: performantdelay(5);
	ld	a, #0x05
	call	_performantdelay
	jp	00192$
;main.c:1440: }
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
__xinit__movetimer:
	.db #0x00	; 0
__xinit__direction:
	.db #0x00	; 0
__xinit__room:
	.db #0x00	; 0
__xinit__prev_pad:
	.db #0x00	; 0
__xinit__spawned_enemies:
	.db #0x00	; 0
__xinit__title_flash_timer:
	.db #0x00	; 0
__xinit__title_flash_visible:
	.db #0x01	; 1
__xinit__enemy_start_delay_timer:
	.db #0x00	; 0
__xinit__knockback_timer:
	.db #0x00	; 0
__xinit__knockback_dx:
	.db #0x00	;  0
__xinit__knockback_dy:
	.db #0x00	;  0
	.area _CABS (ABS)
