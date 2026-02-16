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
	.globl _transition_cooldown_timer
	.globl _room_clear_timer
	.globl _reward_type
	.globl _can_transition
	.globl _reward_claimed
	.globl _reward_active
	.globl _room_cleared
	.globl _enemy_start_delay_timer
	.globl _title_flash_visible
	.globl _title_flash_timer
	.globl _spawned_enemies
	.globl _prev_pad
	.globl _current_enemy_count
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
	.globl _show_ready_ui
	.globl _hide_ready_ui
	.globl _show_reward_ui
	.globl _hide_reward_ui
	.globl _show_game_over_ui
	.globl _roll_room_reward
	.globl _apply_reward
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
	.globl _room_1
	.globl _load_room
	.globl _performantdelay
	.globl _character_enemy_collision
	.globl _hide_character_sprites
	.globl _hide_sword_sprites
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
_current_enemy_count::
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
_room_cleared::
	.ds 1
_reward_active::
	.ds 1
_reward_claimed::
	.ds 1
_can_transition::
	.ds 1
_reward_type::
	.ds 1
_room_clear_timer::
	.ds 1
_transition_cooldown_timer::
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
;main.c:303: void draw_press_start(UINT8 visible)
;	---------------------------------
; Function draw_press_start
; ---------------------------------
_draw_press_start::
	add	sp, #-11
	ld	c, a
;main.c:305: const UINT8 press_start_tiles[11] = {
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
;main.c:311: for(UINT8 i = 0; i < 11; i++)
	ld	b, #0x00
00103$:
	ld	a, b
	sub	a, #0x0b
	jr	NC, 00105$
;main.c:313: set_bkg_tile_xy(START_X + i, START_Y, visible ? press_start_tiles[i] : 0);
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
;main.c:311: for(UINT8 i = 0; i < 11; i++)
	inc	b
	jr	00103$
00105$:
;main.c:315: }
	add	sp, #11
	ret
;main.c:317: void init_title_screen(void)
;	---------------------------------
; Function init_title_screen
; ---------------------------------
_init_title_screen::
;main.c:319: font_init();
	call	_font_init
;main.c:320: ui_font = font_load(font_min);
	ld	de, #_font_min
	push	de
	call	_font_load
	pop	hl
	ld	hl, #_ui_font
	ld	a, e
	ld	(hl+), a
;main.c:321: font_set(ui_font);
	ld	a, d
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_font_set
	pop	hl
;main.c:323: for(UINT8 y = 0; y < 18; y++)
	ld	e, #0x00
00107$:
	ld	a, e
	sub	a, #0x12
	jr	NC, 00102$
;main.c:325: for(UINT8 x = 0; x < 20; x++)
	ld	d, #0x00
00104$:
	ld	a, d
	sub	a, #0x14
	jr	NC, 00108$
;main.c:327: set_bkg_tile_xy(x, y, 0);
	push	de
	xor	a, a
	push	af
	inc	sp
	ld	a, d
	call	_set_bkg_tile_xy
	pop	de
;main.c:325: for(UINT8 x = 0; x < 20; x++)
	inc	d
	jr	00104$
00108$:
;main.c:323: for(UINT8 y = 0; y < 18; y++)
	inc	e
	jr	00107$
00102$:
;main.c:331: set_bkg_tile_xy(TITLE_X + 0, TITLE_Y, TILE_S);
	ld	a, #0x1d
	push	af
	inc	sp
	ld	e, #0x06
	ld	a, #0x04
	call	_set_bkg_tile_xy
;main.c:332: set_bkg_tile_xy(TITLE_X + 1, TITLE_Y, TILE_L);
	ld	a, #0x16
	push	af
	inc	sp
	ld	e, #0x06
	ld	a, #0x05
	call	_set_bkg_tile_xy
;main.c:333: set_bkg_tile_xy(TITLE_X + 2, TITLE_Y, TILE_I);
	ld	a, #0x13
	push	af
	inc	sp
	ld	a,#0x06
	ld	e,a
	call	_set_bkg_tile_xy
;main.c:334: set_bkg_tile_xy(TITLE_X + 3, TITLE_Y, TILE_M);
	ld	a, #0x17
	push	af
	inc	sp
	ld	e, #0x06
	ld	a, #0x07
	call	_set_bkg_tile_xy
;main.c:335: set_bkg_tile_xy(TITLE_X + 4, TITLE_Y, TILE_E);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	e, #0x06
	ld	a, #0x08
	call	_set_bkg_tile_xy
;main.c:336: set_bkg_tile_xy(TITLE_X + 5, TITLE_Y, 0);
	xor	a, a
	push	af
	inc	sp
	ld	e, #0x06
	ld	a, #0x09
	call	_set_bkg_tile_xy
;main.c:337: set_bkg_tile_xy(TITLE_X + 6, TITLE_Y, TILE_K);
	ld	a, #0x15
	push	af
	inc	sp
	ld	e, #0x06
	ld	a, #0x0a
	call	_set_bkg_tile_xy
;main.c:338: set_bkg_tile_xy(TITLE_X + 7, TITLE_Y, TILE_I);
	ld	a, #0x13
	push	af
	inc	sp
	ld	e, #0x06
	ld	a, #0x0b
	call	_set_bkg_tile_xy
;main.c:339: set_bkg_tile_xy(TITLE_X + 8, TITLE_Y, TILE_L);
	ld	a, #0x16
	push	af
	inc	sp
	ld	e, #0x06
	ld	a, #0x0c
	call	_set_bkg_tile_xy
;main.c:340: set_bkg_tile_xy(TITLE_X + 9, TITLE_Y, TILE_L);
	ld	a, #0x16
	push	af
	inc	sp
	ld	e, #0x06
	ld	a, #0x0d
	call	_set_bkg_tile_xy
;main.c:341: set_bkg_tile_xy(TITLE_X + 10, TITLE_Y, TILE_E);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	e, #0x06
	ld	a, #0x0e
	call	_set_bkg_tile_xy
;main.c:342: set_bkg_tile_xy(TITLE_X + 11, TITLE_Y, TILE_R);
	ld	a, #0x1c
	push	af
	inc	sp
	ld	e, #0x06
	ld	a, #0x0f
	call	_set_bkg_tile_xy
;main.c:344: draw_press_start(1);
	ld	a, #0x01
	call	_draw_press_start
;main.c:345: title_flash_timer = 0;
	xor	a, a
	ld	(#_title_flash_timer),a
;main.c:346: title_flash_visible = 1;
	ld	hl, #_title_flash_visible
	ld	(hl), #0x01
;main.c:348: HIDE_WIN;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xdf
	ldh	(_LCDC_REG + 0), a
;main.c:349: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:350: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:351: }
	ret
;main.c:353: void update_title_screen(void)
;	---------------------------------
; Function update_title_screen
; ---------------------------------
_update_title_screen::
;main.c:355: title_flash_timer++;
	ld	hl, #_title_flash_timer
	inc	(hl)
;main.c:356: if(title_flash_timer >= START_FLASH_FRAMES)
	ld	a, (hl)
	sub	a, #0x04
	ret	C
;main.c:358: title_flash_timer = 0;
	ld	(hl), #0x00
;main.c:359: title_flash_visible = !title_flash_visible;
	ld	hl, #_title_flash_visible
	ld	a, (hl)
	sub	a, #0x01
	ld	a, #0x00
	rla
;main.c:360: draw_press_start(title_flash_visible);
	ld	(hl), a
;main.c:362: }
	jp	_draw_press_start
;main.c:364: void slime_can_move(struct Enemy* enemy, struct GameCharacter* target)
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
;main.c:367: if(enemy->move_timer == SLIME_MOVE_INTERVAL)
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
;main.c:369: enemy->move_timer = 0;
	xor	a, a
	ld	(de), a
;main.c:370: slime_ai(target, enemy);
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
;main.c:371: enemy_check_borders(enemy);
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_enemy_check_borders
;main.c:372: move_enemy_small(enemy, enemy->x, enemy->y);        
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
;main.c:374: enemy->move_timer++;
	ld	a, (de)
	inc	a
	ld	(de), a
;main.c:375: }
	add	sp, #5
	ret
;main.c:377: void resolve_enemy_collisions(void)
;	---------------------------------
; Function resolve_enemy_collisions
; ---------------------------------
_resolve_enemy_collisions::
	add	sp, #-22
;main.c:379: for(UINT8 i = 0; i < current_enemy_count; i++)
	ldhl	sp,	#20
	ld	(hl), #0x00
00126$:
	ldhl	sp,	#20
	ld	a, (hl)
	ld	hl, #_current_enemy_count
	sub	a, (hl)
	jp	NC, 00127$
;main.c:381: if(enemies[i].death == 1)
	ldhl	sp,	#20
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
;main.c:386: for(UINT8 j = i + 1; j < current_enemy_count; j++)
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
	ld	hl, #_current_enemy_count
	sub	a, (hl)
	jp	NC, 00121$
;main.c:388: if(enemies[j].death == 1)
	ldhl	sp,	#21
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
;main.c:393: if(enemies[i].x < enemies[j].x + enemies[j].width &&
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
;main.c:394: enemies[i].x + enemies[i].width > enemies[j].x &&
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
;main.c:395: enemies[i].y < enemies[j].y + enemies[j].height &&
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
;main.c:396: enemies[i].y + enemies[i].height > enemies[j].y)
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
;main.c:398: INT8 dx = (INT8)enemies[i].x - (INT8)enemies[j].x;
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#9
	ld	c, (hl)
	sub	a, c
	ld	c, a
;main.c:399: INT8 dy = (INT8)enemies[i].y - (INT8)enemies[j].y;
	ldhl	sp,	#12
	ld	a, (hl)
	ldhl	sp,	#15
	ld	b, (hl)
	inc	hl
	inc	hl
	sub	a, b
;main.c:400: UINT8 abs_dx = (dx < 0) ? (UINT8)(-dx) : (UINT8)dx;
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
;main.c:401: UINT8 abs_dy = (dy < 0) ? (UINT8)(-dy) : (UINT8)dy;
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
;main.c:403: if(abs_dx >= abs_dy)
	ld	a, c
	sub	a, b
	jr	C, 00112$
;main.c:405: if(dx >= 0)
	ldhl	sp,	#18
	bit	0, (hl)
	jr	NZ, 00106$
;main.c:407: enemies[i].x++;
	ldhl	sp,	#6
	ld	a, (hl-)
	dec	hl
	inc	a
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;main.c:408: enemies[j].x--;
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
;main.c:412: enemies[i].x--;
	ldhl	sp,	#6
	ld	a, (hl-)
	dec	hl
	dec	a
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;main.c:413: enemies[j].x++;
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
;main.c:418: if(dy >= 0)
	ldhl	sp,	#19
	bit	0, (hl)
	jr	NZ, 00109$
;main.c:420: enemies[i].y++;
	ldhl	sp,	#12
	ld	a, (hl-)
	dec	hl
	inc	a
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;main.c:421: enemies[j].y--;
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
;main.c:425: enemies[i].y--;
	ldhl	sp,	#12
	ld	a, (hl-)
	dec	hl
	dec	a
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;main.c:426: enemies[j].y++;
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
;main.c:430: enemy_check_borders(&enemies[i]);
	pop	de
	push	de
	call	_enemy_check_borders
;main.c:431: enemy_check_borders(&enemies[j]);
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_enemy_check_borders
00119$:
;main.c:386: for(UINT8 j = i + 1; j < current_enemy_count; j++)
	ldhl	sp,	#21
	inc	(hl)
	jp	00124$
00121$:
;main.c:379: for(UINT8 i = 0; i < current_enemy_count; i++)
	ldhl	sp,	#20
	inc	(hl)
	jp	00126$
00127$:
;main.c:435: }
	add	sp, #22
	ret
;main.c:438: void slime_ai(struct GameCharacter* character, struct Enemy* enemy)
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
;main.c:440: if (character->x > enemy->x)
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
;main.c:442: enemy->x++;
	inc	hl
	ld	a, (hl)
	inc	a
	ld	(de), a
00102$:
;main.c:444: if (character->x < enemy->x)
	ld	a, (bc)
	ld	b, a
;main.c:440: if (character->x > enemy->x)
	ld	a, (de)
	ld	c, a
;main.c:444: if (character->x < enemy->x)
	ld	a, b
	sub	a, c
	jr	NC, 00104$
;main.c:446: enemy->x--;
	ld	a, c
	dec	a
	ld	(de), a
00104$:
;main.c:448: if (character-> y> enemy->y)
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
;main.c:450: enemy->y++;
	inc	hl
	ld	a, (hl)
	inc	a
	ld	(de), a
00106$:
;main.c:452: if (character->y < enemy->y)
	ld	a, (bc)
	ld	b, a
;main.c:448: if (character-> y> enemy->y)
	ld	a, (de)
	ld	c, a
;main.c:452: if (character->y < enemy->y)
	ld	a, b
	sub	a, c
	jr	NC, 00109$
;main.c:454: enemy->y--;
	ld	a, c
	dec	a
	ld	(de), a
00109$:
;main.c:456: }
	add	sp, #6
	ret
;main.c:457: void update_window_stats_ui(void)
;	---------------------------------
; Function update_window_stats_ui
; ---------------------------------
_update_window_stats_ui::
;main.c:459: set_win_tile_xy(HUD_HP_X, HUD_ROW, TILE_H); // HP label (heart tile)
	ld	a, #0x12
	push	af
	inc	sp
	xor	a, a
	ld	e, a
	call	_set_win_tile_xy
;main.c:460: set_win_tile_xy(HUD_HP_X + 1, HUD_ROW, TILE_P); 
	ld	a, #0x1a
	push	af
	inc	sp
	ld	e, #0x00
	ld	a, #0x01
	call	_set_win_tile_xy
;main.c:461: write_window_2digits(player_stats.current_health, HUD_HP_X + 2, HUD_ROW);
	ld	a, (#(_player_stats + 1) + 0)
	ld	h, #0x00
	push	hl
	inc	sp
	ld	e, #0x02
	call	_write_window_2digits
;main.c:463: set_win_tile_xy(HUD_DMG_X, HUD_ROW, TILE_D);
	ld	a, #0x0e
	push	af
	inc	sp
	ld	e, #0x00
	ld	a, #0x05
	call	_set_win_tile_xy
;main.c:464: set_win_tile_xy(HUD_DMG_X + 1, HUD_ROW, TILE_M);
	ld	a, #0x17
	push	af
	inc	sp
	ld	e, #0x00
	ld	a, #0x06
	call	_set_win_tile_xy
;main.c:465: write_window_2digits(player_stats.damage, HUD_DMG_X + 2, HUD_ROW);
	ld	a, (#(_player_stats + 2) + 0)
	ld	h, #0x00
	push	hl
	inc	sp
	ld	e, #0x07
	call	_write_window_2digits
;main.c:467: set_win_tile_xy(HUD_RANGE_X, HUD_ROW, TILE_S);
	ld	a, #0x1d
	push	af
	inc	sp
	ld	e, #0x00
	ld	a, #0x0a
	call	_set_win_tile_xy
;main.c:468: set_win_tile_xy(HUD_RANGE_X + 1, HUD_ROW, TILE_P);
	ld	a, #0x1a
	push	af
	inc	sp
	ld	e, #0x00
	ld	a, #0x0b
	call	_set_win_tile_xy
;main.c:469: write_window_2digits(player_stats.speed, HUD_RANGE_X + 2, HUD_ROW);
	ld	a, (#(_player_stats + 4) + 0)
	ld	h, #0x00
	push	hl
	inc	sp
	ld	e, #0x0c
	call	_write_window_2digits
;main.c:470: }
	ret
;main.c:472: void show_pause_ui(void)
;	---------------------------------
; Function show_pause_ui
; ---------------------------------
_show_pause_ui::
;main.c:474: set_win_tile_xy(PAUSE_TEXT_X + 0, PAUSE_ROW, TILE_P);
	ld	a, #0x1a
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x07
	call	_set_win_tile_xy
;main.c:475: set_win_tile_xy(PAUSE_TEXT_X + 1, PAUSE_ROW, TILE_A);
	ld	a, #0x0b
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x08
	call	_set_win_tile_xy
;main.c:476: set_win_tile_xy(PAUSE_TEXT_X + 2, PAUSE_ROW, TILE_U);
	ld	a, #0x1f
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x09
	call	_set_win_tile_xy
;main.c:477: set_win_tile_xy(PAUSE_TEXT_X + 3, PAUSE_ROW, TILE_S);
	ld	a, #0x1d
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0a
	call	_set_win_tile_xy
;main.c:478: set_win_tile_xy(PAUSE_TEXT_X + 4, PAUSE_ROW, TILE_E);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0b
	call	_set_win_tile_xy
;main.c:479: }
	ret
;main.c:481: void hide_pause_ui(void)
;	---------------------------------
; Function hide_pause_ui
; ---------------------------------
_hide_pause_ui::
;main.c:483: set_win_tile_xy(PAUSE_TEXT_X + 0, PAUSE_ROW, 0);
	xor	a, a
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x07
	call	_set_win_tile_xy
;main.c:484: set_win_tile_xy(PAUSE_TEXT_X + 1, PAUSE_ROW, 0);
	xor	a, a
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x08
	call	_set_win_tile_xy
;main.c:485: set_win_tile_xy(PAUSE_TEXT_X + 2, PAUSE_ROW, 0);
	xor	a, a
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x09
	call	_set_win_tile_xy
;main.c:486: set_win_tile_xy(PAUSE_TEXT_X + 3, PAUSE_ROW, 0);
	xor	a, a
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0a
	call	_set_win_tile_xy
;main.c:487: set_win_tile_xy(PAUSE_TEXT_X + 4, PAUSE_ROW, 0);
	xor	a, a
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0b
	call	_set_win_tile_xy
;main.c:488: }
	ret
;main.c:490: void show_room_clear_ui(void)
;	---------------------------------
; Function show_room_clear_ui
; ---------------------------------
_show_room_clear_ui::
;main.c:492: set_win_tile_xy(ROOM_CLEAR_X + 0, ROOM_CLEAR_ROW, TILE_R);
	ld	a, #0x1c
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x05
	call	_set_win_tile_xy
;main.c:493: set_win_tile_xy(ROOM_CLEAR_X + 1, ROOM_CLEAR_ROW, TILE_O);
	ld	a, #0x19
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x06
	call	_set_win_tile_xy
;main.c:494: set_win_tile_xy(ROOM_CLEAR_X + 2, ROOM_CLEAR_ROW, TILE_O);
	ld	a, #0x19
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x07
	call	_set_win_tile_xy
;main.c:495: set_win_tile_xy(ROOM_CLEAR_X + 3, ROOM_CLEAR_ROW, TILE_M);
	ld	a, #0x17
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x08
	call	_set_win_tile_xy
;main.c:496: set_win_tile_xy(ROOM_CLEAR_X + 4, ROOM_CLEAR_ROW, 0);
	xor	a, a
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x09
	call	_set_win_tile_xy
;main.c:497: set_win_tile_xy(ROOM_CLEAR_X + 5, ROOM_CLEAR_ROW, TILE_C);
	ld	a, #0x0d
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0a
	call	_set_win_tile_xy
;main.c:498: set_win_tile_xy(ROOM_CLEAR_X + 6, ROOM_CLEAR_ROW, TILE_L);
	ld	a, #0x16
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0b
	call	_set_win_tile_xy
;main.c:499: set_win_tile_xy(ROOM_CLEAR_X + 7, ROOM_CLEAR_ROW, TILE_E);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0c
	call	_set_win_tile_xy
;main.c:500: set_win_tile_xy(ROOM_CLEAR_X + 8, ROOM_CLEAR_ROW, TILE_A);
	ld	a, #0x0b
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0d
	call	_set_win_tile_xy
;main.c:501: set_win_tile_xy(ROOM_CLEAR_X + 9, ROOM_CLEAR_ROW, TILE_R);
	ld	a, #0x1c
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0e
	call	_set_win_tile_xy
;main.c:502: }
	ret
;main.c:504: void hide_room_clear_ui(void)
;	---------------------------------
; Function hide_room_clear_ui
; ---------------------------------
_hide_room_clear_ui::
;main.c:506: for(UINT8 i = 0; i < 10; i++)
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x0a
	ret	NC
;main.c:508: set_win_tile_xy(ROOM_CLEAR_X + i, ROOM_CLEAR_ROW, 0);
	ld	a, c
	add	a, #0x05
	push	bc
	ld	h, #0x00
	push	hl
	inc	sp
	ld	e, #0x01
	call	_set_win_tile_xy
	pop	bc
;main.c:506: for(UINT8 i = 0; i < 10; i++)
	inc	c
;main.c:510: }
	jr	00103$
;main.c:512: void show_ready_ui(void)
;	---------------------------------
; Function show_ready_ui
; ---------------------------------
_show_ready_ui::
;main.c:514: set_win_tile_xy(READY_X + 0, READY_ROW, TILE_R);
	ld	a, #0x1c
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x07
	call	_set_win_tile_xy
;main.c:515: set_win_tile_xy(READY_X + 1, READY_ROW, TILE_E);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x08
	call	_set_win_tile_xy
;main.c:516: set_win_tile_xy(READY_X + 2, READY_ROW, TILE_A);
	ld	a, #0x0b
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x09
	call	_set_win_tile_xy
;main.c:517: set_win_tile_xy(READY_X + 3, READY_ROW, TILE_D);
	ld	a, #0x0e
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0a
	call	_set_win_tile_xy
;main.c:518: set_win_tile_xy(READY_X + 4, READY_ROW, TILE_Y);
	ld	a, #0x23
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0b
	call	_set_win_tile_xy
;main.c:519: }
	ret
;main.c:521: void hide_ready_ui(void)
;	---------------------------------
; Function hide_ready_ui
; ---------------------------------
_hide_ready_ui::
;main.c:523: for(UINT8 i = 0; i < 5; i++)
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x05
	ret	NC
;main.c:525: set_win_tile_xy(READY_X + i, READY_ROW, 0);
	ld	a, c
	add	a, #0x07
	push	bc
	ld	h, #0x00
	push	hl
	inc	sp
	ld	e, #0x01
	call	_set_win_tile_xy
	pop	bc
;main.c:523: for(UINT8 i = 0; i < 5; i++)
	inc	c
;main.c:527: }
	jr	00103$
;main.c:529: void show_reward_ui(UINT8 reward)
;	---------------------------------
; Function show_reward_ui
; ---------------------------------
_show_reward_ui::
;main.c:531: if(reward == REWARD_HP)
	or	a, a
	jr	NZ, 00105$
;main.c:533: set_win_tile_xy(REWARD_X + 0, REWARD_ROW, TILE_H);
	ld	a, #0x12
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x07
	call	_set_win_tile_xy
;main.c:534: set_win_tile_xy(REWARD_X + 1, REWARD_ROW, TILE_P);
	ld	a, #0x1a
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x08
	call	_set_win_tile_xy
;main.c:535: set_win_tile_xy(REWARD_X + 2, REWARD_ROW, 0);
	xor	a, a
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x09
	call	_set_win_tile_xy
;main.c:536: set_win_tile_xy(REWARD_X + 3, REWARD_ROW, TILE_U);
	ld	a, #0x1f
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0a
	call	_set_win_tile_xy
;main.c:537: set_win_tile_xy(REWARD_X + 4, REWARD_ROW, TILE_P);
	ld	a, #0x1a
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0b
	call	_set_win_tile_xy
	ret
00105$:
;main.c:539: else if(reward == REWARD_DMG)
	dec	a
	jr	NZ, 00102$
;main.c:541: set_win_tile_xy(REWARD_X + 0, REWARD_ROW, TILE_D);
	ld	a, #0x0e
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x07
	call	_set_win_tile_xy
;main.c:542: set_win_tile_xy(REWARD_X + 1, REWARD_ROW, TILE_M);
	ld	a, #0x17
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x08
	call	_set_win_tile_xy
;main.c:543: set_win_tile_xy(REWARD_X + 2, REWARD_ROW, TILE_G);
	ld	a, #0x11
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x09
	call	_set_win_tile_xy
;main.c:544: set_win_tile_xy(REWARD_X + 3, REWARD_ROW, 0);
	xor	a, a
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0a
	call	_set_win_tile_xy
;main.c:545: set_win_tile_xy(REWARD_X + 4, REWARD_ROW, TILE_U);
	ld	a, #0x1f
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0b
	call	_set_win_tile_xy
;main.c:546: set_win_tile_xy(REWARD_X + 5, REWARD_ROW, TILE_P);
	ld	a, #0x1a
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0c
	call	_set_win_tile_xy
	ret
00102$:
;main.c:550: set_win_tile_xy(REWARD_X + 0, REWARD_ROW, TILE_S);
	ld	a, #0x1d
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x07
	call	_set_win_tile_xy
;main.c:551: set_win_tile_xy(REWARD_X + 1, REWARD_ROW, TILE_P);
	ld	a, #0x1a
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x08
	call	_set_win_tile_xy
;main.c:552: set_win_tile_xy(REWARD_X + 2, REWARD_ROW, TILE_E);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x09
	call	_set_win_tile_xy
;main.c:553: set_win_tile_xy(REWARD_X + 3, REWARD_ROW, TILE_E);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0a
	call	_set_win_tile_xy
;main.c:554: set_win_tile_xy(REWARD_X + 4, REWARD_ROW, TILE_D);
	ld	a, #0x0e
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0b
	call	_set_win_tile_xy
;main.c:555: set_win_tile_xy(REWARD_X + 5, REWARD_ROW, 0);
	xor	a, a
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0c
	call	_set_win_tile_xy
;main.c:556: set_win_tile_xy(REWARD_X + 6, REWARD_ROW, TILE_U);
	ld	a, #0x1f
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0d
	call	_set_win_tile_xy
;main.c:557: set_win_tile_xy(REWARD_X + 7, REWARD_ROW, TILE_P);
	ld	a, #0x1a
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0e
	call	_set_win_tile_xy
;main.c:559: }
	ret
;main.c:561: void hide_reward_ui(void)
;	---------------------------------
; Function hide_reward_ui
; ---------------------------------
_hide_reward_ui::
;main.c:563: for(UINT8 i = 0; i < 10; i++)
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x0a
	ret	NC
;main.c:565: set_win_tile_xy(REWARD_X + i, REWARD_ROW, 0);
	ld	a, c
	add	a, #0x07
	push	bc
	ld	h, #0x00
	push	hl
	inc	sp
	ld	e, #0x01
	call	_set_win_tile_xy
	pop	bc
;main.c:563: for(UINT8 i = 0; i < 10; i++)
	inc	c
;main.c:567: }
	jr	00103$
;main.c:569: void show_game_over_ui(void)
;	---------------------------------
; Function show_game_over_ui
; ---------------------------------
_show_game_over_ui::
;main.c:571: for(UINT8 x = 0; x < 20; x++)
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x14
	jr	NC, 00101$
;main.c:573: set_win_tile_xy(x, 0, 0);
	push	bc
	xor	a, a
	push	af
	inc	sp
	ld	e, #0x00
	ld	a, c
	call	_set_win_tile_xy
	pop	bc
;main.c:574: set_win_tile_xy(x, 1, 0);
	push	bc
	xor	a, a
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, c
	call	_set_win_tile_xy
	pop	bc
;main.c:571: for(UINT8 x = 0; x < 20; x++)
	inc	c
	jr	00103$
00101$:
;main.c:577: set_win_tile_xy(5, 1, TILE_G);
	ld	a, #0x11
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x05
	call	_set_win_tile_xy
;main.c:578: set_win_tile_xy(6, 1, TILE_A);
	ld	a, #0x0b
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x06
	call	_set_win_tile_xy
;main.c:579: set_win_tile_xy(7, 1, TILE_M);
	ld	a, #0x17
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x07
	call	_set_win_tile_xy
;main.c:580: set_win_tile_xy(8, 1, TILE_E);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x08
	call	_set_win_tile_xy
;main.c:581: set_win_tile_xy(9, 1, 0);
	xor	a, a
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x09
	call	_set_win_tile_xy
;main.c:582: set_win_tile_xy(10, 1, TILE_O);
	ld	a, #0x19
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0a
	call	_set_win_tile_xy
;main.c:583: set_win_tile_xy(11, 1, TILE_V);
	ld	a, #0x20
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0b
	call	_set_win_tile_xy
;main.c:584: set_win_tile_xy(12, 1, TILE_E);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0c
	call	_set_win_tile_xy
;main.c:585: set_win_tile_xy(13, 1, TILE_R);
	ld	a, #0x1c
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0d
	call	_set_win_tile_xy
;main.c:586: }
	ret
;main.c:588: void roll_room_reward(void)
;	---------------------------------
; Function roll_room_reward
; ---------------------------------
_roll_room_reward::
;main.c:590: reward_type = rand() % 3;
	call	_rand
	ld	a, e
	ld	e, #0x03
	call	__moduchar
	ld	hl, #_reward_type
	ld	(hl), c
;main.c:591: }
	ret
;main.c:593: void apply_reward(UINT8 reward)
;	---------------------------------
; Function apply_reward
; ---------------------------------
_apply_reward::
;main.c:595: if(reward == REWARD_HP)
	or	a, a
	jr	NZ, 00114$
;main.c:597: UINT8 boosted_max_hp = player_stats.max_health + HP_REWARD_AMOUNT;
	ld	bc, #_player_stats
	ld	a, (bc)
	add	a, #0x02
;main.c:598: if(boosted_max_hp > PLAYER_MAX_HP_CAP)
	cp	a, #0x1f
	jr	C, 00102$
;main.c:600: player_stats.max_health = PLAYER_MAX_HP_CAP;
	ld	a, #0x1e
	ld	(bc), a
	jr	00103$
00102$:
;main.c:604: player_stats.max_health = boosted_max_hp;
	ld	(bc), a
00103$:
;main.c:607: UINT8 boosted_hp = player_stats.current_health + HP_REWARD_AMOUNT;
	ld	hl, #_player_stats + 1
	ld	e, (hl)
	inc	e
	inc	e
;main.c:597: UINT8 boosted_max_hp = player_stats.max_health + HP_REWARD_AMOUNT;
	ld	a, (bc)
;main.c:608: if(boosted_hp > player_stats.max_health)
	ld	c, a
	sub	a, e
	jr	NC, 00105$
;main.c:610: player_stats.current_health = player_stats.max_health;
	ld	(hl), c
	ret
00105$:
;main.c:614: player_stats.current_health = boosted_hp;
	ld	(hl), e
	ret
00114$:
;main.c:617: else if(reward == REWARD_DMG)
	dec	a
	jr	NZ, 00111$
;main.c:619: player_stats.damage += DMG_REWARD_AMOUNT;
	ld	bc, #_player_stats+2
	ld	a, (bc)
	add	a, #0x02
	ld	(bc), a
	ret
00111$:
;main.c:623: UINT8 boosted_speed = player_stats.speed + SPEED_REWARD_AMOUNT;
	ld	bc, #_player_stats+4
	ld	a, (bc)
	inc	a
;main.c:624: if(boosted_speed > PLAYER_SPEED_CAP)
	cp	a, #0x06
	jr	C, 00108$
;main.c:626: player_stats.speed = PLAYER_SPEED_CAP;
	ld	a, #0x05
	ld	(bc), a
	ret
00108$:
;main.c:630: player_stats.speed = boosted_speed;
	ld	(bc), a
;main.c:633: }
	ret
;main.c:635: void write_window_2digits(UINT8 value, UINT8 x, UINT8 y)
;	---------------------------------
; Function write_window_2digits
; ---------------------------------
_write_window_2digits::
	ld	b, e
;main.c:639: UINT8 tens = value / 10;
	ld	c, a
	push	bc
	ld	e, #0x0a
	ld	a, c
	call	__divuchar
	ld	l, c
	pop	bc
;main.c:640: UINT8 ones = value % 10;
	push	hl
	push	bc
	ld	e, #0x0a
	ld	a, c
	call	__moduchar
	pop	af
	ld	b, a
	pop	hl
;main.c:642: set_win_tile_xy(x, y, DIGIT_TILE_BASE + tens);
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
;main.c:643: set_win_tile_xy(x + 1, y, DIGIT_TILE_BASE + ones);
	inc	c
	ld	a, b
	inc	a
	ld	h, c
	push	hl
	inc	sp
	ldhl	sp,	#3
	ld	e, (hl)
	call	_set_win_tile_xy
;main.c:644: }
	pop	hl
	inc	sp
	jp	(hl)
;main.c:645: UINT8 player_take_damage(UINT8 amount)
;	---------------------------------
; Function player_take_damage
; ---------------------------------
_player_take_damage::
	ld	c, a
;main.c:647: if(player_stats.invuln_timer == 0 && player_stats.is_dead == 0)
	ld	a, (#(_player_stats + 5) + 0)
	or	a, a
	jr	NZ, 00105$
	ld	a, (#(_player_stats + 6) + 0)
	or	a, a
	jr	NZ, 00105$
;main.c:649: if(amount >= player_stats.current_health)
	ld	hl, #(_player_stats + 1)
	ld	b, (hl)
	ld	a, c
	sub	a, b
	jr	C, 00102$
;main.c:651: player_stats.current_health = 0;
	ld	hl, #(_player_stats + 1)
	ld	(hl), #0x00
;main.c:652: player_stats.is_dead = 1;
	ld	hl, #(_player_stats + 6)
	ld	(hl), #0x01
	jr	00103$
00102$:
;main.c:656: player_stats.current_health -= amount;
	ld	a, b
	sub	a, c
	ld	(#(_player_stats + 1)),a
00103$:
;main.c:658: sfx_player_hurt();
	call	_sfx_player_hurt
;main.c:659: player_stats.invuln_timer = INVULN_FRAMES;
	ld	hl, #(_player_stats + 5)
	ld	(hl), #0x0a
;main.c:660: return 1;
	ld	a, #0x01
	ret
00105$:
;main.c:662: return 0;
	xor	a, a
;main.c:663: }            
	ret
;main.c:664: void audio_init(void)
;	---------------------------------
; Function audio_init
; ---------------------------------
_audio_init::
;main.c:666: NR52_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR52_REG + 0), a
;main.c:667: NR50_REG = 0x77;
	ld	a, #0x77
	ldh	(_NR50_REG + 0), a
;main.c:668: NR51_REG = 0xFF;
	ld	a, #0xff
	ldh	(_NR51_REG + 0), a
;main.c:669: }
	ret
;main.c:671: void sfx_swing(void)
;	---------------------------------
; Function sfx_swing
; ---------------------------------
_sfx_swing::
;main.c:673: NR41_REG = 0x00;
	xor	a, a
	ldh	(_NR41_REG + 0), a
;main.c:674: NR42_REG = 0xF1;
	ld	a, #0xf1
	ldh	(_NR42_REG + 0), a
;main.c:675: NR43_REG = 0x35;
	ld	a, #0x35
	ldh	(_NR43_REG + 0), a
;main.c:676: NR44_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR44_REG + 0), a
;main.c:677: }
	ret
;main.c:679: void sfx_enemy_hit(void)
;	---------------------------------
; Function sfx_enemy_hit
; ---------------------------------
_sfx_enemy_hit::
;main.c:681: NR41_REG = 0x00;
	xor	a, a
	ldh	(_NR41_REG + 0), a
;main.c:682: NR42_REG = 0xC2;
	ld	a, #0xc2
	ldh	(_NR42_REG + 0), a
;main.c:683: NR43_REG = 0x20;
	ld	a, #0x20
	ldh	(_NR43_REG + 0), a
;main.c:684: NR44_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR44_REG + 0), a
;main.c:685: }
	ret
;main.c:687: void sfx_player_hurt(void)
;	---------------------------------
; Function sfx_player_hurt
; ---------------------------------
_sfx_player_hurt::
;main.c:689: NR10_REG = 0x16;
	ld	a, #0x16
	ldh	(_NR10_REG + 0), a
;main.c:690: NR11_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR11_REG + 0), a
;main.c:691: NR12_REG = 0xF2;
	ld	a, #0xf2
	ldh	(_NR12_REG + 0), a
;main.c:692: NR13_REG = 0x40;
	ld	a, #0x40
	ldh	(_NR13_REG + 0), a
;main.c:693: NR14_REG = 0x87;
	ld	a, #0x87
	ldh	(_NR14_REG + 0), a
;main.c:694: }
	ret
;main.c:696: void init_player_stats(void)
;	---------------------------------
; Function init_player_stats
; ---------------------------------
_init_player_stats::
;main.c:698: init_character_stats(&player_stats,
	ld	hl, #0x02
	push	hl
	ld	hl, #0x505
	push	hl
	ld	a, #0x06
	ld	de, #_player_stats
	call	_init_character_stats
;main.c:704: }
	ret
;main.c:706: void init_character_stats(struct PlayerStats* stats,
;	---------------------------------
; Function init_character_stats
; ---------------------------------
_init_character_stats::
;main.c:713: stats->max_health = max_health;
	ld	(de), a
;main.c:714: stats->current_health = max_health;
	ld	c, e
	ld	b, d
	inc	bc
	ld	(bc), a
;main.c:715: stats->damage = damage;
	ld	c, e
	ld	b, d
	inc	bc
	inc	bc
	ldhl	sp,	#2
;main.c:716: stats->range = range;
	ld	a, (hl+)
	ld	(bc), a
	ld	c, e
	ld	b, d
	inc	bc
	inc	bc
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;main.c:717: stats->speed = speed;
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(bc), a
;main.c:718: stats->invuln_timer = invuln_time;
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#5
	ld	a, (hl)
	ld	(bc), a
;main.c:719: stats->is_dead = 0;
	ld	hl, #0x0006
	add	hl, de
	ld	(hl), #0x00
;main.c:720: }
	pop	hl
	add	sp, #4
	jp	(hl)
;main.c:722: void update_timers(struct GameCharacter* player, struct Weapon* weapon)
;	---------------------------------
; Function update_timers
; ---------------------------------
_update_timers::
	add	sp, #-14
	ldhl	sp,	#12
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ldhl	sp,	#10
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:724: if(player_stats.invuln_timer > 0 && player_stats.is_dead == 0)
	ld	hl, #(_player_stats + 5)
	ld	c, (hl)
	ld	a, c
	or	a, a
	jr	Z, 00102$
	ld	a, (#(_player_stats + 6) + 0)
	or	a, a
	jr	NZ, 00102$
;main.c:726: player_stats.invuln_timer--;
	dec	c
	ld	hl, #(_player_stats + 5)
	ld	(hl), c
00102$:
;main.c:731: player->x += knockback_dx;
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	inc	sp
	inc	sp
	push	hl
;main.c:732: player->y += knockback_dy;
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), a
;main.c:757: weapon->x += knockback_dx;
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl), a
;main.c:758: weapon->y += knockback_dy;
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0003
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl), a
;main.c:729: if(knockback_timer > 0 && player_stats.is_dead == 0)
	ld	a, (#_knockback_timer)
	or	a, a
	jp	Z, 00116$
	ld	a, (#(_player_stats + 6) + 0)
	or	a, a
	jp	NZ, 00116$
;main.c:731: player->x += knockback_dx;
	pop	de
	push	de
	ld	a, (de)
	ld	hl, #_knockback_dx
	add	a, (hl)
	pop	hl
	push	hl
	ld	(hl), a
;main.c:732: player->y += knockback_dy;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	hl, #_knockback_dy
	add	a, (hl)
	ldhl	sp,	#2
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;main.c:734: if(player->x < MIN_GIRL_X)
	pop	de
	push	de
	ld	a, (de)
	sub	a, #0x17
	jr	NC, 00105$
;main.c:736: player->x = MIN_GIRL_X;
	pop	hl
	ld	(hl), #0x17
	push	hl
00105$:
;main.c:738: if(player->x > MAX_GIRL_X)
	pop	de
	push	de
	ld	a, (de)
	cp	a, #0x8b
	jr	C, 00107$
;main.c:740: player->x = MAX_GIRL_X;
	pop	hl
	ld	(hl), #0x8a
	push	hl
00107$:
;main.c:742: if(player->y < MIN_GIRL_Y)
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	sub	a, #0x14
	jr	NC, 00109$
;main.c:744: player->y = MIN_GIRL_Y;
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), #0x14
00109$:
;main.c:746: if(player->y > MAX_GIRL_Y)
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	cp	a, #0x72
	jr	C, 00111$
;main.c:748: player->y = MAX_GIRL_Y;
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), #0x71
00111$:
;main.c:751: if(locktimer == 0)
	ld	a, (#_locktimer)
	or	a, a
	jr	NZ, 00113$
;main.c:753: move_weapon(weapon, player);
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_move_weapon
	jr	00114$
00113$:
;main.c:757: weapon->x += knockback_dx;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	hl, #_knockback_dx
	add	a, (hl)
	ldhl	sp,	#4
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;main.c:758: weapon->y += knockback_dy;
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	hl, #_knockback_dy
	add	a, (hl)
	ldhl	sp,	#6
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;main.c:759: move_sword_sprites_from_position(weapon);
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_move_sword_sprites_from_position
00114$:
;main.c:762: knockback_timer--;
	ld	hl, #_knockback_timer
	dec	(hl)
00116$:
;main.c:765: if(locktimer > 0)
	ld	a, (#_locktimer)
	or	a, a
	jp	Z, 00166$
;main.c:767: UINT8 lunge_offset = SWORD_LUNGE_MAX_OFFSET;
	ldhl	sp,	#8
	ld	(hl), #0x08
;main.c:769: if(locktimer == 1)
	ld	a, (#_locktimer)
	dec	a
	jr	NZ, 00121$
;main.c:771: lunge_offset = 3;
	ldhl	sp,	#8
	ld	(hl), #0x03
	jr	00122$
00121$:
;main.c:773: else if(locktimer == 2)
	ld	a, (#_locktimer)
	sub	a, #0x02
	jr	NZ, 00122$
;main.c:775: lunge_offset = 6;
	ldhl	sp,	#8
	ld	(hl), #0x06
00122$:
;main.c:778: if(direction == 2)
	ld	a, (#_direction)
	sub	a, #0x02
	jr	NZ, 00150$
;main.c:780: if(player->x > MIN_GIRL_X)
	pop	de
	push	de
	ld	a, (de)
	ldhl	sp,	#9
	ld	(hl), a
	ld	a, #0x17
	sub	a, (hl)
	jp	NC, 00151$
;main.c:782: UINT8 distance_to_min_x = player->x - MIN_GIRL_X;
	ld	a, (hl)
	add	a, #0xe9
;main.c:783: if(distance_to_min_x <= PLAYER_LUNGE_STEP)
	cp	a, #0x04
	jr	NC, 00124$
;main.c:785: player->x = MIN_GIRL_X;
	pop	hl
	ld	(hl), #0x17
	push	hl
	jr	00151$
00124$:
;main.c:789: player->x -= PLAYER_LUNGE_STEP;
	ldhl	sp,	#9
	ld	a, (hl)
	add	a, #0xfd
	pop	hl
	push	hl
	ld	(hl), a
	jr	00151$
00150$:
;main.c:793: else if(direction == 3)
	ld	a, (#_direction)
	sub	a, #0x03
	jr	NZ, 00147$
;main.c:795: if(player->x < MAX_GIRL_X)
	pop	de
	push	de
	ld	a, (de)
	cp	a, #0x8a
	jr	NC, 00151$
;main.c:797: UINT8 distance_to_max_x = MAX_GIRL_X - player->x;
	ld	c, a
	ld	a, #0x8a
	sub	a, c
;main.c:798: if(distance_to_max_x <= PLAYER_LUNGE_STEP)
	cp	a, #0x04
	jr	NC, 00129$
;main.c:800: player->x = MAX_GIRL_X;
	pop	hl
	ld	(hl), #0x8a
	push	hl
	jr	00151$
00129$:
;main.c:804: player->x += PLAYER_LUNGE_STEP;
	inc	c
	inc	c
	inc	c
	pop	hl
	push	hl
	ld	(hl), c
	jr	00151$
00147$:
;main.c:732: player->y += knockback_dy;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
;main.c:812: UINT8 distance_to_min_y = player->y - MIN_GIRL_Y;
	ld	c, b
;main.c:808: else if(direction == 1)
	ld	a, (#_direction)
	dec	a
	jr	NZ, 00144$
;main.c:810: if(player->y > MIN_GIRL_Y)
	ld	a, #0x14
	sub	a, b
	jr	NC, 00151$
;main.c:812: UINT8 distance_to_min_y = player->y - MIN_GIRL_Y;
	ld	a, c
	add	a, #0xec
;main.c:813: if(distance_to_min_y <= PLAYER_LUNGE_STEP)
	cp	a, #0x04
	jr	NC, 00134$
;main.c:815: player->y = MIN_GIRL_Y;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x14
	jr	00151$
00134$:
;main.c:819: player->y -= PLAYER_LUNGE_STEP;
	ld	a, c
	add	a, #0xfd
	ldhl	sp,	#2
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
	jr	00151$
00144$:
;main.c:825: if(player->y < MAX_GIRL_Y)
	ld	a, b
	sub	a, #0x71
	jr	NC, 00151$
;main.c:827: UINT8 distance_to_max_y = MAX_GIRL_Y - player->y;
	ld	a, #0x71
	sub	a, c
;main.c:828: if(distance_to_max_y <= PLAYER_LUNGE_STEP)
	cp	a, #0x04
	jr	NC, 00139$
;main.c:830: player->y = MAX_GIRL_Y;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x71
	jr	00151$
00139$:
;main.c:834: player->y += PLAYER_LUNGE_STEP;
	inc	c
	inc	c
	inc	c
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
00151$:
;main.c:839: move_weapon(weapon, player);
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_move_weapon
;main.c:841: if(direction == 2)
	ld	a, (#_direction)
	sub	a, #0x02
	jr	NZ, 00159$
;main.c:843: weapon->x -= lunge_offset;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#8
	sub	a, (hl)
	ldhl	sp,	#4
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
	jr	00160$
00159$:
;main.c:845: else if(direction == 3)
	ld	a, (#_direction)
	sub	a, #0x03
	jr	NZ, 00156$
;main.c:847: weapon->x += lunge_offset;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#8
	add	a, (hl)
	ldhl	sp,	#4
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
	jr	00160$
00156$:
;main.c:758: weapon->y += knockback_dy;
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
;main.c:849: else if(direction == 1)
	ld	a, (#_direction)
	dec	a
	jr	NZ, 00153$
;main.c:851: weapon->y -= lunge_offset;
	ld	a, c
	ldhl	sp,	#8
	sub	a, (hl)
	dec	hl
	dec	hl
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
	jr	00160$
00153$:
;main.c:855: weapon->y += lunge_offset;
	ld	a, c
	ldhl	sp,	#8
	add	a, (hl)
	dec	hl
	dec	hl
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
00160$:
;main.c:858: move_sword_sprites_from_position(weapon);
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_move_sword_sprites_from_position
;main.c:860: for(UINT8 i = 0; i < ACTIVE_ENEMY_COUNT; i++)
	ldhl	sp,	#9
	ld	(hl), #0x00
00180$:
	ldhl	sp,	#9
	ld	a, (hl)
	sub	a, #0x06
	jr	NC, 00161$
;main.c:862: weapon_enemy_collision(weapon, &enemies[i], i);
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
	ldhl	sp,	#9
	ld	a, (hl+)
	push	af
	inc	sp
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_weapon_enemy_collision
;main.c:860: for(UINT8 i = 0; i < ACTIVE_ENEMY_COUNT; i++)
	ldhl	sp,	#9
	inc	(hl)
	jr	00180$
00161$:
;main.c:865: if(locktimer >= SWORD_LUNGE_FRAMES)
	ld	hl, #_locktimer
	ld	a, (hl)
	sub	a, #0x03
	jr	C, 00163$
;main.c:867: locktimer = 0;
	ld	(hl), #0x00
;main.c:868: swordreset(player, weapon);
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	ld	b, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_swordreset
	jr	00166$
00163$:
;main.c:872: locktimer++;
	ld	hl, #_locktimer
	inc	(hl)
00166$:
;main.c:876: if(player_stats.is_dead == 1)
	ld	a, (#(_player_stats + 6) + 0)
	dec	a
	jr	NZ, 00174$
;main.c:878: hide_character_sprites(player);
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_hide_character_sprites
	jr	00175$
00174$:
;main.c:724: if(player_stats.invuln_timer > 0 && player_stats.is_dead == 0)
	ld	a, (#(_player_stats + 5) + 0)
;main.c:880: else if(player_stats.invuln_timer > 0)
	or	a, a
	jr	Z, 00171$
;main.c:882: if(player_stats.invuln_timer % INVULN_FLASH_PERIOD == 0)
	and	a, #0x01
	jr	NZ, 00168$
;main.c:884: hide_character_sprites(player);
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_hide_character_sprites
	jr	00175$
00168$:
;main.c:888: move_player(player, player->x, player->y);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
	pop	de
	push	de
	ld	a, (de)
	push	bc
	inc	sp
	ldhl	sp,	#13
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_move_player
	jr	00175$
00171$:
;main.c:893: move_player(player, player->x, player->y);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
	pop	de
	push	de
	ld	a, (de)
	push	bc
	inc	sp
	ldhl	sp,	#13
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_move_player
00175$:
;main.c:896: if(player_stats.is_dead == 0 && locktimer == 0)
	ld	a, (#(_player_stats + 6) + 0)
	or	a, a
	jr	NZ, 00182$
	ld	a, (#_locktimer)
	or	a, a
	jr	NZ, 00182$
;main.c:898: move_weapon(weapon, player);
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_move_weapon
00182$:
;main.c:900: }
	add	sp, #14
	ret
;main.c:902: void setup_enemy(struct Enemy* enemy, UINT8 oam_slot, UINT8 x, UINT8 y)
;	---------------------------------
; Function setup_enemy
; ---------------------------------
_setup_enemy::
	dec	sp
	ldhl	sp,	#0
	ld	(hl), a
;main.c:904: enemy->x = x;
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(bc), a
;main.c:905: enemy->y = y;
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(bc), a
;main.c:906: enemy->width = 8;
	ld	hl, #0x0006
	add	hl, de
	ld	(hl), #0x08
;main.c:907: enemy->height = 8;
	ld	hl, #0x0007
	add	hl, de
	ld	(hl), #0x08
;main.c:908: enemy->anim = 0;
	ld	hl, #0x0008
	add	hl, de
	ld	(hl), #0x00
;main.c:909: enemy->death = 0;
	ld	hl, #0x0009
	add	hl, de
	ld	(hl), #0x00
;main.c:910: enemy->max_health = SLIME_BASE_HP;
	ld	hl, #0x000a
	add	hl, de
	ld	(hl), #0x0a
;main.c:911: enemy->current_health = enemy->max_health;
	ld	hl, #0x000b
	add	hl, de
	ld	(hl), #0x0a
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
;main.c:915: enemy->spritids[0] = oam_slot;
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
;main.c:917: move_enemy_small(enemy, x, y);
	ldhl	sp,	#4
	ld	a, (hl-)
	push	af
	inc	sp
	ld	a, (hl)
	call	_move_enemy_small
;main.c:918: }
	inc	sp
	pop	hl
	pop	af
	jp	(hl)
;main.c:921: void room_0(void)
;	---------------------------------
; Function room_0
; ---------------------------------
_room_0::
;main.c:923: current_enemy_count = 4;
	ld	hl, #_current_enemy_count
	ld	(hl), #0x04
;main.c:924: setup_enemy(&enemies[0], 22, 26, 50);   // Left top
	ld	hl, #0x321a
	push	hl
	ld	a, #0x16
	ld	de, #_enemies
	call	_setup_enemy
;main.c:925: setup_enemy(&enemies[1], 23, 26, 70);   // Left bottom
	ld	hl, #0x461a
	push	hl
	ld	a, #0x17
	ld	de, #(_enemies + 13)
	call	_setup_enemy
;main.c:926: setup_enemy(&enemies[2], 24, 134, 50);  // Right top
	ld	hl, #0x3286
	push	hl
	ld	a, #0x18
	ld	de, #(_enemies + 26)
	call	_setup_enemy
;main.c:927: setup_enemy(&enemies[3], 25, 134, 70);  // Right bottom
	ld	hl, #0x4686
	push	hl
	ld	a, #0x19
	ld	de, #(_enemies + 39)
	call	_setup_enemy
;main.c:928: setup_enemy(&enemies[4], 26, 0, 0);     // Unused in room 0
	xor	a, a
	rrca
	push	af
	ld	a, #0x1a
	ld	de, #(_enemies + 52)
	call	_setup_enemy
;main.c:929: setup_enemy(&enemies[5], 27, 0, 0);     // Unused in room 0
	xor	a, a
	rrca
	push	af
	ld	a, #0x1b
	ld	de, #(_enemies + 65)
	call	_setup_enemy
;main.c:930: enemies[4].death = 1;
	ld	hl, #_enemies + 61
	ld	(hl), #0x01
;main.c:931: enemies[5].death = 1;
	ld	hl, #_enemies + 74
	ld	(hl), #0x01
;main.c:932: enemy_start_delay_timer = ENEMY_START_DELAY_FRAMES;
	ld	hl, #_enemy_start_delay_timer
	ld	(hl), #0x0f
;main.c:933: room_cleared = 0;
;main.c:934: reward_active = 0;
	xor	a, a
	ld	(#_room_cleared), a
	ld	(#_reward_active),a
;main.c:935: reward_claimed = 0;
;main.c:936: can_transition = 0;
	xor	a, a
	ld	(#_reward_claimed), a
	ld	(#_can_transition),a
;main.c:937: room_clear_timer = 0;
;main.c:938: transition_cooldown_timer = 0;
	xor	a, a
	ld	(#_room_clear_timer), a
	ld	(#_transition_cooldown_timer),a
;main.c:939: }
	ret
;main.c:942: void room_1(void)
;	---------------------------------
; Function room_1
; ---------------------------------
_room_1::
;main.c:944: current_enemy_count = 6;
	ld	hl, #_current_enemy_count
	ld	(hl), #0x06
;main.c:945: setup_enemy(&enemies[0], 22, 26, 50);   // Left top
	ld	hl, #0x321a
	push	hl
	ld	a, #0x16
	ld	de, #_enemies
	call	_setup_enemy
;main.c:946: setup_enemy(&enemies[1], 23, 26, 70);   // Left bottom
	ld	hl, #0x461a
	push	hl
	ld	a, #0x17
	ld	de, #(_enemies + 13)
	call	_setup_enemy
;main.c:947: setup_enemy(&enemies[2], 24, 26, 90);  // Right top
	ld	hl, #0x5a1a
	push	hl
	ld	a, #0x18
	ld	de, #(_enemies + 26)
	call	_setup_enemy
;main.c:948: setup_enemy(&enemies[3], 25, 134, 50);  // Right bottom
	ld	hl, #0x3286
	push	hl
	ld	a, #0x19
	ld	de, #(_enemies + 39)
	call	_setup_enemy
;main.c:949: setup_enemy(&enemies[4], 26, 134, 70);  
	ld	hl, #0x4686
	push	hl
	ld	a, #0x1a
	ld	de, #(_enemies + 52)
	call	_setup_enemy
;main.c:950: setup_enemy(&enemies[5], 27, 134, 90);  
	ld	hl, #0x5a86
	push	hl
	ld	a, #0x1b
	ld	de, #(_enemies + 65)
	call	_setup_enemy
;main.c:951: enemy_start_delay_timer = ENEMY_START_DELAY_FRAMES;
	ld	hl, #_enemy_start_delay_timer
	ld	(hl), #0x0f
;main.c:952: room_cleared = 0;
;main.c:953: reward_active = 0;
	xor	a, a
	ld	(#_room_cleared), a
	ld	(#_reward_active),a
;main.c:954: reward_claimed = 0;
;main.c:955: can_transition = 0;
	xor	a, a
	ld	(#_reward_claimed), a
	ld	(#_can_transition),a
;main.c:956: room_clear_timer = 0;
;main.c:957: transition_cooldown_timer = 0;
	xor	a, a
	ld	(#_room_clear_timer), a
	ld	(#_transition_cooldown_timer),a
;main.c:958: }
	ret
;main.c:960: void load_room(UINT8 room_id)
;	---------------------------------
; Function load_room
; ---------------------------------
_load_room::
;main.c:962: if(room_id == 0)
	or	a, a
	jr	NZ, 00105$
;main.c:964: room_0();
	call	_room_0
	jr	00106$
00105$:
;main.c:966: else if(room_id == 1)
	dec	a
	jr	NZ, 00102$
;main.c:968: room_1();
	call	_room_1
	jr	00106$
00102$:
;main.c:972: room_0();
	call	_room_0
00106$:
;main.c:975: setup_character(&girl, PLAYER_SPAWN_X, PLAYER_SPAWN_Y);
	ld	a, #0x24
	push	af
	inc	sp
	ld	a, #0x50
	ld	de, #_girl
	call	_setup_character
;main.c:976: direction = 0;
	xor	a, a
	ld	(#_direction),a
;main.c:977: move_weapon(&sword, &girl);
	ld	bc, #_girl
	ld	de, #_sword
	call	_move_weapon
;main.c:978: hide_room_clear_ui();
	call	_hide_room_clear_ui
;main.c:979: hide_reward_ui();
	call	_hide_reward_ui
;main.c:980: hide_ready_ui();
;main.c:981: }
	jp	_hide_ready_ui
;main.c:985: void performantdelay(UINT8 numloops)
;	---------------------------------
; Function performantdelay
; ---------------------------------
_performantdelay::
	ld	c, a
;main.c:988: for(i = 0; i < numloops; i++)
	ld	b, #0x00
00103$:
	ld	a, b
	sub	a, c
	ret	NC
;main.c:990: wait_vbl_done();
	call	_wait_vbl_done
;main.c:988: for(i = 0; i < numloops; i++)
	inc	b
;main.c:992: }
	jr	00103$
;main.c:994: void character_enemy_collision(struct GameCharacter* character, struct Enemy* enemy)
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
;main.c:997: if(enemy->death == 1)
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
;main.c:999: return;
;main.c:1002: if (character->x < enemy->x + enemy->width - pad &&
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
;main.c:1003: character->x + character->width - pad > enemy->x &&
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
;main.c:1004: character->y < enemy->y + enemy->height - pad &&
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
;main.c:1005: character->y + character->height - pad > enemy->y)
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
;main.c:1007: UINT8 took_damage = player_take_damage(1);
	ld	a, #0x01
	call	_player_take_damage
;main.c:1008: if(took_damage)
	or	a, a
	jp	Z, 00119$
;main.c:1010: UINT8 dx = (character->x > enemy->x) ? (character->x - enemy->x) : (enemy->x - character->x);
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
;main.c:1011: UINT8 dy = (character->y > enemy->y) ? (character->y - enemy->y) : (enemy->y - character->y);
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
;main.c:1013: if (character->x < enemy->x)
	ldhl	sp,	#14
	ld	a, (hl-)
	sub	a, (hl)
	jr	NC, 00104$
;main.c:1015: knockback_dx = -KNOCKBACK_STEP;
	ld	hl, #_knockback_dx
	ld	(hl), #0xfe
	jr	00105$
00104$:
;main.c:1019: knockback_dx = KNOCKBACK_STEP;
	ld	hl, #_knockback_dx
	ld	(hl), #0x02
00105$:
;main.c:1021: if (character->y < enemy->y)
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
;main.c:1023: knockback_dy = -KNOCKBACK_STEP;
	ld	hl, #_knockback_dy
	ld	(hl), #0xfe
	jr	00108$
00107$:
;main.c:1027: knockback_dy = KNOCKBACK_STEP;
	ld	hl, #_knockback_dy
	ld	(hl), #0x02
00108$:
;main.c:1030: if (dx < dy)
	ldhl	sp,	#12
	ld	a, (hl)
	sub	a, c
	jr	NC, 00110$
;main.c:1032: knockback_dy = 0;
	xor	a, a
	ld	(#_knockback_dy),a
	jr	00111$
00110$:
;main.c:1036: knockback_dx = 0;
	xor	a, a
	ld	(#_knockback_dx),a
00111$:
;main.c:1039: knockback_timer = KNOCKBACK_FRAMES;
	ld	hl, #_knockback_timer
	ld	(hl), #0x06
00119$:
;main.c:1042: }
	add	sp, #19
	ret
;main.c:1044: void hide_character_sprites(struct GameCharacter* character)
;	---------------------------------
; Function hide_character_sprites
; ---------------------------------
_hide_character_sprites::
;main.c:1046: for(UINT8 i = 0; i < 4; i++)
	ld	c, #0x00
00104$:
	ld	a, c
	sub	a, #0x04
	ret	NC
;main.c:1048: hide_sprite(character->spritids[i]);
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
;main.c:1046: for(UINT8 i = 0; i < 4; i++)
	inc	c
;main.c:1050: }
	jr	00104$
;main.c:1052: void hide_sword_sprites(struct Weapon* weapon)
;	---------------------------------
; Function hide_sword_sprites
; ---------------------------------
_hide_sword_sprites::
;main.c:1054: hide_sprite(weapon->spritids[0]);
	ld	a, (de)
	ld	c, a
;c:\gbdk\include\gb\gb.h:2001: shadow_OAM[nb].y = 0;
	xor	a, a
	ld	l, c
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
	ld	(hl), #0x00
;main.c:1055: hide_sprite(weapon->spritids[1]);
	inc	de
	ld	a, (de)
	ld	e, a
;c:\gbdk\include\gb\gb.h:2001: shadow_OAM[nb].y = 0;
	ld	bc, #_shadow_OAM+0
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	(hl), #0x00
;main.c:1055: hide_sprite(weapon->spritids[1]);
;main.c:1056: }
	ret
;main.c:1058: void weapon_enemy_collision(struct Weapon* weapon, struct Enemy* enemy, UINT8 enemy_index)
;	---------------------------------
; Function weapon_enemy_collision
; ---------------------------------
_weapon_enemy_collision::
	add	sp, #-19
	ldhl	sp,	#17
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ldhl	sp,	#15
	ld	a, c
	ld	(hl+), a
;main.c:1061: if(enemy->death == 1)
	ld	a, b
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0009
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
	jp	Z, 00130$
;main.c:1063: return;
;main.c:1067: if(hit_this_attack[enemy_index] == 1)
	ld	de, #_hit_this_attack
	ldhl	sp,	#21
	ld	l, (hl)
	ld	h, #0x00
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
	ld	d, (hl)
	ld	a, (de)
	dec	a
	jp	Z, 00130$
;main.c:1069: return;
;main.c:1076: UINT8 collision_x = weapon->x;
	ldhl	sp,	#17
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	ld	a, (bc)
	ldhl	sp,	#12
	ld	(hl), a
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
;main.c:1077: UINT8 collision_y = weapon->y;
	ldhl	sp,	#17
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	inc	bc
	ld	a, (bc)
	ldhl	sp,	#13
	ld	(hl), a
	ldhl	sp,	#6
	ld	(hl), a
;main.c:1078: UINT8 collision_width = weapon->width;
	ldhl	sp,#17
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
	ldhl	sp,	#7
	ld	(hl), a
;main.c:1079: UINT8 collision_height = weapon->height;
	ldhl	sp,#17
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#8
	ld	(hl), a
;main.c:1082: if(direction == 2 || direction == 3) // left or right
	ld	a,(#_direction)
	cp	a,#0x02
	jr	Z, 00105$
	sub	a, #0x03
	jr	NZ, 00106$
00105$:
;main.c:1084: collision_x = weapon->x - 8;  // Start 8px to the left
	ldhl	sp,	#12
	ld	a, (hl+)
	inc	hl
	add	a, #0xf8
	ld	(hl), a
;main.c:1085: collision_width = 16;  // 2 sprites wide
	ldhl	sp,	#7
	ld	(hl), #0x10
	jr	00107$
00106$:
;main.c:1089: collision_y = weapon->y - 8;  // Start 8px up
	ldhl	sp,	#13
	ld	a, (hl)
	add	a, #0xf8
	ldhl	sp,	#6
;main.c:1090: collision_height = 16;  // 2 sprites tall
	ld	(hl+), a
	inc	hl
	ld	(hl), #0x10
00107$:
;main.c:1093: if (collision_x < enemy->x + enemy->width &&
	ldhl	sp,#15
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
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,#15
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
	ldhl	sp,	#11
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#14
	ld	a, (hl-)
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	jp	NC, 00130$
;main.c:1094: collision_x + collision_width > enemy->x &&
	ldhl	sp,	#7
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#13
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#11
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	jp	NC, 00130$
;main.c:1095: collision_y < enemy->y + enemy->height &&
	ldhl	sp,#15
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ldhl	sp,	#11
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
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#13
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	jp	NC, 00130$
;main.c:1096: collision_y + collision_height > enemy->y)
	ldhl	sp,	#8
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#13
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#11
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	jp	NC, 00130$
;main.c:1099: hit_this_attack[enemy_index] = 1;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x01
;main.c:1100: if(enemy->current_health > 0)
	ldhl	sp,#15
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000b
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#14
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#13
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	or	a, a
	jr	Z, 00122$
;main.c:1102: if(player_stats.damage >= enemy->current_health)
	ld	hl, #(_player_stats + 2)
	ld	l, (hl)
	ld	a, l
	sub	a, c
	jr	C, 00110$
;main.c:1104: enemy->current_health = 0;
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
	jr	00111$
00110$:
;main.c:1108: enemy->current_health -= player_stats.damage;
	ld	a, c
	sub	a, l
	ldhl	sp,	#12
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
00111$:
;main.c:1111: if(direction == 2) // left
	ld	a, (#_direction)
	sub	a, #0x02
	jr	NZ, 00119$
;main.c:1113: enemy->x -= ENEMY_KNOCKBACK_STEP;
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#14
	ld	(hl), a
	add	a, #0xf8
	ldhl	sp,	#9
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
	jr	00120$
00119$:
;main.c:1115: else if(direction == 3) // right
	ld	a, (#_direction)
	sub	a, #0x03
	jr	NZ, 00116$
;main.c:1117: enemy->x += ENEMY_KNOCKBACK_STEP;
	ldhl	sp,#9
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
	jr	00120$
00116$:
;main.c:1095: collision_y < enemy->y + enemy->height &&
	pop	de
	push	de
	ld	a, (de)
;main.c:1121: enemy->y -= ENEMY_KNOCKBACK_STEP;
	ld	c, a
;main.c:1119: else if(direction == 1) // up
	ld	a, (#_direction)
	dec	a
	jr	NZ, 00113$
;main.c:1121: enemy->y -= ENEMY_KNOCKBACK_STEP;
	ld	a, c
	add	a, #0xf8
	pop	hl
	push	hl
	ld	(hl), a
	jr	00120$
00113$:
;main.c:1125: enemy->y += ENEMY_KNOCKBACK_STEP;
	ld	a, c
	add	a, #0x08
	pop	hl
	push	hl
	ld	(hl), a
00120$:
;main.c:1128: enemy_check_borders(enemy);
	ldhl	sp,	#15
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_enemy_check_borders
00122$:
;main.c:1131: sfx_enemy_hit();
	call	_sfx_enemy_hit
;main.c:1133: if(enemy->current_health == 0)
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	jr	NZ, 00130$
;main.c:1135: enemy->death = 1;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x01
;main.c:1136: enemy->x = 0;
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;main.c:1137: enemy->y = 0;
	pop	hl
	ld	(hl), #0x00
	push	hl
;main.c:1138: score = score ++;
00130$:
;main.c:1142: }
	add	sp, #19
	pop	hl
	inc	sp
	jp	(hl)
;main.c:1143: void move_player(struct GameCharacter* character, UINT8 x, UINT8 y)
;	---------------------------------
; Function move_player
; ---------------------------------
_move_player::
	dec	sp
	ldhl	sp,	#0
	ld	(hl), a
;main.c:1145: move_sprite(character->spritids[0], x, y);
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
;main.c:1146: move_sprite(character->spritids[1], x + spritesize, y);
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
;main.c:1147: move_sprite(character->spritids[2], x, y + spritesize);
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
;main.c:1148: move_sprite(character->spritids[3], x + spritesize, y + spritesize);
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
;main.c:1148: move_sprite(character->spritids[3], x + spritesize, y + spritesize);
;main.c:1149: }
	inc	sp
	pop	hl
	inc	sp
	jp	(hl)
;main.c:1150: void move_weapon(struct Weapon* weapon, struct GameCharacter* owner)
;	---------------------------------
; Function move_weapon
; ---------------------------------
_move_weapon::
	add	sp, #-14
	ldhl	sp,	#12
	ld	a, e
	ld	(hl+), a
;main.c:1156: weapon->x = owner->x;
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
;main.c:1157: weapon->y = owner->y + 8;
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
;main.c:1154: if(direction == 2) // left
	ld	a, (#_direction)
	sub	a, #0x02
	jp	NZ, 00110$
;main.c:1156: weapon->x = owner->x;
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
;main.c:1157: weapon->y = owner->y + 8;
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
;main.c:1160: weapon->spritids[0] = 4;
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
;main.c:1163: weapon->spritids[1] = 5;
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
;main.c:1164: move_sprite(weapon->spritids[0], weapon->x, weapon->y);
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
;main.c:1165: move_sprite(weapon->spritids[1], weapon->x - spritesize, weapon->y);
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
;main.c:1165: move_sprite(weapon->spritids[1], weapon->x - spritesize, weapon->y);
	jp	00136$
00110$:
;main.c:1167: else if(direction == 3) // right
	ld	a, (#_direction)
	sub	a, #0x03
	jp	NZ, 00107$
;main.c:1169: weapon->x = owner->x + 18;
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
;main.c:1170: weapon->y = owner->y + 8;
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
;main.c:1173: weapon->spritids[1] = 4;
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
;main.c:1176: weapon->spritids[0] = 5;
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x05
;main.c:1177: move_sprite(weapon->spritids[0], weapon->x, weapon->y);
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
;main.c:1178: move_sprite(weapon->spritids[1], weapon->x - spritesize, weapon->y);
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
;main.c:1178: move_sprite(weapon->spritids[1], weapon->x - spritesize, weapon->y);
	jp	00136$
00107$:
;main.c:1180: else if(direction == 1) // up
	ld	a, (#_direction)
	dec	a
	jp	NZ, 00104$
;main.c:1182: weapon->x = owner->x + 9;
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
;main.c:1183: weapon->y = owner->y + 3;
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
;main.c:1186: weapon->spritids[0] = 4;
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
;main.c:1189: weapon->spritids[1] = 5;
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
;main.c:1190: move_sprite(weapon->spritids[0], weapon->x, weapon->y);
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
;main.c:1191: move_sprite(weapon->spritids[1], weapon->x, weapon->y - spritesize);
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
;main.c:1191: move_sprite(weapon->spritids[1], weapon->x, weapon->y - spritesize);
	jp	00136$
00104$:
;main.c:1193: else if(direction == 0) // down
	ld	a, (#_direction)
	or	a, a
	jp	NZ, 00136$
;main.c:1195: weapon->x = owner->x - 2;
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
;main.c:1196: weapon->y = owner->y + 18;
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
;main.c:1199: weapon->spritids[1] = 4;
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
;main.c:1202: weapon->spritids[0] = 5;
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x05
;main.c:1203: move_sprite(weapon->spritids[0], weapon->x, weapon->y);
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
;main.c:1204: move_sprite(weapon->spritids[1], weapon->x, weapon->y - spritesize);
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
;main.c:1204: move_sprite(weapon->spritids[1], weapon->x, weapon->y - spritesize);
00136$:
;main.c:1206: }
	add	sp, #14
	ret
;main.c:1208: void move_sword_sprites_from_position(struct Weapon* weapon)
;	---------------------------------
; Function move_sword_sprites_from_position
; ---------------------------------
_move_sword_sprites_from_position::
	add	sp, #-6
	ld	c, e
	ld	b, d
;main.c:1212: move_sprite(weapon->spritids[0], weapon->x, weapon->y);
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
;main.c:1210: if(direction == 2 || direction == 3)
	ld	a, (#_direction)
	sub	a, #0x02
	jr	Z, 00101$
	ld	a, (#_direction)
	sub	a, #0x03
	jr	NZ, 00102$
00101$:
;main.c:1212: move_sprite(weapon->spritids[0], weapon->x, weapon->y);
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
;main.c:1213: move_sprite(weapon->spritids[1], weapon->x - spritesize, weapon->y);
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
;main.c:1213: move_sprite(weapon->spritids[1], weapon->x - spritesize, weapon->y);
	jr	00109$
00102$:
;main.c:1217: move_sprite(weapon->spritids[0], weapon->x, weapon->y);
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
;main.c:1218: move_sprite(weapon->spritids[1], weapon->x, weapon->y - spritesize);
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
;main.c:1218: move_sprite(weapon->spritids[1], weapon->x, weapon->y - spritesize);
00109$:
;main.c:1220: }
	add	sp, #6
	ret
;main.c:1222: void attack(struct GameCharacter* owner, struct Weapon* weapon)
;	---------------------------------
; Function attack
; ---------------------------------
_attack::
;main.c:1227: for(UINT8 i = 0; i < MAX_ENEMIES; i++)
	ld	c, #0x00
00105$:
	ld	a, c
	sub	a, #0x08
	jr	NC, 00101$
;main.c:1229: hit_this_attack[i] = 0;
	ld	hl, #_hit_this_attack
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x00
;main.c:1227: for(UINT8 i = 0; i < MAX_ENEMIES; i++)
	inc	c
	jr	00105$
00101$:
;main.c:1232: sfx_swing();
	call	_sfx_swing
;main.c:1234: if (locktimer == 0)
	ld	hl, #_locktimer
	ld	a, (hl)
	or	a, a
	ret	NZ
;main.c:1236: locktimer ++;
	inc	(hl)
;main.c:1238: }
	ret
;main.c:1239: void swordreset(struct GameCharacter* owner, struct Weapon* weapon)
;	---------------------------------
; Function swordreset
; ---------------------------------
_swordreset::
	push	bc
;main.c:1242: for(UINT8 i = 0; i < MAX_ENEMIES; i++)
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x08
	jr	NC, 00101$
;main.c:1244: hit_this_attack[i] = 0;
	ld	hl, #_hit_this_attack
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x00
;main.c:1242: for(UINT8 i = 0; i < MAX_ENEMIES; i++)
	inc	c
	jr	00103$
00101$:
;main.c:1247: move_weapon(weapon, owner);
	ld	c, e
	ld	b, d
	pop	de
	jp	_move_weapon
;main.c:1248: }
	inc	sp
	inc	sp
	ret
;main.c:1249: void move_enemy_small(struct Enemy* character, UINT8 x, UINT8 y)
;	---------------------------------
; Function move_enemy_small
; ---------------------------------
_move_enemy_small::
	ld	c, a
;main.c:1251: move_sprite(character->spritids[0], x, y);
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
;main.c:1251: move_sprite(character->spritids[0], x, y);
;main.c:1252: }
	pop	hl
	inc	sp
	jp	(hl)
;main.c:1253: void animate_enemy(struct Enemy* enemy, UINT8 tile0, UINT8 tile1)
;	---------------------------------
; Function animate_enemy
; ---------------------------------
_animate_enemy::
	dec	sp
	dec	sp
	ld	c, a
;main.c:1256: if(enemy->anim == 0)
	ld	hl, #0x0008
	add	hl, de
	ld	b, (hl)
;main.c:1258: set_sprite_tile(enemy->spritids[0], tile0);
	inc	sp
	inc	sp
	push	de
;main.c:1256: if(enemy->anim == 0)
	ld	a, b
	or	a, a
	jr	NZ, 00104$
;main.c:1258: set_sprite_tile(enemy->spritids[0], tile0);
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
;main.c:1258: set_sprite_tile(enemy->spritids[0], tile0);
	jr	00108$
00104$:
;main.c:1260: else if(enemy->anim == 1)
	dec	b
	jr	NZ, 00108$
;main.c:1262: set_sprite_tile(enemy->spritids[0], tile1);
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
;main.c:1262: set_sprite_tile(enemy->spritids[0], tile1);
00108$:
;main.c:1264: }
	inc	sp
	inc	sp
	pop	hl
	inc	sp
	jp	(hl)
;main.c:1265: void enemy_check_borders(struct Enemy* enemy)
;	---------------------------------
; Function enemy_check_borders
; ---------------------------------
_enemy_check_borders::
;main.c:1267: if (enemy->x < MIN_ENEMY_X)
	ld	hl, #0x0004
	add	hl, de
	ld	a, (hl)
	sub	a, #0x10
	jr	NC, 00102$
;main.c:1269: enemy->x = MIN_ENEMY_X;
	ld	(hl), #0x10
00102$:
;main.c:1271: if (enemy->x > MAX_ENEMY_X)
	ld	a, (hl)
	cp	a, #0x99
	jr	C, 00104$
;main.c:1273: enemy->x = MAX_ENEMY_X;
	ld	(hl), #0x98
00104$:
;main.c:1275: if (enemy->y < MIN_ENEMY_Y)
	ld	hl, #0x0005
	add	hl, de
	ld	a, (hl)
	sub	a, #0x14
	jr	NC, 00106$
;main.c:1277: enemy->y = MIN_ENEMY_Y;
	ld	(hl), #0x14
00106$:
;main.c:1279: if (enemy->y > MAX_ENEMY_Y)
	ld	a, (hl)
	cp	a, #0x81
	ret	C
;main.c:1281: enemy->y = MAX_ENEMY_Y;
	ld	(hl), #0x80
;main.c:1283: }
	ret
;main.c:1286: void character_set_sprite(struct GameCharacter* character, UINT8 anim_state)
;	---------------------------------
; Function character_set_sprite
; ---------------------------------
_character_set_sprite::
	ld	c, e
	ld	b, d
	ld	e, a
;main.c:1291: character->anim = anim_state;  // Set animation state in struct
	ld	hl, #0x0008
	add	hl, bc
	ld	(hl), e
;main.c:1293: if(anim_state == 0) // down walking
	ld	a, e
	or	a, a
	jr	NZ, 00122$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;main.c:1297: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:1300: character->spritids[1] = 1;
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
;main.c:1303: character->spritids[3] = 2;
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
;main.c:1306: character->spritids[2] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jp	00123$
00122$:
;main.c:1308: else if(anim_state == 1) // down standing
	ld	a, e
	dec	a
	jr	NZ, 00119$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;main.c:1312: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:1315: character->spritids[1] = 1;
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
;main.c:1318: character->spritids[2] = 2;
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
;main.c:1321: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jp	00123$
00119$:
;main.c:1323: else if(anim_state == 2) // left walking
	ld	a, e
	sub	a, #0x02
	jr	NZ, 00116$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x04
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:1327: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x05
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:1330: character->spritids[1] = 1;
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
;main.c:1333: character->spritids[2] = 2;
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
;main.c:1336: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jp	00123$
00116$:
;main.c:1338: else if(anim_state == 3) // left standing
	ld	a, e
	sub	a, #0x03
	jr	NZ, 00113$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x08
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:1342: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x09
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:1345: character->spritids[1] = 1;
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
;main.c:1348: character->spritids[2] = 2;
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
;main.c:1351: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jp	00123$
00113$:
;main.c:1353: else if(anim_state == 4) // right walking
	ld	a, e
	sub	a, #0x04
	jr	NZ, 00110$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x05
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:1357: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x04
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:1360: character->spritids[1] = 1;
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
;main.c:1363: character->spritids[2] = 2;
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
;main.c:1366: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jp	00123$
00110$:
;main.c:1368: else if(anim_state == 5) // right standing
	ld	a, e
	sub	a, #0x05
	jr	NZ, 00107$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x09
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:1372: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x08
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:1375: character->spritids[1] = 1;
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
;main.c:1378: character->spritids[2] = 2;
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
;main.c:1381: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jr	00123$
00107$:
;main.c:1383: else if(anim_state == 6) // up walking
	ld	a, e
	sub	a, #0x06
	jr	NZ, 00104$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0c
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:1387: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0d
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:1390: character->spritids[1] = 1;
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
;main.c:1393: character->spritids[2] = 2;
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
;main.c:1396: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jr	00123$
00104$:
;main.c:1398: else if(anim_state == 7) // up standing
	ld	a, e
	sub	a, #0x07
	jr	NZ, 00123$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0c
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:1402: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0d
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:1405: character->spritids[1] = 1;
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
;main.c:1408: character->spritids[2] = 2;
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
;main.c:1411: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
00123$:
;main.c:1414: move_player(character, character->x, character->y);
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
;main.c:1415: }
	ret
;main.c:1417: void setup_character(struct GameCharacter* character, UINT8 x, UINT8 y)
;	---------------------------------
; Function setup_character
; ---------------------------------
_setup_character::
	add	sp, #-5
	ld	c, e
	ld	b, d
	ldhl	sp,	#4
	ld	(hl), a
;main.c:1419: character->x = x;
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
;main.c:1420: character->y = y;
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
;main.c:1421: character->width = 16;
	ld	hl, #0x0006
	add	hl, bc
	ld	(hl), #0x10
;main.c:1422: character->height = 16;
	ld	hl, #0x0007
	add	hl, bc
	ld	(hl), #0x10
;main.c:1423: character->anim = 0;
	ld	hl, #0x0008
	add	hl, bc
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;main.c:1427: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:1430: character->spritids[1] = 1;
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
;main.c:1433: character->spritids[2] = 2;
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
;main.c:1436: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
;main.c:1438: move_player(character, character->x, character->y);
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
;main.c:1439: }
	add	sp, #5
	pop	hl
	inc	sp
	jp	(hl)
;main.c:1441: void setup_player(void)
;	---------------------------------
; Function setup_player
; ---------------------------------
_setup_player::
;main.c:1443: setup_character(&girl, PLAYER_SPAWN_X, PLAYER_SPAWN_Y);
	ld	a, #0x24
	push	af
	inc	sp
	ld	a, #0x50
	ld	de, #_girl
	call	_setup_character
;main.c:1444: }
	ret
;main.c:1446: void setupslime(void)
;	---------------------------------
; Function setupslime
; ---------------------------------
_setupslime::
;main.c:1448: slime.x = rand() % 128 + 16;
	call	_rand
	ld	a, e
	res	7, a
	add	a, #0x10
	ld	(#(_slime + 4)),a
;main.c:1449: slime.y = rand() % 96 + 24;
	call	_rand
	ld	a, e
	ld	e, #0x60
	call	__moduchar
	ld	a, c
	add	a, #0x18
	ld	hl, #(_slime + 5)
;main.c:1450: slime.width = 8;
	ld	(hl+), a
	ld	(hl), #0x08
;main.c:1451: slime.height = 8;
	ld	hl, #_slime + 7
	ld	(hl), #0x08
;main.c:1452: slime.anim = 0;
	ld	hl, #_slime + 8
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 90)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x10
	ld	(hl+), a
	ld	(hl), #0x10
;main.c:1456: slime.spritids[0] = 22;
	ld	hl, #_slime
	ld	(hl), #0x16
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 94)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x11
	ld	(hl+), a
	ld	(hl), #0x10
;main.c:1459: slime.spritids[1] = 23;
	ld	hl, #_slime + 1
	ld	(hl), #0x17
;main.c:1461: move_enemy_small(&slime, slime.x, slime.y);
	ld	hl, #(_slime + 5)
	ld	b, (hl)
	ld	a, (#(_slime + 4) + 0)
	push	bc
	inc	sp
	ld	de, #_slime
	call	_move_enemy_small
;main.c:1462: }
	ret
;main.c:1464: void setupsword(void)
;	---------------------------------
; Function setupsword
; ---------------------------------
_setupsword::
;main.c:1466: sword.x = 100;
	ld	hl, #_sword + 2
	ld	(hl), #0x64
;main.c:1467: sword.y = 100;
	ld	hl, #_sword + 3
	ld	(hl), #0x64
;main.c:1468: sword.width = 8;
	ld	hl, #_sword + 4
	ld	(hl), #0x08
;main.c:1469: sword.height = 8;
	ld	hl, #_sword + 5
	ld	(hl), #0x08
;main.c:1470: sword.anim = 0;
	ld	hl, #_sword + 6
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x12
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:1475: sword.spritids[0] = 4;
	ld	hl, #_sword
	ld	(hl), #0x04
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x13
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:1478: sword.spritids[1] = 5;
	ld	hl, #_sword + 1
	ld	(hl), #0x05
;main.c:1481: }
	ret
;main.c:1484: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
	add	sp, #-9
;main.c:1486: init_title_screen();
	call	_init_title_screen
;main.c:1488: while(1)
00245$:
;main.c:1490: UINT8 current_pad = joypad();
	call	_joypad
;main.c:1492: if((current_pad & J_START) && !(prev_pad & J_START))
	ldhl	sp,#0
	ld	(hl), a
	ld	a, (hl+)
	and	a, #0x80
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	or	a, (hl)
	jp	Z, 00117$
	ld	a, (_prev_pad)
	rlca
	jp	C, 00117$
;main.c:1494: if(gamestate == 0)
	ld	hl, #_gamestate
	ld	a, (hl)
	or	a, a
	jp	NZ, 00114$
;main.c:1496: gamestate = 1;
	ld	(hl), #0x01
;main.c:1497: initrand(DIV_REG);
	ldh	a, (_DIV_REG + 0)
	ld	b, #0x00
	ld	c, a
	push	bc
	call	_initrand
	pop	hl
;main.c:1498: font_set(ui_font);
	ld	a, (_ui_font)
	ld	e, a
	ld	hl, #_ui_font + 1
	ld	d, (hl)
	push	de
	call	_font_set
	pop	hl
;main.c:1499: audio_init();
	call	_audio_init
;main.c:1501: set_bkg_data(37, 8, backgroundtiles);
	ld	de, #_backgroundtiles
	push	de
	ld	hl, #0x825
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:1502: set_bkg_tiles(0, 0, 20, 16, backgroundmap);
	ld	de, #_backgroundmap
	push	de
	ld	hl, #0x1014
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:1504: set_win_tiles(0, 0, 20, 2, windowmap);
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
;main.c:1509: set_sprite_data(0, 22, Girl);
	ld	de, #_Girl
	push	de
	ld	hl, #0x1600
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:1510: setup_player();
	call	_setup_player
;main.c:1511: init_player_stats();
	call	_init_player_stats
;main.c:1512: update_window_stats_ui();
	call	_update_window_stats_ui
;main.c:1513: setupsword();
	call	_setupsword
;main.c:1514: load_room(room);  // Initialize room after sprite data is loaded
	ld	a, (_room)
	call	_load_room
;main.c:1522: BGP_REG  = 0xE4; // Background palette (light fill uses C1)
	ld	a, #0xe4
	ldh	(_BGP_REG + 0), a
;main.c:1523: OBP0_REG = 0xE0; // Sprite palette 0: Girl/Sword (old colors)
	ld	a, #0xe0
	ldh	(_OBP0_REG + 0), a
;main.c:1524: OBP1_REG = 0xE4; // Sprite palette 1: Slimes (clear, light, dark, black)
	ld	a, #0xe4
	ldh	(_OBP1_REG + 0), a
;main.c:1525: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:1526: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:1527: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;main.c:1528: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
	jp	00117$
00114$:
;main.c:1530: else if(gamestate == 1 && player_stats.is_dead == 1)
	ld	a, (#_gamestate)
	dec	a
	ld	a, #0x01
	jr	Z, 00831$
	xor	a, a
00831$:
	ld	c, a
	or	a, a
	jr	Z, 00110$
	ld	a, (#(_player_stats + 6) + 0)
;main.c:1532: room = 0;
;main.c:1533: locktimer = 0;
	dec	a
	jr	NZ, 00110$
	ld	(#_room), a
	ld	(#_locktimer),a
;main.c:1534: knockback_timer = 0;
;main.c:1535: knockback_dx = 0;
	xor	a, a
	ld	(#_knockback_timer), a
	ld	(#_knockback_dx),a
;main.c:1536: knockback_dy = 0;
;main.c:1537: room_cleared = 0;
	xor	a, a
	ld	(#_knockback_dy), a
	ld	(#_room_cleared),a
;main.c:1538: reward_active = 0;
;main.c:1539: reward_claimed = 0;
	xor	a, a
	ld	(#_reward_active), a
	ld	(#_reward_claimed),a
;main.c:1540: can_transition = 0;
;main.c:1541: room_clear_timer = 0;
	xor	a, a
	ld	(#_can_transition), a
	ld	(#_room_clear_timer),a
;main.c:1542: transition_cooldown_timer = 0;
	xor	a, a
	ld	(#_transition_cooldown_timer),a
;main.c:1544: setup_player();
	call	_setup_player
;main.c:1545: init_player_stats();
	call	_init_player_stats
;main.c:1546: setupsword();
	call	_setupsword
;main.c:1547: load_room(room);
	ld	a, (_room)
	call	_load_room
;main.c:1549: set_win_tiles(0, 0, 20, 2, windowmap);
	ld	de, #_windowmap
	push	de
	ld	hl, #0x214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
;main.c:1550: hide_pause_ui();
	call	_hide_pause_ui
;main.c:1551: hide_room_clear_ui();
	call	_hide_room_clear_ui
;main.c:1552: hide_reward_ui();
	call	_hide_reward_ui
;main.c:1553: hide_ready_ui();
	call	_hide_ready_ui
;main.c:1554: update_window_stats_ui();
	call	_update_window_stats_ui
	jr	00117$
00110$:
;main.c:1556: else if(gamestate == 1 && room_cleared == 0 && reward_active == 0 && can_transition == 0)
	ld	a, c
	or	a, a
	jr	Z, 00104$
	ld	a, (#_room_cleared)
	or	a, a
	jr	NZ, 00104$
	ld	a, (#_reward_active)
	or	a, a
	jr	NZ, 00104$
	ld	a, (#_can_transition)
	or	a, a
	jr	NZ, 00104$
;main.c:1558: gamestate = 2;
	ld	hl, #_gamestate
	ld	(hl), #0x02
;main.c:1559: show_pause_ui();
	call	_show_pause_ui
	jr	00117$
00104$:
;main.c:1561: else if(gamestate == 2)
	ld	a, (#_gamestate)
	sub	a, #0x02
	jr	NZ, 00117$
;main.c:1563: gamestate = 1;
	ld	hl, #_gamestate
	ld	(hl), #0x01
;main.c:1564: hide_pause_ui();
	call	_hide_pause_ui
00117$:
;main.c:1568: if(gamestate == 0)
	ld	a, (#_gamestate)
	or	a, a
	jr	NZ, 00120$
;main.c:1570: update_title_screen();
	call	_update_title_screen
00120$:
;main.c:1573: if(gamestate == 1)
	ld	a, (#_gamestate)
	dec	a
	jp	NZ, 00243$
;main.c:1575: struct GameCharacter* active_player = &girl;
;main.c:1577: if(player_stats.is_dead == 0 && locktimer == 0 && knockback_timer == 0 && enemy_start_delay_timer == 0)
	ld	a, (#(_player_stats + 6) + 0)
	or	a, a
	jp	NZ, 00182$
	ld	a, (#_locktimer)
	or	a, a
	jp	NZ, 00182$
	ld	a, (#_knockback_timer)
	or	a, a
	jp	NZ, 00182$
	ld	a, (#_enemy_start_delay_timer)
	or	a, a
	jp	NZ, 00182$
;main.c:1579: if(joypad() & J_LEFT)
	call	_joypad
;main.c:1583: if(active_player->x > MIN_GIRL_X)
;main.c:1586: if(distance_to_min_x < player_stats.speed)
;main.c:1596: if(active_player->anim != 2 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
;main.c:1579: if(joypad() & J_LEFT)
	bit	1,a
	jr	Z, 00136$
;main.c:1581: direction = 2;
	ld	hl, #_direction
	ld	(hl), #0x02
;main.c:1582: move_weapon(&sword, active_player);
	ld	bc, #_girl
	ld	de, #_sword
	call	_move_weapon
;main.c:1583: if(active_player->x > MIN_GIRL_X)
	ld	hl, #(_girl + 4)
	ld	c, (hl)
	ld	a, #0x17
	sub	a, c
	jr	NC, 00125$
;main.c:1585: UINT8 distance_to_min_x = active_player->x - MIN_GIRL_X;
	ld	a, c
	add	a, #0xe9
;main.c:1586: if(distance_to_min_x < player_stats.speed)
	ld	hl, #(_player_stats + 4)
	ld	b, (hl)
	sub	a, b
	jr	NC, 00122$
;main.c:1588: active_player->x = MIN_GIRL_X;
	ld	hl, #(_girl + 4)
	ld	(hl), #0x17
	jr	00125$
00122$:
;main.c:1592: active_player->x -= player_stats.speed;
	ld	a, c
	sub	a, b
	ld	(#(_girl + 4)),a
00125$:
;main.c:1596: if(active_player->anim != 2 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	ld	a, (#(_girl + 8) + 0)
	sub	a, #0x02
	jr	Z, 00131$
	call	_joypad
	bit	2, a
	jr	NZ, 00131$
	call	_joypad
	bit	3, a
	jr	NZ, 00131$
;main.c:1598: character_set_sprite(active_player, 2);
	ld	a, #0x02
	ld	de, #_girl
	call	_character_set_sprite
	jr	00136$
00131$:
;main.c:1600: else if(active_player->anim != 3 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	ld	a, (#(_girl + 8) + 0)
	sub	a, #0x03
	jr	Z, 00136$
	call	_joypad
	bit	2, a
	jr	NZ, 00136$
	call	_joypad
	bit	3, a
	jr	NZ, 00136$
;main.c:1602: character_set_sprite(active_player, 3);
	ld	a, #0x03
	ld	de, #_girl
	call	_character_set_sprite
00136$:
;main.c:1605: if(joypad() & J_RIGHT)
	call	_joypad
	rrca
	jr	NC, 00152$
;main.c:1607: direction = 3;
	ld	hl, #_direction
	ld	(hl), #0x03
;main.c:1608: move_weapon(&sword, active_player);
	ld	bc, #_girl
	ld	de, #_sword
	call	_move_weapon
;main.c:1609: if(active_player->x < MAX_GIRL_X)
	ld	a, (#(_girl + 4) + 0)
	ldhl	sp,#7
	ld	(hl), a
	ld	a, (hl)
	sub	a, #0x8a
	jr	NC, 00141$
;main.c:1611: UINT8 distance_to_max_x = MAX_GIRL_X - active_player->x;
	ld	a, (hl+)
	ld	(hl), a
	ld	a, #0x8a
	sub	a, (hl)
;main.c:1612: if(distance_to_max_x < player_stats.speed)
	ld	hl, #(_player_stats + 4)
	ld	c, (hl)
	sub	a, c
	jr	NC, 00138$
;main.c:1614: active_player->x = MAX_GIRL_X;
	ld	hl, #(_girl + 4)
	ld	(hl), #0x8a
	jr	00141$
00138$:
;main.c:1618: active_player->x += player_stats.speed;
	ldhl	sp,	#7
	ld	a, (hl)
	add	a, c
	ld	(#(_girl + 4)),a
00141$:
;main.c:1623: if(active_player->anim != 4 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	ld	a, (#(_girl + 8) + 0)
	sub	a, #0x04
	jr	Z, 00147$
	call	_joypad
	bit	2, a
	jr	NZ, 00147$
	call	_joypad
	bit	3, a
	jr	NZ, 00147$
;main.c:1625: character_set_sprite(active_player, 4);
	ld	a, #0x04
	ld	de, #_girl
	call	_character_set_sprite
	jr	00152$
00147$:
;main.c:1627: else if(active_player->anim != 5 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	ld	a, (#(_girl + 8) + 0)
	sub	a, #0x05
	jr	Z, 00152$
	call	_joypad
	bit	2, a
	jr	NZ, 00152$
	call	_joypad
	bit	3, a
	jr	NZ, 00152$
;main.c:1629: character_set_sprite(active_player, 5);
	ld	a, #0x05
	ld	de, #_girl
	call	_character_set_sprite
00152$:
;main.c:1632: if(joypad() & J_UP)
	call	_joypad
;main.c:1636: if(active_player->y > MIN_GIRL_Y)
;main.c:1632: if(joypad() & J_UP)
	bit	2,a
	jr	Z, 00164$
;main.c:1634: direction = 1;
	ld	hl, #_direction
	ld	(hl), #0x01
;main.c:1635: move_weapon(&sword, active_player);
	ld	bc, #_girl
	ld	de, #_sword
	call	_move_weapon
;main.c:1636: if(active_player->y > MIN_GIRL_Y)
	ld	hl, #(_girl + 5)
	ld	c, (hl)
	ld	a, #0x14
	sub	a, c
	jr	NC, 00157$
;main.c:1638: UINT8 distance_to_min_y = active_player->y - MIN_GIRL_Y;
	ld	a, c
	add	a, #0xec
;main.c:1639: if(distance_to_min_y < player_stats.speed)
	ld	hl, #(_player_stats + 4)
	ld	b, (hl)
	sub	a, b
	jr	NC, 00154$
;main.c:1641: active_player->y = MIN_GIRL_Y;
	ld	hl, #(_girl + 5)
	ld	(hl), #0x14
	jr	00157$
00154$:
;main.c:1645: active_player->y -= player_stats.speed;
	ld	a, c
	sub	a, b
	ld	(#(_girl + 5)),a
00157$:
;main.c:1648: if(active_player->anim != 6)
	ld	a, (#(_girl + 8) + 0)
	cp	a, #0x06
	jr	Z, 00161$
;main.c:1650: character_set_sprite(active_player, 6);
	ld	a, #0x06
	ld	de, #_girl
	call	_character_set_sprite
	jr	00164$
00161$:
;main.c:1652: else if(active_player->anim != 7)
	sub	a, #0x07
	jr	Z, 00164$
;main.c:1654: character_set_sprite(active_player, 7);
	ld	a, #0x07
	ld	de, #_girl
	call	_character_set_sprite
00164$:
;main.c:1657: if(joypad() & J_DOWN)
	call	_joypad
	bit	3, a
	jr	Z, 00176$
;main.c:1659: direction = 0;
	xor	a, a
	ld	(#_direction),a
;main.c:1660: move_weapon(&sword, active_player);
	ld	bc, #_girl
	ld	de, #_sword
	call	_move_weapon
;main.c:1661: if(active_player->y < MAX_GIRL_Y)
	ld	hl, #(_girl + 5)
	ld	c, (hl)
	ld	a, c
	sub	a, #0x71
	jr	NC, 00169$
;main.c:1663: UINT8 distance_to_max_y = MAX_GIRL_Y - active_player->y;
	ld	b, c
	ld	a, #0x71
	sub	a, b
;main.c:1664: if(distance_to_max_y < player_stats.speed)
	ld	hl, #(_player_stats + 4)
	ld	b, (hl)
	sub	a, b
	jr	NC, 00166$
;main.c:1666: active_player->y = MAX_GIRL_Y;
	ld	hl, #(_girl + 5)
	ld	(hl), #0x71
	jr	00169$
00166$:
;main.c:1670: active_player->y += player_stats.speed;
	ld	a, c
	add	a, b
	ld	(#(_girl + 5)),a
00169$:
;main.c:1674: if(active_player->anim != 0)
	ld	a, (#(_girl + 8) + 0)
	or	a, a
	jr	Z, 00173$
;main.c:1676: character_set_sprite(active_player, 0);
	xor	a, a
	ld	de, #_girl
	call	_character_set_sprite
	jr	00176$
00173$:
;main.c:1678: else if(active_player->anim != 1)
	dec	a
	jr	Z, 00176$
;main.c:1680: character_set_sprite(active_player, 1);
	ld	a, #0x01
	ld	de, #_girl
	call	_character_set_sprite
00176$:
;main.c:1684: if((joypad() & J_A) && !(prev_pad & J_A) && reward_active == 0)
	call	_joypad
	bit	4, a
	jr	Z, 00182$
	ld	a, (_prev_pad)
	bit	4, a
	jr	NZ, 00182$
	ld	a, (#_reward_active)
	or	a, a
	jr	NZ, 00182$
;main.c:1686: attack(active_player, &sword);
	ld	bc, #_sword
	ld	de, #_girl
	call	_attack
00182$:
;main.c:1690: if(player_stats.is_dead == 1)
	ld	a, (#(_player_stats + 6) + 0)
	dec	a
	jr	NZ, 00187$
;main.c:1692: hide_character_sprites(active_player);
	ld	de, #_girl
	call	_hide_character_sprites
00187$:
;main.c:1695: update_timers(active_player, &sword);
	ld	bc, #_sword
	ld	de, #_girl
	call	_update_timers
;main.c:1697: if(player_stats.is_dead == 1)
	ld	a, (#(_player_stats + 6) + 0)
	dec	a
	jr	NZ, 00189$
;main.c:1699: hide_character_sprites(active_player);
	ld	de, #_girl
	call	_hide_character_sprites
;main.c:1700: hide_sword_sprites(&sword);
	ld	de, #_sword
	call	_hide_sword_sprites
;main.c:1701: hide_pause_ui();
	call	_hide_pause_ui
;main.c:1702: hide_room_clear_ui();
	call	_hide_room_clear_ui
;main.c:1703: hide_reward_ui();
	call	_hide_reward_ui
;main.c:1704: hide_ready_ui();
	call	_hide_ready_ui
;main.c:1705: show_game_over_ui();
	call	_show_game_over_ui
;main.c:1707: prev_pad = current_pad;
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(#_prev_pad),a
;main.c:1708: performantdelay(5);
	ld	a, #0x05
	call	_performantdelay
;main.c:1709: continue;
	jp	00245$
00189$:
;main.c:1712: UINT8 can_enemies_move = 1;
	ldhl	sp,	#3
;main.c:1713: UINT8 delay_active = 0;
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:1714: if(enemy_start_delay_timer > 0)
	ld	a, (#_enemy_start_delay_timer)
	or	a, a
	jr	Z, 00191$
;main.c:1716: delay_active = 1;
	ldhl	sp,	#4
	ld	(hl), #0x01
;main.c:1717: enemy_start_delay_timer--;
	ld	hl, #_enemy_start_delay_timer
	dec	(hl)
;main.c:1718: can_enemies_move = 0;
	ldhl	sp,	#3
	ld	(hl), #0x00
00191$:
;main.c:1722: UINT8 all_enemies_dead = 1;
	ldhl	sp,	#5
	ld	(hl), #0x01
;main.c:1723: for(UINT8 i = 0; i < current_enemy_count; i++)
	ldhl	sp,	#8
	ld	(hl), #0x00
00249$:
	ldhl	sp,	#8
	ld	a, (hl)
	ld	hl, #_current_enemy_count
	sub	a, (hl)
	jr	NC, 00199$
;main.c:1725: if(enemies[i].death == 0)
	ldhl	sp,	#8
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
;main.c:1730: slime_can_move(&enemies[i], active_player);
	ldhl	sp,	#6
	ld	(hl), c
	inc	hl
	ld	(hl), b
;main.c:1725: if(enemies[i].death == 0)
	or	a, a
	jr	NZ, 00197$
;main.c:1727: all_enemies_dead = 0;
	dec	hl
	dec	hl
;main.c:1728: if(can_enemies_move)
	xor	a, a
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	or	a, a
	jr	Z, 00193$
;main.c:1730: slime_can_move(&enemies[i], active_player);
	ld	bc, #_girl
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_slime_can_move
00193$:
;main.c:1732: animate_enemy(&enemies[i], 16, 17);
	ld	a, #0x11
	push	af
	inc	sp
	ld	a, #0x10
	ldhl	sp,	#7
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_animate_enemy
	jr	00250$
00197$:
;main.c:1734: else if(enemies[i].death == 1)
	dec	a
	jr	NZ, 00250$
;main.c:1736: enemies[i].x = 0;
	ld	hl, #0x0004
	add	hl, bc
	ld	(hl), #0x00
;main.c:1737: enemies[i].y = 0;
	ld	hl, #0x0005
	add	hl, bc
	ld	(hl), #0x00
;main.c:1738: move_enemy_small(&enemies[i], 0, 0);
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	ldhl	sp,	#7
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_move_enemy_small
00250$:
;main.c:1723: for(UINT8 i = 0; i < current_enemy_count; i++)
	ldhl	sp,	#8
	inc	(hl)
	jr	00249$
00199$:
;main.c:1742: resolve_enemy_collisions();
	call	_resolve_enemy_collisions
;main.c:1744: for(UINT8 i = 0; i < current_enemy_count; i++)
	ld	c, #0x00
00252$:
	ld	a, c
	ld	hl, #_current_enemy_count
	sub	a, (hl)
	jr	NC, 00202$
;main.c:1746: if(enemies[i].death == 0)
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
	jr	NZ, 00253$
;main.c:1748: move_enemy_small(&enemies[i], enemies[i].x, enemies[i].y);
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
00253$:
;main.c:1744: for(UINT8 i = 0; i < current_enemy_count; i++)
	inc	c
	jr	00252$
00202$:
;main.c:1752: if(all_enemies_dead)
	ldhl	sp,	#5
	ld	a, (hl)
	or	a, a
	jp	Z, 00224$
;main.c:1754: hide_ready_ui();
	call	_hide_ready_ui
;main.c:1756: if(room_cleared == 0)
	ld	hl, #_room_cleared
	ld	a, (hl)
	or	a, a
	jr	NZ, 00204$
;main.c:1758: room_cleared = 1;
	ld	(hl), #0x01
;main.c:1759: room_clear_timer = ROOM_CLEAR_SHOW_FRAMES;
	ld	hl, #_room_clear_timer
	ld	(hl), #0x0f
00204$:
;main.c:1762: if(room_clear_timer > 0)
	ld	hl, #_room_clear_timer
	ld	a, (hl)
	or	a, a
	jr	Z, 00215$
;main.c:1764: room_clear_timer--;
	dec	(hl)
;main.c:1765: hide_reward_ui();
	call	_hide_reward_ui
;main.c:1766: show_room_clear_ui();
	call	_show_room_clear_ui
	jp	00225$
00215$:
;main.c:1770: if(reward_claimed == 0 && reward_active == 0)
	ld	a, (#_reward_claimed)
	or	a, a
	jr	NZ, 00206$
	ld	a, (#_reward_active)
	or	a, a
	jr	NZ, 00206$
;main.c:1772: roll_room_reward();
	call	_roll_room_reward
;main.c:1773: reward_active = 1;
	ld	hl, #_reward_active
	ld	(hl), #0x01
00206$:
;main.c:1776: if(reward_active)
	ld	a, (#_reward_active)
	or	a, a
	jr	Z, 00212$
;main.c:1778: hide_room_clear_ui();
	call	_hide_room_clear_ui
;main.c:1779: show_reward_ui(reward_type);
	ld	a, (_reward_type)
	call	_show_reward_ui
;main.c:1781: if((current_pad & J_START) && !(prev_pad & J_START))
	xor	a, a
	ldhl	sp,	#1
	or	a, (hl)
	jr	Z, 00225$
	ld	a, (_prev_pad)
	rlca
	jr	C, 00225$
;main.c:1783: apply_reward(reward_type);
	ld	a, (_reward_type)
	call	_apply_reward
;main.c:1784: reward_active = 0;
	xor	a, a
	ld	(#_reward_active),a
;main.c:1785: reward_claimed = 1;
	ld	hl, #_reward_claimed
	ld	(hl), #0x01
;main.c:1786: can_transition = 1;
	ld	hl, #_can_transition
	ld	(hl), #0x01
;main.c:1787: transition_cooldown_timer = TRANSITION_COOLDOWN_FRAMES;
	ld	hl, #_transition_cooldown_timer
	ld	(hl), #0x0a
;main.c:1788: hide_reward_ui();
	call	_hide_reward_ui
;main.c:1789: hide_room_clear_ui();
	call	_hide_room_clear_ui
;main.c:1790: update_window_stats_ui();
	call	_update_window_stats_ui
	jr	00225$
00212$:
;main.c:1795: hide_reward_ui();
	call	_hide_reward_ui
;main.c:1796: hide_room_clear_ui();
	call	_hide_room_clear_ui
	jr	00225$
00224$:
;main.c:1802: room_cleared = 0;
;main.c:1803: reward_active = 0;
	xor	a, a
	ld	(#_room_cleared), a
	ld	(#_reward_active),a
;main.c:1804: reward_claimed = 0;
;main.c:1805: can_transition = 0;
	xor	a, a
	ld	(#_reward_claimed), a
	ld	(#_can_transition),a
;main.c:1806: room_clear_timer = 0;
;main.c:1807: transition_cooldown_timer = 0;
	xor	a, a
	ld	(#_room_clear_timer), a
	ld	(#_transition_cooldown_timer),a
;main.c:1808: hide_room_clear_ui();
	call	_hide_room_clear_ui
;main.c:1809: hide_reward_ui();
	call	_hide_reward_ui
;main.c:1811: if(delay_active)
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	Z, 00221$
;main.c:1813: if(enemy_start_delay_timer & 0x04)
	ld	a, (_enemy_start_delay_timer)
	bit	2, a
	jr	Z, 00218$
;main.c:1815: show_ready_ui();
	call	_show_ready_ui
	jr	00225$
00218$:
;main.c:1819: hide_ready_ui();
	call	_hide_ready_ui
	jr	00225$
00221$:
;main.c:1824: hide_ready_ui();
	call	_hide_ready_ui
00225$:
;main.c:1829: animtimer++;
	ld	hl, #_animtimer
	inc	(hl)
;main.c:1830: if(animtimer == ANIM_TIMER_MAX)
	ld	a, (hl)
	sub	a, #0x14
	jr	NZ, 00228$
;main.c:1832: animtimer = 0;
	xor	a, a
	ld	(#_animtimer),a
;main.c:1833: for(UINT8 i = 0; i < current_enemy_count; i++)
	ld	bc, #_enemies
	ldhl	sp,	#8
	ld	(hl), #0x00
00255$:
	ldhl	sp,	#8
	ld	a, (hl)
	ld	hl, #_current_enemy_count
	sub	a, (hl)
	jr	NC, 00228$
;main.c:1835: enemies[i].anim = (enemies[i].anim == 0) ? 1 : 0;
	ldhl	sp,	#8
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
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	ld	a, #0x01
	jr	Z, 00263$
	xor	a, a
00263$:
	ldhl	sp,	#6
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;main.c:1833: for(UINT8 i = 0; i < current_enemy_count; i++)
	ldhl	sp,	#8
	inc	(hl)
	jr	00255$
00228$:
;main.c:1840: if(player_stats.is_dead == 0)
	ld	a, (#(_player_stats + 6) + 0)
	or	a, a
	jr	NZ, 00231$
;main.c:1842: for(UINT8 i = 0; i < current_enemy_count; i++)
	ldhl	sp,	#8
	ld	(hl), #0x00
00258$:
	ldhl	sp,	#8
	ld	a, (hl)
	ld	hl, #_current_enemy_count
	sub	a, (hl)
	jr	NC, 00231$
;main.c:1844: character_enemy_collision(active_player, &enemies[i]);
	ldhl	sp,	#8
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
;main.c:1842: for(UINT8 i = 0; i < current_enemy_count; i++)
	ldhl	sp,	#8
	inc	(hl)
	jr	00258$
00231$:
;main.c:1848: if(can_transition == 1)
	ld	a, (#_can_transition)
	dec	a
	jr	NZ, 00243$
;main.c:1850: if(transition_cooldown_timer > 0)
	ld	hl, #_transition_cooldown_timer
	ld	a, (hl)
	or	a, a
	jr	Z, 00238$
;main.c:1852: transition_cooldown_timer--;
	dec	(hl)
	jr	00243$
00238$:
;main.c:1492: if((current_pad & J_START) && !(prev_pad & J_START))
	ld	a, (_prev_pad)
	ld	c, a
;main.c:1854: else if(((current_pad & J_A) && !(prev_pad & J_A)) ||
	push	hl
	ldhl	sp,	#2
	bit	4, (hl)
	pop	hl
	jr	Z, 00236$
	bit	4, c
	jr	Z, 00232$
00236$:
;main.c:1855: ((current_pad & J_START) && !(prev_pad & J_START)))
	xor	a, a
	ldhl	sp,	#1
	or	a, (hl)
	jr	Z, 00243$
	bit	7, c
	jr	NZ, 00243$
00232$:
;main.c:1857: room = (room + 1) % TOTAL_ROOMS;
	ld	a, (_room)
	ld	d, #0x00
	ld	e, a
	inc	de
	ld	bc, #0x0002
	call	__modsint
	ld	hl, #_room
	ld	(hl), c
;main.c:1858: load_room(room);
	ld	a, (hl)
	call	_load_room
00243$:
;main.c:1900: prev_pad = current_pad;
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(#_prev_pad),a
;main.c:1901: update_window_stats_ui();
	call	_update_window_stats_ui
;main.c:1902: performantdelay(5);
	ld	a, #0x05
	call	_performantdelay
	jp	00245$
;main.c:1905: }
	add	sp, #9
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
__xinit__current_enemy_count:
	.db #0x04	; 4
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
__xinit__room_cleared:
	.db #0x00	; 0
__xinit__reward_active:
	.db #0x00	; 0
__xinit__reward_claimed:
	.db #0x00	; 0
__xinit__can_transition:
	.db #0x00	; 0
__xinit__reward_type:
	.db #0x00	; 0
__xinit__room_clear_timer:
	.db #0x00	; 0
__xinit__transition_cooldown_timer:
	.db #0x00	; 0
__xinit__knockback_timer:
	.db #0x00	; 0
__xinit__knockback_dx:
	.db #0x00	;  0
__xinit__knockback_dy:
	.db #0x00	;  0
	.area _CABS (ABS)
