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
	.globl _wait_vbl_done
	.globl _joypad
	.globl _knockback_dy
	.globl _knockback_dx
	.globl _knockback_timer
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
	.globl _player_stats
	.globl _slime
	.globl _sword
	.globl _girl
	.globl _player_take_damage
	.globl _init_player_stats
	.globl _update_timers
	.globl _setup_enemy
	.globl _room_0
	.globl _performantdelay
	.globl _character_enemy_collision
	.globl _hide_character_sprites
	.globl _weapon_enemy_collision
	.globl _move_player
	.globl _move_weapon
	.globl _attack
	.globl _swordreset
	.globl _move_enemy_small
	.globl _animate_enemy
	.globl _enemy_check_borders
	.globl _character_set_sprite
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
	.ds 10
_player_stats::
	.ds 7
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
;main.c:189: UINT8 player_take_damage(UINT8 amount)
;	---------------------------------
; Function player_take_damage
; ---------------------------------
_player_take_damage::
	ld	c, a
;main.c:191: if(player_stats.invuln_timer == 0 && player_stats.is_dead == 0)
	ld	a, (#(_player_stats + 5) + 0)
	or	a, a
	jr	NZ, 00105$
	ld	a, (#(_player_stats + 6) + 0)
	or	a, a
	jr	NZ, 00105$
;main.c:193: if(amount >= player_stats.current_health)
	ld	hl, #(_player_stats + 1)
	ld	b, (hl)
	ld	a, c
	sub	a, b
	jr	C, 00102$
;main.c:195: player_stats.current_health = 0;
	ld	hl, #(_player_stats + 1)
	ld	(hl), #0x00
;main.c:196: player_stats.is_dead = 1;
	ld	hl, #(_player_stats + 6)
	ld	(hl), #0x01
	jr	00103$
00102$:
;main.c:200: player_stats.current_health -= amount;
	ld	a, b
	sub	a, c
	ld	(#(_player_stats + 1)),a
00103$:
;main.c:202: player_stats.invuln_timer = INVULN_FRAMES;
	ld	hl, #(_player_stats + 5)
	ld	(hl), #0x0a
;main.c:203: return 1;
	ld	a, #0x01
	ret
00105$:
;main.c:205: return 0;
	xor	a, a
;main.c:206: }            
	ret
;main.c:207: void init_player_stats(void)
;	---------------------------------
; Function init_player_stats
; ---------------------------------
_init_player_stats::
;main.c:209: player_stats.max_health = PLAYER_START_MAX_HP;
	ld	hl, #_player_stats
;main.c:210: player_stats.current_health = PLAYER_START_MAX_HP;
	ld	a, #0x06
	ld	(hl+), a
	ld	(hl), #0x06
;main.c:211: player_stats.damage = PLAYER_START_DAMAGE;
	ld	hl, #_player_stats + 2
	ld	(hl), #0x05
;main.c:212: player_stats.range = PLAYER_START_RANGE;
	ld	hl, #_player_stats + 3
	ld	(hl), #0x05
;main.c:213: player_stats.speed = PLAYER_START_SPEED;
	ld	hl, #_player_stats + 4
	ld	(hl), #0x02
;main.c:214: player_stats.invuln_timer = PLAYER_START_INVULN_TIME;
	ld	hl, #_player_stats + 5
	ld	(hl), #0x00
;main.c:215: player_stats.is_dead = 0;
	ld	hl, #_player_stats + 6
	ld	(hl), #0x00
;main.c:216: }
	ret
;main.c:218: void update_timers(void)
;	---------------------------------
; Function update_timers
; ---------------------------------
_update_timers::
	dec	sp
	dec	sp
;main.c:220: if(player_stats.invuln_timer > 0 && player_stats.is_dead == 0)
	ld	hl, #(_player_stats + 5)
	ld	c, (hl)
	ld	a, c
	or	a, a
	jr	Z, 00102$
	ld	a, (#(_player_stats + 6) + 0)
	or	a, a
	jr	NZ, 00102$
;main.c:222: player_stats.invuln_timer--;
	dec	c
	ld	hl, #(_player_stats + 5)
	ld	(hl), c
00102$:
;main.c:225: if(knockback_timer > 0 && player_stats.is_dead == 0)
	ld	a, (#_knockback_timer)
	or	a, a
	jr	Z, 00113$
	ld	a, (#(_player_stats + 6) + 0)
	or	a, a
	jr	NZ, 00113$
;main.c:227: girl.x += knockback_dx;
	ld	de, #_girl + 4
	ld	a, (de)
	ld	hl, #_knockback_dx
	add	a, (hl)
	ld	(de), a
;main.c:228: girl.y += knockback_dy;
	ld	bc, #_girl + 5
	ld	a, (bc)
	ld	hl, #_knockback_dy
	add	a, (hl)
	ld	(bc), a
;main.c:230: if(girl.x < MIN_GIRL_X)
	ld	a, (de)
	sub	a, #0x17
	jr	NC, 00105$
;main.c:232: girl.x = MIN_GIRL_X;
	ld	a, #0x17
	ld	(de), a
00105$:
;main.c:234: if(girl.x > MAX_GIRL_X)
	ld	a, (de)
	cp	a, #0x8b
	jr	C, 00107$
;main.c:236: girl.x = MAX_GIRL_X;
	ld	a, #0x8a
	ld	(de), a
00107$:
;main.c:238: if(girl.y < MIN_GIRL_Y)
	ld	a, (bc)
	sub	a, #0x14
	jr	NC, 00109$
;main.c:240: girl.y = MIN_GIRL_Y;
	ld	a, #0x14
	ld	(bc), a
00109$:
;main.c:242: if(girl.y > MAX_GIRL_Y)
	ld	a, (bc)
	cp	a, #0x72
	jr	C, 00111$
;main.c:244: girl.y = MAX_GIRL_Y;
	ld	a, #0x71
	ld	(bc), a
00111$:
;main.c:247: knockback_timer--;
	ld	hl, #_knockback_timer
	dec	(hl)
00113$:
;main.c:250: if(locktimer == ATTACK_LOCK_TIME)
	ld	a, (#_locktimer)
	sub	a, #0x0a
	jr	NZ, 00116$
;main.c:252: locktimer = 0;
	xor	a, a
	ld	(#_locktimer),a
;main.c:253: swordreset();
	call	_swordreset
00116$:
;main.c:256: if(locktimer > 0)
	ld	a, (#_locktimer)
	or	a, a
	jr	Z, 00119$
;main.c:258: for(UINT8 i = 0; i < 4; i++)
	ldhl	sp,	#1
	ld	(hl), #0x00
00130$:
	ldhl	sp,	#1
	ld	a, (hl)
	sub	a, #0x04
	jr	NC, 00117$
;main.c:260: weapon_enemy_collision(&sword, &enemies[i], i);
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
	ldhl	sp,	#1
	ld	a, (hl)
	push	af
	inc	sp
	ld	de, #_sword
	call	_weapon_enemy_collision
;main.c:258: for(UINT8 i = 0; i < 4; i++)
	ldhl	sp,	#1
	inc	(hl)
	jr	00130$
00117$:
;main.c:262: locktimer++;
	ld	hl, #_locktimer
	inc	(hl)
00119$:
;main.c:265: if(player_stats.is_dead == 1)
	ld	a, (#(_player_stats + 6) + 0)
	dec	a
	jr	NZ, 00127$
;main.c:267: hide_character_sprites(&girl);
	ld	de, #_girl
	inc	sp
	inc	sp
	jp	_hide_character_sprites
	jr	00132$
00127$:
;main.c:220: if(player_stats.invuln_timer > 0 && player_stats.is_dead == 0)
	ld	a, (#(_player_stats + 5) + 0)
;main.c:269: else if(player_stats.invuln_timer > 0)
	or	a, a
	jr	Z, 00124$
;main.c:271: if(player_stats.invuln_timer % INVULN_FLASH_PERIOD == 0)
	and	a, #0x01
	jr	NZ, 00121$
;main.c:273: hide_character_sprites(&girl);
	ld	de, #_girl
	inc	sp
	inc	sp
	jp	_hide_character_sprites
	jr	00132$
00121$:
;main.c:277: move_player(&girl, girl.x, girl.y);
	ld	a, (#(_girl + 5) + 0)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (#(_girl + 4) + 0)
	ldhl	sp,	#1
	ld	(hl), a
	ldhl	sp,	#0
	ld	a, (hl+)
	push	af
	inc	sp
	ld	a, (hl)
	ld	de, #_girl
	call	_move_player
	jr	00132$
00124$:
;main.c:282: move_player(&girl, girl.x, girl.y);
	ld	a, (#(_girl + 5) + 0)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (#(_girl + 4) + 0)
	ldhl	sp,	#1
	ld	(hl), a
	ldhl	sp,	#0
	ld	a, (hl+)
	push	af
	inc	sp
	ld	a, (hl)
	ld	de, #_girl
	call	_move_player
00132$:
;main.c:284: }
	inc	sp
	inc	sp
	ret
;main.c:286: void setup_enemy(struct Enemy* enemy, UINT8 oam_slot, UINT8 x, UINT8 y)
;	---------------------------------
; Function setup_enemy
; ---------------------------------
_setup_enemy::
	dec	sp
	ldhl	sp,	#0
	ld	(hl), a
;main.c:288: enemy->x = x;
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(bc), a
;main.c:289: enemy->y = y;
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(bc), a
;main.c:290: enemy->width = 8;
	ld	hl, #0x0006
	add	hl, de
	ld	(hl), #0x08
;main.c:291: enemy->height = 8;
	ld	hl, #0x0007
	add	hl, de
	ld	(hl), #0x08
;main.c:292: enemy->anim = 0;
	ld	hl, #0x0008
	add	hl, de
	ld	(hl), #0x00
;main.c:293: enemy->death = 0;
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
;main.c:297: enemy->spritids[0] = oam_slot;
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
;main.c:299: move_enemy_small(enemy, x, y);
	ldhl	sp,	#4
	ld	a, (hl-)
	push	af
	inc	sp
	ld	a, (hl)
	call	_move_enemy_small
;main.c:300: }
	inc	sp
	pop	hl
	pop	af
	jp	(hl)
;main.c:303: void room_0(void)
;	---------------------------------
; Function room_0
; ---------------------------------
_room_0::
;main.c:305: setup_enemy(&enemies[0], 22, 26, 50);   // Left top
	ld	hl, #0x321a
	push	hl
	ld	a, #0x16
	ld	de, #_enemies
	call	_setup_enemy
;main.c:306: setup_enemy(&enemies[1], 23, 26, 70);   // Left bottom
	ld	hl, #0x461a
	push	hl
	ld	a, #0x17
	ld	de, #(_enemies + 10)
	call	_setup_enemy
;main.c:307: setup_enemy(&enemies[2], 24, 134, 50);  // Right top
	ld	hl, #0x3286
	push	hl
	ld	a, #0x18
	ld	de, #(_enemies + 20)
	call	_setup_enemy
;main.c:308: setup_enemy(&enemies[3], 25, 134, 70);  // Right bottom
	ld	hl, #0x4686
	push	hl
	ld	a, #0x19
	ld	de, #(_enemies + 30)
	call	_setup_enemy
;main.c:309: }
	ret
;main.c:313: void performantdelay(UINT8 numloops)
;	---------------------------------
; Function performantdelay
; ---------------------------------
_performantdelay::
	ld	c, a
;main.c:316: for(i = 0; i < numloops; i++)
	ld	b, #0x00
00103$:
	ld	a, b
	sub	a, c
	ret	NC
;main.c:318: wait_vbl_done();
	call	_wait_vbl_done
;main.c:316: for(i = 0; i < numloops; i++)
	inc	b
;main.c:320: }
	jr	00103$
;main.c:322: void character_enemy_collision(struct GameCharacter* character, struct Enemy* enemy)
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
;main.c:325: if(enemy->death == 1)
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
;main.c:327: return;
;main.c:330: if (character->x < enemy->x + enemy->width - pad &&
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
;main.c:331: character->x + character->width - pad > enemy->x &&
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
;main.c:332: character->y < enemy->y + enemy->height - pad &&
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
;main.c:333: character->y + character->height - pad > enemy->y)
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
;main.c:335: UINT8 took_damage = player_take_damage(1);
	ld	a, #0x01
	call	_player_take_damage
;main.c:336: if(took_damage)
	or	a, a
	jp	Z, 00119$
;main.c:338: UINT8 dx = (character->x > enemy->x) ? (character->x - enemy->x) : (enemy->x - character->x);
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
;main.c:339: UINT8 dy = (character->y > enemy->y) ? (character->y - enemy->y) : (enemy->y - character->y);
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
;main.c:341: if (character->x < enemy->x)
	ldhl	sp,	#14
	ld	a, (hl-)
	sub	a, (hl)
	jr	NC, 00104$
;main.c:343: knockback_dx = -KNOCKBACK_STEP;
	ld	hl, #_knockback_dx
	ld	(hl), #0xfe
	jr	00105$
00104$:
;main.c:347: knockback_dx = KNOCKBACK_STEP;
	ld	hl, #_knockback_dx
	ld	(hl), #0x02
00105$:
;main.c:349: if (character->y < enemy->y)
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
;main.c:351: knockback_dy = -KNOCKBACK_STEP;
	ld	hl, #_knockback_dy
	ld	(hl), #0xfe
	jr	00108$
00107$:
;main.c:355: knockback_dy = KNOCKBACK_STEP;
	ld	hl, #_knockback_dy
	ld	(hl), #0x02
00108$:
;main.c:358: if (dx < dy)
	ldhl	sp,	#12
	ld	a, (hl)
	sub	a, c
	jr	NC, 00110$
;main.c:360: knockback_dy = 0;
	xor	a, a
	ld	(#_knockback_dy),a
	jr	00111$
00110$:
;main.c:364: knockback_dx = 0;
	xor	a, a
	ld	(#_knockback_dx),a
00111$:
;main.c:367: knockback_timer = KNOCKBACK_FRAMES;
	ld	hl, #_knockback_timer
	ld	(hl), #0x06
00119$:
;main.c:370: }
	add	sp, #19
	ret
;main.c:372: void hide_character_sprites(struct GameCharacter* character)
;	---------------------------------
; Function hide_character_sprites
; ---------------------------------
_hide_character_sprites::
;main.c:374: for(UINT8 i = 0; i < 4; i++)
	ld	c, #0x00
00104$:
	ld	a, c
	sub	a, #0x04
	ret	NC
;main.c:376: hide_sprite(character->spritids[i]);
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
;main.c:374: for(UINT8 i = 0; i < 4; i++)
	inc	c
;main.c:378: }
	jr	00104$
;main.c:379: void weapon_enemy_collision(struct Weapon* weapon, struct Enemy* enemy, UINT8 enemy_index)
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
;main.c:382: if(enemy->death == 1)
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
;main.c:384: return;
;main.c:388: if(hit_this_attack[enemy_index] == 1)
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
;main.c:390: return;
;main.c:397: UINT8 collision_x = weapon->x;
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
;main.c:398: UINT8 collision_y = weapon->y;
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
;main.c:399: UINT8 collision_width = weapon->width;
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
;main.c:400: UINT8 collision_height = weapon->height;
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
;main.c:403: if(direction == 2 || direction == 3) // left or right
	ld	a,(#_direction)
	cp	a,#0x02
	jr	Z, 00105$
	sub	a, #0x03
	jr	NZ, 00106$
00105$:
;main.c:405: collision_x = weapon->x - 8;  // Start 8px to the left
	ldhl	sp,	#8
	ld	a, (hl)
	add	a, #0xf8
	ldhl	sp,	#12
	ld	(hl), a
;main.c:406: collision_width = 16;  // 2 sprites wide
	ld	c, #0x10
	jr	00107$
00106$:
;main.c:410: collision_y = weapon->y - 8;  // Start 8px up
	ldhl	sp,	#9
	ld	a, (hl)
	add	a, #0xf8
	ldhl	sp,	#13
	ld	(hl), a
;main.c:411: collision_height = 16;  // 2 sprites tall
	ld	b, #0x10
00107$:
;main.c:414: if (collision_x < enemy->x + enemy->width &&
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
;main.c:415: collision_x + collision_width > enemy->x &&
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
;main.c:416: collision_y < enemy->y + enemy->height &&
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
;main.c:417: collision_y + collision_height > enemy->y)
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
;main.c:420: hit_this_attack[enemy_index] = 1;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x01
;main.c:421: enemy->death = 1;
	pop	hl
	ld	(hl), #0x01
	push	hl
;main.c:422: enemy->x = 0;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;main.c:423: enemy->y = 0;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;main.c:424: score = score ++;
00114$:
;main.c:427: }
	add	sp, #18
	pop	hl
	inc	sp
	jp	(hl)
;main.c:428: void move_player(struct GameCharacter* character, UINT8 x, UINT8 y)
;	---------------------------------
; Function move_player
; ---------------------------------
_move_player::
	dec	sp
	ldhl	sp,	#0
	ld	(hl), a
;main.c:430: move_sprite(character->spritids[0], x, y);
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
;main.c:431: move_sprite(character->spritids[1], x + spritesize, y);
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
;main.c:432: move_sprite(character->spritids[2], x, y + spritesize);
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
;main.c:433: move_sprite(character->spritids[3], x + spritesize, y + spritesize);
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
;main.c:433: move_sprite(character->spritids[3], x + spritesize, y + spritesize);
;main.c:434: }
	inc	sp
	pop	hl
	inc	sp
	jp	(hl)
;main.c:435: void move_weapon(struct Weapon* weapon)
;	---------------------------------
; Function move_weapon
; ---------------------------------
_move_weapon::
	add	sp, #-3
	ldhl	sp,	#1
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:439: if(direction == 2) // left
	ld	a, (#_direction)
	sub	a, #0x02
	jr	NZ, 00110$
;main.c:441: sword.x = girl.x - 3;
	ld	a, (#(_girl + 4) + 0)
	add	a, #0xfd
	ld	hl, #(_sword + 2)
;main.c:442: sword.y = girl.y + 8;
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
;main.c:445: sword.spritids[0] = 4;
	ld	hl, #_sword
	ld	(hl), #0x04
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x13
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:448: sword.spritids[1] = 5;
	ld	hl, #_sword + 1
	ld	(hl), #0x05
;main.c:449: move_sprite(weapon->spritids[0], sword.x, sword.y);
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
;main.c:450: move_sprite(weapon->spritids[1], sword.x - spritesize, sword.y);
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
;main.c:450: move_sprite(weapon->spritids[1], sword.x - spritesize, sword.y);
	jp	00136$
00110$:
;main.c:452: else if(direction == 3) // right
	ld	a, (#_direction)
	sub	a, #0x03
	jr	NZ, 00107$
;main.c:454: sword.x = girl.x + 21;
	ld	a, (#(_girl + 4) + 0)
	add	a, #0x15
	ld	hl, #(_sword + 2)
;main.c:455: sword.y = girl.y + 8;
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
;main.c:458: sword.spritids[1] = 4;
	ld	hl, #_sword + 1
	ld	(hl), #0x04
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x13
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:461: sword.spritids[0] = 5;
	ld	hl, #_sword
	ld	(hl), #0x05
;main.c:462: move_sprite(weapon->spritids[0], sword.x, sword.y);
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
;main.c:463: move_sprite(weapon->spritids[1], sword.x - spritesize, sword.y);
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
;main.c:463: move_sprite(weapon->spritids[1], sword.x - spritesize, sword.y);
	jp	00136$
00107$:
;main.c:465: else if(direction == 1) // up
	ld	a, (#_direction)
	dec	a
	jr	NZ, 00104$
;main.c:467: sword.x = girl.x + 9;
	ld	a, (#(_girl + 4) + 0)
	add	a, #0x09
	ld	hl, #(_sword + 2)
;main.c:468: sword.y = girl.y;
	ld	(hl+), a
	ld	a, (#(_girl + 5) + 0)
	ld	(hl), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x14
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:471: sword.spritids[0] = 4;
	ld	hl, #_sword
	ld	(hl), #0x04
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x15
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:474: sword.spritids[1] = 5;
	ld	hl, #_sword + 1
	ld	(hl), #0x05
;main.c:475: move_sprite(weapon->spritids[0], sword.x, sword.y);
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
;main.c:476: move_sprite(weapon->spritids[1], sword.x, sword.y - spritesize);
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
;main.c:476: move_sprite(weapon->spritids[1], sword.x, sword.y - spritesize);
	jr	00136$
00104$:
;main.c:478: else if(direction == 0) // down
	ld	a, (#_direction)
	or	a, a
	jr	NZ, 00136$
;main.c:480: sword.x = girl.x - 2;
	ld	a, (#(_girl + 4) + 0)
	dec	a
	dec	a
	ld	hl, #(_sword + 2)
;main.c:481: sword.y = girl.y + 20;
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
;main.c:484: sword.spritids[1] = 4;
	ld	hl, #_sword + 1
	ld	(hl), #0x04
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x15
	ld	(hl+), a
	ld	(hl), #0x40
;main.c:487: sword.spritids[0] = 5;
	ld	hl, #_sword
	ld	(hl), #0x05
;main.c:488: move_sprite(weapon->spritids[0], sword.x, sword.y);
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
;main.c:489: move_sprite(weapon->spritids[1], sword.x, sword.y - spritesize);
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
;main.c:489: move_sprite(weapon->spritids[1], sword.x, sword.y - spritesize);
00136$:
;main.c:491: }
	add	sp, #3
	ret
;main.c:492: void attack(void)
;	---------------------------------
; Function attack
; ---------------------------------
_attack::
;main.c:495: for(UINT8 i = 0; i < MAX_ENEMIES; i++)
	ld	c, #0x00
00116$:
	ld	a, c
	sub	a, #0x08
	jr	NC, 00101$
;main.c:497: hit_this_attack[i] = 0;
	ld	hl, #_hit_this_attack
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x00
;main.c:495: for(UINT8 i = 0; i < MAX_ENEMIES; i++)
	inc	c
	jr	00116$
00101$:
;main.c:500: move_weapon(&sword);
	ld	bc, #_sword+0
	ld	e, c
	ld	d, b
	push	bc
	call	_move_weapon
	pop	bc
;main.c:503: sword.y = sword.y + 6;
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
;main.c:501: if(direction == 0)
	ld	a, (#_direction)
	or	a, a
	jr	NZ, 00111$
;main.c:503: sword.y = sword.y + 6;
	ld	a, (de)
	add	a, #0x06
	ld	(de), a
	jr	00112$
00111$:
;main.c:505: else if(direction == 1)
	ld	a, (#_direction)
	dec	a
	jr	NZ, 00108$
;main.c:507: sword.y = sword.y - 6;
	ld	a, (de)
	add	a, #0xfa
	ld	(de), a
	jr	00112$
00108$:
;main.c:511: sword.x = sword.x - 6;
	inc	bc
	inc	bc
;main.c:509: else if(direction == 2)
	ld	a, (#_direction)
	sub	a, #0x02
	jr	NZ, 00105$
;main.c:511: sword.x = sword.x - 6;
	ld	a, (bc)
	add	a, #0xfa
	ld	(bc), a
	jr	00112$
00105$:
;main.c:513: else if(direction == 3)
	ld	a, (#_direction)
	sub	a, #0x03
	jr	NZ, 00112$
;main.c:515: sword.x = sword.x + 6;
	ld	a, (bc)
	add	a, #0x06
	ld	(bc), a
00112$:
;main.c:517: if (locktimer == 0)
	ld	hl, #_locktimer
	ld	a, (hl)
	or	a, a
	ret	NZ
;main.c:519: locktimer ++;
	inc	(hl)
;main.c:521: }
	ret
;main.c:522: void swordreset(void)
;	---------------------------------
; Function swordreset
; ---------------------------------
_swordreset::
;main.c:525: for(UINT8 i = 0; i < MAX_ENEMIES; i++)
	ld	c, #0x00
00114$:
	ld	a, c
	sub	a, #0x08
	jr	NC, 00101$
;main.c:527: hit_this_attack[i] = 0;
	ld	hl, #_hit_this_attack
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x00
;main.c:525: for(UINT8 i = 0; i < MAX_ENEMIES; i++)
	inc	c
	jr	00114$
00101$:
;main.c:530: if(direction == 0)
	ld	a, (#_direction)
	or	a, a
	jr	NZ, 00111$
;main.c:532: sword.y = sword.y - 8;
	ld	bc, #_sword+3
	ld	a, (bc)
	add	a, #0xf8
	ld	(bc), a
	jr	00112$
00111$:
;main.c:534: else if(direction == 1)
	ld	a, (#_direction)
	dec	a
	jr	NZ, 00108$
;main.c:536: sword.y = sword.y + 8;
	ld	bc, #_sword+3
	ld	a, (bc)
	add	a, #0x08
	ld	(bc), a
	jr	00112$
00108$:
;main.c:538: else if(direction == 2)
	ld	a, (#_direction)
	sub	a, #0x02
	jr	NZ, 00105$
;main.c:540: sword.x = sword.x + 8;
	ld	bc, #_sword+2
	ld	a, (bc)
	add	a, #0x08
	ld	(bc), a
	jr	00112$
00105$:
;main.c:542: else if(direction == 3)
	ld	a, (#_direction)
	sub	a, #0x03
	jr	NZ, 00112$
;main.c:544: sword.x = sword.x - 8;
	ld	bc, #_sword+2
	ld	a, (bc)
	add	a, #0xf8
	ld	(bc), a
00112$:
;main.c:546: move_weapon(&sword);
	ld	de, #_sword
;main.c:547: }
	jp	_move_weapon
;main.c:548: void move_enemy_small(struct Enemy* character, UINT8 x, UINT8 y)
;	---------------------------------
; Function move_enemy_small
; ---------------------------------
_move_enemy_small::
	ld	c, a
;main.c:550: move_sprite(character->spritids[0], x, y);
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
;main.c:550: move_sprite(character->spritids[0], x, y);
;main.c:551: }
	pop	hl
	inc	sp
	jp	(hl)
;main.c:552: void animate_enemy(struct Enemy* enemy, UINT8 tile0, UINT8 tile1)
;	---------------------------------
; Function animate_enemy
; ---------------------------------
_animate_enemy::
	dec	sp
	dec	sp
	ld	c, a
;main.c:555: if(enemy->anim == 0)
	ld	hl, #0x0008
	add	hl, de
	ld	b, (hl)
;main.c:557: set_sprite_tile(enemy->spritids[0], tile0);
	inc	sp
	inc	sp
	push	de
;main.c:555: if(enemy->anim == 0)
	ld	a, b
	or	a, a
	jr	NZ, 00104$
;main.c:557: set_sprite_tile(enemy->spritids[0], tile0);
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
;main.c:557: set_sprite_tile(enemy->spritids[0], tile0);
	jr	00108$
00104$:
;main.c:559: else if(enemy->anim == 1)
	dec	b
	jr	NZ, 00108$
;main.c:561: set_sprite_tile(enemy->spritids[0], tile1);
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
;main.c:561: set_sprite_tile(enemy->spritids[0], tile1);
00108$:
;main.c:563: }
	inc	sp
	inc	sp
	pop	hl
	inc	sp
	jp	(hl)
;main.c:564: void enemy_check_borders(struct Enemy* enemy)
;	---------------------------------
; Function enemy_check_borders
; ---------------------------------
_enemy_check_borders::
;main.c:566: if (enemy->x < MIN_ENEMY_X)
	ld	hl, #0x0004
	add	hl, de
	ld	a, (hl)
	sub	a, #0x10
	jr	NC, 00102$
;main.c:568: enemy->x = MIN_ENEMY_X;
	ld	(hl), #0x10
00102$:
;main.c:570: if (enemy->x > MAX_ENEMY_X)
	ld	a, (hl)
	cp	a, #0x99
	jr	C, 00104$
;main.c:572: enemy->x = MAX_ENEMY_X;
	ld	(hl), #0x98
00104$:
;main.c:574: if (enemy->y < MIN_ENEMY_Y)
	ld	hl, #0x0005
	add	hl, de
	ld	a, (hl)
	sub	a, #0x14
	jr	NC, 00106$
;main.c:576: enemy->y = MIN_ENEMY_Y;
	ld	(hl), #0x14
00106$:
;main.c:578: if (enemy->y > MAX_ENEMY_Y)
	ld	a, (hl)
	cp	a, #0x81
	ret	C
;main.c:580: enemy->y = MAX_ENEMY_Y;
	ld	(hl), #0x80
;main.c:582: }
	ret
;main.c:585: void character_set_sprite(struct GameCharacter* character, UINT8 anim_state)
;	---------------------------------
; Function character_set_sprite
; ---------------------------------
_character_set_sprite::
	ld	c, e
	ld	b, d
	ld	e, a
;main.c:590: character->anim = anim_state;  // Set animation state in struct
	ld	hl, #0x0008
	add	hl, bc
	ld	(hl), e
;main.c:592: if(anim_state == 0) // down walking
	ld	a, e
	or	a, a
	jr	NZ, 00122$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;main.c:596: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:599: character->spritids[1] = 1;
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
;main.c:602: character->spritids[3] = 2;
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
;main.c:605: character->spritids[2] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jp	00123$
00122$:
;main.c:607: else if(anim_state == 1) // down standing
	ld	a, e
	dec	a
	jr	NZ, 00119$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;main.c:611: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:614: character->spritids[1] = 1;
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
;main.c:617: character->spritids[2] = 2;
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
;main.c:620: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jp	00123$
00119$:
;main.c:622: else if(anim_state == 2) // left walking
	ld	a, e
	sub	a, #0x02
	jr	NZ, 00116$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x04
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:626: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x05
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:629: character->spritids[1] = 1;
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
;main.c:632: character->spritids[2] = 2;
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
;main.c:635: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jp	00123$
00116$:
;main.c:637: else if(anim_state == 3) // left standing
	ld	a, e
	sub	a, #0x03
	jr	NZ, 00113$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x08
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:641: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x09
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:644: character->spritids[1] = 1;
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
;main.c:647: character->spritids[2] = 2;
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
;main.c:650: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jp	00123$
00113$:
;main.c:652: else if(anim_state == 4) // right walking
	ld	a, e
	sub	a, #0x04
	jr	NZ, 00110$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x05
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:656: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x04
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:659: character->spritids[1] = 1;
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
;main.c:662: character->spritids[2] = 2;
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
;main.c:665: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jp	00123$
00110$:
;main.c:667: else if(anim_state == 5) // right standing
	ld	a, e
	sub	a, #0x05
	jr	NZ, 00107$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x09
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:671: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x08
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:674: character->spritids[1] = 1;
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
;main.c:677: character->spritids[2] = 2;
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
;main.c:680: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jr	00123$
00107$:
;main.c:682: else if(anim_state == 6) // up walking
	ld	a, e
	sub	a, #0x06
	jr	NZ, 00104$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0c
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:686: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0d
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:689: character->spritids[1] = 1;
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
;main.c:692: character->spritids[2] = 2;
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
;main.c:695: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jr	00123$
00104$:
;main.c:697: else if(anim_state == 7) // up standing
	ld	a, e
	sub	a, #0x07
	jr	NZ, 00123$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0c
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:701: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0d
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:704: character->spritids[1] = 1;
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
;main.c:707: character->spritids[2] = 2;
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
;main.c:710: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
00123$:
;main.c:713: move_player(character, character->x, character->y);
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
;main.c:714: }
	ret
;main.c:716: void setup_player(void)
;	---------------------------------
; Function setup_player
; ---------------------------------
_setup_player::
;main.c:718: girl.x = PLAYER_SPAWN_X;
	ld	bc, #_girl + 4
	ld	a, #0x50
	ld	(bc), a
;main.c:719: girl.y = PLAYER_SPAWN_Y;
	ld	hl, #(_girl + 5)
;main.c:720: girl.width = 16;
	ld	a, #0x24
	ld	(hl+), a
	ld	(hl), #0x10
;main.c:721: girl.height = 16;
	ld	hl, #_girl + 7
	ld	(hl), #0x10
;main.c:722: girl.anim = 0;
	ld	hl, #_girl + 8
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;main.c:726: girl.spritids[0] = 0;
	ld	hl, #_girl
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:729: girl.spritids[1] = 1;
	ld	hl, #_girl + 1
	ld	(hl), #0x01
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x02
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:732: girl.spritids[2] = 2;
	ld	hl, #_girl + 2
	ld	(hl), #0x02
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x03
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:735: girl.spritids[3] = 3;
	ld	hl, #_girl + 3
	ld	(hl), #0x03
;main.c:737: move_player(&girl, girl.x, girl.y);
	ld	hl, #(_girl + 5)
	ld	h, (hl)
	ld	a, (bc)
	push	hl
	inc	sp
	ld	de, #_girl
	call	_move_player
;main.c:738: }
	ret
;main.c:740: void setupslime(void)
;	---------------------------------
; Function setupslime
; ---------------------------------
_setupslime::
;main.c:742: slime.x = rand() % 128 + 16;
	call	_rand
	ld	a, e
	res	7, a
	add	a, #0x10
	ld	(#(_slime + 4)),a
;main.c:743: slime.y = rand() % 96 + 24;
	call	_rand
	ld	a, e
	ld	e, #0x60
	call	__moduchar
	ld	a, c
	add	a, #0x18
	ld	hl, #(_slime + 5)
;main.c:744: slime.width = 8;
	ld	(hl+), a
	ld	(hl), #0x08
;main.c:745: slime.height = 8;
	ld	hl, #_slime + 7
	ld	(hl), #0x08
;main.c:746: slime.anim = 0;
	ld	hl, #_slime + 8
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 90)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x10
	ld	(hl+), a
	ld	(hl), #0x10
;main.c:750: slime.spritids[0] = 22;
	ld	hl, #_slime
	ld	(hl), #0x16
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 94)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x11
	ld	(hl+), a
	ld	(hl), #0x10
;main.c:753: slime.spritids[1] = 23;
	ld	hl, #_slime + 1
	ld	(hl), #0x17
;main.c:755: move_enemy_small(&slime, slime.x, slime.y);
	ld	hl, #(_slime + 5)
	ld	b, (hl)
	ld	a, (#(_slime + 4) + 0)
	push	bc
	inc	sp
	ld	de, #_slime
	call	_move_enemy_small
;main.c:756: }
	ret
;main.c:758: void setupsword(void)
;	---------------------------------
; Function setupsword
; ---------------------------------
_setupsword::
;main.c:760: sword.x = 100;
	ld	hl, #_sword + 2
	ld	(hl), #0x64
;main.c:761: sword.y = 100;
	ld	hl, #_sword + 3
	ld	(hl), #0x64
;main.c:762: sword.width = 8;
	ld	hl, #_sword + 4
	ld	(hl), #0x08
;main.c:763: sword.height = 8;
	ld	hl, #_sword + 5
	ld	(hl), #0x08
;main.c:764: sword.anim = 0;
	ld	hl, #_sword + 6
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x12
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:769: sword.spritids[0] = 4;
	ld	hl, #_sword
	ld	(hl), #0x04
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x13
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:772: sword.spritids[1] = 5;
	ld	hl, #_sword + 1
	ld	(hl), #0x05
;main.c:775: }
	ret
;main.c:778: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
	add	sp, #-8
;main.c:780: while(1)
00179$:
;main.c:782: UINT8 current_pad = joypad();
	call	_joypad
	ldhl	sp,	#0
	ld	(hl), a
;main.c:784: if((current_pad & J_START) && !(prev_pad & J_START))
	push	hl
	ldhl	sp,	#2
	bit	7, (hl)
	pop	hl
	jp	Z, 00110$
	ld	a, (_prev_pad)
	rlca
	jp	C, 00110$
;main.c:786: if(gamestate == 0)
	ld	hl, #_gamestate
	ld	a, (hl)
	or	a, a
	jp	NZ, 00107$
;main.c:788: gamestate = 1;
	ld	(hl), #0x01
;main.c:789: initrand(DIV_REG);
	ldh	a, (_DIV_REG + 0)
	ld	b, #0x00
	ld	c, a
	push	bc
	call	_initrand
	pop	hl
;main.c:792: font_init();
	call	_font_init
;main.c:793: min_font = font_load(font_min);
	ld	de, #_font_min
	push	de
	call	_font_load
	pop	hl
;main.c:794: font_set(min_font);
	push	de
	call	_font_set
	pop	hl
;main.c:796: set_bkg_data(37, 8, backgroundtiles);
	ld	de, #_backgroundtiles
	push	de
	ld	hl, #0x825
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:797: set_bkg_tiles(0, 0, 20, 16, backgroundmap);
	ld	de, #_backgroundmap
	push	de
	ld	hl, #0x1014
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:799: set_win_tiles(0, 0, 20, 2, windowmap);
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
;main.c:804: set_sprite_data(0, 22, Girl);
	ld	de, #_Girl
	push	de
	ld	hl, #0x1600
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:805: setup_player();
	call	_setup_player
;main.c:806: init_player_stats();
	call	_init_player_stats
;main.c:807: setupsword();
	call	_setupsword
;main.c:808: room_0();  // Initialize room after sprite data is loaded
	call	_room_0
;main.c:816: BGP_REG  = 0xE4; // Background palette (light fill uses C1)
	ld	a, #0xe4
	ldh	(_BGP_REG + 0), a
;main.c:817: OBP0_REG = 0xE0; // Sprite palette 0: Girl/Sword (old colors)
	ld	a, #0xe0
	ldh	(_OBP0_REG + 0), a
;main.c:818: OBP1_REG = 0xE4; // Sprite palette 1: Slimes (clear, light, dark, black)
	ld	a, #0xe4
	ldh	(_OBP1_REG + 0), a
;main.c:819: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:820: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:821: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;main.c:822: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
	jr	00110$
00107$:
;main.c:824: else if(gamestate == 1)
	ld	a, (#_gamestate)
	dec	a
	jr	NZ, 00104$
;main.c:826: gamestate = 2;
	ld	hl, #_gamestate
	ld	(hl), #0x02
;main.c:827: HIDE_BKG;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfe
	ldh	(_LCDC_REG + 0), a
;main.c:828: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
	jr	00110$
00104$:
;main.c:830: else if(gamestate == 2)
	ld	a, (#_gamestate)
	sub	a, #0x02
	jr	NZ, 00110$
;main.c:832: gamestate = 1;
	ld	hl, #_gamestate
	ld	(hl), #0x01
;main.c:833: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:834: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
00110$:
;main.c:838: if(gamestate == 1)
	ld	a, (#_gamestate)
	dec	a
	jp	NZ, 00177$
;main.c:840: if(player_stats.is_dead == 0 && locktimer == 0 && knockback_timer == 0)
	ld	a, (#(_player_stats + 6) + 0)
	or	a, a
	jp	NZ, 00159$
	ld	a, (#_locktimer)
	or	a, a
	jp	NZ, 00159$
	ld	a, (#_knockback_timer)
	or	a, a
	jp	NZ, 00159$
;main.c:842: if(joypad() & J_LEFT)
	call	_joypad
	bit	1, a
	jr	Z, 00124$
;main.c:844: direction = 2;
	ld	hl, #_direction
	ld	(hl), #0x02
;main.c:845: move_weapon(&sword);
	ld	de, #_sword
	call	_move_weapon
;main.c:846: if(girl.x > MIN_GIRL_X)
	ld	hl, #_girl + 4
	ld	a, (hl)
	cp	a, #0x18
	jr	C, 00113$
;main.c:848: girl.x -= 2;
	dec	a
	dec	a
	ld	(hl), a
00113$:
;main.c:851: if(girl.anim != 2 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	ld	hl, #_girl + 8
	ld	a, (hl)
;main.c:853: character_set_sprite(&girl, 2);
;main.c:851: if(girl.anim != 2 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	sub	a, #0x02
	jr	Z, 00119$
	call	_joypad
	bit	2, a
	jr	NZ, 00119$
	call	_joypad
	bit	3, a
	jr	NZ, 00119$
;main.c:853: character_set_sprite(&girl, 2);
	ld	a, #0x02
	ld	de, #_girl
	call	_character_set_sprite
	jr	00124$
00119$:
;main.c:855: else if(girl.anim != 3 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	ld	a, (hl)
	sub	a, #0x03
	jr	Z, 00124$
	call	_joypad
	bit	2, a
	jr	NZ, 00124$
	call	_joypad
	bit	3, a
	jr	NZ, 00124$
;main.c:857: character_set_sprite(&girl, 3);
	ld	a, #0x03
	ld	de, #_girl
	call	_character_set_sprite
00124$:
;main.c:860: if(joypad() & J_RIGHT)
	call	_joypad
	rrca
	jr	NC, 00137$
;main.c:862: direction = 3;
	ld	hl, #_direction
	ld	(hl), #0x03
;main.c:863: move_weapon(&sword);
	ld	de, #_sword
	call	_move_weapon
;main.c:864: if(girl.x < MAX_GIRL_X)
	ld	bc, #_girl + 4
	ld	a, (bc)
	cp	a, #0x8a
	jr	NC, 00126$
;main.c:866: girl.x += 2;
	add	a, #0x02
	ld	(bc), a
00126$:
;main.c:870: if(girl.anim != 4 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	ld	hl, #_girl + 8
	ld	a, (hl)
;main.c:872: character_set_sprite(&girl, 4);
;main.c:870: if(girl.anim != 4 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	sub	a, #0x04
	jr	Z, 00132$
	call	_joypad
	bit	2, a
	jr	NZ, 00132$
	call	_joypad
	bit	3, a
	jr	NZ, 00132$
;main.c:872: character_set_sprite(&girl, 4);
	ld	a, #0x04
	ld	de, #_girl
	call	_character_set_sprite
	jr	00137$
00132$:
;main.c:874: else if(girl.anim != 5 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00137$
	call	_joypad
	bit	2, a
	jr	NZ, 00137$
	call	_joypad
	bit	3, a
	jr	NZ, 00137$
;main.c:876: character_set_sprite(&girl, 5);
	ld	a, #0x05
	ld	de, #_girl
	call	_character_set_sprite
00137$:
;main.c:879: if(joypad() & J_UP)
	call	_joypad
	bit	2, a
	jr	Z, 00146$
;main.c:881: direction = 1;
	ld	hl, #_direction
	ld	(hl), #0x01
;main.c:882: move_weapon(&sword);
	ld	de, #_sword
	call	_move_weapon
;main.c:883: if(girl.y > MIN_GIRL_Y)
	ld	hl, #_girl + 5
	ld	a, (hl)
	cp	a, #0x15
	jr	C, 00139$
;main.c:886: girl.y -= 2;
	dec	a
	dec	a
	ld	(hl), a
00139$:
;main.c:888: if(girl.anim != 6)
	ld	a, (#(_girl + 8) + 0)
;main.c:890: character_set_sprite(&girl, 6);
	ld	de, #_girl
;main.c:888: if(girl.anim != 6)
	cp	a, #0x06
	jr	Z, 00143$
;main.c:890: character_set_sprite(&girl, 6);
	ld	a, #0x06
	call	_character_set_sprite
	jr	00146$
00143$:
;main.c:892: else if(girl.anim != 7)
	sub	a, #0x07
	jr	Z, 00146$
;main.c:894: character_set_sprite(&girl, 7);
	ld	a, #0x07
	call	_character_set_sprite
00146$:
;main.c:897: if(joypad() & J_DOWN)
	call	_joypad
	bit	3, a
	jr	Z, 00155$
;main.c:899: direction = 0;
	xor	a, a
	ld	(#_direction),a
;main.c:900: move_weapon(&sword);
	ld	de, #_sword
	call	_move_weapon
;main.c:901: if(girl.y < MAX_GIRL_Y)
	ld	hl, #_girl + 5
	ld	a, (hl)
	cp	a, #0x71
	jr	NC, 00148$
;main.c:904: girl.y += 2;
	add	a, #0x02
	ld	(hl), a
00148$:
;main.c:907: if(girl.anim != 0)
	ld	a, (#(_girl + 8) + 0)
;main.c:909: character_set_sprite(&girl, 0);
	ld	de, #_girl
;main.c:907: if(girl.anim != 0)
	or	a, a
	jr	Z, 00152$
;main.c:909: character_set_sprite(&girl, 0);
	xor	a, a
	call	_character_set_sprite
	jr	00155$
00152$:
;main.c:911: else if(girl.anim != 1)
	dec	a
	jr	Z, 00155$
;main.c:913: character_set_sprite(&girl, 1);
	ld	a, #0x01
	call	_character_set_sprite
00155$:
;main.c:917: if(joypad() & J_A)
	call	_joypad
	bit	4, a
	jr	Z, 00159$
;main.c:919: attack();
	call	_attack
00159$:
;main.c:923: if(player_stats.is_dead == 1)
	ld	a, (#(_player_stats + 6) + 0)
	dec	a
	jr	NZ, 00163$
;main.c:925: hide_character_sprites(&girl);
	ld	de, #_girl
	call	_hide_character_sprites
00163$:
;main.c:928: update_timers();
	call	_update_timers
;main.c:932: for(UINT8 i = 0; i < 4; i++)
	ldhl	sp,	#7
	ld	(hl), #0x00
00183$:
	ldhl	sp,	#7
	ld	a, (hl)
	sub	a, #0x04
	jp	NC, 00169$
;main.c:934: if(enemies[i].death == 0)
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	bc, #_enemies
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
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#6
	ld	(hl), a
;main.c:936: animate_enemy(&enemies[i], 16, 17);
	ldhl	sp,	#1
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
;main.c:934: if(enemies[i].death == 0)
	ld	(hl+), a
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00167$
;main.c:936: animate_enemy(&enemies[i], 16, 17);
	ld	a, #0x11
	push	af
	inc	sp
	ld	a, #0x10
	ldhl	sp,	#4
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_animate_enemy
	jr	00184$
00167$:
;main.c:938: else if(enemies[i].death == 1)
	ldhl	sp,	#6
	ld	a, (hl)
	dec	a
	jr	NZ, 00184$
;main.c:940: enemies[i].x = 0;
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
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
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;main.c:941: enemies[i].y = 0;
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
;main.c:942: move_enemy_small(&enemies[i], 0, 0);
	xor	a, a
	ld	(bc), a
	push	af
	inc	sp
	xor	a, a
	ldhl	sp,	#4
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_move_enemy_small
00184$:
;main.c:932: for(UINT8 i = 0; i < 4; i++)
	ldhl	sp,	#7
	inc	(hl)
	jp	00183$
00169$:
;main.c:947: animtimer++;
	ld	hl, #_animtimer
	inc	(hl)
;main.c:948: if(animtimer == ANIM_TIMER_MAX)
	ld	a, (hl)
	sub	a, #0x14
	jr	NZ, 00172$
;main.c:950: animtimer = 0;
	xor	a, a
	ld	(#_animtimer),a
;main.c:951: for(UINT8 i = 0; i < 4; i++)
	ld	c, #0x00
00186$:
	ld	a, c
	sub	a, #0x04
	jr	NC, 00172$
;main.c:953: enemies[i].anim = (enemies[i].anim == 0) ? 1 : 0;
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	de, #_enemies
	add	hl, de
	ld	de, #0x0008
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	NZ, 00193$
	ld	b, #0x01
	jr	00194$
00193$:
	ld	b, #0x00
00194$:
	ld	(hl), b
;main.c:951: for(UINT8 i = 0; i < 4; i++)
	inc	c
	jr	00186$
00172$:
;main.c:958: if(player_stats.is_dead == 0)
	ld	a, (#(_player_stats + 6) + 0)
	or	a, a
	jr	NZ, 00177$
;main.c:960: for(UINT8 i = 0; i < 4; i++)
	ldhl	sp,	#7
	ld	(hl), #0x00
00189$:
	ldhl	sp,	#7
	ld	a, (hl)
	sub	a, #0x04
	jr	NC, 00177$
;main.c:962: character_enemy_collision(&girl, &enemies[i]);
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
;main.c:960: for(UINT8 i = 0; i < 4; i++)
	ldhl	sp,	#7
	inc	(hl)
	jr	00189$
00177$:
;main.c:1005: prev_pad = current_pad;
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(#_prev_pad),a
;main.c:1006: performantdelay(5);
	ld	a, #0x05
	call	_performantdelay
	jp	00179$
;main.c:1009: }
	add	sp, #8
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
__xinit__knockback_timer:
	.db #0x00	; 0
__xinit__knockback_dx:
	.db #0x00	;  0
__xinit__knockback_dy:
	.db #0x00	;  0
	.area _CABS (ABS)
