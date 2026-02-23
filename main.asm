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
	.globl _enemy_hp_multiplier
	.globl _stage
	.globl _windowmap
	.globl _backgroundmap
	.globl _backgroundtiles
	.globl _Boss
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
	.globl _boss_ai
	.globl _count_alive_slimes
	.globl _spawn_slime_near_boss
	.globl _spawn_boss_death_slimes
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
	.globl _room_3
	.globl _room_4
	.globl _room_2
	.globl _room_5
	.globl _load_room
	.globl _performantdelay
	.globl _character_enemy_collision
	.globl _hide_character_sprites
	.globl _hide_sword_sprites
	.globl _hide_enemy_sprites
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
	.ds 20
_player_stats::
	.ds 7
_enemies::
	.ds 200
_hit_this_attack::
	.ds 10
_ui_font::
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_Girl::
	.ds 368
_Boss::
	.ds 144
_backgroundtiles::
	.ds 144
_backgroundmap::
	.ds 360
_windowmap::
	.ds 40
_stage::
	.ds 1
_enemy_hp_multiplier::
	.ds 1
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
;main.c:338: void draw_press_start(UINT8 visible)
;	---------------------------------
; Function draw_press_start
; ---------------------------------
_draw_press_start::
	add	sp, #-11
	ld	c, a
;main.c:340: const UINT8 press_start_tiles[11] = {
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
;main.c:346: for(UINT8 i = 0; i < 11; i++)
	ld	b, #0x00
00103$:
	ld	a, b
	sub	a, #0x0b
	jr	NC, 00105$
;main.c:348: set_bkg_tile_xy(START_X + i, START_Y, visible ? press_start_tiles[i] : 0);
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
;main.c:346: for(UINT8 i = 0; i < 11; i++)
	inc	b
	jr	00103$
00105$:
;main.c:350: }
	add	sp, #11
	ret
;main.c:352: void init_title_screen(void)
;	---------------------------------
; Function init_title_screen
; ---------------------------------
_init_title_screen::
;main.c:354: font_init();
	call	_font_init
;main.c:355: ui_font = font_load(font_min);
	ld	de, #_font_min
	push	de
	call	_font_load
	pop	hl
	ld	hl, #_ui_font
	ld	a, e
	ld	(hl+), a
;main.c:356: font_set(ui_font);
	ld	a, d
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_font_set
	pop	hl
;main.c:358: for(UINT8 y = 0; y < 18; y++)
	ld	e, #0x00
00107$:
	ld	a, e
	sub	a, #0x12
	jr	NC, 00102$
;main.c:360: for(UINT8 x = 0; x < 20; x++)
	ld	d, #0x00
00104$:
	ld	a, d
	sub	a, #0x14
	jr	NC, 00108$
;main.c:362: set_bkg_tile_xy(x, y, 0);
	push	de
	xor	a, a
	push	af
	inc	sp
	ld	a, d
	call	_set_bkg_tile_xy
	pop	de
;main.c:360: for(UINT8 x = 0; x < 20; x++)
	inc	d
	jr	00104$
00108$:
;main.c:358: for(UINT8 y = 0; y < 18; y++)
	inc	e
	jr	00107$
00102$:
;main.c:366: set_bkg_tile_xy(TITLE_X + 0, TITLE_Y, TILE_S);
	ld	a, #0x1d
	push	af
	inc	sp
	ld	e, #0x06
	ld	a, #0x04
	call	_set_bkg_tile_xy
;main.c:367: set_bkg_tile_xy(TITLE_X + 1, TITLE_Y, TILE_L);
	ld	a, #0x16
	push	af
	inc	sp
	ld	e, #0x06
	ld	a, #0x05
	call	_set_bkg_tile_xy
;main.c:368: set_bkg_tile_xy(TITLE_X + 2, TITLE_Y, TILE_I);
	ld	a, #0x13
	push	af
	inc	sp
	ld	a,#0x06
	ld	e,a
	call	_set_bkg_tile_xy
;main.c:369: set_bkg_tile_xy(TITLE_X + 3, TITLE_Y, TILE_M);
	ld	a, #0x17
	push	af
	inc	sp
	ld	e, #0x06
	ld	a, #0x07
	call	_set_bkg_tile_xy
;main.c:370: set_bkg_tile_xy(TITLE_X + 4, TITLE_Y, TILE_E);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	e, #0x06
	ld	a, #0x08
	call	_set_bkg_tile_xy
;main.c:371: set_bkg_tile_xy(TITLE_X + 5, TITLE_Y, 0);
	xor	a, a
	push	af
	inc	sp
	ld	e, #0x06
	ld	a, #0x09
	call	_set_bkg_tile_xy
;main.c:372: set_bkg_tile_xy(TITLE_X + 6, TITLE_Y, TILE_K);
	ld	a, #0x15
	push	af
	inc	sp
	ld	e, #0x06
	ld	a, #0x0a
	call	_set_bkg_tile_xy
;main.c:373: set_bkg_tile_xy(TITLE_X + 7, TITLE_Y, TILE_I);
	ld	a, #0x13
	push	af
	inc	sp
	ld	e, #0x06
	ld	a, #0x0b
	call	_set_bkg_tile_xy
;main.c:374: set_bkg_tile_xy(TITLE_X + 8, TITLE_Y, TILE_L);
	ld	a, #0x16
	push	af
	inc	sp
	ld	e, #0x06
	ld	a, #0x0c
	call	_set_bkg_tile_xy
;main.c:375: set_bkg_tile_xy(TITLE_X + 9, TITLE_Y, TILE_L);
	ld	a, #0x16
	push	af
	inc	sp
	ld	e, #0x06
	ld	a, #0x0d
	call	_set_bkg_tile_xy
;main.c:376: set_bkg_tile_xy(TITLE_X + 10, TITLE_Y, TILE_E);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	e, #0x06
	ld	a, #0x0e
	call	_set_bkg_tile_xy
;main.c:377: set_bkg_tile_xy(TITLE_X + 11, TITLE_Y, TILE_R);
	ld	a, #0x1c
	push	af
	inc	sp
	ld	e, #0x06
	ld	a, #0x0f
	call	_set_bkg_tile_xy
;main.c:379: draw_press_start(1);
	ld	a, #0x01
	call	_draw_press_start
;main.c:380: title_flash_timer = 0;
	xor	a, a
	ld	(#_title_flash_timer),a
;main.c:381: title_flash_visible = 1;
	ld	hl, #_title_flash_visible
	ld	(hl), #0x01
;main.c:383: HIDE_WIN;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xdf
	ldh	(_LCDC_REG + 0), a
;main.c:384: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:385: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:386: }
	ret
;main.c:388: void update_title_screen(void)
;	---------------------------------
; Function update_title_screen
; ---------------------------------
_update_title_screen::
;main.c:390: title_flash_timer++;
	ld	hl, #_title_flash_timer
	inc	(hl)
;main.c:391: if(title_flash_timer >= START_FLASH_FRAMES)
	ld	a, (hl)
	sub	a, #0x04
	ret	C
;main.c:393: title_flash_timer = 0;
	ld	(hl), #0x00
;main.c:394: title_flash_visible = !title_flash_visible;
	ld	hl, #_title_flash_visible
	ld	a, (hl)
	sub	a, #0x01
	ld	a, #0x00
	rla
;main.c:395: draw_press_start(title_flash_visible);
	ld	(hl), a
;main.c:397: }
	jp	_draw_press_start
;main.c:399: void slime_can_move(struct Enemy* enemy, struct GameCharacter* target)
;	---------------------------------
; Function slime_can_move
; ---------------------------------
_slime_can_move::
	add	sp, #-9
	ldhl	sp,	#7
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ldhl	sp,	#5
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:404: if(room < 2 || room == 3 || room == 4 || room == 5)
	ld	a, (#_room)
	cp	a,#0x02
	jr	C, 00101$
	sub	a, #0x03
	jr	Z, 00101$
	ld	a,(#_room)
	cp	a,#0x04
	jr	Z, 00101$
	sub	a, #0x05
	jr	NZ, 00102$
00101$:
;main.c:406: move_interval = SLIME_MOVE_INTERVAL_FAST;
	ld	c, #0x01
	jr	00103$
00102$:
;main.c:410: move_interval = SLIME_MOVE_INTERVAL;
	ld	c, #0x03
00103$:
;main.c:413: if(enemy->move_timer == move_interval)
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000c
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	sub	a, c
	jp	NZ, 00118$
;main.c:415: enemy->move_timer = 0;
	pop	hl
	ld	(hl), #0x00
	push	hl
;main.c:418: if(enemy->type == ENEMY_TYPE_SLIME)
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000d
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
	jr	NZ, 00115$
;main.c:420: slime_ai(target, enemy);
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_slime_ai
	jr	00116$
00115$:
;main.c:422: else if(enemy->type == ENEMY_TYPE_BOSS)
	dec	a
	jr	NZ, 00116$
;main.c:424: boss_ai(target, enemy);
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_boss_ai
;main.c:427: if(enemy->spawn_timer > 0)
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000e
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
	jr	Z, 00110$
;main.c:429: enemy->spawn_timer--;
	dec	hl
	dec	a
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
	jr	00116$
00110$:
;main.c:434: UINT8 slime_count = count_alive_slimes();
	call	_count_alive_slimes
;main.c:435: if(slime_count < BOSS_MAX_SLIMES)
	sub	a, #0x06
	jr	NC, 00108$
;main.c:437: spawn_slime_near_boss(enemy);
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_spawn_slime_near_boss
00108$:
;main.c:441: enemy->spawn_timer = BOSS_SPAWN_MIN_FRAMES + (rand() % (BOSS_SPAWN_MAX_FRAMES - BOSS_SPAWN_MIN_FRAMES + 1));
	call	_rand
	ld	a, e
	ld	e, #0x0b
	call	__moduchar
	ld	a, c
	add	a, #0x14
	ldhl	sp,	#3
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
00116$:
;main.c:445: enemy_check_borders(enemy);
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_enemy_check_borders
;main.c:446: move_enemy_small(enemy, enemy->x, enemy->y);        
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#2
	ld	(hl), a
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
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
	ld	(hl-), a
	dec	hl
	ld	a, (hl+)
	inc	hl
	push	af
	inc	sp
	ld	a, (hl)
	ldhl	sp,	#8
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_move_enemy_small
00118$:
;main.c:448: enemy->move_timer++;
	pop	de
	push	de
	ld	a, (de)
	inc	a
	pop	hl
	push	hl
	ld	(hl), a
;main.c:449: }
	add	sp, #9
	ret
;main.c:451: void resolve_enemy_collisions(void)
;	---------------------------------
; Function resolve_enemy_collisions
; ---------------------------------
_resolve_enemy_collisions::
	add	sp, #-22
;main.c:453: for(UINT8 i = 0; i < current_enemy_count; i++)
	ldhl	sp,	#20
	ld	(hl), #0x00
00126$:
	ldhl	sp,	#20
	ld	a, (hl)
	ld	hl, #_current_enemy_count
	sub	a, (hl)
	jp	NC, 00127$
;main.c:455: if(enemies[i].death == 1)
	ldhl	sp,	#20
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
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
;main.c:460: for(UINT8 j = i + 1; j < current_enemy_count; j++)
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
;main.c:462: if(enemies[j].death == 1)
	ldhl	sp,	#21
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
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
;main.c:467: if(enemies[i].x < enemies[j].x + enemies[j].width &&
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
;main.c:468: enemies[i].x + enemies[i].width > enemies[j].x &&
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
;main.c:469: enemies[i].y < enemies[j].y + enemies[j].height &&
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
;main.c:470: enemies[i].y + enemies[i].height > enemies[j].y)
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
;main.c:472: INT8 dx = (INT8)enemies[i].x - (INT8)enemies[j].x;
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#9
	ld	c, (hl)
	sub	a, c
	ld	c, a
;main.c:473: INT8 dy = (INT8)enemies[i].y - (INT8)enemies[j].y;
	ldhl	sp,	#12
	ld	a, (hl)
	ldhl	sp,	#15
	ld	b, (hl)
	inc	hl
	inc	hl
	sub	a, b
;main.c:474: UINT8 abs_dx = (dx < 0) ? (UINT8)(-dx) : (UINT8)dx;
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
;main.c:475: UINT8 abs_dy = (dy < 0) ? (UINT8)(-dy) : (UINT8)dy;
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
;main.c:477: if(abs_dx >= abs_dy)
	ld	a, c
	sub	a, b
	jr	C, 00112$
;main.c:479: if(dx >= 0)
	ldhl	sp,	#18
	bit	0, (hl)
	jr	NZ, 00106$
;main.c:481: enemies[i].x++;
	ldhl	sp,	#6
	ld	a, (hl-)
	dec	hl
	inc	a
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;main.c:482: enemies[j].x--;
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
;main.c:486: enemies[i].x--;
	ldhl	sp,	#6
	ld	a, (hl-)
	dec	hl
	dec	a
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;main.c:487: enemies[j].x++;
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
;main.c:492: if(dy >= 0)
	ldhl	sp,	#19
	bit	0, (hl)
	jr	NZ, 00109$
;main.c:494: enemies[i].y++;
	ldhl	sp,	#12
	ld	a, (hl-)
	dec	hl
	inc	a
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;main.c:495: enemies[j].y--;
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
;main.c:499: enemies[i].y--;
	ldhl	sp,	#12
	ld	a, (hl-)
	dec	hl
	dec	a
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;main.c:500: enemies[j].y++;
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
;main.c:504: enemy_check_borders(&enemies[i]);
	pop	de
	push	de
	call	_enemy_check_borders
;main.c:505: enemy_check_borders(&enemies[j]);
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_enemy_check_borders
00119$:
;main.c:460: for(UINT8 j = i + 1; j < current_enemy_count; j++)
	ldhl	sp,	#21
	inc	(hl)
	jp	00124$
00121$:
;main.c:453: for(UINT8 i = 0; i < current_enemy_count; i++)
	ldhl	sp,	#20
	inc	(hl)
	jp	00126$
00127$:
;main.c:509: }
	add	sp, #22
	ret
;main.c:512: void slime_ai(struct GameCharacter* character, struct Enemy* enemy)
;	---------------------------------
; Function slime_ai
; ---------------------------------
_slime_ai::
	add	sp, #-15
	ldhl	sp,	#12
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:515: if(enemy->jump_timer > 0)
	ld	hl, #0x0011
	add	hl, bc
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
	ldhl	sp,	#14
	ld	(hl), a
;main.c:520: if(enemy->x != enemy->jump_target_x || enemy->y != enemy->jump_target_y)
	ld	hl, #0x0004
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl), a
	ld	hl, #0x0012
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl), a
	ld	hl, #0x0005
	add	hl, bc
	inc	sp
	inc	sp
	push	hl
	ld	hl, #0x0013
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#12
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#11
	ld	(hl), a
;main.c:556: enemy->anim = 1;
	ld	hl, #0x0008
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), a
;main.c:515: if(enemy->jump_timer > 0)
	ldhl	sp,	#14
	ld	a, (hl)
	or	a, a
	jp	Z, 00128$
;main.c:517: enemy->jump_timer--;
	ld	a, (hl)
	dec	a
	ldhl	sp,	#4
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;main.c:520: if(enemy->x != enemy->jump_target_x || enemy->y != enemy->jump_target_y)
	ldhl	sp,	#6
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl-)
	dec	hl
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	c, a
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#9
	ld	a, (hl-)
	dec	hl
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	sub	a, c
	jr	NZ, 00143$
	inc	hl
	pop	de
	push	de
	ld	a, (de)
	ld	c, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	sub	a, c
	jp	Z, 00116$
;main.c:524: for(UINT8 step = 0; step < 4; step++)
00143$:
	ldhl	sp,	#10
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#11
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#14
	ld	(hl), #0x00
00131$:
	ldhl	sp,	#14
	ld	a, (hl)
	sub	a, #0x04
	jr	NC, 00114$
;main.c:526: if(enemy->jump_target_x > enemy->x)
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#11
	ld	(hl), a
	ld	a, (hl-)
	sub	a, (hl)
	jr	NC, 00104$
;main.c:528: enemy->x++;
	inc	hl
	ld	a, (hl)
	inc	a
	ldhl	sp,	#4
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;main.c:529: moved = 1;
	jr	00105$
00104$:
;main.c:531: else if(enemy->jump_target_x < enemy->x)
	ldhl	sp,	#10
	ld	a, (hl+)
	sub	a, (hl)
	jr	NC, 00105$
;main.c:533: enemy->x--;
	ld	a, (hl)
	dec	a
	ldhl	sp,	#4
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;main.c:534: moved = 1;
00105$:
;main.c:537: if(enemy->jump_target_y > enemy->y)
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	pop	de
	push	de
	ld	a, (de)
	ld	c, a
	sub	a, (hl)
	jr	NC, 00109$
;main.c:539: enemy->y++;
	inc	c
	pop	hl
	push	hl
	ld	(hl), c
;main.c:540: moved = 1;
	jr	00110$
00109$:
;main.c:542: else if(enemy->jump_target_y < enemy->y)
	ldhl	sp,	#11
	ld	a, (hl)
	sub	a, c
	jr	NC, 00110$
;main.c:544: enemy->y--;
	dec	c
	pop	hl
	push	hl
	ld	(hl), c
;main.c:545: moved = 1;
00110$:
;main.c:549: if(enemy->x == enemy->jump_target_x && enemy->y == enemy->jump_target_y)
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	c, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	sub	a, c
	jr	NZ, 00132$
	inc	hl
	pop	de
	push	de
	ld	a, (de)
	ld	c, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	sub	a, c
	jr	Z, 00114$
;main.c:551: break;
00132$:
;main.c:524: for(UINT8 step = 0; step < 4; step++)
	ldhl	sp,	#14
	inc	(hl)
	jr	00131$
00114$:
;main.c:556: enemy->anim = 1;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x01
	jp	00133$
00116$:
;main.c:561: enemy->anim = 0;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
	jp	00133$
00128$:
;main.c:567: enemy->jump_timer = SLIME_JUMP_COOLDOWN;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x14
;main.c:570: INT8 dx = (INT8)character->x - (INT8)enemy->x;
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	b, a
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ld	a, b
	sub	a, c
	ld	b, a
;main.c:571: INT8 dy = (INT8)character->y - (INT8)enemy->y;
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	pop	de
	push	de
	push	af
	ld	a, (de)
	ld	l, a
	pop	af
	ld	e, l
	sub	a, e
	ldhl	sp,	#14
	ld	(hl), a
;main.c:574: if(dx > SLIME_JUMP_DISTANCE) dx = SLIME_JUMP_DISTANCE;
	ld	e, b
	ld	a,#0x10
	ld	d,a
	sub	a, b
	bit	7, e
	jr	Z, 00233$
	bit	7, d
	jr	NZ, 00234$
	cp	a, a
	jr	00234$
00233$:
	bit	7, d
	jr	Z, 00234$
	scf
00234$:
	jr	NC, 00120$
	ld	b, #0x10
00120$:
;main.c:575: if(dx < -SLIME_JUMP_DISTANCE) dx = -SLIME_JUMP_DISTANCE;
	ld	a, b
	xor	a, #0x80
	sub	a, #0x70
	jr	NC, 00122$
	ld	b, #0xf0
00122$:
;main.c:576: if(dy > SLIME_JUMP_DISTANCE) dy = SLIME_JUMP_DISTANCE;
	ldhl	sp,	#14
	ld	e, (hl)
	ld	a,#0x10
	ld	d,a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00235$
	bit	7, d
	jr	NZ, 00236$
	cp	a, a
	jr	00236$
00235$:
	bit	7, d
	jr	Z, 00236$
	scf
00236$:
	jr	NC, 00124$
	ldhl	sp,	#14
	ld	(hl), #0x10
00124$:
;main.c:577: if(dy < -SLIME_JUMP_DISTANCE) dy = -SLIME_JUMP_DISTANCE;
	ldhl	sp,	#14
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x70
	jr	NC, 00126$
	ld	(hl), #0xf0
00126$:
;main.c:580: enemy->jump_target_x = enemy->x + dx;
	ld	a, c
	add	a, b
	ldhl	sp,	#8
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;main.c:581: enemy->jump_target_y = enemy->y + dy;
	pop	de
	push	de
	ld	a, (de)
	ldhl	sp,	#14
	add	a, (hl)
	ldhl	sp,	#10
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;main.c:584: enemy->anim = 1;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x01
00133$:
;main.c:586: }
	add	sp, #15
	ret
;main.c:588: void boss_ai(struct GameCharacter* player, struct Enemy* boss)
;	---------------------------------
; Function boss_ai
; ---------------------------------
_boss_ai::
	add	sp, #-6
	ldhl	sp,	#4
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ldhl	sp,	#2
	ld	a, c
	ld	(hl+), a
;main.c:591: if(boss->attack_timer > 0)
	ld	a, b
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000f
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#1
;main.c:602: boss->attack_anim_frame = time_into_anim / BOSS_ATTACK_FRAME_DURATION;
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0010
	add	hl, de
	ld	e, l
	ld	d, h
;main.c:591: if(boss->attack_timer > 0)
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	Z, 00107$
;main.c:593: boss->attack_timer--;
	ld	a, (hl)
	dec	a
	ld	(bc), a
;main.c:598: if(boss->attack_timer < total_anim_time)
	sub	a, #0x28
	jr	NC, 00104$
;main.c:601: UINT8 time_into_anim = total_anim_time - boss->attack_timer;
	ld	a, (bc)
	ld	c, a
	ld	a, #0x28
	sub	a, c
;main.c:602: boss->attack_anim_frame = time_into_anim / BOSS_ATTACK_FRAME_DURATION;
	ld	c, a
	ld	b, #0x00
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	a, c
	ld	(de), a
;main.c:603: if(boss->attack_anim_frame >= BOSS_ATTACK_ANIM_FRAMES)
	sub	a, #0x05
	jr	C, 00108$
;main.c:605: boss->attack_anim_frame = BOSS_ATTACK_ANIM_FRAMES - 1;
	ld	a, #0x04
	ld	(de), a
	jr	00108$
00104$:
;main.c:611: boss->attack_anim_frame = 0;
	xor	a, a
	ld	(de), a
	jr	00108$
00107$:
;main.c:617: boss->attack_timer = BOSS_ATTACK_COOLDOWN;
	ld	a, #0x3c
	ld	(bc), a
;main.c:618: boss->attack_anim_frame = 0;
	xor	a, a
	ld	(de), a
00108$:
;main.c:622: if (player->x > boss->x)
	ldhl	sp,#4
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
	jr	NC, 00110$
;main.c:624: boss->x++;
	inc	hl
	ld	a, (hl)
	inc	a
	ld	(de), a
00110$:
;main.c:626: if (player->x < boss->x)
	ld	a, (bc)
	ld	c, a
;main.c:622: if (player->x > boss->x)
	ld	a, (de)
	ld	b, a
;main.c:626: if (player->x < boss->x)
	ld	a, c
	sub	a, b
	jr	NC, 00112$
;main.c:628: boss->x--;
	ld	a, b
	dec	a
	ld	(de), a
00112$:
;main.c:630: if (player->y > boss->y)
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
	jr	NC, 00114$
;main.c:632: boss->y++;
	inc	hl
	ld	a, (hl)
	inc	a
	ld	(de), a
00114$:
;main.c:634: if (player->y < boss->y)
	ld	a, (bc)
	ld	c, a
;main.c:630: if (player->y > boss->y)
	ld	a, (de)
	ld	b, a
;main.c:634: if (player->y < boss->y)
	ld	a, c
	sub	a, b
	jr	NC, 00117$
;main.c:636: boss->y--;
	ld	a, b
	dec	a
	ld	(de), a
00117$:
;main.c:638: }
	add	sp, #6
	ret
;main.c:640: UINT8 count_alive_slimes(void)
;	---------------------------------
; Function count_alive_slimes
; ---------------------------------
_count_alive_slimes::
;main.c:643: for(UINT8 i = 0; i < MAX_ENEMIES; i++)
	ld	bc, #0x0
00106$:
	ld	a, b
	sub	a, #0x0a
	jr	NC, 00104$
;main.c:645: if(enemies[i].death == 0 && enemies[i].type == ENEMY_TYPE_SLIME)
	ld	e, b
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
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
	jr	NZ, 00107$
	ld	hl, #0x000d
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	NZ, 00107$
;main.c:647: count++;
	inc	c
00107$:
;main.c:643: for(UINT8 i = 0; i < MAX_ENEMIES; i++)
	inc	b
	jr	00106$
00104$:
;main.c:650: return count;
	ld	a, c
;main.c:651: }
	ret
;main.c:653: void spawn_slime_near_boss(struct Enemy* boss)
;	---------------------------------
; Function spawn_slime_near_boss
; ---------------------------------
_spawn_slime_near_boss::
	add	sp, #-9
	ldhl	sp,	#7
	ld	a, e
	ld	(hl+), a
;main.c:656: for(UINT8 i = 0; i < MAX_ENEMIES; i++)
	ld	a, d
	ld	(hl-), a
	dec	hl
	xor	a, a
	ld	(hl-), a
	ld	(hl), a
00121$:
	ldhl	sp,	#5
	ld	a, (hl)
	sub	a, #0x0a
	jp	NC, 00123$
;main.c:658: if(enemies[i].death == 1)
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	de, #_enemies
	add	hl, de
	ld	bc, #0x0009
	add	hl, bc
	ld	a, (hl)
	dec	a
	jp	NZ, 00122$
;main.c:661: INT8 offset_x = (rand() % 32) - 16;  // Random offset -16 to +16
	call	_rand
	ld	a, e
	and	a, #0x1f
	add	a, #0xf0
	ld	b, a
;main.c:662: INT8 offset_y = (rand() % 32) - 16;
	call	_rand
	ld	a, e
	and	a, #0x1f
	add	a, #0xf0
	ld	c, a
;main.c:668: if(offset_x < 0 && boss->x < (UINT8)(-offset_x))
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	l, a
	bit	7, b
	jr	Z, 00102$
	xor	a, a
	sub	a, b
	ld	e, a
	ld	a, l
	sub	a, e
	jr	NC, 00102$
;main.c:670: spawn_x = SPAWN_MIN_X;  // Would underflow
	ldhl	sp,	#2
	ld	(hl), #0x20
	jr	00103$
00102$:
;main.c:674: spawn_x = boss->x + offset_x;
	ld	a, l
	add	a, b
	ldhl	sp,	#2
	ld	(hl), a
00103$:
;main.c:678: if(offset_y < 0 && boss->y < (UINT8)(-offset_y))
	ldhl	sp,#7
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
	bit	7, c
	jr	Z, 00106$
	xor	a, a
	sub	a, c
	ld	b, a
	ld	a, (hl)
	sub	a, b
	jr	NC, 00106$
;main.c:680: spawn_y = SPAWN_MIN_Y;  // Would underflow
	dec	hl
	dec	hl
	ld	(hl), #0x2c
	jr	00107$
00106$:
;main.c:684: spawn_y = boss->y + offset_y;
	ldhl	sp,	#5
	ld	a, (hl-)
	dec	hl
	add	a, c
	ld	(hl), a
00107$:
;main.c:688: if(spawn_x < SPAWN_MIN_X) spawn_x = SPAWN_MIN_X;
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x20
	jr	NC, 00110$
	ld	(hl), #0x20
00110$:
;main.c:689: if(spawn_x > SPAWN_MAX_X) spawn_x = SPAWN_MAX_X;
	ld	a, #0x80
	ldhl	sp,	#2
	sub	a, (hl)
	jr	NC, 00112$
	ld	(hl), #0x80
00112$:
;main.c:690: if(spawn_y < SPAWN_MIN_Y) spawn_y = SPAWN_MIN_Y;
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x2c
	jr	NC, 00114$
	ld	(hl), #0x2c
00114$:
;main.c:691: if(spawn_y > SPAWN_MAX_Y) spawn_y = SPAWN_MAX_Y;
	ld	a, #0x78
	ldhl	sp,	#3
	sub	a, (hl)
	jr	NC, 00116$
	ld	(hl), #0x78
00116$:
;main.c:694: UINT8 oam_slot = 26 + i;
	ldhl	sp,	#6
	ld	a, (hl-)
	dec	hl
	add	a, #0x1a
;main.c:697: setup_enemy(&enemies[i], oam_slot, spawn_x, spawn_y, ENEMY_TYPE_SLIME);
	ld	(hl+), a
	inc	hl
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	hl, #_enemies
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl), a
	xor	a, a
	push	af
	inc	sp
	ldhl	sp,	#4
	ld	a, (hl-)
	ld	d, a
	ld	a, (hl+)
	inc	hl
	ld	e, a
	push	de
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_setup_enemy
;main.c:698: current_enemy_count++;
	ld	hl, #_current_enemy_count
	inc	(hl)
;main.c:699: break;  // Only spawn one slime per call
	jr	00123$
00122$:
;main.c:656: for(UINT8 i = 0; i < MAX_ENEMIES; i++)
	ldhl	sp,	#5
	inc	(hl)
	ld	a, (hl+)
	ld	(hl), a
	jp	00121$
00123$:
;main.c:702: }
	add	sp, #9
	ret
;main.c:704: void spawn_boss_death_slimes(struct Enemy* boss)
;	---------------------------------
; Function spawn_boss_death_slimes
; ---------------------------------
_spawn_boss_death_slimes::
	add	sp, #-26
	ldhl	sp,	#22
	ld	(hl), e
	inc	hl
	ld	(hl), d
;main.c:707: const INT8 offsets[4][2] = {
	ldhl	sp,	#0
	ld	(hl), #0xf4
	inc	hl
	ld	(hl), #0xf4
	inc	hl
	ld	(hl), #0x0c
	inc	hl
	ld	(hl), #0xf4
	inc	hl
	ld	(hl), #0xf4
	inc	hl
	ld	(hl), #0x0c
	inc	hl
	ld	(hl), #0x0c
	inc	hl
	ld	(hl), #0x0c
;main.c:715: UINT8 boss_index = MAX_ENEMIES;
	inc	hl
	ld	(hl), #0x0a
;main.c:716: for(UINT8 i = 0; i < MAX_ENEMIES; i++)
	ldhl	sp,	#24
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
00129$:
	ldhl	sp,	#25
	ld	a, (hl)
	sub	a, #0x0a
	jr	NC, 00151$
;main.c:718: if(&enemies[i] == boss)
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	push	hl
	ld	a, l
	ldhl	sp,	#20
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#19
	ld	(hl), a
	ld	de, #_enemies
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#22
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#21
	ld	(hl+), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#20
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00130$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	NZ, 00130$
;main.c:720: boss_index = i;
	ldhl	sp,	#24
	ld	a, (hl)
	ldhl	sp,	#8
	ld	(hl), a
;main.c:721: break;
	jr	00151$
00130$:
;main.c:716: for(UINT8 i = 0; i < MAX_ENEMIES; i++)
	ldhl	sp,	#25
	inc	(hl)
	ld	a, (hl-)
	ld	(hl), a
	jr	00129$
;main.c:725: for(UINT8 i = 0; i < MAX_ENEMIES && spawned < BOSS_DEATH_SLIMES; i++)
00151$:
	ldhl	sp,#22
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
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
	ldhl	sp,#22
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
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
	ldhl	sp,	#24
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
00133$:
	ldhl	sp,	#25
	ld	a, (hl)
	sub	a, #0x0a
	jp	NC, 00125$
	dec	hl
	ld	a, (hl)
	sub	a, #0x04
	jp	NC, 00125$
;main.c:728: if(i == boss_index)
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#25
	sub	a, (hl)
	jp	Z, 00124$
;main.c:733: if(enemies[i].death == 1)
	ldhl	sp,	#25
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	bc, #_enemies
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#19
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#18
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
	jp	NZ, 00124$
;main.c:735: INT8 offset_x = offsets[spawned][0];
	ldhl	sp,	#24
	ld	c, (hl)
	xor	a, a
	ld	b, a
	sla	c
	rl	b
	ld	hl, #0
	add	hl, sp
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#19
;main.c:736: INT8 offset_y = offsets[spawned][1];
	ld	(hl+), a
	inc	bc
	ld	a, (bc)
;main.c:740: if(offset_x < 0 && boss->x < (UINT8)(-offset_x))
	ld	(hl-), a
	bit	7, (hl)
	jr	Z, 00107$
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#21
	ld	(hl-), a
	dec	hl
	xor	a, a
	sub	a, (hl)
	inc	hl
	inc	hl
	ld	c, a
	ld	a, (hl)
	sub	a, c
	jr	NC, 00107$
;main.c:742: spawn_x = MIN_ENEMY_X;
	ld	c, #0x18
	jr	00108$
00107$:
;main.c:746: spawn_x = boss->x + offset_x;
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#19
	add	a, (hl)
	ld	c, a
00108$:
;main.c:750: if(offset_y < 0 && boss->y < (UINT8)(-offset_y))
	ldhl	sp,	#20
	bit	7, (hl)
	jr	Z, 00111$
	ldhl	sp,#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
	xor	a, a
	ldhl	sp,	#20
	sub	a, (hl)
	ld	e, a
	ld	a, b
	sub	a, e
	jr	NC, 00111$
;main.c:752: spawn_y = MIN_ENEMY_Y;
	ld	b, #0x1c
	jr	00112$
00111$:
;main.c:756: spawn_y = boss->y + offset_y;
	ldhl	sp,#15
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#20
	add	a, (hl)
	ld	b, a
00112$:
;main.c:760: if(spawn_x < MIN_ENEMY_X) spawn_x = MIN_ENEMY_X;
	ld	a, c
	sub	a, #0x18
	jr	NC, 00115$
	ld	c, #0x18
00115$:
;main.c:761: if(spawn_x > MAX_ENEMY_X) spawn_x = MAX_ENEMY_X;
	ld	a, #0x90
	sub	a, c
	jr	NC, 00117$
	ld	c, #0x90
00117$:
;main.c:762: if(spawn_y < MIN_ENEMY_Y) spawn_y = MIN_ENEMY_Y;
	ld	a, b
	sub	a, #0x1c
	jr	NC, 00119$
	ld	b, #0x1c
00119$:
;main.c:763: if(spawn_y > MAX_ENEMY_Y) spawn_y = MAX_ENEMY_Y;
	ld	a, #0x78
	sub	a, b
	jr	NC, 00121$
	ld	b, #0x78
00121$:
;main.c:765: UINT8 oam_slot = 26 + i;
	ldhl	sp,	#25
	ld	a, (hl)
	add	a, #0x1a
;main.c:767: setup_enemy(&enemies[i], oam_slot, spawn_x, spawn_y, ENEMY_TYPE_SLIME);
	ldhl	sp,	#17
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	h, #0x00
	push	hl
	inc	sp
	push	bc
	inc	sp
	ld	h, c
	push	hl
	inc	sp
	call	_setup_enemy
;main.c:768: spawned++;
	ldhl	sp,	#24
	inc	(hl)
00124$:
;main.c:725: for(UINT8 i = 0; i < MAX_ENEMIES && spawned < BOSS_DEATH_SLIMES; i++)
	ldhl	sp,	#25
	inc	(hl)
	jp	00133$
00125$:
;main.c:773: current_enemy_count += spawned;
	ldhl	sp,	#24
	ld	a, (hl)
	ld	hl, #_current_enemy_count
	add	a, (hl)
	ld	(hl), a
;main.c:774: if(current_enemy_count > MAX_ENEMIES)
	ld	a, #0x0a
	sub	a, (hl)
	jr	NC, 00134$
;main.c:776: current_enemy_count = MAX_ENEMIES;
	ld	(hl), #0x0a
00134$:
;main.c:778: }
	add	sp, #26
	ret
;main.c:780: void update_window_stats_ui(void)
;	---------------------------------
; Function update_window_stats_ui
; ---------------------------------
_update_window_stats_ui::
;main.c:782: set_win_tile_xy(HUD_HP_X, HUD_ROW, TILE_H); // HP label (heart tile)
	ld	a, #0x12
	push	af
	inc	sp
	xor	a, a
	ld	e, a
	call	_set_win_tile_xy
;main.c:783: set_win_tile_xy(HUD_HP_X + 1, HUD_ROW, TILE_P); 
	ld	a, #0x1a
	push	af
	inc	sp
	ld	e, #0x00
	ld	a, #0x01
	call	_set_win_tile_xy
;main.c:784: write_window_2digits(player_stats.current_health, HUD_HP_X + 2, HUD_ROW);
	ld	a, (#(_player_stats + 1) + 0)
	ld	h, #0x00
	push	hl
	inc	sp
	ld	e, #0x02
	call	_write_window_2digits
;main.c:786: set_win_tile_xy(HUD_DMG_X, HUD_ROW, TILE_D);
	ld	a, #0x0e
	push	af
	inc	sp
	ld	e, #0x00
	ld	a, #0x05
	call	_set_win_tile_xy
;main.c:787: set_win_tile_xy(HUD_DMG_X + 1, HUD_ROW, TILE_M);
	ld	a, #0x17
	push	af
	inc	sp
	ld	e, #0x00
	ld	a, #0x06
	call	_set_win_tile_xy
;main.c:788: write_window_2digits(player_stats.damage, HUD_DMG_X + 2, HUD_ROW);
	ld	a, (#(_player_stats + 2) + 0)
	ld	h, #0x00
	push	hl
	inc	sp
	ld	e, #0x07
	call	_write_window_2digits
;main.c:790: set_win_tile_xy(HUD_RANGE_X, HUD_ROW, TILE_S);
	ld	a, #0x1d
	push	af
	inc	sp
	ld	e, #0x00
	ld	a, #0x0a
	call	_set_win_tile_xy
;main.c:791: set_win_tile_xy(HUD_RANGE_X + 1, HUD_ROW, TILE_P);
	ld	a, #0x1a
	push	af
	inc	sp
	ld	e, #0x00
	ld	a, #0x0b
	call	_set_win_tile_xy
;main.c:792: write_window_2digits(player_stats.speed, HUD_RANGE_X + 2, HUD_ROW);
	ld	a, (#(_player_stats + 4) + 0)
	ld	h, #0x00
	push	hl
	inc	sp
	ld	e, #0x0c
	call	_write_window_2digits
;main.c:795: set_win_tile_xy(STAGE_X, HUD_ROW, TILE_S);
	ld	a, #0x1d
	push	af
	inc	sp
	ld	e, #0x00
	ld	a, #0x0f
	call	_set_win_tile_xy
;main.c:796: set_win_tile_xy(STAGE_X + 1, HUD_ROW, TILE_T);
	ld	a, #0x1e
	push	af
	inc	sp
	ld	e, #0x00
	ld	a, #0x10
	call	_set_win_tile_xy
;main.c:797: set_win_tile_xy(STAGE_X + 2, HUD_ROW, TILE_G);
	ld	a, #0x11
	push	af
	inc	sp
	ld	e, #0x00
	ld	a, #0x11
	call	_set_win_tile_xy
;main.c:798: write_window_2digits(stage, STAGE_X + 3, HUD_ROW);
	xor	a, a
	push	af
	inc	sp
	ld	e, #0x12
	ld	a, (_stage)
	call	_write_window_2digits
;main.c:799: }
	ret
;main.c:801: void show_pause_ui(void)
;	---------------------------------
; Function show_pause_ui
; ---------------------------------
_show_pause_ui::
;main.c:803: set_win_tile_xy(PAUSE_TEXT_X + 0, PAUSE_ROW, TILE_P);
	ld	a, #0x1a
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x07
	call	_set_win_tile_xy
;main.c:804: set_win_tile_xy(PAUSE_TEXT_X + 1, PAUSE_ROW, TILE_A);
	ld	a, #0x0b
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x08
	call	_set_win_tile_xy
;main.c:805: set_win_tile_xy(PAUSE_TEXT_X + 2, PAUSE_ROW, TILE_U);
	ld	a, #0x1f
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x09
	call	_set_win_tile_xy
;main.c:806: set_win_tile_xy(PAUSE_TEXT_X + 3, PAUSE_ROW, TILE_S);
	ld	a, #0x1d
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0a
	call	_set_win_tile_xy
;main.c:807: set_win_tile_xy(PAUSE_TEXT_X + 4, PAUSE_ROW, TILE_E);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0b
	call	_set_win_tile_xy
;main.c:808: }
	ret
;main.c:810: void hide_pause_ui(void)
;	---------------------------------
; Function hide_pause_ui
; ---------------------------------
_hide_pause_ui::
;main.c:812: set_win_tile_xy(PAUSE_TEXT_X + 0, PAUSE_ROW, 0);
	xor	a, a
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x07
	call	_set_win_tile_xy
;main.c:813: set_win_tile_xy(PAUSE_TEXT_X + 1, PAUSE_ROW, 0);
	xor	a, a
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x08
	call	_set_win_tile_xy
;main.c:814: set_win_tile_xy(PAUSE_TEXT_X + 2, PAUSE_ROW, 0);
	xor	a, a
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x09
	call	_set_win_tile_xy
;main.c:815: set_win_tile_xy(PAUSE_TEXT_X + 3, PAUSE_ROW, 0);
	xor	a, a
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0a
	call	_set_win_tile_xy
;main.c:816: set_win_tile_xy(PAUSE_TEXT_X + 4, PAUSE_ROW, 0);
	xor	a, a
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0b
	call	_set_win_tile_xy
;main.c:817: }
	ret
;main.c:819: void show_room_clear_ui(void)
;	---------------------------------
; Function show_room_clear_ui
; ---------------------------------
_show_room_clear_ui::
;main.c:821: set_win_tile_xy(ROOM_CLEAR_X + 0, ROOM_CLEAR_ROW, TILE_R);
	ld	a, #0x1c
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x05
	call	_set_win_tile_xy
;main.c:822: set_win_tile_xy(ROOM_CLEAR_X + 1, ROOM_CLEAR_ROW, TILE_O);
	ld	a, #0x19
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x06
	call	_set_win_tile_xy
;main.c:823: set_win_tile_xy(ROOM_CLEAR_X + 2, ROOM_CLEAR_ROW, TILE_O);
	ld	a, #0x19
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x07
	call	_set_win_tile_xy
;main.c:824: set_win_tile_xy(ROOM_CLEAR_X + 3, ROOM_CLEAR_ROW, TILE_M);
	ld	a, #0x17
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x08
	call	_set_win_tile_xy
;main.c:825: set_win_tile_xy(ROOM_CLEAR_X + 4, ROOM_CLEAR_ROW, 0);
	xor	a, a
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x09
	call	_set_win_tile_xy
;main.c:826: set_win_tile_xy(ROOM_CLEAR_X + 5, ROOM_CLEAR_ROW, TILE_C);
	ld	a, #0x0d
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0a
	call	_set_win_tile_xy
;main.c:827: set_win_tile_xy(ROOM_CLEAR_X + 6, ROOM_CLEAR_ROW, TILE_L);
	ld	a, #0x16
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0b
	call	_set_win_tile_xy
;main.c:828: set_win_tile_xy(ROOM_CLEAR_X + 7, ROOM_CLEAR_ROW, TILE_E);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0c
	call	_set_win_tile_xy
;main.c:829: set_win_tile_xy(ROOM_CLEAR_X + 8, ROOM_CLEAR_ROW, TILE_A);
	ld	a, #0x0b
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0d
	call	_set_win_tile_xy
;main.c:830: set_win_tile_xy(ROOM_CLEAR_X + 9, ROOM_CLEAR_ROW, TILE_R);
	ld	a, #0x1c
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0e
	call	_set_win_tile_xy
;main.c:831: }
	ret
;main.c:833: void hide_room_clear_ui(void)
;	---------------------------------
; Function hide_room_clear_ui
; ---------------------------------
_hide_room_clear_ui::
;main.c:835: for(UINT8 i = 0; i < 10; i++)
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x0a
	ret	NC
;main.c:837: set_win_tile_xy(ROOM_CLEAR_X + i, ROOM_CLEAR_ROW, 0);
	ld	a, c
	add	a, #0x05
	push	bc
	ld	h, #0x00
	push	hl
	inc	sp
	ld	e, #0x01
	call	_set_win_tile_xy
	pop	bc
;main.c:835: for(UINT8 i = 0; i < 10; i++)
	inc	c
;main.c:839: }
	jr	00103$
;main.c:841: void show_ready_ui(void)
;	---------------------------------
; Function show_ready_ui
; ---------------------------------
_show_ready_ui::
;main.c:843: set_win_tile_xy(READY_X + 0, READY_ROW, TILE_R);
	ld	a, #0x1c
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x07
	call	_set_win_tile_xy
;main.c:844: set_win_tile_xy(READY_X + 1, READY_ROW, TILE_E);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x08
	call	_set_win_tile_xy
;main.c:845: set_win_tile_xy(READY_X + 2, READY_ROW, TILE_A);
	ld	a, #0x0b
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x09
	call	_set_win_tile_xy
;main.c:846: set_win_tile_xy(READY_X + 3, READY_ROW, TILE_D);
	ld	a, #0x0e
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0a
	call	_set_win_tile_xy
;main.c:847: set_win_tile_xy(READY_X + 4, READY_ROW, TILE_Y);
	ld	a, #0x23
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0b
	call	_set_win_tile_xy
;main.c:848: }
	ret
;main.c:850: void hide_ready_ui(void)
;	---------------------------------
; Function hide_ready_ui
; ---------------------------------
_hide_ready_ui::
;main.c:852: for(UINT8 i = 0; i < 5; i++)
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x05
	ret	NC
;main.c:854: set_win_tile_xy(READY_X + i, READY_ROW, 0);
	ld	a, c
	add	a, #0x07
	push	bc
	ld	h, #0x00
	push	hl
	inc	sp
	ld	e, #0x01
	call	_set_win_tile_xy
	pop	bc
;main.c:852: for(UINT8 i = 0; i < 5; i++)
	inc	c
;main.c:856: }
	jr	00103$
;main.c:858: void show_reward_ui(UINT8 reward)
;	---------------------------------
; Function show_reward_ui
; ---------------------------------
_show_reward_ui::
;main.c:860: if(reward == REWARD_HP)
	or	a, a
	jr	NZ, 00105$
;main.c:862: set_win_tile_xy(REWARD_X + 0, REWARD_ROW, TILE_H);
	ld	a, #0x12
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x07
	call	_set_win_tile_xy
;main.c:863: set_win_tile_xy(REWARD_X + 1, REWARD_ROW, TILE_P);
	ld	a, #0x1a
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x08
	call	_set_win_tile_xy
;main.c:864: set_win_tile_xy(REWARD_X + 2, REWARD_ROW, 0);
	xor	a, a
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x09
	call	_set_win_tile_xy
;main.c:865: set_win_tile_xy(REWARD_X + 3, REWARD_ROW, TILE_U);
	ld	a, #0x1f
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0a
	call	_set_win_tile_xy
;main.c:866: set_win_tile_xy(REWARD_X + 4, REWARD_ROW, TILE_P);
	ld	a, #0x1a
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0b
	call	_set_win_tile_xy
	ret
00105$:
;main.c:868: else if(reward == REWARD_DMG)
	dec	a
	jr	NZ, 00102$
;main.c:870: set_win_tile_xy(REWARD_X + 0, REWARD_ROW, TILE_D);
	ld	a, #0x0e
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x07
	call	_set_win_tile_xy
;main.c:871: set_win_tile_xy(REWARD_X + 1, REWARD_ROW, TILE_M);
	ld	a, #0x17
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x08
	call	_set_win_tile_xy
;main.c:872: set_win_tile_xy(REWARD_X + 2, REWARD_ROW, TILE_G);
	ld	a, #0x11
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x09
	call	_set_win_tile_xy
;main.c:873: set_win_tile_xy(REWARD_X + 3, REWARD_ROW, 0);
	xor	a, a
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0a
	call	_set_win_tile_xy
;main.c:874: set_win_tile_xy(REWARD_X + 4, REWARD_ROW, TILE_U);
	ld	a, #0x1f
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0b
	call	_set_win_tile_xy
;main.c:875: set_win_tile_xy(REWARD_X + 5, REWARD_ROW, TILE_P);
	ld	a, #0x1a
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0c
	call	_set_win_tile_xy
	ret
00102$:
;main.c:879: set_win_tile_xy(REWARD_X + 0, REWARD_ROW, TILE_S);
	ld	a, #0x1d
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x07
	call	_set_win_tile_xy
;main.c:880: set_win_tile_xy(REWARD_X + 1, REWARD_ROW, TILE_P);
	ld	a, #0x1a
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x08
	call	_set_win_tile_xy
;main.c:881: set_win_tile_xy(REWARD_X + 2, REWARD_ROW, TILE_E);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x09
	call	_set_win_tile_xy
;main.c:882: set_win_tile_xy(REWARD_X + 3, REWARD_ROW, TILE_E);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0a
	call	_set_win_tile_xy
;main.c:883: set_win_tile_xy(REWARD_X + 4, REWARD_ROW, TILE_D);
	ld	a, #0x0e
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0b
	call	_set_win_tile_xy
;main.c:884: set_win_tile_xy(REWARD_X + 5, REWARD_ROW, 0);
	xor	a, a
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0c
	call	_set_win_tile_xy
;main.c:885: set_win_tile_xy(REWARD_X + 6, REWARD_ROW, TILE_U);
	ld	a, #0x1f
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0d
	call	_set_win_tile_xy
;main.c:886: set_win_tile_xy(REWARD_X + 7, REWARD_ROW, TILE_P);
	ld	a, #0x1a
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0e
	call	_set_win_tile_xy
;main.c:888: }
	ret
;main.c:890: void hide_reward_ui(void)
;	---------------------------------
; Function hide_reward_ui
; ---------------------------------
_hide_reward_ui::
;main.c:892: for(UINT8 i = 0; i < 10; i++)
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x0a
	ret	NC
;main.c:894: set_win_tile_xy(REWARD_X + i, REWARD_ROW, 0);
	ld	a, c
	add	a, #0x07
	push	bc
	ld	h, #0x00
	push	hl
	inc	sp
	ld	e, #0x01
	call	_set_win_tile_xy
	pop	bc
;main.c:892: for(UINT8 i = 0; i < 10; i++)
	inc	c
;main.c:896: }
	jr	00103$
;main.c:898: void show_game_over_ui(void)
;	---------------------------------
; Function show_game_over_ui
; ---------------------------------
_show_game_over_ui::
;main.c:900: for(UINT8 x = 0; x < 20; x++)
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x14
	jr	NC, 00101$
;main.c:902: set_win_tile_xy(x, 0, 0);
	push	bc
	xor	a, a
	push	af
	inc	sp
	ld	e, #0x00
	ld	a, c
	call	_set_win_tile_xy
	pop	bc
;main.c:903: set_win_tile_xy(x, 1, 0);
	push	bc
	xor	a, a
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, c
	call	_set_win_tile_xy
	pop	bc
;main.c:900: for(UINT8 x = 0; x < 20; x++)
	inc	c
	jr	00103$
00101$:
;main.c:906: set_win_tile_xy(5, 1, TILE_G);
	ld	a, #0x11
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x05
	call	_set_win_tile_xy
;main.c:907: set_win_tile_xy(6, 1, TILE_A);
	ld	a, #0x0b
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x06
	call	_set_win_tile_xy
;main.c:908: set_win_tile_xy(7, 1, TILE_M);
	ld	a, #0x17
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x07
	call	_set_win_tile_xy
;main.c:909: set_win_tile_xy(8, 1, TILE_E);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x08
	call	_set_win_tile_xy
;main.c:910: set_win_tile_xy(9, 1, 0);
	xor	a, a
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x09
	call	_set_win_tile_xy
;main.c:911: set_win_tile_xy(10, 1, TILE_O);
	ld	a, #0x19
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0a
	call	_set_win_tile_xy
;main.c:912: set_win_tile_xy(11, 1, TILE_V);
	ld	a, #0x20
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0b
	call	_set_win_tile_xy
;main.c:913: set_win_tile_xy(12, 1, TILE_E);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0c
	call	_set_win_tile_xy
;main.c:914: set_win_tile_xy(13, 1, TILE_R);
	ld	a, #0x1c
	push	af
	inc	sp
	ld	e, #0x01
	ld	a, #0x0d
	call	_set_win_tile_xy
;main.c:915: }
	ret
;main.c:917: void roll_room_reward(void)
;	---------------------------------
; Function roll_room_reward
; ---------------------------------
_roll_room_reward::
;main.c:919: reward_type = rand() % 3;
	call	_rand
	ld	a, e
	ld	e, #0x03
	call	__moduchar
	ld	hl, #_reward_type
	ld	(hl), c
;main.c:920: }
	ret
;main.c:922: void apply_reward(UINT8 reward)
;	---------------------------------
; Function apply_reward
; ---------------------------------
_apply_reward::
;main.c:924: if(reward == REWARD_HP)
	or	a, a
	jr	NZ, 00114$
;main.c:926: UINT8 boosted_max_hp = player_stats.max_health + HP_REWARD_AMOUNT;
	ld	bc, #_player_stats
	ld	a, (bc)
	add	a, #0x02
;main.c:927: if(boosted_max_hp > PLAYER_MAX_HP_CAP)
	cp	a, #0x1f
	jr	C, 00102$
;main.c:929: player_stats.max_health = PLAYER_MAX_HP_CAP;
	ld	a, #0x1e
	ld	(bc), a
	jr	00103$
00102$:
;main.c:933: player_stats.max_health = boosted_max_hp;
	ld	(bc), a
00103$:
;main.c:936: UINT8 boosted_hp = player_stats.current_health + HP_REWARD_AMOUNT;
	ld	hl, #_player_stats + 1
	ld	e, (hl)
	inc	e
	inc	e
;main.c:926: UINT8 boosted_max_hp = player_stats.max_health + HP_REWARD_AMOUNT;
	ld	a, (bc)
;main.c:937: if(boosted_hp > player_stats.max_health)
	ld	c, a
	sub	a, e
	jr	NC, 00105$
;main.c:939: player_stats.current_health = player_stats.max_health;
	ld	(hl), c
	ret
00105$:
;main.c:943: player_stats.current_health = boosted_hp;
	ld	(hl), e
	ret
00114$:
;main.c:946: else if(reward == REWARD_DMG)
	dec	a
	jr	NZ, 00111$
;main.c:948: player_stats.damage += DMG_REWARD_AMOUNT;
	ld	bc, #_player_stats+2
	ld	a, (bc)
	add	a, #0x02
	ld	(bc), a
	ret
00111$:
;main.c:952: UINT8 boosted_speed = player_stats.speed + SPEED_REWARD_AMOUNT;
	ld	bc, #_player_stats+4
	ld	a, (bc)
	inc	a
;main.c:953: if(boosted_speed > PLAYER_SPEED_CAP)
	cp	a, #0x07
	jr	C, 00108$
;main.c:955: player_stats.speed = PLAYER_SPEED_CAP;
	ld	a, #0x06
	ld	(bc), a
	ret
00108$:
;main.c:959: player_stats.speed = boosted_speed;
	ld	(bc), a
;main.c:962: }
	ret
;main.c:964: void write_window_2digits(UINT8 value, UINT8 x, UINT8 y)
;	---------------------------------
; Function write_window_2digits
; ---------------------------------
_write_window_2digits::
	ld	b, e
;main.c:968: UINT8 tens = value / 10;
	ld	c, a
	push	bc
	ld	e, #0x0a
	ld	a, c
	call	__divuchar
	ld	l, c
	pop	bc
;main.c:969: UINT8 ones = value % 10;
	push	hl
	push	bc
	ld	e, #0x0a
	ld	a, c
	call	__moduchar
	pop	af
	ld	b, a
	pop	hl
;main.c:971: set_win_tile_xy(x, y, DIGIT_TILE_BASE + tens);
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
;main.c:972: set_win_tile_xy(x + 1, y, DIGIT_TILE_BASE + ones);
	inc	c
	ld	a, b
	inc	a
	ld	h, c
	push	hl
	inc	sp
	ldhl	sp,	#3
	ld	e, (hl)
	call	_set_win_tile_xy
;main.c:973: }
	pop	hl
	inc	sp
	jp	(hl)
;main.c:974: UINT8 player_take_damage(UINT8 amount)
;	---------------------------------
; Function player_take_damage
; ---------------------------------
_player_take_damage::
	ld	c, a
;main.c:976: if(player_stats.invuln_timer == 0 && player_stats.is_dead == 0)
	ld	a, (#(_player_stats + 5) + 0)
	or	a, a
	jr	NZ, 00105$
	ld	a, (#(_player_stats + 6) + 0)
	or	a, a
	jr	NZ, 00105$
;main.c:978: if(amount >= player_stats.current_health)
	ld	hl, #(_player_stats + 1)
	ld	b, (hl)
	ld	a, c
	sub	a, b
	jr	C, 00102$
;main.c:980: player_stats.current_health = 0;
	ld	hl, #(_player_stats + 1)
	ld	(hl), #0x00
;main.c:981: player_stats.is_dead = 1;
	ld	hl, #(_player_stats + 6)
	ld	(hl), #0x01
	jr	00103$
00102$:
;main.c:985: player_stats.current_health -= amount;
	ld	a, b
	sub	a, c
	ld	(#(_player_stats + 1)),a
00103$:
;main.c:987: sfx_player_hurt();
	call	_sfx_player_hurt
;main.c:988: player_stats.invuln_timer = INVULN_FRAMES;
	ld	hl, #(_player_stats + 5)
	ld	(hl), #0x0a
;main.c:989: return 1;
	ld	a, #0x01
	ret
00105$:
;main.c:991: return 0;
	xor	a, a
;main.c:992: }            
	ret
;main.c:993: void audio_init(void)
;	---------------------------------
; Function audio_init
; ---------------------------------
_audio_init::
;main.c:995: NR52_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR52_REG + 0), a
;main.c:996: NR50_REG = 0x77;
	ld	a, #0x77
	ldh	(_NR50_REG + 0), a
;main.c:997: NR51_REG = 0xFF;
	ld	a, #0xff
	ldh	(_NR51_REG + 0), a
;main.c:998: }
	ret
;main.c:1000: void sfx_swing(void)
;	---------------------------------
; Function sfx_swing
; ---------------------------------
_sfx_swing::
;main.c:1002: NR41_REG = 0x00;
	xor	a, a
	ldh	(_NR41_REG + 0), a
;main.c:1003: NR42_REG = 0xF1;
	ld	a, #0xf1
	ldh	(_NR42_REG + 0), a
;main.c:1004: NR43_REG = 0x35;
	ld	a, #0x35
	ldh	(_NR43_REG + 0), a
;main.c:1005: NR44_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR44_REG + 0), a
;main.c:1006: }
	ret
;main.c:1008: void sfx_enemy_hit(void)
;	---------------------------------
; Function sfx_enemy_hit
; ---------------------------------
_sfx_enemy_hit::
;main.c:1011: NR10_REG = 0x16;
	ld	a, #0x16
	ldh	(_NR10_REG + 0), a
;main.c:1012: NR11_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR11_REG + 0), a
;main.c:1013: NR12_REG = 0xF2;
	ld	a, #0xf2
	ldh	(_NR12_REG + 0), a
;main.c:1014: NR13_REG = 0x40;
	ld	a, #0x40
	ldh	(_NR13_REG + 0), a
;main.c:1015: NR14_REG = 0x87;
	ld	a, #0x87
	ldh	(_NR14_REG + 0), a
;main.c:1016: }
	ret
;main.c:1018: void sfx_player_hurt(void)
;	---------------------------------
; Function sfx_player_hurt
; ---------------------------------
_sfx_player_hurt::
;main.c:1021: NR41_REG = 0x00;
	xor	a, a
	ldh	(_NR41_REG + 0), a
;main.c:1022: NR42_REG = 0xC2;
	ld	a, #0xc2
	ldh	(_NR42_REG + 0), a
;main.c:1023: NR43_REG = 0x20;
	ld	a, #0x20
	ldh	(_NR43_REG + 0), a
;main.c:1024: NR44_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR44_REG + 0), a
;main.c:1025: }
	ret
;main.c:1027: void init_player_stats(void)
;	---------------------------------
; Function init_player_stats
; ---------------------------------
_init_player_stats::
;main.c:1029: init_character_stats(&player_stats,
	ld	hl, #0x03
	push	hl
	ld	hl, #0x505
	push	hl
	ld	a, #0x06
	ld	de, #_player_stats
	call	_init_character_stats
;main.c:1035: }
	ret
;main.c:1037: void init_character_stats(struct PlayerStats* stats,
;	---------------------------------
; Function init_character_stats
; ---------------------------------
_init_character_stats::
;main.c:1044: stats->max_health = max_health;
	ld	(de), a
;main.c:1045: stats->current_health = max_health;
	ld	c, e
	ld	b, d
	inc	bc
	ld	(bc), a
;main.c:1046: stats->damage = damage;
	ld	c, e
	ld	b, d
	inc	bc
	inc	bc
	ldhl	sp,	#2
;main.c:1047: stats->range = range;
	ld	a, (hl+)
	ld	(bc), a
	ld	c, e
	ld	b, d
	inc	bc
	inc	bc
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;main.c:1048: stats->speed = speed;
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(bc), a
;main.c:1049: stats->invuln_timer = invuln_time;
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#5
	ld	a, (hl)
	ld	(bc), a
;main.c:1050: stats->is_dead = 0;
	ld	hl, #0x0006
	add	hl, de
	ld	(hl), #0x00
;main.c:1051: }
	pop	hl
	add	sp, #4
	jp	(hl)
;main.c:1053: void update_timers(struct GameCharacter* player, struct Weapon* weapon)
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
;main.c:1055: if(player_stats.invuln_timer > 0 && player_stats.is_dead == 0)
	ld	hl, #(_player_stats + 5)
	ld	c, (hl)
	ld	a, c
	or	a, a
	jr	Z, 00102$
	ld	a, (#(_player_stats + 6) + 0)
	or	a, a
	jr	NZ, 00102$
;main.c:1057: player_stats.invuln_timer--;
	dec	c
	ld	hl, #(_player_stats + 5)
	ld	(hl), c
00102$:
;main.c:1062: player->x += knockback_dx;
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	inc	sp
	inc	sp
	push	hl
;main.c:1063: player->y += knockback_dy;
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
;main.c:1088: weapon->x += knockback_dx;
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
;main.c:1089: weapon->y += knockback_dy;
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
;main.c:1060: if(knockback_timer > 0 && player_stats.is_dead == 0)
	ld	a, (#_knockback_timer)
	or	a, a
	jp	Z, 00116$
	ld	a, (#(_player_stats + 6) + 0)
	or	a, a
	jp	NZ, 00116$
;main.c:1062: player->x += knockback_dx;
	pop	de
	push	de
	ld	a, (de)
	ld	hl, #_knockback_dx
	add	a, (hl)
	pop	hl
	push	hl
	ld	(hl), a
;main.c:1063: player->y += knockback_dy;
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
;main.c:1065: if(player->x < MIN_GIRL_X)
	pop	de
	push	de
	ld	a, (de)
	sub	a, #0x17
	jr	NC, 00105$
;main.c:1067: player->x = MIN_GIRL_X;
	pop	hl
	ld	(hl), #0x17
	push	hl
00105$:
;main.c:1069: if(player->x > MAX_GIRL_X)
	pop	de
	push	de
	ld	a, (de)
	cp	a, #0x8b
	jr	C, 00107$
;main.c:1071: player->x = MAX_GIRL_X;
	pop	hl
	ld	(hl), #0x8a
	push	hl
00107$:
;main.c:1073: if(player->y < MIN_GIRL_Y)
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	sub	a, #0x14
	jr	NC, 00109$
;main.c:1075: player->y = MIN_GIRL_Y;
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), #0x14
00109$:
;main.c:1077: if(player->y > MAX_GIRL_Y)
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	cp	a, #0x72
	jr	C, 00111$
;main.c:1079: player->y = MAX_GIRL_Y;
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), #0x71
00111$:
;main.c:1082: if(locktimer == 0)
	ld	a, (#_locktimer)
	or	a, a
	jr	NZ, 00113$
;main.c:1084: move_weapon(weapon, player);
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
;main.c:1088: weapon->x += knockback_dx;
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
;main.c:1089: weapon->y += knockback_dy;
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
;main.c:1090: move_sword_sprites_from_position(weapon);
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_move_sword_sprites_from_position
00114$:
;main.c:1093: knockback_timer--;
	ld	hl, #_knockback_timer
	dec	(hl)
00116$:
;main.c:1096: if(locktimer > 0)
	ld	a, (#_locktimer)
	or	a, a
	jp	Z, 00168$
;main.c:1098: UINT8 lunge_offset = SWORD_LUNGE_MAX_OFFSET;
	ldhl	sp,	#8
	ld	(hl), #0x08
;main.c:1100: if(locktimer == 1)
	ld	a, (#_locktimer)
	dec	a
	jr	NZ, 00121$
;main.c:1102: lunge_offset = 3;
	ldhl	sp,	#8
	ld	(hl), #0x03
	jr	00122$
00121$:
;main.c:1104: else if(locktimer == 2)
	ld	a, (#_locktimer)
	sub	a, #0x02
	jr	NZ, 00122$
;main.c:1106: lunge_offset = 6;
	ldhl	sp,	#8
	ld	(hl), #0x06
00122$:
;main.c:1109: if(direction == 2)
	ld	a, (#_direction)
	sub	a, #0x02
	jr	NZ, 00150$
;main.c:1111: if(player->x > MIN_GIRL_X)
	pop	de
	push	de
	ld	a, (de)
	ldhl	sp,	#9
	ld	(hl), a
	ld	a, #0x17
	sub	a, (hl)
	jp	NC, 00151$
;main.c:1113: UINT8 distance_to_min_x = player->x - MIN_GIRL_X;
	ld	a, (hl)
	add	a, #0xe9
;main.c:1114: if(distance_to_min_x <= PLAYER_LUNGE_STEP)
	cp	a, #0x04
	jr	NC, 00124$
;main.c:1116: player->x = MIN_GIRL_X;
	pop	hl
	ld	(hl), #0x17
	push	hl
	jr	00151$
00124$:
;main.c:1120: player->x -= PLAYER_LUNGE_STEP;
	ldhl	sp,	#9
	ld	a, (hl)
	add	a, #0xfd
	pop	hl
	push	hl
	ld	(hl), a
	jr	00151$
00150$:
;main.c:1124: else if(direction == 3)
	ld	a, (#_direction)
	sub	a, #0x03
	jr	NZ, 00147$
;main.c:1126: if(player->x < MAX_GIRL_X)
	pop	de
	push	de
	ld	a, (de)
	cp	a, #0x8a
	jr	NC, 00151$
;main.c:1128: UINT8 distance_to_max_x = MAX_GIRL_X - player->x;
	ld	c, a
	ld	a, #0x8a
	sub	a, c
;main.c:1129: if(distance_to_max_x <= PLAYER_LUNGE_STEP)
	cp	a, #0x04
	jr	NC, 00129$
;main.c:1131: player->x = MAX_GIRL_X;
	pop	hl
	ld	(hl), #0x8a
	push	hl
	jr	00151$
00129$:
;main.c:1135: player->x += PLAYER_LUNGE_STEP;
	inc	c
	inc	c
	inc	c
	pop	hl
	push	hl
	ld	(hl), c
	jr	00151$
00147$:
;main.c:1063: player->y += knockback_dy;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
;main.c:1143: UINT8 distance_to_min_y = player->y - MIN_GIRL_Y;
	ld	c, b
;main.c:1139: else if(direction == 1)
	ld	a, (#_direction)
	dec	a
	jr	NZ, 00144$
;main.c:1141: if(player->y > MIN_GIRL_Y)
	ld	a, #0x14
	sub	a, b
	jr	NC, 00151$
;main.c:1143: UINT8 distance_to_min_y = player->y - MIN_GIRL_Y;
	ld	a, c
	add	a, #0xec
;main.c:1144: if(distance_to_min_y <= PLAYER_LUNGE_STEP)
	cp	a, #0x04
	jr	NC, 00134$
;main.c:1146: player->y = MIN_GIRL_Y;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x14
	jr	00151$
00134$:
;main.c:1150: player->y -= PLAYER_LUNGE_STEP;
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
;main.c:1156: if(player->y < MAX_GIRL_Y)
	ld	a, b
	sub	a, #0x71
	jr	NC, 00151$
;main.c:1158: UINT8 distance_to_max_y = MAX_GIRL_Y - player->y;
	ld	a, #0x71
	sub	a, c
;main.c:1159: if(distance_to_max_y <= PLAYER_LUNGE_STEP)
	cp	a, #0x04
	jr	NC, 00139$
;main.c:1161: player->y = MAX_GIRL_Y;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x71
	jr	00151$
00139$:
;main.c:1165: player->y += PLAYER_LUNGE_STEP;
	inc	c
	inc	c
	inc	c
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
00151$:
;main.c:1170: move_weapon(weapon, player);
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_move_weapon
;main.c:1172: if(direction == 2)
	ld	a, (#_direction)
	sub	a, #0x02
	jr	NZ, 00159$
;main.c:1174: weapon->x -= lunge_offset;
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
;main.c:1176: else if(direction == 3)
	ld	a, (#_direction)
	sub	a, #0x03
	jr	NZ, 00156$
;main.c:1178: weapon->x += lunge_offset;
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
;main.c:1089: weapon->y += knockback_dy;
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
;main.c:1180: else if(direction == 1)
	ld	a, (#_direction)
	dec	a
	jr	NZ, 00153$
;main.c:1182: weapon->y -= lunge_offset;
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
;main.c:1186: weapon->y += lunge_offset;
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
;main.c:1189: move_sword_sprites_from_position(weapon);
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_move_sword_sprites_from_position
;main.c:1191: UINT8 max_check = (current_enemy_count > MAX_ENEMIES) ? MAX_ENEMIES : current_enemy_count;
	ld	a, #0x0a
	ld	hl, #_current_enemy_count
	sub	a, (hl)
	jr	NC, 00186$
	ld	a, #0x0a
	jr	00187$
00186$:
	ld	a, (_current_enemy_count)
00187$:
	ldhl	sp,	#6
	ld	(hl), a
;main.c:1192: for(UINT8 i = 0; i < max_check; i++)
	ldhl	sp,	#9
	ld	(hl), #0x00
00182$:
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#6
	sub	a, (hl)
	jr	NC, 00163$
;main.c:1195: if(enemies[i].death == 0)
	ldhl	sp,	#9
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	bc, #_enemies
	add	hl, bc
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
	ld	d, (hl)
	ld	hl, #0x0009
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
	jr	NZ, 00183$
;main.c:1197: weapon_enemy_collision(weapon, &enemies[i], i);
	ldhl	sp,	#9
	ld	a, (hl-)
	dec	hl
	push	af
	inc	sp
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	inc	hl
	ld	b, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_weapon_enemy_collision
00183$:
;main.c:1192: for(UINT8 i = 0; i < max_check; i++)
	ldhl	sp,	#9
	inc	(hl)
	jr	00182$
00163$:
;main.c:1201: if(locktimer >= SWORD_LUNGE_FRAMES)
	ld	hl, #_locktimer
	ld	a, (hl)
	sub	a, #0x03
	jr	C, 00165$
;main.c:1203: locktimer = 0;
	ld	(hl), #0x00
;main.c:1204: swordreset(player, weapon);
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	ld	b, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_swordreset
	jr	00168$
00165$:
;main.c:1208: locktimer++;
	ld	hl, #_locktimer
	inc	(hl)
00168$:
;main.c:1212: if(player_stats.is_dead == 1)
	ld	a, (#(_player_stats + 6) + 0)
	dec	a
	jr	NZ, 00176$
;main.c:1214: hide_character_sprites(player);
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_hide_character_sprites
	jr	00177$
00176$:
;main.c:1055: if(player_stats.invuln_timer > 0 && player_stats.is_dead == 0)
	ld	a, (#(_player_stats + 5) + 0)
;main.c:1216: else if(player_stats.invuln_timer > 0)
	or	a, a
	jr	Z, 00173$
;main.c:1218: if(player_stats.invuln_timer % INVULN_FLASH_PERIOD == 0)
	and	a, #0x01
	jr	NZ, 00170$
;main.c:1220: hide_character_sprites(player);
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_hide_character_sprites
	jr	00177$
00170$:
;main.c:1224: move_player(player, player->x, player->y);
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
	jr	00177$
00173$:
;main.c:1229: move_player(player, player->x, player->y);
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
00177$:
;main.c:1232: if(player_stats.is_dead == 0 && locktimer == 0)
	ld	a, (#(_player_stats + 6) + 0)
	or	a, a
	jr	NZ, 00184$
	ld	a, (#_locktimer)
	or	a, a
	jr	NZ, 00184$
;main.c:1234: move_weapon(weapon, player);
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_move_weapon
00184$:
;main.c:1236: }
	add	sp, #14
	ret
;main.c:1238: void setup_enemy(struct Enemy* enemy, UINT8 oam_slot, UINT8 x, UINT8 y, UINT8 type)
;	---------------------------------
; Function setup_enemy
; ---------------------------------
_setup_enemy::
	add	sp, #-19
	ld	c, e
	ld	b, d
	ldhl	sp,	#18
	ld	(hl), a
;main.c:1240: enemy->type = type;
	ld	hl, #0x000d
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#23
	ld	a, (hl)
	ld	(de), a
;main.c:1241: enemy->x = x;
	ld	hl, #0x0004
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#21
	ld	a, (hl)
	ld	(de), a
;main.c:1242: enemy->y = y;
	ld	hl, #0x0005
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#22
	ld	a, (hl)
	ld	(de), a
;main.c:1243: enemy->anim = 0;
	ld	hl, #0x0008
	add	hl, bc
	ld	(hl), #0x00
;main.c:1244: enemy->death = 0;
	ld	hl, #0x0009
	add	hl, bc
	ld	(hl), #0x00
;main.c:1245: enemy->move_timer = 0;  // Initialize movement timer
	ld	hl, #0x000c
	add	hl, bc
	ld	(hl), #0x00
;main.c:1249: enemy->width = 8;
	ld	hl, #0x0006
	add	hl, bc
	ld	e, l
	ld	d, h
;main.c:1250: enemy->height = 8;
	ld	hl, #0x0007
	add	hl, bc
	inc	sp
	inc	sp
	push	hl
;main.c:1252: enemy->max_health = SLIME_BASE_HP * enemy_hp_multiplier;
	ld	hl, #0x000a
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), a
;main.c:1253: enemy->current_health = enemy->max_health;
	ld	hl, #0x000b
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl), a
;main.c:1254: enemy->spawn_timer = 0;  // Slimes don't spawn others
	ld	hl, #0x000e
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl), a
;main.c:1255: enemy->attack_timer = 0;
	ld	hl, #0x000f
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl), a
;main.c:1256: enemy->attack_anim_frame = 0;
	ld	hl, #0x0010
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#12
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#11
	ld	(hl), a
;main.c:1257: enemy->jump_timer = SLIME_JUMP_COOLDOWN;  // Initialize jump timer
	ld	hl, #0x0011
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#14
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#13
	ld	(hl), a
;main.c:1258: enemy->jump_target_x = x;
	ld	hl, #0x0012
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#16
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#15
	ld	(hl), a
;main.c:1259: enemy->jump_target_y = y;
	ld	hl, #0x0013
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#18
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#17
	ld	(hl), a
;main.c:1247: if(type == ENEMY_TYPE_SLIME)
	ldhl	sp,	#23
	ld	a, (hl)
	or	a, a
	jp	NZ, 00105$
;main.c:1249: enemy->width = 8;
	ld	a, #0x08
	ld	(de), a
;main.c:1250: enemy->height = 8;
	pop	hl
	ld	(hl), #0x08
	push	hl
;main.c:1252: enemy->max_health = SLIME_BASE_HP * enemy_hp_multiplier;
	ld	a, (_enemy_hp_multiplier)
	ld	e, a
	add	a, a
	add	a, a
	add	a, e
	add	a, a
	ldhl	sp,	#2
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;main.c:1253: enemy->current_health = enemy->max_health;
	ldhl	sp,	#4
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;main.c:1254: enemy->spawn_timer = 0;  // Slimes don't spawn others
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;main.c:1255: enemy->attack_timer = 0;
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;main.c:1256: enemy->attack_anim_frame = 0;
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;main.c:1257: enemy->jump_timer = SLIME_JUMP_COOLDOWN;  // Initialize jump timer
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x14
;main.c:1258: enemy->jump_target_x = x;
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#21
	ld	a, (hl)
	ld	(de), a
;main.c:1259: enemy->jump_target_y = y;
	ldhl	sp,	#16
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#22
	ld	a, (hl)
	ld	(de), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ldhl	sp,	#18
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sla	e
	rl	d
	sla	e
	rl	d
	ld	hl,#_shadow_OAM + 1
	add	hl,de
	inc	hl
	ld	(hl), #0x10
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	hl,#_shadow_OAM + 1
	add	hl,de
	inc	hl
	inc	hl
	ld	(hl), #0x10
;main.c:1264: enemy->spritids[0] = oam_slot;
	ldhl	sp,	#18
	ld	a, (hl)
	ld	(bc), a
;main.c:1267: enemy->spritids[1] = 0xFF;
	ld	l, c
	ld	h, b
	inc	hl
	ld	(hl), #0xff
;main.c:1268: enemy->spritids[2] = 0xFF;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	(hl), #0xff
;main.c:1269: enemy->spritids[3] = 0xFF;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0xff
	jp	00106$
00105$:
;main.c:1271: else if(type == ENEMY_TYPE_BOSS)
	ldhl	sp,	#23
	ld	a, (hl)
	dec	a
	jp	NZ, 00106$
;main.c:1273: enemy->width = 16;
	ld	a, #0x10
	ld	(de), a
;main.c:1274: enemy->height = 16;
	pop	hl
	ld	(hl), #0x10
	push	hl
;main.c:1276: enemy->max_health = BOSS_BASE_HP * enemy_hp_multiplier;
	ld	a, (_enemy_hp_multiplier)
	ld	e, a
	add	a, a
	add	a, e
	add	a, a
	add	a, a
	add	a, a
	add	a, e
	add	a, a
	add	a, a
	ldhl	sp,	#2
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;main.c:1277: enemy->current_health = enemy->max_health;
	ldhl	sp,	#4
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;main.c:1280: enemy->spawn_timer = BOSS_SPAWN_MIN_FRAMES + (rand() % (BOSS_SPAWN_MAX_FRAMES - BOSS_SPAWN_MIN_FRAMES + 1));
	call	_rand
	ld	a, e
	push	bc
	ld	e, #0x0b
	call	__moduchar
	ld	a, c
	pop	bc
	add	a, #0x14
	ldhl	sp,	#6
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;main.c:1283: enemy->attack_timer = BOSS_ATTACK_COOLDOWN;
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x3c
;main.c:1284: enemy->attack_anim_frame = 0;
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;main.c:1285: enemy->jump_timer = 0;
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;main.c:1286: enemy->jump_target_x = x;
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#21
	ld	a, (hl)
	ld	(de), a
;main.c:1287: enemy->jump_target_y = y;
	ldhl	sp,	#16
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#22
	ld	a, (hl)
	ld	(de), a
;main.c:1290: for(UINT8 i = 0; i < 4; i++)
	ld	e, #0x00
00112$:
;main.c:1292: set_sprite_tile(oam_slot + i, 22 + i);  // Boss tiles 22-25
	ld	a,e
	cp	a,#0x04
	jr	NC, 00106$
	add	a, #0x16
	ldhl	sp,	#16
	ld	(hl+), a
	inc	hl
	ld	a, (hl-)
	add	a, e
	ld	(hl), a
	ld	d, (hl)
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	xor	a, a
	ld	l, d
	ld	h, a
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	pop	de
	push	hl
	ldhl	sp,	#18
	ld	a, (hl)
	pop	hl
	ld	(hl), a
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ldhl	sp,	#17
	ld	d, (hl)
	xor	a, a
	ld	l, d
	ld	h, a
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	inc	hl
	pop	de
	ld	(hl), #0x10
;main.c:1294: enemy->spritids[i] = oam_slot + i;
	ld	l, e
	ld	h, #0x00
	add	hl, bc
	push	hl
	ldhl	sp,	#19
	ld	a, (hl)
	pop	hl
	ld	(hl), a
;main.c:1290: for(UINT8 i = 0; i < 4; i++)
	inc	e
	jr	00112$
00106$:
;main.c:1298: move_enemy_small(enemy, x, y);
	ldhl	sp,	#22
	ld	a, (hl-)
	push	af
	inc	sp
	ld	a, (hl)
	ld	e, c
	ld	d, b
	call	_move_enemy_small
;main.c:1299: }
	add	sp, #19
	pop	hl
	add	sp, #3
	jp	(hl)
;main.c:1302: void room_0(void)
;	---------------------------------
; Function room_0
; ---------------------------------
_room_0::
;main.c:1304: current_enemy_count = 4;
	ld	hl, #_current_enemy_count
	ld	(hl), #0x04
;main.c:1305: setup_enemy(&enemies[0], 22, 26, 50, ENEMY_TYPE_SLIME);   // Left top
	xor	a, a
	ld	h, a
	ld	l, #0x32
	push	hl
	ld	a, #0x1a
	push	af
	inc	sp
	ld	a, #0x16
	ld	de, #_enemies
	call	_setup_enemy
;main.c:1306: setup_enemy(&enemies[1], 23, 26, 70, ENEMY_TYPE_SLIME);   // Left bottom
	xor	a, a
	ld	h, a
	ld	l, #0x46
	push	hl
	ld	a, #0x1a
	push	af
	inc	sp
	ld	a, #0x17
	ld	de, #(_enemies + 20)
	call	_setup_enemy
;main.c:1307: setup_enemy(&enemies[2], 24, 134, 50, ENEMY_TYPE_SLIME);  // Right top
	xor	a, a
	ld	h, a
	ld	l, #0x32
	push	hl
	ld	a, #0x86
	push	af
	inc	sp
	ld	a, #0x18
	ld	de, #(_enemies + 40)
	call	_setup_enemy
;main.c:1308: setup_enemy(&enemies[3], 25, 134, 70, ENEMY_TYPE_SLIME);  // Right bottom
	xor	a, a
	ld	h, a
	ld	l, #0x46
	push	hl
	ld	a, #0x86
	push	af
	inc	sp
	ld	a, #0x19
	ld	de, #(_enemies + 60)
	call	_setup_enemy
;main.c:1311: for(UINT8 i = 4; i < MAX_ENEMIES; i++)
	ld	c, #0x04
00103$:
	ld	a, c
	sub	a, #0x0a
	jr	NC, 00101$
;main.c:1313: enemies[i].death = 1;
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	a, l
	add	a, #<(_enemies)
	ld	e, a
	ld	a, h
	adc	a, #>(_enemies)
	ld	d, a
	ld	hl, #0x0009
	add	hl, de
	ld	(hl), #0x01
;main.c:1314: hide_enemy_sprites(&enemies[i]);
	push	bc
	call	_hide_enemy_sprites
	pop	bc
;main.c:1311: for(UINT8 i = 4; i < MAX_ENEMIES; i++)
	inc	c
	jr	00103$
00101$:
;main.c:1317: enemy_start_delay_timer = ENEMY_START_DELAY_FRAMES;
	ld	hl, #_enemy_start_delay_timer
	ld	(hl), #0x0f
;main.c:1318: room_cleared = 0;
;main.c:1319: reward_active = 0;
	xor	a, a
	ld	(#_room_cleared), a
	ld	(#_reward_active),a
;main.c:1320: reward_claimed = 0;
;main.c:1321: can_transition = 0;
	xor	a, a
	ld	(#_reward_claimed), a
	ld	(#_can_transition),a
;main.c:1322: room_clear_timer = 0;
;main.c:1323: transition_cooldown_timer = 0;
	xor	a, a
	ld	(#_room_clear_timer), a
	ld	(#_transition_cooldown_timer),a
;main.c:1324: }
	ret
;main.c:1327: void room_1(void)
;	---------------------------------
; Function room_1
; ---------------------------------
_room_1::
;main.c:1329: current_enemy_count = 6;
	ld	hl, #_current_enemy_count
	ld	(hl), #0x06
;main.c:1330: setup_enemy(&enemies[0], 22, 26, 50, ENEMY_TYPE_SLIME);   // Left top
	xor	a, a
	ld	h, a
	ld	l, #0x32
	push	hl
	ld	a, #0x1a
	push	af
	inc	sp
	ld	a, #0x16
	ld	de, #_enemies
	call	_setup_enemy
;main.c:1331: setup_enemy(&enemies[1], 23, 26, 70, ENEMY_TYPE_SLIME);   // Left bottom
	xor	a, a
	ld	h, a
	ld	l, #0x46
	push	hl
	ld	a, #0x1a
	push	af
	inc	sp
	ld	a, #0x17
	ld	de, #(_enemies + 20)
	call	_setup_enemy
;main.c:1332: setup_enemy(&enemies[2], 24, 26, 90, ENEMY_TYPE_SLIME);  // Right top
	xor	a, a
	ld	h, a
	ld	l, #0x5a
	push	hl
	ld	a, #0x1a
	push	af
	inc	sp
	ld	a, #0x18
	ld	de, #(_enemies + 40)
	call	_setup_enemy
;main.c:1333: setup_enemy(&enemies[3], 25, 134, 50, ENEMY_TYPE_SLIME);  // Right bottom
	xor	a, a
	ld	h, a
	ld	l, #0x32
	push	hl
	ld	a, #0x86
	push	af
	inc	sp
	ld	a, #0x19
	ld	de, #(_enemies + 60)
	call	_setup_enemy
;main.c:1334: setup_enemy(&enemies[4], 26, 134, 70, ENEMY_TYPE_SLIME);  
	xor	a, a
	ld	h, a
	ld	l, #0x46
	push	hl
	ld	a, #0x86
	push	af
	inc	sp
	ld	a, #0x1a
	ld	de, #(_enemies + 80)
	call	_setup_enemy
;main.c:1335: setup_enemy(&enemies[5], 27, 134, 90, ENEMY_TYPE_SLIME);
	xor	a, a
	ld	h, a
	ld	l, #0x5a
	push	hl
	ld	a, #0x86
	push	af
	inc	sp
	ld	a, #0x1b
	ld	de, #(_enemies + 100)
	call	_setup_enemy
;main.c:1338: for(UINT8 i = 6; i < MAX_ENEMIES; i++)
	ld	c, #0x06
00103$:
	ld	a, c
	sub	a, #0x0a
	jr	NC, 00101$
;main.c:1340: enemies[i].death = 1;
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	a, l
	add	a, #<(_enemies)
	ld	e, a
	ld	a, h
	adc	a, #>(_enemies)
	ld	d, a
	ld	hl, #0x0009
	add	hl, de
	ld	(hl), #0x01
;main.c:1341: hide_enemy_sprites(&enemies[i]);
	push	bc
	call	_hide_enemy_sprites
	pop	bc
;main.c:1338: for(UINT8 i = 6; i < MAX_ENEMIES; i++)
	inc	c
	jr	00103$
00101$:
;main.c:1344: enemy_start_delay_timer = ENEMY_START_DELAY_FRAMES;
	ld	hl, #_enemy_start_delay_timer
	ld	(hl), #0x0f
;main.c:1345: room_cleared = 0;
;main.c:1346: reward_active = 0;
	xor	a, a
	ld	(#_room_cleared), a
	ld	(#_reward_active),a
;main.c:1347: reward_claimed = 0;
;main.c:1348: can_transition = 0;
	xor	a, a
	ld	(#_reward_claimed), a
	ld	(#_can_transition),a
;main.c:1349: room_clear_timer = 0;
;main.c:1350: transition_cooldown_timer = 0;
	xor	a, a
	ld	(#_room_clear_timer), a
	ld	(#_transition_cooldown_timer),a
;main.c:1351: }
	ret
;main.c:1353: void room_3(void)
;	---------------------------------
; Function room_3
; ---------------------------------
_room_3::
;main.c:1355: current_enemy_count = 8;
	ld	hl, #_current_enemy_count
	ld	(hl), #0x08
;main.c:1356: setup_enemy(&enemies[0], 22, 26, 50, ENEMY_TYPE_SLIME);   // Left top
	xor	a, a
	ld	h, a
	ld	l, #0x32
	push	hl
	ld	a, #0x1a
	push	af
	inc	sp
	ld	a, #0x16
	ld	de, #_enemies
	call	_setup_enemy
;main.c:1357: setup_enemy(&enemies[1], 23, 26, 70, ENEMY_TYPE_SLIME);   // Left bottom
	xor	a, a
	ld	h, a
	ld	l, #0x46
	push	hl
	ld	a, #0x1a
	push	af
	inc	sp
	ld	a, #0x17
	ld	de, #(_enemies + 20)
	call	_setup_enemy
;main.c:1358: setup_enemy(&enemies[2], 24, 26, 90, ENEMY_TYPE_SLIME);  // Right top
	xor	a, a
	ld	h, a
	ld	l, #0x5a
	push	hl
	ld	a, #0x1a
	push	af
	inc	sp
	ld	a, #0x18
	ld	de, #(_enemies + 40)
	call	_setup_enemy
;main.c:1359: setup_enemy(&enemies[3], 25, 134, 50, ENEMY_TYPE_SLIME);  // Right bottom
	xor	a, a
	ld	h, a
	ld	l, #0x32
	push	hl
	ld	a, #0x86
	push	af
	inc	sp
	ld	a, #0x19
	ld	de, #(_enemies + 60)
	call	_setup_enemy
;main.c:1360: setup_enemy(&enemies[4], 26, 134, 70, ENEMY_TYPE_SLIME);  
	xor	a, a
	ld	h, a
	ld	l, #0x46
	push	hl
	ld	a, #0x86
	push	af
	inc	sp
	ld	a, #0x1a
	ld	de, #(_enemies + 80)
	call	_setup_enemy
;main.c:1361: setup_enemy(&enemies[5], 27, 134, 90, ENEMY_TYPE_SLIME);
	xor	a, a
	ld	h, a
	ld	l, #0x5a
	push	hl
	ld	a, #0x86
	push	af
	inc	sp
	ld	a, #0x1b
	ld	de, #(_enemies + 100)
	call	_setup_enemy
;main.c:1362: setup_enemy(&enemies[6], 28, 26, 110, ENEMY_TYPE_SLIME);  
	xor	a, a
	ld	h, a
	ld	l, #0x6e
	push	hl
	ld	a, #0x1a
	push	af
	inc	sp
	ld	a, #0x1c
	ld	de, #(_enemies + 120)
	call	_setup_enemy
;main.c:1363: setup_enemy(&enemies[7], 29, 134, 110, ENEMY_TYPE_SLIME);
	xor	a, a
	ld	h, a
	ld	l, #0x6e
	push	hl
	ld	a, #0x86
	push	af
	inc	sp
	ld	a, #0x1d
	ld	de, #(_enemies + 140)
	call	_setup_enemy
;main.c:1366: for(UINT8 i = 8; i < MAX_ENEMIES; i++)
	ld	c, #0x08
00103$:
	ld	a, c
	sub	a, #0x0a
	jr	NC, 00101$
;main.c:1368: enemies[i].death = 1;
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	a, l
	add	a, #<(_enemies)
	ld	e, a
	ld	a, h
	adc	a, #>(_enemies)
	ld	d, a
	ld	hl, #0x0009
	add	hl, de
	ld	(hl), #0x01
;main.c:1369: hide_enemy_sprites(&enemies[i]);
	push	bc
	call	_hide_enemy_sprites
	pop	bc
;main.c:1366: for(UINT8 i = 8; i < MAX_ENEMIES; i++)
	inc	c
	jr	00103$
00101$:
;main.c:1372: enemy_start_delay_timer = ENEMY_START_DELAY_FRAMES;
	ld	hl, #_enemy_start_delay_timer
	ld	(hl), #0x0f
;main.c:1373: room_cleared = 0;
;main.c:1374: reward_active = 0;
	xor	a, a
	ld	(#_room_cleared), a
	ld	(#_reward_active),a
;main.c:1375: reward_claimed = 0;
;main.c:1376: can_transition = 0;
	xor	a, a
	ld	(#_reward_claimed), a
	ld	(#_can_transition),a
;main.c:1377: room_clear_timer = 0;
;main.c:1378: transition_cooldown_timer = 0;
	xor	a, a
	ld	(#_room_clear_timer), a
	ld	(#_transition_cooldown_timer),a
;main.c:1379: }
	ret
;main.c:1381: void room_4(void)
;	---------------------------------
; Function room_4
; ---------------------------------
_room_4::
;main.c:1383: current_enemy_count = 10;
	ld	hl, #_current_enemy_count
	ld	(hl), #0x0a
;main.c:1384: setup_enemy(&enemies[0], 22, 26, 50, ENEMY_TYPE_SLIME);   // Left top
	xor	a, a
	ld	h, a
	ld	l, #0x32
	push	hl
	ld	a, #0x1a
	push	af
	inc	sp
	ld	a, #0x16
	ld	de, #_enemies
	call	_setup_enemy
;main.c:1385: setup_enemy(&enemies[1], 23, 26, 70, ENEMY_TYPE_SLIME);   // Left bottom
	xor	a, a
	ld	h, a
	ld	l, #0x46
	push	hl
	ld	a, #0x1a
	push	af
	inc	sp
	ld	a, #0x17
	ld	de, #(_enemies + 20)
	call	_setup_enemy
;main.c:1386: setup_enemy(&enemies[2], 24, 26, 90, ENEMY_TYPE_SLIME);  // Right top
	xor	a, a
	ld	h, a
	ld	l, #0x5a
	push	hl
	ld	a, #0x1a
	push	af
	inc	sp
	ld	a, #0x18
	ld	de, #(_enemies + 40)
	call	_setup_enemy
;main.c:1387: setup_enemy(&enemies[3], 25, 134, 50, ENEMY_TYPE_SLIME);  // Right bottom
	xor	a, a
	ld	h, a
	ld	l, #0x32
	push	hl
	ld	a, #0x86
	push	af
	inc	sp
	ld	a, #0x19
	ld	de, #(_enemies + 60)
	call	_setup_enemy
;main.c:1388: setup_enemy(&enemies[4], 26, 134, 70, ENEMY_TYPE_SLIME);  
	xor	a, a
	ld	h, a
	ld	l, #0x46
	push	hl
	ld	a, #0x86
	push	af
	inc	sp
	ld	a, #0x1a
	ld	de, #(_enemies + 80)
	call	_setup_enemy
;main.c:1389: setup_enemy(&enemies[5], 27, 134, 90, ENEMY_TYPE_SLIME);
	xor	a, a
	ld	h, a
	ld	l, #0x5a
	push	hl
	ld	a, #0x86
	push	af
	inc	sp
	ld	a, #0x1b
	ld	de, #(_enemies + 100)
	call	_setup_enemy
;main.c:1390: setup_enemy(&enemies[6], 28, 26, 110, ENEMY_TYPE_SLIME);  
	xor	a, a
	ld	h, a
	ld	l, #0x6e
	push	hl
	ld	a, #0x1a
	push	af
	inc	sp
	ld	a, #0x1c
	ld	de, #(_enemies + 120)
	call	_setup_enemy
;main.c:1391: setup_enemy(&enemies[7], 29, 134, 110, ENEMY_TYPE_SLIME);
	xor	a, a
	ld	h, a
	ld	l, #0x6e
	push	hl
	ld	a, #0x86
	push	af
	inc	sp
	ld	a, #0x1d
	ld	de, #(_enemies + 140)
	call	_setup_enemy
;main.c:1392: setup_enemy(&enemies[8], 30, 46, 110, ENEMY_TYPE_SLIME);  
	xor	a, a
	ld	h, a
	ld	l, #0x6e
	push	hl
	ld	a, #0x2e
	push	af
	inc	sp
	ld	a, #0x1e
	ld	de, #(_enemies + 160)
	call	_setup_enemy
;main.c:1393: setup_enemy(&enemies[9], 31, 114, 110, ENEMY_TYPE_SLIME);
	xor	a, a
	ld	h, a
	ld	l, #0x6e
	push	hl
	ld	a, #0x72
	push	af
	inc	sp
	ld	a, #0x1f
	ld	de, #(_enemies + 180)
	call	_setup_enemy
;main.c:1396: for(UINT8 i = 10; i <= MAX_ENEMIES; i++)
	ld	a, #0x0a
00103$:
	cp	a, #0x0b
	jr	NC, 00101$
;main.c:1398: enemies[i].death = 1;
	ld	hl, #(_enemies + 200) + 9
	ld	(hl), #0x01
;main.c:1399: hide_enemy_sprites(&enemies[i]);
	ld	de, #(_enemies + 200)
	call	_hide_enemy_sprites
;main.c:1396: for(UINT8 i = 10; i <= MAX_ENEMIES; i++)
	ld	a, #0x0b
	jr	00103$
00101$:
;main.c:1402: enemy_start_delay_timer = ENEMY_START_DELAY_FRAMES;
	ld	hl, #_enemy_start_delay_timer
	ld	(hl), #0x0f
;main.c:1403: room_cleared = 0;
;main.c:1404: reward_active = 0;
	xor	a, a
	ld	(#_room_cleared), a
	ld	(#_reward_active),a
;main.c:1405: reward_claimed = 0;
;main.c:1406: can_transition = 0;
	xor	a, a
	ld	(#_reward_claimed), a
	ld	(#_can_transition),a
;main.c:1407: room_clear_timer = 0;
;main.c:1408: transition_cooldown_timer = 0;
	xor	a, a
	ld	(#_room_clear_timer), a
	ld	(#_transition_cooldown_timer),a
;main.c:1409: }
	ret
;main.c:1412: void room_2(void)
;	---------------------------------
; Function room_2
; ---------------------------------
_room_2::
;main.c:1414: current_enemy_count = 1;  // Just the boss
	ld	hl, #_current_enemy_count
;main.c:1416: setup_enemy(&enemies[0], 22, 80, 60, ENEMY_TYPE_BOSS);
	ld	(hl), #0x01
	ld	hl, #0x13c
	push	hl
	ld	a, #0x50
	push	af
	inc	sp
	ld	a, #0x16
	ld	de, #_enemies
	call	_setup_enemy
;main.c:1419: for(UINT8 i = 1; i < MAX_ENEMIES; i++)
	ld	c, #0x01
00103$:
	ld	a, c
	sub	a, #0x0a
	jr	NC, 00101$
;main.c:1421: enemies[i].death = 1;
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	a, l
	add	a, #<(_enemies)
	ld	e, a
	ld	a, h
	adc	a, #>(_enemies)
	ld	d, a
	ld	hl, #0x0009
	add	hl, de
	ld	(hl), #0x01
;main.c:1422: hide_enemy_sprites(&enemies[i]);
	push	bc
	call	_hide_enemy_sprites
	pop	bc
;main.c:1419: for(UINT8 i = 1; i < MAX_ENEMIES; i++)
	inc	c
	jr	00103$
00101$:
;main.c:1425: enemy_start_delay_timer = ENEMY_START_DELAY_FRAMES;
	ld	hl, #_enemy_start_delay_timer
	ld	(hl), #0x0f
;main.c:1426: room_cleared = 0;
;main.c:1427: reward_active = 0;
	xor	a, a
	ld	(#_room_cleared), a
	ld	(#_reward_active),a
;main.c:1428: reward_claimed = 0;
;main.c:1429: can_transition = 0;
	xor	a, a
	ld	(#_reward_claimed), a
	ld	(#_can_transition),a
;main.c:1430: room_clear_timer = 0;
;main.c:1431: transition_cooldown_timer = 0;
	xor	a, a
	ld	(#_room_clear_timer), a
	ld	(#_transition_cooldown_timer),a
;main.c:1432: }
	ret
;main.c:1434: void room_5(void)
;	---------------------------------
; Function room_5
; ---------------------------------
_room_5::
;main.c:1436: current_enemy_count = 5;  // Boss and adds
	ld	hl, #_current_enemy_count
	ld	(hl), #0x05
;main.c:1438: setup_enemy(&enemies[0], 22, 80, 60, ENEMY_TYPE_BOSS);
	ld	hl, #0x13c
	push	hl
	ld	a, #0x50
	push	af
	inc	sp
	ld	a, #0x16
	ld	de, #_enemies
	call	_setup_enemy
;main.c:1439: setup_enemy(&enemies[1], 26, 26, 50, ENEMY_TYPE_SLIME);   // Left top
	xor	a, a
	ld	h, a
	ld	l, #0x32
	push	hl
	ld	a, #0x1a
	push	af
	inc	sp
	ld	a, #0x1a
	ld	de, #(_enemies + 20)
	call	_setup_enemy
;main.c:1440: setup_enemy(&enemies[2], 27, 26, 70, ENEMY_TYPE_SLIME);   // Left bottom
	xor	a, a
	ld	h, a
	ld	l, #0x46
	push	hl
	ld	a, #0x1a
	push	af
	inc	sp
	ld	a, #0x1b
	ld	de, #(_enemies + 40)
	call	_setup_enemy
;main.c:1441: setup_enemy(&enemies[3], 28, 26, 90, ENEMY_TYPE_SLIME);  // Right top
	xor	a, a
	ld	h, a
	ld	l, #0x5a
	push	hl
	ld	a, #0x1a
	push	af
	inc	sp
	ld	a, #0x1c
	ld	de, #(_enemies + 60)
	call	_setup_enemy
;main.c:1442: setup_enemy(&enemies[4], 29, 134, 50, ENEMY_TYPE_SLIME);  // Right bottom
	xor	a, a
	ld	h, a
	ld	l, #0x32
	push	hl
	ld	a, #0x86
	push	af
	inc	sp
	ld	a, #0x1d
	ld	de, #(_enemies + 80)
	call	_setup_enemy
;main.c:1444: current_enemy_count = 5;
	ld	hl, #_current_enemy_count
	ld	(hl), #0x05
;main.c:1446: for(UINT8 i = 5; i < MAX_ENEMIES; i++)
	ld	c, #0x05
00103$:
	ld	a, c
	sub	a, #0x0a
	jr	NC, 00101$
;main.c:1448: enemies[i].death = 1;
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	a, l
	add	a, #<(_enemies)
	ld	e, a
	ld	a, h
	adc	a, #>(_enemies)
	ld	d, a
	ld	hl, #0x0009
	add	hl, de
	ld	(hl), #0x01
;main.c:1449: hide_enemy_sprites(&enemies[i]);
	push	bc
	call	_hide_enemy_sprites
	pop	bc
;main.c:1446: for(UINT8 i = 5; i < MAX_ENEMIES; i++)
	inc	c
	jr	00103$
00101$:
;main.c:1452: enemy_start_delay_timer = ENEMY_START_DELAY_FRAMES;
	ld	hl, #_enemy_start_delay_timer
	ld	(hl), #0x0f
;main.c:1453: room_cleared = 0;
;main.c:1454: reward_active = 0;
	xor	a, a
	ld	(#_room_cleared), a
	ld	(#_reward_active),a
;main.c:1455: reward_claimed = 0;
;main.c:1456: can_transition = 0;
	xor	a, a
	ld	(#_reward_claimed), a
	ld	(#_can_transition),a
;main.c:1457: room_clear_timer = 0;
;main.c:1458: transition_cooldown_timer = 0;
	xor	a, a
	ld	(#_room_clear_timer), a
	ld	(#_transition_cooldown_timer),a
;main.c:1459: }
	ret
;main.c:1462: void load_room(UINT8 room_id)
;	---------------------------------
; Function load_room
; ---------------------------------
_load_room::
;main.c:1464: if(room_id == 0)
	or	a, a
	jr	NZ, 00117$
;main.c:1466: room_0();
	call	_room_0
	jr	00118$
00117$:
;main.c:1468: else if(room_id == 1)
	cp	a, #0x01
	jr	NZ, 00114$
;main.c:1470: room_1();
	call	_room_1
	jr	00118$
00114$:
;main.c:1472: else if(room_id == 2)
	cp	a, #0x02
	jr	NZ, 00111$
;main.c:1474: room_2();
	call	_room_2
	jr	00118$
00111$:
;main.c:1476: else if(room_id == 3)
	cp	a, #0x03
	jr	NZ, 00108$
;main.c:1478: room_3();
	call	_room_3
	jr	00118$
00108$:
;main.c:1480: else if(room_id == 4)
	cp	a, #0x04
	jr	NZ, 00105$
;main.c:1482: room_4();
	call	_room_4
	jr	00118$
00105$:
;main.c:1484: else if(room_id == 5)
	sub	a, #0x05
	jr	NZ, 00102$
;main.c:1486: room_5();
	call	_room_5
	jr	00118$
00102$:
;main.c:1490: room_0();
	call	_room_0
00118$:
;main.c:1493: setup_character(&girl, PLAYER_SPAWN_X, PLAYER_SPAWN_Y);
	ld	a, #0x24
	push	af
	inc	sp
	ld	a, #0x50
	ld	de, #_girl
	call	_setup_character
;main.c:1494: direction = 0;
	xor	a, a
	ld	(#_direction),a
;main.c:1495: move_weapon(&sword, &girl);
	ld	bc, #_girl
	ld	de, #_sword
	call	_move_weapon
;main.c:1496: hide_room_clear_ui();
	call	_hide_room_clear_ui
;main.c:1497: hide_reward_ui();
	call	_hide_reward_ui
;main.c:1498: hide_ready_ui();
;main.c:1499: }
	jp	_hide_ready_ui
;main.c:1503: void performantdelay(UINT8 numloops)
;	---------------------------------
; Function performantdelay
; ---------------------------------
_performantdelay::
	ld	c, a
;main.c:1506: for(i = 0; i < numloops; i++)
	ld	b, #0x00
00103$:
	ld	a, b
	sub	a, c
	ret	NC
;main.c:1508: wait_vbl_done();
	call	_wait_vbl_done
;main.c:1506: for(i = 0; i < numloops; i++)
	inc	b
;main.c:1510: }
	jr	00103$
;main.c:1512: void character_enemy_collision(struct GameCharacter* character, struct Enemy* enemy)
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
;main.c:1515: if(enemy->death == 1)
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
;main.c:1517: return;
;main.c:1520: if (character->x < enemy->x + enemy->width - pad &&
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
;main.c:1521: character->x + character->width - pad > enemy->x &&
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
;main.c:1522: character->y < enemy->y + enemy->height - pad &&
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
;main.c:1523: character->y + character->height - pad > enemy->y)
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
;main.c:1525: UINT8 took_damage = player_take_damage(1);
	ld	a, #0x01
	call	_player_take_damage
;main.c:1526: if(took_damage)
	or	a, a
	jp	Z, 00119$
;main.c:1528: UINT8 dx = (character->x > enemy->x) ? (character->x - enemy->x) : (enemy->x - character->x);
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
;main.c:1529: UINT8 dy = (character->y > enemy->y) ? (character->y - enemy->y) : (enemy->y - character->y);
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
;main.c:1531: if (character->x < enemy->x)
	ldhl	sp,	#14
	ld	a, (hl-)
	sub	a, (hl)
	jr	NC, 00104$
;main.c:1533: knockback_dx = -KNOCKBACK_STEP;
	ld	hl, #_knockback_dx
	ld	(hl), #0xfe
	jr	00105$
00104$:
;main.c:1537: knockback_dx = KNOCKBACK_STEP;
	ld	hl, #_knockback_dx
	ld	(hl), #0x02
00105$:
;main.c:1539: if (character->y < enemy->y)
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
;main.c:1541: knockback_dy = -KNOCKBACK_STEP;
	ld	hl, #_knockback_dy
	ld	(hl), #0xfe
	jr	00108$
00107$:
;main.c:1545: knockback_dy = KNOCKBACK_STEP;
	ld	hl, #_knockback_dy
	ld	(hl), #0x02
00108$:
;main.c:1548: if (dx < dy)
	ldhl	sp,	#12
	ld	a, (hl)
	sub	a, c
	jr	NC, 00110$
;main.c:1550: knockback_dy = 0;
	xor	a, a
	ld	(#_knockback_dy),a
	jr	00111$
00110$:
;main.c:1554: knockback_dx = 0;
	xor	a, a
	ld	(#_knockback_dx),a
00111$:
;main.c:1557: knockback_timer = KNOCKBACK_FRAMES;
	ld	hl, #_knockback_timer
	ld	(hl), #0x06
00119$:
;main.c:1560: }
	add	sp, #19
	ret
;main.c:1562: void hide_character_sprites(struct GameCharacter* character)
;	---------------------------------
; Function hide_character_sprites
; ---------------------------------
_hide_character_sprites::
;main.c:1564: for(UINT8 i = 0; i < 4; i++)
	ld	c, #0x00
00104$:
	ld	a, c
	sub	a, #0x04
	ret	NC
;main.c:1566: hide_sprite(character->spritids[i]);
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
;main.c:1564: for(UINT8 i = 0; i < 4; i++)
	inc	c
;main.c:1568: }
	jr	00104$
;main.c:1570: void hide_sword_sprites(struct Weapon* weapon)
;	---------------------------------
; Function hide_sword_sprites
; ---------------------------------
_hide_sword_sprites::
;main.c:1572: hide_sprite(weapon->spritids[0]);
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
;main.c:1573: hide_sprite(weapon->spritids[1]);
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
;main.c:1573: hide_sprite(weapon->spritids[1]);
;main.c:1574: }
	ret
;main.c:1576: void hide_enemy_sprites(struct Enemy* enemy)
;	---------------------------------
; Function hide_enemy_sprites
; ---------------------------------
_hide_enemy_sprites::
	add	sp, #-4
	ld	c, e
	ld	b, d
;main.c:1578: if(enemy->type == ENEMY_TYPE_SLIME)
	ld	hl, #0x000d
	add	hl, bc
	ld	e, (hl)
	ld	a, e
	or	a, a
	jr	NZ, 00105$
;main.c:1580: hide_sprite(enemy->spritids[0]);
	ld	a, (bc)
	ld	e, a
;c:\gbdk\include\gb\gb.h:2001: shadow_OAM[nb].y = 0;
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	(hl), #0x00
;main.c:1581: enemy->spritids[0] = 0xFF;  // Mark as unused
	ld	a, #0xff
	ld	(bc), a
	jr	00112$
00105$:
;main.c:1583: else if(enemy->type == ENEMY_TYPE_BOSS)
	dec	e
	jr	NZ, 00112$
;main.c:1585: for(UINT8 i = 0; i < 4; i++)
	ldhl	sp,	#3
	ld	(hl), #0x00
00110$:
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x04
	jr	NC, 00112$
;main.c:1587: hide_sprite(enemy->spritids[i]);
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl), a
;c:\gbdk\include\gb\gb.h:2001: shadow_OAM[nb].y = 0;
	ld	e, (hl)
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	(hl), #0x00
;main.c:1588: enemy->spritids[i] = 0xFF;  // Mark as unused
	pop	hl
	ld	(hl), #0xff
	push	hl
;main.c:1585: for(UINT8 i = 0; i < 4; i++)
	ldhl	sp,	#3
	inc	(hl)
	jr	00110$
00112$:
;main.c:1591: }
	add	sp, #4
	ret
;main.c:1593: void weapon_enemy_collision(struct Weapon* weapon, struct Enemy* enemy, UINT8 enemy_index)
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
;main.c:1596: if(enemy->death == 1)
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
	jp	Z, 00140$
;main.c:1598: return;
;main.c:1602: if(hit_this_attack[enemy_index] == 1)
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
	jp	Z, 00140$
;main.c:1604: return;
;main.c:1611: UINT8 collision_x = weapon->x;
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
;main.c:1612: UINT8 collision_y = weapon->y;
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
;main.c:1613: UINT8 collision_width = weapon->width;
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
;main.c:1614: UINT8 collision_height = weapon->height;
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
;main.c:1617: if(direction == 2 || direction == 3) // left or right
	ld	a,(#_direction)
	cp	a,#0x02
	jr	Z, 00105$
	sub	a, #0x03
	jr	NZ, 00106$
00105$:
;main.c:1619: collision_x = weapon->x - 8;  // Start 8px to the left
	ldhl	sp,	#11
	ld	a, (hl+)
	inc	hl
	add	a, #0xf8
	ld	(hl), a
;main.c:1620: collision_width = 16;  // 2 sprites wide
	ld	c, #0x10
	jr	00107$
00106$:
;main.c:1624: collision_y = weapon->y - 8;  // Start 8px up
	ldhl	sp,	#12
	ld	a, (hl)
	add	a, #0xf8
	ldhl	sp,	#4
;main.c:1625: collision_height = 16;  // 2 sprites tall
	ld	(hl+), a
	ld	(hl), #0x10
00107$:
;main.c:1628: if (collision_x < enemy->x + enemy->width &&
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
	jp	NC, 00140$
;main.c:1629: collision_x + collision_width > enemy->x &&
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
	jp	NC, 00140$
;main.c:1630: collision_y < enemy->y + enemy->height &&
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
	jp	NC, 00140$
;main.c:1631: collision_y + collision_height > enemy->y)
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
	jp	NC, 00140$
;main.c:1634: hit_this_attack[enemy_index] = 1;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x01
;main.c:1635: if(enemy->current_health > 0)
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000b
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#13
	ld	(hl), a
	or	a, a
	jr	Z, 00122$
;main.c:1637: if(player_stats.damage >= enemy->current_health)
	ld	de, #_player_stats+2
	ld	a, (de)
	ld	e, a
	sub	a, (hl)
	jr	C, 00110$
;main.c:1639: enemy->current_health = 0;
	xor	a, a
	ld	(bc), a
	jr	00111$
00110$:
;main.c:1643: enemy->current_health -= player_stats.damage;
	ldhl	sp,	#13
	ld	a, (hl)
	sub	a, e
	ld	(bc), a
00111$:
;main.c:1646: if(direction == 2) // left
	ld	a, (#_direction)
	sub	a, #0x02
	jr	NZ, 00119$
;main.c:1648: enemy->x -= ENEMY_KNOCKBACK_STEP;
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
	jr	00120$
00119$:
;main.c:1650: else if(direction == 3) // right
	ld	a, (#_direction)
	sub	a, #0x03
	jr	NZ, 00116$
;main.c:1652: enemy->x += ENEMY_KNOCKBACK_STEP;
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
	jr	00120$
00116$:
;main.c:1630: collision_y < enemy->y + enemy->height &&
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
;main.c:1656: enemy->y -= ENEMY_KNOCKBACK_STEP;
	ld	e, a
;main.c:1654: else if(direction == 1) // up
	ld	a, (#_direction)
	dec	a
	jr	NZ, 00113$
;main.c:1656: enemy->y -= ENEMY_KNOCKBACK_STEP;
	ld	a, e
	add	a, #0xf8
	ldhl	sp,	#8
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
	jr	00120$
00113$:
;main.c:1660: enemy->y += ENEMY_KNOCKBACK_STEP;
	ld	a, e
	add	a, #0x08
	ldhl	sp,	#8
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
00120$:
;main.c:1663: enemy_check_borders(enemy);
	push	bc
	ldhl	sp,	#16
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_enemy_check_borders
	pop	bc
00122$:
;main.c:1666: sfx_enemy_hit();
	push	bc
	call	_sfx_enemy_hit
	pop	bc
;main.c:1668: if(enemy->current_health == 0)
	ld	a, (bc)
	or	a, a
	jr	NZ, 00140$
;main.c:1670: enemy->death = 1;
	pop	hl
	ld	(hl), #0x01
	push	hl
;main.c:1671: hide_enemy_sprites(enemy);
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_hide_enemy_sprites
;main.c:1674: if(enemy->type == ENEMY_TYPE_BOSS)
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000d
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	dec	a
	jr	NZ, 00132$
;main.c:1677: if(enemy->x < MIN_ENEMY_X) enemy->x = MIN_ENEMY_X;
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	sub	a, #0x18
	jr	NC, 00124$
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), #0x18
00124$:
;main.c:1678: if(enemy->x > MAX_ENEMY_X) enemy->x = MAX_ENEMY_X;
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	cp	a, #0x91
	jr	C, 00126$
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), #0x90
00126$:
;main.c:1679: if(enemy->y < MIN_ENEMY_Y) enemy->y = MIN_ENEMY_Y;
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	sub	a, #0x1c
	jr	NC, 00128$
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), #0x1c
00128$:
;main.c:1680: if(enemy->y > MAX_ENEMY_Y) enemy->y = MAX_ENEMY_Y;
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	cp	a, #0x79
	jr	C, 00130$
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), #0x78
00130$:
;main.c:1682: spawn_boss_death_slimes(enemy);
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_spawn_boss_death_slimes
00132$:
;main.c:1685: score ++;
	ld	hl, #_score
	inc	(hl)
00140$:
;main.c:1689: }
	add	sp, #18
	pop	hl
	inc	sp
	jp	(hl)
;main.c:1690: void move_player(struct GameCharacter* character, UINT8 x, UINT8 y)
;	---------------------------------
; Function move_player
; ---------------------------------
_move_player::
	dec	sp
	ldhl	sp,	#0
	ld	(hl), a
;main.c:1692: move_sprite(character->spritids[0], x, y);
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
;main.c:1693: move_sprite(character->spritids[1], x + spritesize, y);
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
;main.c:1694: move_sprite(character->spritids[2], x, y + spritesize);
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
;main.c:1695: move_sprite(character->spritids[3], x + spritesize, y + spritesize);
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
;main.c:1695: move_sprite(character->spritids[3], x + spritesize, y + spritesize);
;main.c:1696: }
	inc	sp
	pop	hl
	inc	sp
	jp	(hl)
;main.c:1697: void move_weapon(struct Weapon* weapon, struct GameCharacter* owner)
;	---------------------------------
; Function move_weapon
; ---------------------------------
_move_weapon::
	add	sp, #-14
	ldhl	sp,	#12
	ld	a, e
	ld	(hl+), a
;main.c:1703: weapon->x = owner->x;
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
;main.c:1704: weapon->y = owner->y + 8;
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
;main.c:1701: if(direction == 2) // left
	ld	a, (#_direction)
	sub	a, #0x02
	jp	NZ, 00110$
;main.c:1703: weapon->x = owner->x;
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
;main.c:1704: weapon->y = owner->y + 8;
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
;main.c:1707: weapon->spritids[0] = 4;
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
;main.c:1710: weapon->spritids[1] = 5;
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
;main.c:1711: move_sprite(weapon->spritids[0], weapon->x, weapon->y);
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
;main.c:1712: move_sprite(weapon->spritids[1], weapon->x - spritesize, weapon->y);
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
;main.c:1712: move_sprite(weapon->spritids[1], weapon->x - spritesize, weapon->y);
	jp	00136$
00110$:
;main.c:1714: else if(direction == 3) // right
	ld	a, (#_direction)
	sub	a, #0x03
	jp	NZ, 00107$
;main.c:1716: weapon->x = owner->x + 18;
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
;main.c:1717: weapon->y = owner->y + 8;
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
;main.c:1720: weapon->spritids[1] = 4;
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
;main.c:1723: weapon->spritids[0] = 5;
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x05
;main.c:1724: move_sprite(weapon->spritids[0], weapon->x, weapon->y);
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
;main.c:1725: move_sprite(weapon->spritids[1], weapon->x - spritesize, weapon->y);
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
;main.c:1725: move_sprite(weapon->spritids[1], weapon->x - spritesize, weapon->y);
	jp	00136$
00107$:
;main.c:1727: else if(direction == 1) // up
	ld	a, (#_direction)
	dec	a
	jp	NZ, 00104$
;main.c:1729: weapon->x = owner->x + 9;
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
;main.c:1730: weapon->y = owner->y + 3;
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
;main.c:1733: weapon->spritids[0] = 4;
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
;main.c:1736: weapon->spritids[1] = 5;
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
;main.c:1737: move_sprite(weapon->spritids[0], weapon->x, weapon->y);
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
;main.c:1738: move_sprite(weapon->spritids[1], weapon->x, weapon->y - spritesize);
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
;main.c:1738: move_sprite(weapon->spritids[1], weapon->x, weapon->y - spritesize);
	jp	00136$
00104$:
;main.c:1740: else if(direction == 0) // down
	ld	a, (#_direction)
	or	a, a
	jp	NZ, 00136$
;main.c:1742: weapon->x = owner->x - 2;
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
;main.c:1743: weapon->y = owner->y + 18;
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
;main.c:1746: weapon->spritids[1] = 4;
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
;main.c:1749: weapon->spritids[0] = 5;
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x05
;main.c:1750: move_sprite(weapon->spritids[0], weapon->x, weapon->y);
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
;main.c:1751: move_sprite(weapon->spritids[1], weapon->x, weapon->y - spritesize);
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
;main.c:1751: move_sprite(weapon->spritids[1], weapon->x, weapon->y - spritesize);
00136$:
;main.c:1753: }
	add	sp, #14
	ret
;main.c:1755: void move_sword_sprites_from_position(struct Weapon* weapon)
;	---------------------------------
; Function move_sword_sprites_from_position
; ---------------------------------
_move_sword_sprites_from_position::
	add	sp, #-6
	ld	c, e
	ld	b, d
;main.c:1759: move_sprite(weapon->spritids[0], weapon->x, weapon->y);
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
;main.c:1757: if(direction == 2 || direction == 3)
	ld	a, (#_direction)
	sub	a, #0x02
	jr	Z, 00101$
	ld	a, (#_direction)
	sub	a, #0x03
	jr	NZ, 00102$
00101$:
;main.c:1759: move_sprite(weapon->spritids[0], weapon->x, weapon->y);
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
;main.c:1760: move_sprite(weapon->spritids[1], weapon->x - spritesize, weapon->y);
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
;main.c:1760: move_sprite(weapon->spritids[1], weapon->x - spritesize, weapon->y);
	jr	00109$
00102$:
;main.c:1764: move_sprite(weapon->spritids[0], weapon->x, weapon->y);
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
;main.c:1765: move_sprite(weapon->spritids[1], weapon->x, weapon->y - spritesize);
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
;main.c:1765: move_sprite(weapon->spritids[1], weapon->x, weapon->y - spritesize);
00109$:
;main.c:1767: }
	add	sp, #6
	ret
;main.c:1769: void attack(struct GameCharacter* owner, struct Weapon* weapon)
;	---------------------------------
; Function attack
; ---------------------------------
_attack::
;main.c:1774: for(UINT8 i = 0; i < MAX_ENEMIES; i++)
	ld	c, #0x00
00105$:
	ld	a, c
	sub	a, #0x0a
	jr	NC, 00101$
;main.c:1776: hit_this_attack[i] = 0;
	ld	hl, #_hit_this_attack
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x00
;main.c:1774: for(UINT8 i = 0; i < MAX_ENEMIES; i++)
	inc	c
	jr	00105$
00101$:
;main.c:1779: sfx_swing();
	call	_sfx_swing
;main.c:1781: if (locktimer == 0)
	ld	hl, #_locktimer
	ld	a, (hl)
	or	a, a
	ret	NZ
;main.c:1783: locktimer ++;
	inc	(hl)
;main.c:1785: }
	ret
;main.c:1786: void swordreset(struct GameCharacter* owner, struct Weapon* weapon)
;	---------------------------------
; Function swordreset
; ---------------------------------
_swordreset::
	push	bc
;main.c:1789: for(UINT8 i = 0; i < MAX_ENEMIES; i++)
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x0a
	jr	NC, 00101$
;main.c:1791: hit_this_attack[i] = 0;
	ld	hl, #_hit_this_attack
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x00
;main.c:1789: for(UINT8 i = 0; i < MAX_ENEMIES; i++)
	inc	c
	jr	00103$
00101$:
;main.c:1794: move_weapon(weapon, owner);
	ld	c, e
	ld	b, d
	pop	de
	jp	_move_weapon
;main.c:1795: }
	inc	sp
	inc	sp
	ret
;main.c:1796: void move_enemy_small(struct Enemy* character, UINT8 x, UINT8 y)
;	---------------------------------
; Function move_enemy_small
; ---------------------------------
_move_enemy_small::
	add	sp, #-7
	ldhl	sp,	#5
	ld	(hl), e
	inc	hl
	ld	(hl), d
	dec	hl
	dec	hl
;main.c:1798: if(character->type == ENEMY_TYPE_SLIME)
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000d
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#1
	ld	(hl), a
;main.c:1801: move_sprite(character->spritids[0], x, y);
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#3
;main.c:1798: if(character->type == ENEMY_TYPE_SLIME)
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00104$
;main.c:1801: move_sprite(character->spritids[0], x, y);
	inc	hl
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
	ld	a, (hl-)
	dec	hl
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00127$:
	ldhl	sp,	#0
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00127$
	pop	de
	push	de
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#9
	ld	a, (hl)
	ld	(de), a
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	ld	b, a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;main.c:1801: move_sprite(character->spritids[0], x, y);
	jp	00111$
00104$:
;main.c:1803: else if(character->type == ENEMY_TYPE_BOSS)
	ldhl	sp,	#1
	ld	a, (hl)
	dec	a
	jr	NZ, 00111$
;main.c:1806: move_sprite(character->spritids[0], x, y);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
	ld	de, #_shadow_OAM+0
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	c, l
	ld	b, h
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ldhl	sp,	#9
	ld	a, (hl)
	ld	(bc), a
	inc	bc
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(bc), a
;main.c:1807: move_sprite(character->spritids[1], x + spritesize, y);
	ld	a, (hl)
	ld	hl, #_spritesize
	add	a, (hl)
	ld	c, a
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
	ld	de, #_shadow_OAM+0
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, de
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	push	hl
	ldhl	sp,	#11
	ld	a, (hl)
	pop	hl
	ld	(hl+), a
	ld	(hl), c
;main.c:1808: move_sprite(character->spritids[2], x, y + spritesize);
	ldhl	sp,	#9
	ld	a, (hl)
	ld	hl, #_spritesize
	add	a, (hl)
	ld	c, a
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	inc	hl
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
	ld	de, #_shadow_OAM+0
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, de
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	c, l
	ld	b, h
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(bc), a
;main.c:1809: move_sprite(character->spritids[3], x + spritesize, y + spritesize);
	ldhl	sp,	#9
	ld	a, (hl)
	ld	hl, #_spritesize
	add	a, (hl)
	ld	b, a
	ldhl	sp,	#4
	ld	a, (hl)
	ld	hl, #_spritesize
	add	a, (hl)
	ld	c, a
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	inc	hl
	inc	hl
;c:\gbdk\include\gb\gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:\gbdk\include\gb\gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl), b
	inc	hl
	ld	(hl), c
;main.c:1809: move_sprite(character->spritids[3], x + spritesize, y + spritesize);
00111$:
;main.c:1811: }
	add	sp, #7
	pop	hl
	inc	sp
	jp	(hl)
;main.c:1812: void animate_enemy(struct Enemy* enemy, UINT8 tile0, UINT8 tile1)
;	---------------------------------
; Function animate_enemy
; ---------------------------------
_animate_enemy::
	dec	sp
	ld	c, e
	ld	b, d
	ld	e, a
;main.c:1814: if(enemy->type == ENEMY_TYPE_SLIME)
	ld	hl, #0x000d
	add	hl, bc
	ld	d, (hl)
	ld	a, d
	or	a, a
	jr	NZ, 00110$
;main.c:1817: if(enemy->anim == 0)
	ld	hl, #0x0008
	add	hl, bc
	ld	a, (hl)
;main.c:1819: set_sprite_tile(enemy->spritids[0], tile0);
;main.c:1817: if(enemy->anim == 0)
	or	a, a
	jr	NZ, 00104$
;main.c:1819: set_sprite_tile(enemy->spritids[0], tile0);
	ld	a, (bc)
	ld	d, a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	bc, #_shadow_OAM+0
	ld	l, d
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), e
;main.c:1819: set_sprite_tile(enemy->spritids[0], tile0);
	jr	00118$
00104$:
;main.c:1821: else if(enemy->anim == 1)
	dec	a
	jr	NZ, 00118$
;main.c:1823: set_sprite_tile(enemy->spritids[0], tile1);
	ldhl	sp,	#3
	ld	e, (hl)
	ld	a, (bc)
	ld	d, a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	bc, #_shadow_OAM+0
	ld	l, d
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), e
;main.c:1823: set_sprite_tile(enemy->spritids[0], tile1);
	jr	00118$
00110$:
;main.c:1826: else if(enemy->type == ENEMY_TYPE_BOSS)
	dec	d
	jr	NZ, 00118$
;main.c:1830: for(UINT8 i = 0; i < 4; i++)
	ld	e, #0x00
00116$:
	ld	a, e
	sub	a, #0x04
	jr	NC, 00118$
;main.c:1832: set_sprite_tile(enemy->spritids[i], 22 + i);
	ld	a, e
	add	a, #0x16
	ldhl	sp,	#0
	ld	(hl), a
	ld	l, e
	ld	h, #0x00
	add	hl, bc
	ld	d, (hl)
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	xor	a, a
	ld	l, d
	ld	h, a
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	pop	de
	push	hl
	ldhl	sp,	#2
	ld	a, (hl)
	pop	hl
	ld	(hl), a
;main.c:1830: for(UINT8 i = 0; i < 4; i++)
	inc	e
	jr	00116$
00118$:
;main.c:1835: }
	inc	sp
	pop	hl
	inc	sp
	jp	(hl)
;main.c:1836: void enemy_check_borders(struct Enemy* enemy)
;	---------------------------------
; Function enemy_check_borders
; ---------------------------------
_enemy_check_borders::
;main.c:1838: if (enemy->x < MIN_ENEMY_X)
	ld	hl, #0x0004
	add	hl, de
	ld	a, (hl)
	sub	a, #0x18
	jr	NC, 00102$
;main.c:1840: enemy->x = MIN_ENEMY_X;
	ld	(hl), #0x18
00102$:
;main.c:1842: if (enemy->x > MAX_ENEMY_X)
	ld	a, (hl)
	cp	a, #0x91
	jr	C, 00104$
;main.c:1844: enemy->x = MAX_ENEMY_X;
	ld	(hl), #0x90
00104$:
;main.c:1846: if (enemy->y < MIN_ENEMY_Y)
	ld	hl, #0x0005
	add	hl, de
	ld	a, (hl)
	sub	a, #0x1c
	jr	NC, 00106$
;main.c:1848: enemy->y = MIN_ENEMY_Y;
	ld	(hl), #0x1c
00106$:
;main.c:1850: if (enemy->y > MAX_ENEMY_Y)
	ld	a, (hl)
	cp	a, #0x79
	ret	C
;main.c:1852: enemy->y = MAX_ENEMY_Y;
	ld	(hl), #0x78
;main.c:1854: }
	ret
;main.c:1857: void character_set_sprite(struct GameCharacter* character, UINT8 anim_state)
;	---------------------------------
; Function character_set_sprite
; ---------------------------------
_character_set_sprite::
	ld	c, e
	ld	b, d
	ld	e, a
;main.c:1862: character->anim = anim_state;  // Set animation state in struct
	ld	hl, #0x0008
	add	hl, bc
	ld	(hl), e
;main.c:1864: if(anim_state == 0) // down walking
	ld	a, e
	or	a, a
	jr	NZ, 00122$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;main.c:1868: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:1871: character->spritids[1] = 1;
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
;main.c:1874: character->spritids[3] = 2;
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
;main.c:1877: character->spritids[2] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jp	00123$
00122$:
;main.c:1879: else if(anim_state == 1) // down standing
	ld	a, e
	dec	a
	jr	NZ, 00119$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;main.c:1883: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:1886: character->spritids[1] = 1;
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
;main.c:1889: character->spritids[2] = 2;
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
;main.c:1892: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jp	00123$
00119$:
;main.c:1894: else if(anim_state == 2) // left walking
	ld	a, e
	sub	a, #0x02
	jr	NZ, 00116$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x04
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:1898: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x05
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:1901: character->spritids[1] = 1;
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
;main.c:1904: character->spritids[2] = 2;
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
;main.c:1907: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jp	00123$
00116$:
;main.c:1909: else if(anim_state == 3) // left standing
	ld	a, e
	sub	a, #0x03
	jr	NZ, 00113$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x08
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:1913: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x09
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:1916: character->spritids[1] = 1;
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
;main.c:1919: character->spritids[2] = 2;
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
;main.c:1922: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jp	00123$
00113$:
;main.c:1924: else if(anim_state == 4) // right walking
	ld	a, e
	sub	a, #0x04
	jr	NZ, 00110$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x05
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:1928: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x04
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:1931: character->spritids[1] = 1;
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
;main.c:1934: character->spritids[2] = 2;
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
;main.c:1937: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jp	00123$
00110$:
;main.c:1939: else if(anim_state == 5) // right standing
	ld	a, e
	sub	a, #0x05
	jr	NZ, 00107$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x09
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:1943: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x08
	ld	(hl+), a
	ld	(hl), #0x20
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
;main.c:1949: character->spritids[2] = 2;
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
;main.c:1952: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jr	00123$
00107$:
;main.c:1954: else if(anim_state == 6) // up walking
	ld	a, e
	sub	a, #0x06
	jr	NZ, 00104$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0c
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:1958: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0d
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:1961: character->spritids[1] = 1;
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
;main.c:1964: character->spritids[2] = 2;
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
;main.c:1967: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jr	00123$
00104$:
;main.c:1969: else if(anim_state == 7) // up standing
	ld	a, e
	sub	a, #0x07
	jr	NZ, 00123$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0c
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:1973: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0d
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:1976: character->spritids[1] = 1;
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
;main.c:1979: character->spritids[2] = 2;
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
;main.c:1982: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
00123$:
;main.c:1985: move_player(character, character->x, character->y);
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
;main.c:1986: }
	ret
;main.c:1988: void setup_character(struct GameCharacter* character, UINT8 x, UINT8 y)
;	---------------------------------
; Function setup_character
; ---------------------------------
_setup_character::
	add	sp, #-5
	ld	c, e
	ld	b, d
	ldhl	sp,	#4
	ld	(hl), a
;main.c:1990: character->x = x;
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
;main.c:1991: character->y = y;
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
;main.c:1992: character->width = 16;
	ld	hl, #0x0006
	add	hl, bc
	ld	(hl), #0x10
;main.c:1993: character->height = 16;
	ld	hl, #0x0007
	add	hl, bc
	ld	(hl), #0x10
;main.c:1994: character->anim = 0;
	ld	hl, #0x0008
	add	hl, bc
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;main.c:1998: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:2001: character->spritids[1] = 1;
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
;main.c:2004: character->spritids[2] = 2;
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
;main.c:2007: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
;main.c:2009: move_player(character, character->x, character->y);
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
;main.c:2010: }
	add	sp, #5
	pop	hl
	inc	sp
	jp	(hl)
;main.c:2012: void setup_player(void)
;	---------------------------------
; Function setup_player
; ---------------------------------
_setup_player::
;main.c:2014: setup_character(&girl, PLAYER_SPAWN_X, PLAYER_SPAWN_Y);
	ld	a, #0x24
	push	af
	inc	sp
	ld	a, #0x50
	ld	de, #_girl
	call	_setup_character
;main.c:2015: }
	ret
;main.c:2017: void setupslime(void)
;	---------------------------------
; Function setupslime
; ---------------------------------
_setupslime::
;main.c:2019: slime.x = rand() % 128 + 16;
	call	_rand
	ld	a, e
	res	7, a
	add	a, #0x10
	ld	(#(_slime + 4)),a
;main.c:2020: slime.y = rand() % 96 + 24;
	call	_rand
	ld	a, e
	ld	e, #0x60
	call	__moduchar
	ld	a, c
	add	a, #0x18
	ld	hl, #(_slime + 5)
;main.c:2021: slime.width = 8;
	ld	(hl+), a
	ld	(hl), #0x08
;main.c:2022: slime.height = 8;
	ld	hl, #_slime + 7
	ld	(hl), #0x08
;main.c:2023: slime.anim = 0;
	ld	hl, #_slime + 8
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 90)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x10
	ld	(hl+), a
	ld	(hl), #0x10
;main.c:2027: slime.spritids[0] = 22;
	ld	hl, #_slime
	ld	(hl), #0x16
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 94)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x11
	ld	(hl+), a
	ld	(hl), #0x10
;main.c:2030: slime.spritids[1] = 23;
	ld	hl, #_slime + 1
	ld	(hl), #0x17
;main.c:2032: move_enemy_small(&slime, slime.x, slime.y);
	ld	hl, #(_slime + 5)
	ld	b, (hl)
	ld	a, (#(_slime + 4) + 0)
	push	bc
	inc	sp
	ld	de, #_slime
	call	_move_enemy_small
;main.c:2033: }
	ret
;main.c:2035: void setupsword(void)
;	---------------------------------
; Function setupsword
; ---------------------------------
_setupsword::
;main.c:2037: sword.x = 100;
	ld	hl, #_sword + 2
	ld	(hl), #0x64
;main.c:2038: sword.y = 100;
	ld	hl, #_sword + 3
	ld	(hl), #0x64
;main.c:2039: sword.width = 8;
	ld	hl, #_sword + 4
	ld	(hl), #0x08
;main.c:2040: sword.height = 8;
	ld	hl, #_sword + 5
	ld	(hl), #0x08
;main.c:2041: sword.anim = 0;
	ld	hl, #_sword + 6
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x12
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:2046: sword.spritids[0] = 4;
	ld	hl, #_sword
	ld	(hl), #0x04
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x13
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:2049: sword.spritids[1] = 5;
	ld	hl, #_sword + 1
	ld	(hl), #0x05
;main.c:2052: }
	ret
;main.c:2055: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
	add	sp, #-15
;main.c:2057: init_title_screen();
	call	_init_title_screen
;main.c:2059: while(1)
00257$:
;main.c:2061: UINT8 current_pad = joypad();
	call	_joypad
;main.c:2063: if((current_pad & J_START) && !(prev_pad & J_START))
	ldhl	sp,#5
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
;main.c:2065: if(gamestate == 0)
	ld	hl, #_gamestate
	ld	a, (hl)
	or	a, a
	jp	NZ, 00114$
;main.c:2067: gamestate = 1;
	ld	(hl), #0x01
;main.c:2068: initrand(DIV_REG);
	ldh	a, (_DIV_REG + 0)
	ld	b, #0x00
	ld	c, a
	push	bc
	call	_initrand
	pop	hl
;main.c:2069: font_set(ui_font);
	ld	a, (_ui_font)
	ld	e, a
	ld	hl, #_ui_font + 1
	ld	d, (hl)
	push	de
	call	_font_set
	pop	hl
;main.c:2070: audio_init();
	call	_audio_init
;main.c:2072: set_bkg_data(37, 8, backgroundtiles);
	ld	de, #_backgroundtiles
	push	de
	ld	hl, #0x825
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:2073: set_bkg_tiles(0, 0, 20, 16, backgroundmap);
	ld	de, #_backgroundmap
	push	de
	ld	hl, #0x1014
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:2075: set_win_tiles(0, 0, 20, 2, windowmap);
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
;main.c:2080: set_sprite_data(0, 22, Girl);  // Girl + Slime + Sword tiles (0-21)
	ld	de, #_Girl
	push	de
	ld	hl, #0x1600
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:2081: set_sprite_data(22, 9, Boss);   // Boss tiles (22-30) - includes attack animation frames
	ld	de, #_Boss
	push	de
	ld	hl, #0x916
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:2082: setup_player();
	call	_setup_player
;main.c:2083: init_player_stats();
	call	_init_player_stats
;main.c:2085: stage = 1;
	ld	hl, #_stage
	ld	(hl), #0x01
;main.c:2086: enemy_hp_multiplier = 1;
	ld	hl, #_enemy_hp_multiplier
	ld	(hl), #0x01
;main.c:2087: update_window_stats_ui();
	call	_update_window_stats_ui
;main.c:2088: setupsword();
	call	_setupsword
;main.c:2089: load_room(room);  // Initialize room after sprite data is loaded
	ld	a, (_room)
	call	_load_room
;main.c:2097: BGP_REG  = 0xE4; // Background palette (light fill uses C1)
	ld	a, #0xe4
	ldh	(_BGP_REG + 0), a
;main.c:2098: OBP0_REG = 0xE0; // Sprite palette 0: Girl/Sword (old colors)
	ld	a, #0xe0
	ldh	(_OBP0_REG + 0), a
;main.c:2099: OBP1_REG = 0xE4; // Sprite palette 1: Slimes (clear, light, dark, black)
	ld	a, #0xe4
	ldh	(_OBP1_REG + 0), a
;main.c:2100: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:2101: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:2102: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;main.c:2103: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
	jp	00117$
00114$:
;main.c:2105: else if(gamestate == 1 && player_stats.is_dead == 1)
	ld	a, (#_gamestate)
	dec	a
	ld	a, #0x01
	jr	Z, 00915$
	xor	a, a
00915$:
	ld	c, a
	or	a, a
	jr	Z, 00110$
	ld	a, (#(_player_stats + 6) + 0)
;main.c:2107: room = 0;
;main.c:2108: locktimer = 0;
	dec	a
	jr	NZ, 00110$
	ld	(#_room), a
	ld	(#_locktimer),a
;main.c:2109: knockback_timer = 0;
;main.c:2110: knockback_dx = 0;
	xor	a, a
	ld	(#_knockback_timer), a
	ld	(#_knockback_dx),a
;main.c:2111: knockback_dy = 0;
;main.c:2112: room_cleared = 0;
	xor	a, a
	ld	(#_knockback_dy), a
	ld	(#_room_cleared),a
;main.c:2113: reward_active = 0;
;main.c:2114: reward_claimed = 0;
	xor	a, a
	ld	(#_reward_active), a
	ld	(#_reward_claimed),a
;main.c:2115: can_transition = 0;
;main.c:2116: room_clear_timer = 0;
	xor	a, a
	ld	(#_can_transition), a
	ld	(#_room_clear_timer),a
;main.c:2117: transition_cooldown_timer = 0;
	xor	a, a
	ld	(#_transition_cooldown_timer),a
;main.c:2119: setup_player();
	call	_setup_player
;main.c:2120: init_player_stats();
	call	_init_player_stats
;main.c:2122: stage = 1;
	ld	hl, #_stage
	ld	(hl), #0x01
;main.c:2123: enemy_hp_multiplier = 1;
	ld	hl, #_enemy_hp_multiplier
	ld	(hl), #0x01
;main.c:2124: setupsword();
	call	_setupsword
;main.c:2125: load_room(room);
	ld	a, (_room)
	call	_load_room
;main.c:2127: set_win_tiles(0, 0, 20, 2, windowmap);
	ld	de, #_windowmap
	push	de
	ld	hl, #0x214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
;main.c:2128: hide_pause_ui();
	call	_hide_pause_ui
;main.c:2129: hide_room_clear_ui();
	call	_hide_room_clear_ui
;main.c:2130: hide_reward_ui();
	call	_hide_reward_ui
;main.c:2131: hide_ready_ui();
	call	_hide_ready_ui
;main.c:2132: update_window_stats_ui();
	call	_update_window_stats_ui
	jr	00117$
00110$:
;main.c:2134: else if(gamestate == 1 && room_cleared == 0 && reward_active == 0 && can_transition == 0)
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
;main.c:2136: gamestate = 2;
	ld	hl, #_gamestate
	ld	(hl), #0x02
;main.c:2137: show_pause_ui();
	call	_show_pause_ui
	jr	00117$
00104$:
;main.c:2139: else if(gamestate == 2)
	ld	a, (#_gamestate)
	sub	a, #0x02
	jr	NZ, 00117$
;main.c:2141: gamestate = 1;
	ld	hl, #_gamestate
	ld	(hl), #0x01
;main.c:2142: hide_pause_ui();
	call	_hide_pause_ui
00117$:
;main.c:2146: if(gamestate == 0)
	ld	a, (#_gamestate)
	or	a, a
	jr	NZ, 00120$
;main.c:2148: update_title_screen();
	call	_update_title_screen
00120$:
;main.c:2151: if(gamestate == 1)
	ld	a, (#_gamestate)
	dec	a
	jp	NZ, 00255$
;main.c:2153: struct GameCharacter* active_player = &girl;
;main.c:2155: if(player_stats.is_dead == 0 && locktimer == 0 && knockback_timer == 0 && enemy_start_delay_timer == 0)
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
;main.c:2157: if(joypad() & J_LEFT)
	call	_joypad
;main.c:2161: if(active_player->x > MIN_GIRL_X)
;main.c:2164: if(distance_to_min_x < player_stats.speed)
;main.c:2174: if(active_player->anim != 2 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
;main.c:2157: if(joypad() & J_LEFT)
	bit	1,a
	jr	Z, 00136$
;main.c:2159: direction = 2;
	ld	hl, #_direction
	ld	(hl), #0x02
;main.c:2160: move_weapon(&sword, active_player);
	ld	bc, #_girl
	ld	de, #_sword
	call	_move_weapon
;main.c:2161: if(active_player->x > MIN_GIRL_X)
	ld	hl, #(_girl + 4)
	ld	c, (hl)
	ld	a, #0x17
	sub	a, c
	jr	NC, 00125$
;main.c:2163: UINT8 distance_to_min_x = active_player->x - MIN_GIRL_X;
	ld	a, c
	add	a, #0xe9
;main.c:2164: if(distance_to_min_x < player_stats.speed)
	ld	hl, #(_player_stats + 4)
	ld	b, (hl)
	sub	a, b
	jr	NC, 00122$
;main.c:2166: active_player->x = MIN_GIRL_X;
	ld	hl, #(_girl + 4)
	ld	(hl), #0x17
	jr	00125$
00122$:
;main.c:2170: active_player->x -= player_stats.speed;
	ld	a, c
	sub	a, b
	ld	(#(_girl + 4)),a
00125$:
;main.c:2174: if(active_player->anim != 2 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	ld	a, (#(_girl + 8) + 0)
	sub	a, #0x02
	jr	Z, 00131$
	call	_joypad
	bit	2, a
	jr	NZ, 00131$
	call	_joypad
	bit	3, a
	jr	NZ, 00131$
;main.c:2176: character_set_sprite(active_player, 2);
	ld	a, #0x02
	ld	de, #_girl
	call	_character_set_sprite
	jr	00136$
00131$:
;main.c:2178: else if(active_player->anim != 3 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	ld	a, (#(_girl + 8) + 0)
	sub	a, #0x03
	jr	Z, 00136$
	call	_joypad
	bit	2, a
	jr	NZ, 00136$
	call	_joypad
	bit	3, a
	jr	NZ, 00136$
;main.c:2180: character_set_sprite(active_player, 3);
	ld	a, #0x03
	ld	de, #_girl
	call	_character_set_sprite
00136$:
;main.c:2183: if(joypad() & J_RIGHT)
	call	_joypad
	rrca
	jr	NC, 00152$
;main.c:2185: direction = 3;
	ld	hl, #_direction
	ld	(hl), #0x03
;main.c:2186: move_weapon(&sword, active_player);
	ld	bc, #_girl
	ld	de, #_sword
	call	_move_weapon
;main.c:2187: if(active_player->x < MAX_GIRL_X)
	ld	a, (#(_girl + 4) + 0)
	ldhl	sp,#13
	ld	(hl), a
	ld	a, (hl)
	sub	a, #0x8a
	jr	NC, 00141$
;main.c:2189: UINT8 distance_to_max_x = MAX_GIRL_X - active_player->x;
	ld	a, (hl+)
	ld	(hl), a
	ld	a, #0x8a
	sub	a, (hl)
;main.c:2190: if(distance_to_max_x < player_stats.speed)
	ld	hl, #(_player_stats + 4)
	ld	c, (hl)
	sub	a, c
	jr	NC, 00138$
;main.c:2192: active_player->x = MAX_GIRL_X;
	ld	hl, #(_girl + 4)
	ld	(hl), #0x8a
	jr	00141$
00138$:
;main.c:2196: active_player->x += player_stats.speed;
	ldhl	sp,	#13
	ld	a, (hl)
	add	a, c
	ld	(#(_girl + 4)),a
00141$:
;main.c:2201: if(active_player->anim != 4 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	ld	a, (#(_girl + 8) + 0)
	sub	a, #0x04
	jr	Z, 00147$
	call	_joypad
	bit	2, a
	jr	NZ, 00147$
	call	_joypad
	bit	3, a
	jr	NZ, 00147$
;main.c:2203: character_set_sprite(active_player, 4);
	ld	a, #0x04
	ld	de, #_girl
	call	_character_set_sprite
	jr	00152$
00147$:
;main.c:2205: else if(active_player->anim != 5 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	ld	a, (#(_girl + 8) + 0)
	sub	a, #0x05
	jr	Z, 00152$
	call	_joypad
	bit	2, a
	jr	NZ, 00152$
	call	_joypad
	bit	3, a
	jr	NZ, 00152$
;main.c:2207: character_set_sprite(active_player, 5);
	ld	a, #0x05
	ld	de, #_girl
	call	_character_set_sprite
00152$:
;main.c:2210: if(joypad() & J_UP)
	call	_joypad
;main.c:2214: if(active_player->y > MIN_GIRL_Y)
;main.c:2210: if(joypad() & J_UP)
	bit	2,a
	jr	Z, 00164$
;main.c:2212: direction = 1;
	ld	hl, #_direction
	ld	(hl), #0x01
;main.c:2213: move_weapon(&sword, active_player);
	ld	bc, #_girl
	ld	de, #_sword
	call	_move_weapon
;main.c:2214: if(active_player->y > MIN_GIRL_Y)
	ld	hl, #(_girl + 5)
	ld	c, (hl)
	ld	a, #0x14
	sub	a, c
	jr	NC, 00157$
;main.c:2216: UINT8 distance_to_min_y = active_player->y - MIN_GIRL_Y;
	ld	a, c
	add	a, #0xec
;main.c:2217: if(distance_to_min_y < player_stats.speed)
	ld	hl, #(_player_stats + 4)
	ld	b, (hl)
	sub	a, b
	jr	NC, 00154$
;main.c:2219: active_player->y = MIN_GIRL_Y;
	ld	hl, #(_girl + 5)
	ld	(hl), #0x14
	jr	00157$
00154$:
;main.c:2223: active_player->y -= player_stats.speed;
	ld	a, c
	sub	a, b
	ld	(#(_girl + 5)),a
00157$:
;main.c:2226: if(active_player->anim != 6)
	ld	a, (#(_girl + 8) + 0)
	cp	a, #0x06
	jr	Z, 00161$
;main.c:2228: character_set_sprite(active_player, 6);
	ld	a, #0x06
	ld	de, #_girl
	call	_character_set_sprite
	jr	00164$
00161$:
;main.c:2230: else if(active_player->anim != 7)
	sub	a, #0x07
	jr	Z, 00164$
;main.c:2232: character_set_sprite(active_player, 7);
	ld	a, #0x07
	ld	de, #_girl
	call	_character_set_sprite
00164$:
;main.c:2235: if(joypad() & J_DOWN)
	call	_joypad
	bit	3, a
	jr	Z, 00176$
;main.c:2237: direction = 0;
	xor	a, a
	ld	(#_direction),a
;main.c:2238: move_weapon(&sword, active_player);
	ld	bc, #_girl
	ld	de, #_sword
	call	_move_weapon
;main.c:2239: if(active_player->y < MAX_GIRL_Y)
	ld	hl, #(_girl + 5)
	ld	c, (hl)
	ld	a, c
	sub	a, #0x71
	jr	NC, 00169$
;main.c:2241: UINT8 distance_to_max_y = MAX_GIRL_Y - active_player->y;
	ld	b, c
	ld	a, #0x71
	sub	a, b
;main.c:2242: if(distance_to_max_y < player_stats.speed)
	ld	hl, #(_player_stats + 4)
	ld	b, (hl)
	sub	a, b
	jr	NC, 00166$
;main.c:2244: active_player->y = MAX_GIRL_Y;
	ld	hl, #(_girl + 5)
	ld	(hl), #0x71
	jr	00169$
00166$:
;main.c:2248: active_player->y += player_stats.speed;
	ld	a, c
	add	a, b
	ld	(#(_girl + 5)),a
00169$:
;main.c:2252: if(active_player->anim != 0)
	ld	a, (#(_girl + 8) + 0)
	or	a, a
	jr	Z, 00173$
;main.c:2254: character_set_sprite(active_player, 0);
	xor	a, a
	ld	de, #_girl
	call	_character_set_sprite
	jr	00176$
00173$:
;main.c:2256: else if(active_player->anim != 1)
	dec	a
	jr	Z, 00176$
;main.c:2258: character_set_sprite(active_player, 1);
	ld	a, #0x01
	ld	de, #_girl
	call	_character_set_sprite
00176$:
;main.c:2262: if((joypad() & J_A) && !(prev_pad & J_A) && reward_active == 0)
	call	_joypad
	bit	4, a
	jr	Z, 00182$
	ld	a, (_prev_pad)
	bit	4, a
	jr	NZ, 00182$
	ld	a, (#_reward_active)
	or	a, a
	jr	NZ, 00182$
;main.c:2264: attack(active_player, &sword);
	ld	bc, #_sword
	ld	de, #_girl
	call	_attack
00182$:
;main.c:2268: if(player_stats.is_dead == 1)
	ld	a, (#(_player_stats + 6) + 0)
	dec	a
	jr	NZ, 00187$
;main.c:2270: hide_character_sprites(active_player);
	ld	de, #_girl
	call	_hide_character_sprites
00187$:
;main.c:2273: update_timers(active_player, &sword);
	ld	bc, #_sword
	ld	de, #_girl
	call	_update_timers
;main.c:2275: if(player_stats.is_dead == 1)
	ld	a, (#(_player_stats + 6) + 0)
	dec	a
	jr	NZ, 00189$
;main.c:2277: hide_character_sprites(active_player);
	ld	de, #_girl
	call	_hide_character_sprites
;main.c:2278: hide_sword_sprites(&sword);
	ld	de, #_sword
	call	_hide_sword_sprites
;main.c:2279: hide_pause_ui();
	call	_hide_pause_ui
;main.c:2280: hide_room_clear_ui();
	call	_hide_room_clear_ui
;main.c:2281: hide_reward_ui();
	call	_hide_reward_ui
;main.c:2282: hide_ready_ui();
	call	_hide_ready_ui
;main.c:2283: show_game_over_ui();
	call	_show_game_over_ui
;main.c:2285: prev_pad = current_pad;
	ldhl	sp,	#5
	ld	a, (hl)
	ld	(#_prev_pad),a
;main.c:2286: performantdelay(5);
	ld	a, #0x05
	call	_performantdelay
;main.c:2287: continue;
	jp	00257$
00189$:
;main.c:2290: UINT8 can_enemies_move = 1;
	ldhl	sp,	#4
	ld	(hl), #0x01
;main.c:2291: UINT8 delay_active = 0;
	ldhl	sp,	#8
	ld	(hl), #0x00
;main.c:2292: if(enemy_start_delay_timer > 0)
	ld	a, (#_enemy_start_delay_timer)
	or	a, a
	jr	Z, 00191$
;main.c:2294: delay_active = 1;
	ldhl	sp,	#8
	ld	(hl), #0x01
;main.c:2295: enemy_start_delay_timer--;
	ld	hl, #_enemy_start_delay_timer
	dec	(hl)
;main.c:2296: can_enemies_move = 0;
	ldhl	sp,	#4
	ld	(hl), #0x00
00191$:
;main.c:2300: UINT8 all_enemies_dead = 1;
	ldhl	sp,	#9
	ld	(hl), #0x01
;main.c:2301: for(UINT8 i = 0; i < current_enemy_count; i++)
	ldhl	sp,	#13
	ld	(hl), #0x00
00265$:
	ldhl	sp,	#13
	ld	a, (hl)
	ld	hl, #_current_enemy_count
	sub	a, (hl)
	jp	NC, 00207$
;main.c:2303: if(enemies[i].death == 0)
	ldhl	sp,	#13
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	push	hl
	ld	a, l
	ldhl	sp,	#13
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#12
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_enemies
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	hl, #0x0009
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#14
	ld	(hl), a
;main.c:2308: slime_can_move(&enemies[i], active_player);
	ldhl	sp,	#0
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
;main.c:2303: if(enemies[i].death == 0)
	ldhl	sp,	#14
	ld	a, (hl)
	or	a, a
	jp	NZ, 00205$
;main.c:2305: all_enemies_dead = 0;
	ldhl	sp,	#9
	ld	(hl), #0x00
;main.c:2306: if(can_enemies_move)
	ldhl	sp,	#4
	ld	a, (hl)
	or	a, a
	jr	Z, 00193$
;main.c:2308: slime_can_move(&enemies[i], active_player);
	dec	hl
	dec	hl
	ld	bc, #_girl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_slime_can_move
00193$:
;main.c:2312: if(enemies[i].type == ENEMY_TYPE_SLIME)
	ldhl	sp,	#0
	ld	a, (hl)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,	#1
	ld	a, (hl)
	ldhl	sp,	#11
	ld	(hl), a
	pop	de
	push	de
	ld	hl, #0x000d
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
	jr	NZ, 00200$
;main.c:2314: animate_enemy(&enemies[i], 16, 17);  // Slime tiles
	ld	a, #0x11
	push	af
	inc	sp
	ld	a, #0x10
	ldhl	sp,	#3
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_animate_enemy
	jr	00266$
00200$:
;main.c:2316: else if(enemies[i].type == ENEMY_TYPE_BOSS)
	dec	a
	jr	NZ, 00266$
;main.c:2320: UINT8 base_tile = (enemies[i].attack_anim_frame < 2) ? 22 : 26;
	pop	de
	push	de
	ld	hl, #0x0010
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	sub	a, #0x02
	jr	NC, 00278$
	ldhl	sp,	#14
	ld	(hl), #0x16
	jr	00279$
00278$:
	ldhl	sp,	#14
	ld	(hl), #0x1a
00279$:
	ldhl	sp,	#14
	ld	a, (hl-)
	dec	hl
;main.c:2323: for(UINT8 j = 0; j < 4; j++)
	ld	(hl+), a
	inc	hl
	ld	(hl), #0x00
00262$:
	ldhl	sp,	#14
	ld	a, (hl)
	sub	a, #0x04
	jr	NC, 00266$
;main.c:2325: if(enemies[i].spritids[j] != 0xFF)
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#14
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	inc	a
	jr	Z, 00263$
;main.c:2327: set_sprite_tile(enemies[i].spritids[j], base_tile + j);
	ldhl	sp,	#12
	ld	a, (hl+)
	inc	hl
	add	a, (hl)
	ld	e, a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	l, c
	ld	bc, #_shadow_OAM+0
	xor	a, a
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	c, l
	ld	b, h
	ld	a, e
	ld	(bc), a
;main.c:2327: set_sprite_tile(enemies[i].spritids[j], base_tile + j);
00263$:
;main.c:2323: for(UINT8 j = 0; j < 4; j++)
	ldhl	sp,	#14
	inc	(hl)
	jr	00262$
00205$:
;main.c:2332: else if(enemies[i].death == 1)
	ldhl	sp,	#14
	ld	a, (hl)
	dec	a
	jr	NZ, 00266$
;main.c:2334: hide_enemy_sprites(&enemies[i]);
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_hide_enemy_sprites
00266$:
;main.c:2301: for(UINT8 i = 0; i < current_enemy_count; i++)
	ldhl	sp,	#13
	inc	(hl)
	jp	00265$
00207$:
;main.c:2338: resolve_enemy_collisions();
	call	_resolve_enemy_collisions
;main.c:2340: for(UINT8 i = 0; i < current_enemy_count; i++)
	ldhl	sp,	#14
	ld	(hl), #0x00
00268$:
	ldhl	sp,	#14
	ld	a, (hl)
	ld	hl, #_current_enemy_count
	sub	a, (hl)
	jp	NC, 00210$
;main.c:2342: if(enemies[i].death == 0)
	ldhl	sp,	#14
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
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
	ld	hl, #_enemies
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
	ld	hl, #0x0009
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
	ld	(hl), a
	ld	a, (hl)
	or	a, a
	jr	NZ, 00269$
;main.c:2344: move_enemy_small(&enemies[i], enemies[i].x, enemies[i].y);
	inc	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
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
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
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
	ldhl	sp,	#11
	ld	(hl-), a
	ld	a, (hl+)
	push	af
	inc	sp
	ld	a, (hl+)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_move_enemy_small
00269$:
;main.c:2340: for(UINT8 i = 0; i < current_enemy_count; i++)
	ldhl	sp,	#14
	inc	(hl)
	jp	00268$
00210$:
;main.c:2348: if(all_enemies_dead)
	ldhl	sp,	#9
	ld	a, (hl)
	or	a, a
	jp	Z, 00232$
;main.c:2350: hide_ready_ui();
	call	_hide_ready_ui
;main.c:2352: if(room_cleared == 0)
	ld	hl, #_room_cleared
	ld	a, (hl)
	or	a, a
	jr	NZ, 00212$
;main.c:2354: room_cleared = 1;
	ld	(hl), #0x01
;main.c:2355: room_clear_timer = ROOM_CLEAR_SHOW_FRAMES;
	ld	hl, #_room_clear_timer
	ld	(hl), #0x0f
00212$:
;main.c:2358: if(room_clear_timer > 0)
	ld	hl, #_room_clear_timer
	ld	a, (hl)
	or	a, a
	jr	Z, 00223$
;main.c:2360: room_clear_timer--;
	dec	(hl)
;main.c:2361: hide_reward_ui();
	call	_hide_reward_ui
;main.c:2362: show_room_clear_ui();
	call	_show_room_clear_ui
	jp	00233$
00223$:
;main.c:2366: if(reward_claimed == 0 && reward_active == 0)
	ld	a, (#_reward_claimed)
	or	a, a
	jr	NZ, 00214$
	ld	a, (#_reward_active)
	or	a, a
	jr	NZ, 00214$
;main.c:2368: roll_room_reward();
	call	_roll_room_reward
;main.c:2369: reward_active = 1;
	ld	hl, #_reward_active
	ld	(hl), #0x01
00214$:
;main.c:2372: if(reward_active)
	ld	a, (#_reward_active)
	or	a, a
	jr	Z, 00220$
;main.c:2374: hide_room_clear_ui();
	call	_hide_room_clear_ui
;main.c:2375: show_reward_ui(reward_type);
	ld	a, (_reward_type)
	call	_show_reward_ui
;main.c:2377: if((current_pad & J_START) && !(prev_pad & J_START))
	xor	a, a
	ldhl	sp,	#6
	or	a, (hl)
	jr	Z, 00233$
	ld	a, (_prev_pad)
	rlca
	jr	C, 00233$
;main.c:2379: apply_reward(reward_type);
	ld	a, (_reward_type)
	call	_apply_reward
;main.c:2380: reward_active = 0;
	xor	a, a
	ld	(#_reward_active),a
;main.c:2381: reward_claimed = 1;
	ld	hl, #_reward_claimed
	ld	(hl), #0x01
;main.c:2382: can_transition = 1;
	ld	hl, #_can_transition
	ld	(hl), #0x01
;main.c:2383: transition_cooldown_timer = TRANSITION_COOLDOWN_FRAMES;
	ld	hl, #_transition_cooldown_timer
	ld	(hl), #0x0a
;main.c:2384: hide_reward_ui();
	call	_hide_reward_ui
;main.c:2385: hide_room_clear_ui();
	call	_hide_room_clear_ui
;main.c:2386: update_window_stats_ui();
	call	_update_window_stats_ui
	jr	00233$
00220$:
;main.c:2391: hide_reward_ui();
	call	_hide_reward_ui
;main.c:2392: hide_room_clear_ui();
	call	_hide_room_clear_ui
	jr	00233$
00232$:
;main.c:2398: room_cleared = 0;
;main.c:2399: reward_active = 0;
	xor	a, a
	ld	(#_room_cleared), a
	ld	(#_reward_active),a
;main.c:2400: reward_claimed = 0;
;main.c:2401: can_transition = 0;
	xor	a, a
	ld	(#_reward_claimed), a
	ld	(#_can_transition),a
;main.c:2402: room_clear_timer = 0;
;main.c:2403: transition_cooldown_timer = 0;
	xor	a, a
	ld	(#_room_clear_timer), a
	ld	(#_transition_cooldown_timer),a
;main.c:2404: hide_room_clear_ui();
	call	_hide_room_clear_ui
;main.c:2405: hide_reward_ui();
	call	_hide_reward_ui
;main.c:2407: if(delay_active)
	ldhl	sp,	#8
	ld	a, (hl)
	or	a, a
	jr	Z, 00229$
;main.c:2409: if(enemy_start_delay_timer & 0x04)
	ld	a, (_enemy_start_delay_timer)
	bit	2, a
	jr	Z, 00226$
;main.c:2411: show_ready_ui();
	call	_show_ready_ui
	jr	00233$
00226$:
;main.c:2415: hide_ready_ui();
	call	_hide_ready_ui
	jr	00233$
00229$:
;main.c:2420: hide_ready_ui();
	call	_hide_ready_ui
00233$:
;main.c:2425: animtimer++;
	ld	hl, #_animtimer
	inc	(hl)
;main.c:2426: if(animtimer == ANIM_TIMER_MAX)
	ld	a, (hl)
	sub	a, #0x14
	jr	NZ, 00236$
;main.c:2428: animtimer = 0;
	xor	a, a
	ld	(#_animtimer),a
;main.c:2429: for(UINT8 i = 0; i < current_enemy_count; i++)
	ldhl	sp,	#14
	ld	(hl), #0x00
00271$:
	ldhl	sp,	#14
	ld	a, (hl)
	ld	hl, #_current_enemy_count
	sub	a, (hl)
	jr	NC, 00236$
;main.c:2431: enemies[i].anim = (enemies[i].anim == 0) ? 1 : 0;
	ldhl	sp,	#14
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	a, l
	add	a, #<(_enemies)
	ld	c, a
	ld	a, h
	adc	a, #>(_enemies)
	ld	b, a
	ld	hl, #0x0008
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#13
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#12
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	jr	NZ, 00280$
	inc	hl
	ld	(hl), #0x01
	jr	00281$
00280$:
	ldhl	sp,	#13
	ld	(hl), #0x00
00281$:
	ldhl	sp,	#13
	ld	a, (hl-)
	dec	hl
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;main.c:2429: for(UINT8 i = 0; i < current_enemy_count; i++)
	ldhl	sp,	#14
	inc	(hl)
	jr	00271$
00236$:
;main.c:2436: if(player_stats.is_dead == 0)
	ld	a, (#(_player_stats + 6) + 0)
	ldhl	sp,#14
	ld	(hl), a
	ld	a, (hl)
	or	a, a
	jr	NZ, 00241$
;main.c:2438: UINT8 max_check = (current_enemy_count > MAX_ENEMIES) ? MAX_ENEMIES : current_enemy_count;
	ld	a, #0x0a
	ld	hl, #_current_enemy_count
	sub	a, (hl)
	jr	NC, 00282$
	ld	a, #0x0a
	jr	00283$
00282$:
	ld	a, (_current_enemy_count)
00283$:
	ldhl	sp,	#11
	ld	(hl), a
;main.c:2439: for(UINT8 i = 0; i < max_check; i++)
	ldhl	sp,	#14
	ld	(hl), #0x00
00274$:
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#11
	sub	a, (hl)
	jr	NC, 00241$
;main.c:2442: if(enemies[i].death == 0)
	ldhl	sp,	#14
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	push	hl
	ld	a, l
	ldhl	sp,	#14
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#13
	ld	(hl), a
	ld	de, #_enemies
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #0x0009
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	NZ, 00275$
;main.c:2444: character_enemy_collision(active_player, &enemies[i]);
	ld	c, e
	ld	b, d
	ld	de, #_girl
	call	_character_enemy_collision
00275$:
;main.c:2439: for(UINT8 i = 0; i < max_check; i++)
	ldhl	sp,	#14
	inc	(hl)
	jr	00274$
00241$:
;main.c:2449: if(can_transition == 1)
	ld	a, (#_can_transition)
	dec	a
	jr	NZ, 00255$
;main.c:2451: if(transition_cooldown_timer > 0)
	ld	hl, #_transition_cooldown_timer
	ld	a, (hl)
	or	a, a
	jr	Z, 00250$
;main.c:2453: transition_cooldown_timer--;
	dec	(hl)
	jr	00255$
00250$:
;main.c:2063: if((current_pad & J_START) && !(prev_pad & J_START))
	ld	a, (_prev_pad)
	ld	c, a
;main.c:2455: else if(((current_pad & J_A) && !(prev_pad & J_A)) ||
	push	hl
	ldhl	sp,	#7
	bit	4, (hl)
	pop	hl
	jr	Z, 00248$
	bit	4, c
	jr	Z, 00244$
00248$:
;main.c:2456: ((current_pad & J_START) && !(prev_pad & J_START)))
	xor	a, a
	ldhl	sp,	#6
	or	a, (hl)
	jr	Z, 00255$
	bit	7, c
	jr	NZ, 00255$
00244$:
;main.c:2459: UINT8 next_room = (room + 1) % TOTAL_ROOMS;
	ld	a, (_room)
	ld	d, #0x00
	ld	e, a
	inc	de
	ld	bc, #0x0006
	call	__modsint
	ld	a,c
;main.c:2460: if(next_room == 0)
	or	a, a
	jr	NZ, 00243$
;main.c:2463: stage++;
	ld	hl, #_stage
	inc	(hl)
;main.c:2464: enemy_hp_multiplier <<= 1;  // double
	ld	hl, #_enemy_hp_multiplier
	sla	(hl)
;main.c:2465: update_window_stats_ui();
	push	bc
	call	_update_window_stats_ui
	pop	bc
00243$:
;main.c:2467: room = next_room;
	ld	hl, #_room
	ld	(hl), c
;main.c:2468: load_room(room);
	ld	a, (hl)
	call	_load_room
00255$:
;main.c:2510: prev_pad = current_pad;
	ldhl	sp,	#5
	ld	a, (hl)
	ld	(#_prev_pad),a
;main.c:2511: update_window_stats_ui();
	call	_update_window_stats_ui
;main.c:2512: performantdelay(5);
	ld	a, #0x05
	call	_performantdelay
	jp	00257$
;main.c:2515: }
	add	sp, #15
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
__xinit__Boss:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x3c	; 60
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x3c	; 60
	.db #0xfc	; 252
	.db #0x0e	; 14
	.db #0xfe	; 254
	.db #0x73	; 115	's'
	.db #0x7c	; 124
	.db #0xe6	; 230
	.db #0xf9	; 249
	.db #0xcc	; 204
	.db #0xf3	; 243
	.db #0xc8	; 200
	.db #0xf7	; 247
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x3c	; 60
	.db #0xfc	; 252
	.db #0x0e	; 14
	.db #0xfe	; 254
	.db #0xf3	; 243
	.db #0xfc	; 252
	.db #0xe6	; 230
	.db #0xf9	; 249
	.db #0xcc	; 204
	.db #0xf3	; 243
	.db #0xc8	; 200
	.db #0xf7	; 247
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfc	; 252
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
__xinit__stage:
	.db #0x01	; 1
__xinit__enemy_hp_multiplier:
	.db #0x01	; 1
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
