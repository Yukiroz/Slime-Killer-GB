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
;main.c:177: void player_take_damage(UINT8 amount)
;	---------------------------------
; Function player_take_damage
; ---------------------------------
_player_take_damage::
	ld	c, a
;main.c:179: if(player_stats.invuln_timer == 0 && player_stats.is_dead == 0)
	ld	a, (#(_player_stats + 5) + 0)
	or	a, a
	ret	NZ
	ld	a, (#(_player_stats + 6) + 0)
	or	a, a
	ret	NZ
;main.c:181: if(amount >= player_stats.current_health)
	ld	hl, #(_player_stats + 1)
	ld	b, (hl)
	ld	a, c
	sub	a, b
	jr	C, 00102$
;main.c:183: player_stats.current_health = 0;
	ld	hl, #(_player_stats + 1)
	ld	(hl), #0x00
;main.c:184: player_stats.is_dead = 1;
	ld	hl, #(_player_stats + 6)
	ld	(hl), #0x01
	jr	00103$
00102$:
;main.c:188: player_stats.current_health -= amount;
	ld	a, b
	sub	a, c
	ld	(#(_player_stats + 1)),a
00103$:
;main.c:190: player_stats.invuln_timer = INVULN_FRAMES;
	ld	hl, #(_player_stats + 5)
	ld	(hl), #0x0a
;main.c:192: }            
	ret
;main.c:193: void init_player_stats(void)
;	---------------------------------
; Function init_player_stats
; ---------------------------------
_init_player_stats::
;main.c:195: player_stats.max_health = PLAYER_START_MAX_HP;
	ld	hl, #_player_stats
;main.c:196: player_stats.current_health = PLAYER_START_MAX_HP;
	ld	a, #0x06
	ld	(hl+), a
	ld	(hl), #0x06
;main.c:197: player_stats.damage = PLAYER_START_DAMAGE;
	ld	hl, #_player_stats + 2
	ld	(hl), #0x05
;main.c:198: player_stats.range = PLAYER_START_RANGE;
	ld	hl, #_player_stats + 3
	ld	(hl), #0x05
;main.c:199: player_stats.speed = PLAYER_START_SPEED;
	ld	hl, #_player_stats + 4
	ld	(hl), #0x02
;main.c:200: player_stats.invuln_timer = PLAYER_START_INVULN_TIME;
	ld	hl, #_player_stats + 5
	ld	(hl), #0x00
;main.c:201: player_stats.is_dead = 0;
	ld	hl, #_player_stats + 6
	ld	(hl), #0x00
;main.c:202: }
	ret
;main.c:204: void update_timers(void)
;	---------------------------------
; Function update_timers
; ---------------------------------
_update_timers::
	dec	sp
;main.c:206: if(player_stats.invuln_timer > 0 && player_stats.is_dead == 0)
	ld	hl, #(_player_stats + 5)
	ld	c, (hl)
	ld	a, c
	or	a, a
	jr	Z, 00105$
	ld	a, (#(_player_stats + 6) + 0)
	or	a, a
	jr	NZ, 00105$
;main.c:208: if(player_stats.invuln_timer % INVULN_FLASH_PERIOD == 0)
	ld	a, c
	and	a, #0x01
	jr	NZ, 00102$
;main.c:210: hide_character_sprites(&girl);
	ld	de, #_girl
	call	_hide_character_sprites
	jr	00103$
00102$:
;main.c:214: move_player(&girl, girl.x, girl.y);
	ld	hl, #_girl + 5
	ld	h, (hl)
	ld	a, (#(_girl + 4) + 0)
	push	hl
	inc	sp
	ld	de, #_girl
	call	_move_player
00103$:
;main.c:216: player_stats.invuln_timer--;
	ld	a, (#(_player_stats + 5) + 0)
	dec	a
	ld	(#(_player_stats + 5)),a
00105$:
;main.c:219: if(locktimer == ATTACK_LOCK_TIME)
	ld	a, (#_locktimer)
	sub	a, #0x0a
	jr	NZ, 00108$
;main.c:221: locktimer = 0;
	xor	a, a
	ld	(#_locktimer),a
;main.c:222: swordreset();
	call	_swordreset
00108$:
;main.c:225: if(locktimer > 0)
	ld	a, (#_locktimer)
	or	a, a
	jr	Z, 00115$
;main.c:227: for(UINT8 i = 0; i < 4; i++)
	ldhl	sp,	#0
	ld	(hl), #0x00
00113$:
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x04
	jr	NC, 00109$
;main.c:229: weapon_enemy_collision(&sword, &enemies[i], i);
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
	ldhl	sp,	#0
	ld	a, (hl)
	push	af
	inc	sp
	ld	de, #_sword
	call	_weapon_enemy_collision
;main.c:227: for(UINT8 i = 0; i < 4; i++)
	ldhl	sp,	#0
	inc	(hl)
	jr	00113$
00109$:
;main.c:231: locktimer++;
	ld	hl, #_locktimer
	inc	(hl)
00115$:
;main.c:233: }
	inc	sp
	ret
;main.c:235: void setup_enemy(struct Enemy* enemy, UINT8 oam_slot, UINT8 x, UINT8 y)
;	---------------------------------
; Function setup_enemy
; ---------------------------------
_setup_enemy::
	dec	sp
	ldhl	sp,	#0
	ld	(hl), a
;main.c:237: enemy->x = x;
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(bc), a
;main.c:238: enemy->y = y;
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(bc), a
;main.c:239: enemy->width = 8;
	ld	hl, #0x0006
	add	hl, de
	ld	(hl), #0x08
;main.c:240: enemy->height = 8;
	ld	hl, #0x0007
	add	hl, de
	ld	(hl), #0x08
;main.c:241: enemy->anim = 0;
	ld	hl, #0x0008
	add	hl, de
	ld	(hl), #0x00
;main.c:242: enemy->death = 0;
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
;main.c:246: enemy->spritids[0] = oam_slot;
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
;main.c:248: move_enemy_small(enemy, x, y);
	ldhl	sp,	#4
	ld	a, (hl-)
	push	af
	inc	sp
	ld	a, (hl)
	call	_move_enemy_small
;main.c:249: }
	inc	sp
	pop	hl
	pop	af
	jp	(hl)
;main.c:252: void room_0(void)
;	---------------------------------
; Function room_0
; ---------------------------------
_room_0::
;main.c:254: setup_enemy(&enemies[0], 22, 26, 50);   // Left top
	ld	hl, #0x321a
	push	hl
	ld	a, #0x16
	ld	de, #_enemies
	call	_setup_enemy
;main.c:255: setup_enemy(&enemies[1], 23, 26, 70);   // Left bottom
	ld	hl, #0x461a
	push	hl
	ld	a, #0x17
	ld	de, #(_enemies + 10)
	call	_setup_enemy
;main.c:256: setup_enemy(&enemies[2], 24, 134, 50);  // Right top
	ld	hl, #0x3286
	push	hl
	ld	a, #0x18
	ld	de, #(_enemies + 20)
	call	_setup_enemy
;main.c:257: setup_enemy(&enemies[3], 25, 134, 70);  // Right bottom
	ld	hl, #0x4686
	push	hl
	ld	a, #0x19
	ld	de, #(_enemies + 30)
	call	_setup_enemy
;main.c:258: }
	ret
;main.c:262: void performantdelay(UINT8 numloops)
;	---------------------------------
; Function performantdelay
; ---------------------------------
_performantdelay::
	ld	c, a
;main.c:265: for(i = 0; i < numloops; i++)
	ld	b, #0x00
00103$:
	ld	a, b
	sub	a, c
	ret	NC
;main.c:267: wait_vbl_done();
	call	_wait_vbl_done
;main.c:265: for(i = 0; i < numloops; i++)
	inc	b
;main.c:269: }
	jr	00103$
;main.c:271: void character_enemy_collision(struct GameCharacter* character, struct Enemy* enemy)
;	---------------------------------
; Function character_enemy_collision
; ---------------------------------
_character_enemy_collision::
	add	sp, #-14
	ldhl	sp,	#12
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ldhl	sp,	#10
	ld	a, c
	ld	(hl+), a
;main.c:274: if(enemy->death == 1)
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
	jp	Z, 00108$
;main.c:276: return;
;main.c:280: if (character->x < enemy->x + enemy->width - pad &&
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#9
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#4
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	d, #0x00
	ld	e, a
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	b, l
	ld	c, h
	ld	a, (#_pad)
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), #0x00
	ld	e, b
	ld	d, c
	pop	hl
	push	hl
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	c, a
	ld	b, e
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	sub	a, b
	ld	a, (hl)
	sbc	a, c
	ld	d, (hl)
	ld	a, c
	bit	7,a
	jr	Z, 00147$
	bit	7, d
	jr	NZ, 00148$
	cp	a, a
	jr	00148$
00147$:
	bit	7, d
	jr	Z, 00148$
	scf
00148$:
	jp	NC, 00108$
;main.c:281: character->x + character->width - pad > enemy->x &&
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
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
	ld	d, (hl)
	ld	a, (de)
	ld	d, #0x00
	ld	e, a
	ldhl	sp,	#6
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	b, l
	ld	c, h
	ld	e, b
	ld	d, c
	pop	hl
	push	hl
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	c, a
	ld	b, e
	ldhl	sp,	#4
	ld	a, (hl+)
	sub	a, b
	ld	a, (hl)
	sbc	a, c
	ld	d, (hl)
	ld	a, c
	bit	7,a
	jr	Z, 00149$
	bit	7, d
	jr	NZ, 00150$
	cp	a, a
	jr	00150$
00149$:
	bit	7, d
	jr	Z, 00150$
	scf
00150$:
	jp	NC, 00108$
;main.c:282: character->y < enemy->y + enemy->height - pad &&
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#9
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#2
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	d, #0x00
	ld	e, a
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	b, l
	ld	c, h
	ld	e, b
	ld	d, c
	pop	hl
	push	hl
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	c, a
	ld	b, e
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	sub	a, b
	ld	a, (hl)
	sbc	a, c
	ld	d, (hl)
	ld	a, c
	bit	7,a
	jr	Z, 00151$
	bit	7, d
	jr	NZ, 00152$
	cp	a, a
	jr	00152$
00151$:
	bit	7, d
	jr	Z, 00152$
	scf
00152$:
	jr	NC, 00108$
;main.c:283: character->y + character->height - pad > enemy->y)
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
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
	ld	d, (hl)
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#6
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
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
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	pop	hl
	push	hl
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,	#2
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
	jr	Z, 00153$
	bit	7, d
	jr	NZ, 00154$
	cp	a, a
	jr	00154$
00153$:
	bit	7, d
	jr	Z, 00154$
	scf
00154$:
	jr	NC, 00108$
;main.c:285: player_take_damage(1);
	ld	a, #0x01
	call	_player_take_damage
00108$:
;main.c:287: }
	add	sp, #14
	ret
;main.c:289: void hide_character_sprites(struct GameCharacter* character)
;	---------------------------------
; Function hide_character_sprites
; ---------------------------------
_hide_character_sprites::
;main.c:291: for(UINT8 i = 0; i < 4; i++)
	ld	c, #0x00
00104$:
	ld	a, c
	sub	a, #0x04
	ret	NC
;main.c:293: hide_sprite(character->spritids[i]);
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
;main.c:291: for(UINT8 i = 0; i < 4; i++)
	inc	c
;main.c:295: }
	jr	00104$
;main.c:296: void weapon_enemy_collision(struct Weapon* weapon, struct Enemy* enemy, UINT8 enemy_index)
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
;main.c:299: if(enemy->death == 1)
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
;main.c:301: return;
;main.c:305: if(hit_this_attack[enemy_index] == 1)
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
;main.c:307: return;
;main.c:314: UINT8 collision_x = weapon->x;
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
;main.c:315: UINT8 collision_y = weapon->y;
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
;main.c:316: UINT8 collision_width = weapon->width;
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
;main.c:317: UINT8 collision_height = weapon->height;
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
;main.c:320: if(direction == 2 || direction == 3) // left or right
	ld	a,(#_direction)
	cp	a,#0x02
	jr	Z, 00105$
	sub	a, #0x03
	jr	NZ, 00106$
00105$:
;main.c:322: collision_x = weapon->x - 8;  // Start 8px to the left
	ldhl	sp,	#8
	ld	a, (hl)
	add	a, #0xf8
	ldhl	sp,	#12
	ld	(hl), a
;main.c:323: collision_width = 16;  // 2 sprites wide
	ld	c, #0x10
	jr	00107$
00106$:
;main.c:327: collision_y = weapon->y - 8;  // Start 8px up
	ldhl	sp,	#9
	ld	a, (hl)
	add	a, #0xf8
	ldhl	sp,	#13
	ld	(hl), a
;main.c:328: collision_height = 16;  // 2 sprites tall
	ld	b, #0x10
00107$:
;main.c:331: if (collision_x < enemy->x + enemy->width &&
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
;main.c:332: collision_x + collision_width > enemy->x &&
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
;main.c:333: collision_y < enemy->y + enemy->height &&
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
;main.c:334: collision_y + collision_height > enemy->y)
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
;main.c:337: hit_this_attack[enemy_index] = 1;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x01
;main.c:338: enemy->death = 1;
	pop	hl
	ld	(hl), #0x01
	push	hl
;main.c:339: enemy->x = 0;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;main.c:340: enemy->y = 0;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;main.c:341: score = score ++;
00114$:
;main.c:344: }
	add	sp, #18
	pop	hl
	inc	sp
	jp	(hl)
;main.c:345: void move_player(struct GameCharacter* character, UINT8 x, UINT8 y)
;	---------------------------------
; Function move_player
; ---------------------------------
_move_player::
	dec	sp
	ldhl	sp,	#0
	ld	(hl), a
;main.c:347: move_sprite(character->spritids[0], x, y);
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
;main.c:348: move_sprite(character->spritids[1], x + spritesize, y);
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
;main.c:349: move_sprite(character->spritids[2], x, y + spritesize);
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
;main.c:350: move_sprite(character->spritids[3], x + spritesize, y + spritesize);
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
;main.c:350: move_sprite(character->spritids[3], x + spritesize, y + spritesize);
;main.c:351: }
	inc	sp
	pop	hl
	inc	sp
	jp	(hl)
;main.c:352: void move_weapon(struct Weapon* weapon)
;	---------------------------------
; Function move_weapon
; ---------------------------------
_move_weapon::
	add	sp, #-3
	ldhl	sp,	#1
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:356: if(direction == 2) // left
	ld	a, (#_direction)
	sub	a, #0x02
	jr	NZ, 00110$
;main.c:358: sword.x = girl.x - 3;
	ld	a, (#(_girl + 4) + 0)
	add	a, #0xfd
	ld	hl, #(_sword + 2)
;main.c:359: sword.y = girl.y + 8;
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
;main.c:362: sword.spritids[0] = 4;
	ld	hl, #_sword
	ld	(hl), #0x04
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x13
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:365: sword.spritids[1] = 5;
	ld	hl, #_sword + 1
	ld	(hl), #0x05
;main.c:366: move_sprite(weapon->spritids[0], sword.x, sword.y);
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
;main.c:367: move_sprite(weapon->spritids[1], sword.x - spritesize, sword.y);
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
;main.c:367: move_sprite(weapon->spritids[1], sword.x - spritesize, sword.y);
	jp	00136$
00110$:
;main.c:369: else if(direction == 3) // right
	ld	a, (#_direction)
	sub	a, #0x03
	jr	NZ, 00107$
;main.c:371: sword.x = girl.x + 21;
	ld	a, (#(_girl + 4) + 0)
	add	a, #0x15
	ld	hl, #(_sword + 2)
;main.c:372: sword.y = girl.y + 8;
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
;main.c:375: sword.spritids[1] = 4;
	ld	hl, #_sword + 1
	ld	(hl), #0x04
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x13
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:378: sword.spritids[0] = 5;
	ld	hl, #_sword
	ld	(hl), #0x05
;main.c:379: move_sprite(weapon->spritids[0], sword.x, sword.y);
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
;main.c:380: move_sprite(weapon->spritids[1], sword.x - spritesize, sword.y);
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
;main.c:380: move_sprite(weapon->spritids[1], sword.x - spritesize, sword.y);
	jp	00136$
00107$:
;main.c:382: else if(direction == 1) // up
	ld	a, (#_direction)
	dec	a
	jr	NZ, 00104$
;main.c:384: sword.x = girl.x + 9;
	ld	a, (#(_girl + 4) + 0)
	add	a, #0x09
	ld	hl, #(_sword + 2)
;main.c:385: sword.y = girl.y;
	ld	(hl+), a
	ld	a, (#(_girl + 5) + 0)
	ld	(hl), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x14
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:388: sword.spritids[0] = 4;
	ld	hl, #_sword
	ld	(hl), #0x04
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x15
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:391: sword.spritids[1] = 5;
	ld	hl, #_sword + 1
	ld	(hl), #0x05
;main.c:392: move_sprite(weapon->spritids[0], sword.x, sword.y);
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
;main.c:393: move_sprite(weapon->spritids[1], sword.x, sword.y - spritesize);
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
;main.c:393: move_sprite(weapon->spritids[1], sword.x, sword.y - spritesize);
	jr	00136$
00104$:
;main.c:395: else if(direction == 0) // down
	ld	a, (#_direction)
	or	a, a
	jr	NZ, 00136$
;main.c:397: sword.x = girl.x - 2;
	ld	a, (#(_girl + 4) + 0)
	dec	a
	dec	a
	ld	hl, #(_sword + 2)
;main.c:398: sword.y = girl.y + 20;
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
;main.c:401: sword.spritids[1] = 4;
	ld	hl, #_sword + 1
	ld	(hl), #0x04
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x15
	ld	(hl+), a
	ld	(hl), #0x40
;main.c:404: sword.spritids[0] = 5;
	ld	hl, #_sword
	ld	(hl), #0x05
;main.c:405: move_sprite(weapon->spritids[0], sword.x, sword.y);
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
;main.c:406: move_sprite(weapon->spritids[1], sword.x, sword.y - spritesize);
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
;main.c:406: move_sprite(weapon->spritids[1], sword.x, sword.y - spritesize);
00136$:
;main.c:408: }
	add	sp, #3
	ret
;main.c:409: void attack(void)
;	---------------------------------
; Function attack
; ---------------------------------
_attack::
;main.c:412: for(UINT8 i = 0; i < MAX_ENEMIES; i++)
	ld	c, #0x00
00116$:
	ld	a, c
	sub	a, #0x08
	jr	NC, 00101$
;main.c:414: hit_this_attack[i] = 0;
	ld	hl, #_hit_this_attack
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x00
;main.c:412: for(UINT8 i = 0; i < MAX_ENEMIES; i++)
	inc	c
	jr	00116$
00101$:
;main.c:417: move_weapon(&sword);
	ld	bc, #_sword+0
	ld	e, c
	ld	d, b
	push	bc
	call	_move_weapon
	pop	bc
;main.c:420: sword.y = sword.y + 6;
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
;main.c:418: if(direction == 0)
	ld	a, (#_direction)
	or	a, a
	jr	NZ, 00111$
;main.c:420: sword.y = sword.y + 6;
	ld	a, (de)
	add	a, #0x06
	ld	(de), a
	jr	00112$
00111$:
;main.c:422: else if(direction == 1)
	ld	a, (#_direction)
	dec	a
	jr	NZ, 00108$
;main.c:424: sword.y = sword.y - 6;
	ld	a, (de)
	add	a, #0xfa
	ld	(de), a
	jr	00112$
00108$:
;main.c:428: sword.x = sword.x - 6;
	inc	bc
	inc	bc
;main.c:426: else if(direction == 2)
	ld	a, (#_direction)
	sub	a, #0x02
	jr	NZ, 00105$
;main.c:428: sword.x = sword.x - 6;
	ld	a, (bc)
	add	a, #0xfa
	ld	(bc), a
	jr	00112$
00105$:
;main.c:430: else if(direction == 3)
	ld	a, (#_direction)
	sub	a, #0x03
	jr	NZ, 00112$
;main.c:432: sword.x = sword.x + 6;
	ld	a, (bc)
	add	a, #0x06
	ld	(bc), a
00112$:
;main.c:434: if (locktimer == 0)
	ld	hl, #_locktimer
	ld	a, (hl)
	or	a, a
	ret	NZ
;main.c:436: locktimer ++;
	inc	(hl)
;main.c:438: }
	ret
;main.c:439: void swordreset(void)
;	---------------------------------
; Function swordreset
; ---------------------------------
_swordreset::
;main.c:442: for(UINT8 i = 0; i < MAX_ENEMIES; i++)
	ld	c, #0x00
00114$:
	ld	a, c
	sub	a, #0x08
	jr	NC, 00101$
;main.c:444: hit_this_attack[i] = 0;
	ld	hl, #_hit_this_attack
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x00
;main.c:442: for(UINT8 i = 0; i < MAX_ENEMIES; i++)
	inc	c
	jr	00114$
00101$:
;main.c:447: if(direction == 0)
	ld	a, (#_direction)
	or	a, a
	jr	NZ, 00111$
;main.c:449: sword.y = sword.y - 8;
	ld	bc, #_sword+3
	ld	a, (bc)
	add	a, #0xf8
	ld	(bc), a
	jr	00112$
00111$:
;main.c:451: else if(direction == 1)
	ld	a, (#_direction)
	dec	a
	jr	NZ, 00108$
;main.c:453: sword.y = sword.y + 8;
	ld	bc, #_sword+3
	ld	a, (bc)
	add	a, #0x08
	ld	(bc), a
	jr	00112$
00108$:
;main.c:455: else if(direction == 2)
	ld	a, (#_direction)
	sub	a, #0x02
	jr	NZ, 00105$
;main.c:457: sword.x = sword.x + 8;
	ld	bc, #_sword+2
	ld	a, (bc)
	add	a, #0x08
	ld	(bc), a
	jr	00112$
00105$:
;main.c:459: else if(direction == 3)
	ld	a, (#_direction)
	sub	a, #0x03
	jr	NZ, 00112$
;main.c:461: sword.x = sword.x - 8;
	ld	bc, #_sword+2
	ld	a, (bc)
	add	a, #0xf8
	ld	(bc), a
00112$:
;main.c:463: move_weapon(&sword);
	ld	de, #_sword
;main.c:464: }
	jp	_move_weapon
;main.c:465: void move_enemy_small(struct Enemy* character, UINT8 x, UINT8 y)
;	---------------------------------
; Function move_enemy_small
; ---------------------------------
_move_enemy_small::
	ld	c, a
;main.c:467: move_sprite(character->spritids[0], x, y);
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
;main.c:467: move_sprite(character->spritids[0], x, y);
;main.c:468: }
	pop	hl
	inc	sp
	jp	(hl)
;main.c:469: void animate_enemy(struct Enemy* enemy, UINT8 tile0, UINT8 tile1)
;	---------------------------------
; Function animate_enemy
; ---------------------------------
_animate_enemy::
	dec	sp
	dec	sp
	ld	c, a
;main.c:472: if(enemy->anim == 0)
	ld	hl, #0x0008
	add	hl, de
	ld	b, (hl)
;main.c:474: set_sprite_tile(enemy->spritids[0], tile0);
	inc	sp
	inc	sp
	push	de
;main.c:472: if(enemy->anim == 0)
	ld	a, b
	or	a, a
	jr	NZ, 00104$
;main.c:474: set_sprite_tile(enemy->spritids[0], tile0);
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
;main.c:474: set_sprite_tile(enemy->spritids[0], tile0);
	jr	00108$
00104$:
;main.c:476: else if(enemy->anim == 1)
	dec	b
	jr	NZ, 00108$
;main.c:478: set_sprite_tile(enemy->spritids[0], tile1);
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
;main.c:478: set_sprite_tile(enemy->spritids[0], tile1);
00108$:
;main.c:480: }
	inc	sp
	inc	sp
	pop	hl
	inc	sp
	jp	(hl)
;main.c:481: void enemy_check_borders(struct Enemy* enemy)
;	---------------------------------
; Function enemy_check_borders
; ---------------------------------
_enemy_check_borders::
;main.c:483: if (enemy->x < MIN_ENEMY_X)
	ld	hl, #0x0004
	add	hl, de
	ld	a, (hl)
	sub	a, #0x10
	jr	NC, 00102$
;main.c:485: enemy->x = MIN_ENEMY_X;
	ld	(hl), #0x10
00102$:
;main.c:487: if (enemy->x > MAX_ENEMY_X)
	ld	a, (hl)
	cp	a, #0x99
	jr	C, 00104$
;main.c:489: enemy->x = MAX_ENEMY_X;
	ld	(hl), #0x98
00104$:
;main.c:491: if (enemy->y < MIN_ENEMY_Y)
	ld	hl, #0x0005
	add	hl, de
	ld	a, (hl)
	sub	a, #0x14
	jr	NC, 00106$
;main.c:493: enemy->y = MIN_ENEMY_Y;
	ld	(hl), #0x14
00106$:
;main.c:495: if (enemy->y > MAX_ENEMY_Y)
	ld	a, (hl)
	cp	a, #0x81
	ret	C
;main.c:497: enemy->y = MAX_ENEMY_Y;
	ld	(hl), #0x80
;main.c:499: }
	ret
;main.c:502: void character_set_sprite(struct GameCharacter* character, UINT8 anim_state)
;	---------------------------------
; Function character_set_sprite
; ---------------------------------
_character_set_sprite::
	ld	c, e
	ld	b, d
	ld	e, a
;main.c:507: character->anim = anim_state;  // Set animation state in struct
	ld	hl, #0x0008
	add	hl, bc
	ld	(hl), e
;main.c:509: if(anim_state == 0) // down walking
	ld	a, e
	or	a, a
	jr	NZ, 00122$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;main.c:513: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:516: character->spritids[1] = 1;
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
;main.c:519: character->spritids[3] = 2;
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
;main.c:522: character->spritids[2] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jp	00123$
00122$:
;main.c:524: else if(anim_state == 1) // down standing
	ld	a, e
	dec	a
	jr	NZ, 00119$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;main.c:528: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:531: character->spritids[1] = 1;
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
;main.c:534: character->spritids[2] = 2;
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
;main.c:537: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jp	00123$
00119$:
;main.c:539: else if(anim_state == 2) // left walking
	ld	a, e
	sub	a, #0x02
	jr	NZ, 00116$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x04
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:543: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x05
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:546: character->spritids[1] = 1;
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
;main.c:549: character->spritids[2] = 2;
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
;main.c:552: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jp	00123$
00116$:
;main.c:554: else if(anim_state == 3) // left standing
	ld	a, e
	sub	a, #0x03
	jr	NZ, 00113$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x08
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:558: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x09
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:561: character->spritids[1] = 1;
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
;main.c:564: character->spritids[2] = 2;
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
;main.c:567: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jp	00123$
00113$:
;main.c:569: else if(anim_state == 4) // right walking
	ld	a, e
	sub	a, #0x04
	jr	NZ, 00110$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x05
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:573: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x04
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:576: character->spritids[1] = 1;
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
;main.c:579: character->spritids[2] = 2;
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
;main.c:582: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jp	00123$
00110$:
;main.c:584: else if(anim_state == 5) // right standing
	ld	a, e
	sub	a, #0x05
	jr	NZ, 00107$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x09
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:588: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x08
	ld	(hl+), a
	ld	(hl), #0x20
;main.c:591: character->spritids[1] = 1;
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
;main.c:594: character->spritids[2] = 2;
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
;main.c:597: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jr	00123$
00107$:
;main.c:599: else if(anim_state == 6) // up walking
	ld	a, e
	sub	a, #0x06
	jr	NZ, 00104$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0c
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:603: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0d
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:606: character->spritids[1] = 1;
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
;main.c:609: character->spritids[2] = 2;
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
;main.c:612: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
	jr	00123$
00104$:
;main.c:614: else if(anim_state == 7) // up standing
	ld	a, e
	sub	a, #0x07
	jr	NZ, 00123$
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0c
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:618: character->spritids[0] = 0;
	xor	a, a
	ld	(bc), a
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x0d
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:621: character->spritids[1] = 1;
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
;main.c:624: character->spritids[2] = 2;
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
;main.c:627: character->spritids[3] = 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x03
00123$:
;main.c:630: move_player(character, character->x, character->y);
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
;main.c:631: }
	ret
;main.c:633: void setup_player(void)
;	---------------------------------
; Function setup_player
; ---------------------------------
_setup_player::
;main.c:635: girl.x = PLAYER_SPAWN_X;
	ld	bc, #_girl + 4
	ld	a, #0x50
	ld	(bc), a
;main.c:636: girl.y = PLAYER_SPAWN_Y;
	ld	hl, #(_girl + 5)
;main.c:637: girl.width = 16;
	ld	a, #0x24
	ld	(hl+), a
	ld	(hl), #0x10
;main.c:638: girl.height = 16;
	ld	hl, #_girl + 7
	ld	(hl), #0x10
;main.c:639: girl.anim = 0;
	ld	hl, #_girl + 8
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;main.c:643: girl.spritids[0] = 0;
	ld	hl, #_girl
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:646: girl.spritids[1] = 1;
	ld	hl, #_girl + 1
	ld	(hl), #0x01
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x02
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:649: girl.spritids[2] = 2;
	ld	hl, #_girl + 2
	ld	(hl), #0x02
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x03
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:652: girl.spritids[3] = 3;
	ld	hl, #_girl + 3
	ld	(hl), #0x03
;main.c:654: move_player(&girl, girl.x, girl.y);
	ld	hl, #(_girl + 5)
	ld	h, (hl)
	ld	a, (bc)
	push	hl
	inc	sp
	ld	de, #_girl
	call	_move_player
;main.c:655: }
	ret
;main.c:657: void setupslime(void)
;	---------------------------------
; Function setupslime
; ---------------------------------
_setupslime::
;main.c:659: slime.x = rand() % 128 + 16;
	call	_rand
	ld	a, e
	res	7, a
	add	a, #0x10
	ld	(#(_slime + 4)),a
;main.c:660: slime.y = rand() % 96 + 24;
	call	_rand
	ld	a, e
	ld	e, #0x60
	call	__moduchar
	ld	a, c
	add	a, #0x18
	ld	hl, #(_slime + 5)
;main.c:661: slime.width = 8;
	ld	(hl+), a
	ld	(hl), #0x08
;main.c:662: slime.height = 8;
	ld	hl, #_slime + 7
	ld	(hl), #0x08
;main.c:663: slime.anim = 0;
	ld	hl, #_slime + 8
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 90)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x10
	ld	(hl+), a
	ld	(hl), #0x10
;main.c:667: slime.spritids[0] = 22;
	ld	hl, #_slime
	ld	(hl), #0x16
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 94)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x11
	ld	(hl+), a
	ld	(hl), #0x10
;main.c:670: slime.spritids[1] = 23;
	ld	hl, #_slime + 1
	ld	(hl), #0x17
;main.c:672: move_enemy_small(&slime, slime.x, slime.y);
	ld	hl, #(_slime + 5)
	ld	b, (hl)
	ld	a, (#(_slime + 4) + 0)
	push	bc
	inc	sp
	ld	de, #_slime
	call	_move_enemy_small
;main.c:673: }
	ret
;main.c:675: void setupsword(void)
;	---------------------------------
; Function setupsword
; ---------------------------------
_setupsword::
;main.c:677: sword.x = 100;
	ld	hl, #_sword + 2
	ld	(hl), #0x64
;main.c:678: sword.y = 100;
	ld	hl, #_sword + 3
	ld	(hl), #0x64
;main.c:679: sword.width = 8;
	ld	hl, #_sword + 4
	ld	(hl), #0x08
;main.c:680: sword.height = 8;
	ld	hl, #_sword + 5
	ld	(hl), #0x08
;main.c:681: sword.anim = 0;
	ld	hl, #_sword + 6
	ld	(hl), #0x00
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x12
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:686: sword.spritids[0] = 4;
	ld	hl, #_sword
	ld	(hl), #0x04
;c:\gbdk\include\gb\gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
;c:\gbdk\include\gb\gb.h:1946: shadow_OAM[nb].prop=prop;
	ld	a, #0x13
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:689: sword.spritids[1] = 5;
	ld	hl, #_sword + 1
	ld	(hl), #0x05
;main.c:692: }
	ret
;main.c:695: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
	add	sp, #-8
;main.c:697: while(1)
00178$:
;main.c:699: UINT8 current_pad = joypad();
	call	_joypad
	ldhl	sp,	#0
	ld	(hl), a
;main.c:701: if((current_pad & J_START) && !(prev_pad & J_START))
	push	hl
	ldhl	sp,	#2
	bit	7, (hl)
	pop	hl
	jp	Z, 00110$
	ld	a, (_prev_pad)
	rlca
	jp	C, 00110$
;main.c:703: if(gamestate == 0)
	ld	hl, #_gamestate
	ld	a, (hl)
	or	a, a
	jp	NZ, 00107$
;main.c:705: gamestate = 1;
	ld	(hl), #0x01
;main.c:706: initrand(DIV_REG);
	ldh	a, (_DIV_REG + 0)
	ld	b, #0x00
	ld	c, a
	push	bc
	call	_initrand
	pop	hl
;main.c:709: font_init();
	call	_font_init
;main.c:710: min_font = font_load(font_min);
	ld	de, #_font_min
	push	de
	call	_font_load
	pop	hl
;main.c:711: font_set(min_font);
	push	de
	call	_font_set
	pop	hl
;main.c:713: set_bkg_data(37, 8, backgroundtiles);
	ld	de, #_backgroundtiles
	push	de
	ld	hl, #0x825
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:714: set_bkg_tiles(0, 0, 20, 16, backgroundmap);
	ld	de, #_backgroundmap
	push	de
	ld	hl, #0x1014
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:716: set_win_tiles(0, 0, 20, 2, windowmap);
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
;main.c:721: set_sprite_data(0, 22, Girl);
	ld	de, #_Girl
	push	de
	ld	hl, #0x1600
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:722: setup_player();
	call	_setup_player
;main.c:723: init_player_stats();
	call	_init_player_stats
;main.c:724: setupsword();
	call	_setupsword
;main.c:725: room_0();  // Initialize room after sprite data is loaded
	call	_room_0
;main.c:733: BGP_REG  = 0xE4; // Background palette (light fill uses C1)
	ld	a, #0xe4
	ldh	(_BGP_REG + 0), a
;main.c:734: OBP0_REG = 0xE0; // Sprite palette 0: Girl/Sword (old colors)
	ld	a, #0xe0
	ldh	(_OBP0_REG + 0), a
;main.c:735: OBP1_REG = 0xE4; // Sprite palette 1: Slimes (clear, light, dark, black)
	ld	a, #0xe4
	ldh	(_OBP1_REG + 0), a
;main.c:736: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:737: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:738: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;main.c:739: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
	jr	00110$
00107$:
;main.c:741: else if(gamestate == 1)
	ld	a, (#_gamestate)
	dec	a
	jr	NZ, 00104$
;main.c:743: gamestate = 2;
	ld	hl, #_gamestate
	ld	(hl), #0x02
;main.c:744: HIDE_BKG;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfe
	ldh	(_LCDC_REG + 0), a
;main.c:745: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
	jr	00110$
00104$:
;main.c:747: else if(gamestate == 2)
	ld	a, (#_gamestate)
	sub	a, #0x02
	jr	NZ, 00110$
;main.c:749: gamestate = 1;
	ld	hl, #_gamestate
	ld	(hl), #0x01
;main.c:750: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:751: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
00110$:
;main.c:755: if(gamestate == 1)
	ld	a, (#_gamestate)
	dec	a
	jp	NZ, 00176$
;main.c:757: if(player_stats.is_dead == 0 && locktimer == 0)
	ld	a, (#(_player_stats + 6) + 0)
	or	a, a
	jp	NZ, 00159$
	ld	a, (#_locktimer)
	or	a, a
	jp	NZ, 00159$
;main.c:759: if(joypad() & J_LEFT)
	call	_joypad
	bit	1, a
	jr	Z, 00124$
;main.c:761: direction = 2;
	ld	hl, #_direction
	ld	(hl), #0x02
;main.c:762: move_weapon(&sword);
	ld	de, #_sword
	call	_move_weapon
;main.c:763: if(girl.x > MIN_GIRL_X)
	ld	hl, #_girl + 4
	ld	a, (hl)
	cp	a, #0x18
	jr	C, 00113$
;main.c:765: girl.x -= 2;
	dec	a
	dec	a
	ld	(hl), a
00113$:
;main.c:768: if(girl.anim != 2 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	ld	hl, #_girl + 8
	ld	a, (hl)
;main.c:770: character_set_sprite(&girl, 2);
;main.c:768: if(girl.anim != 2 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	sub	a, #0x02
	jr	Z, 00119$
	call	_joypad
	bit	2, a
	jr	NZ, 00119$
	call	_joypad
	bit	3, a
	jr	NZ, 00119$
;main.c:770: character_set_sprite(&girl, 2);
	ld	a, #0x02
	ld	de, #_girl
	call	_character_set_sprite
	jr	00124$
00119$:
;main.c:772: else if(girl.anim != 3 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	ld	a, (hl)
	sub	a, #0x03
	jr	Z, 00124$
	call	_joypad
	bit	2, a
	jr	NZ, 00124$
	call	_joypad
	bit	3, a
	jr	NZ, 00124$
;main.c:774: character_set_sprite(&girl, 3);
	ld	a, #0x03
	ld	de, #_girl
	call	_character_set_sprite
00124$:
;main.c:777: if(joypad() & J_RIGHT)
	call	_joypad
	rrca
	jr	NC, 00137$
;main.c:779: direction = 3;
	ld	hl, #_direction
	ld	(hl), #0x03
;main.c:780: move_weapon(&sword);
	ld	de, #_sword
	call	_move_weapon
;main.c:781: if(girl.x < MAX_GIRL_X)
	ld	bc, #_girl + 4
	ld	a, (bc)
	cp	a, #0x8a
	jr	NC, 00126$
;main.c:783: girl.x += 2;
	add	a, #0x02
	ld	(bc), a
00126$:
;main.c:787: if(girl.anim != 4 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	ld	hl, #_girl + 8
	ld	a, (hl)
;main.c:789: character_set_sprite(&girl, 4);
;main.c:787: if(girl.anim != 4 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	sub	a, #0x04
	jr	Z, 00132$
	call	_joypad
	bit	2, a
	jr	NZ, 00132$
	call	_joypad
	bit	3, a
	jr	NZ, 00132$
;main.c:789: character_set_sprite(&girl, 4);
	ld	a, #0x04
	ld	de, #_girl
	call	_character_set_sprite
	jr	00137$
00132$:
;main.c:791: else if(girl.anim != 5 && !(joypad() & J_UP) && !(joypad() & J_DOWN))
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00137$
	call	_joypad
	bit	2, a
	jr	NZ, 00137$
	call	_joypad
	bit	3, a
	jr	NZ, 00137$
;main.c:793: character_set_sprite(&girl, 5);
	ld	a, #0x05
	ld	de, #_girl
	call	_character_set_sprite
00137$:
;main.c:796: if(joypad() & J_UP)
	call	_joypad
	bit	2, a
	jr	Z, 00146$
;main.c:798: direction = 1;
	ld	hl, #_direction
	ld	(hl), #0x01
;main.c:799: move_weapon(&sword);
	ld	de, #_sword
	call	_move_weapon
;main.c:800: if(girl.y > MIN_GIRL_Y)
	ld	hl, #_girl + 5
	ld	a, (hl)
	cp	a, #0x15
	jr	C, 00139$
;main.c:803: girl.y -= 2;
	dec	a
	dec	a
	ld	(hl), a
00139$:
;main.c:805: if(girl.anim != 6)
	ld	a, (#(_girl + 8) + 0)
;main.c:807: character_set_sprite(&girl, 6);
	ld	de, #_girl
;main.c:805: if(girl.anim != 6)
	cp	a, #0x06
	jr	Z, 00143$
;main.c:807: character_set_sprite(&girl, 6);
	ld	a, #0x06
	call	_character_set_sprite
	jr	00146$
00143$:
;main.c:809: else if(girl.anim != 7)
	sub	a, #0x07
	jr	Z, 00146$
;main.c:811: character_set_sprite(&girl, 7);
	ld	a, #0x07
	call	_character_set_sprite
00146$:
;main.c:814: if(joypad() & J_DOWN)
	call	_joypad
	bit	3, a
	jr	Z, 00155$
;main.c:816: direction = 0;
	xor	a, a
	ld	(#_direction),a
;main.c:817: move_weapon(&sword);
	ld	de, #_sword
	call	_move_weapon
;main.c:818: if(girl.y < MAX_GIRL_Y)
	ld	hl, #_girl + 5
	ld	a, (hl)
	cp	a, #0x71
	jr	NC, 00148$
;main.c:821: girl.y += 2;
	add	a, #0x02
	ld	(hl), a
00148$:
;main.c:824: if(girl.anim != 0)
	ld	a, (#(_girl + 8) + 0)
;main.c:826: character_set_sprite(&girl, 0);
	ld	de, #_girl
;main.c:824: if(girl.anim != 0)
	or	a, a
	jr	Z, 00152$
;main.c:826: character_set_sprite(&girl, 0);
	xor	a, a
	call	_character_set_sprite
	jr	00155$
00152$:
;main.c:828: else if(girl.anim != 1)
	dec	a
	jr	Z, 00155$
;main.c:830: character_set_sprite(&girl, 1);
	ld	a, #0x01
	call	_character_set_sprite
00155$:
;main.c:834: if(joypad() & J_A)
	call	_joypad
	bit	4, a
	jr	Z, 00159$
;main.c:836: attack();
	call	_attack
00159$:
;main.c:840: if(player_stats.is_dead == 1)
	ld	a, (#(_player_stats + 6) + 0)
	dec	a
	jr	NZ, 00162$
;main.c:842: hide_character_sprites(&girl);
	ld	de, #_girl
	call	_hide_character_sprites
00162$:
;main.c:845: update_timers();
	call	_update_timers
;main.c:849: for(UINT8 i = 0; i < 4; i++)
	ldhl	sp,	#7
	ld	(hl), #0x00
00182$:
	ldhl	sp,	#7
	ld	a, (hl)
	sub	a, #0x04
	jp	NC, 00168$
;main.c:851: if(enemies[i].death == 0)
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
;main.c:853: animate_enemy(&enemies[i], 16, 17);
	ldhl	sp,	#1
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
;main.c:851: if(enemies[i].death == 0)
	ld	(hl+), a
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00166$
;main.c:853: animate_enemy(&enemies[i], 16, 17);
	ld	a, #0x11
	push	af
	inc	sp
	ld	a, #0x10
	ldhl	sp,	#4
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_animate_enemy
	jr	00183$
00166$:
;main.c:855: else if(enemies[i].death == 1)
	ldhl	sp,	#6
	ld	a, (hl)
	dec	a
	jr	NZ, 00183$
;main.c:857: enemies[i].x = 0;
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
;main.c:858: enemies[i].y = 0;
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
;main.c:859: move_enemy_small(&enemies[i], 0, 0);
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
00183$:
;main.c:849: for(UINT8 i = 0; i < 4; i++)
	ldhl	sp,	#7
	inc	(hl)
	jp	00182$
00168$:
;main.c:864: animtimer++;
	ld	hl, #_animtimer
	inc	(hl)
;main.c:865: if(animtimer == ANIM_TIMER_MAX)
	ld	a, (hl)
	sub	a, #0x14
	jr	NZ, 00171$
;main.c:867: animtimer = 0;
	xor	a, a
	ld	(#_animtimer),a
;main.c:868: for(UINT8 i = 0; i < 4; i++)
	ld	c, #0x00
00185$:
	ld	a, c
	sub	a, #0x04
	jr	NC, 00171$
;main.c:870: enemies[i].anim = (enemies[i].anim == 0) ? 1 : 0;
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
	jr	NZ, 00192$
	ld	b, #0x01
	jr	00193$
00192$:
	ld	b, #0x00
00193$:
	ld	(hl), b
;main.c:868: for(UINT8 i = 0; i < 4; i++)
	inc	c
	jr	00185$
00171$:
;main.c:875: if(player_stats.is_dead == 0)
	ld	a, (#(_player_stats + 6) + 0)
	or	a, a
	jr	NZ, 00176$
;main.c:877: for(UINT8 i = 0; i < 4; i++)
	ldhl	sp,	#7
	ld	(hl), #0x00
00188$:
	ldhl	sp,	#7
	ld	a, (hl)
	sub	a, #0x04
	jr	NC, 00176$
;main.c:879: character_enemy_collision(&girl, &enemies[i]);
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
;main.c:877: for(UINT8 i = 0; i < 4; i++)
	ldhl	sp,	#7
	inc	(hl)
	jr	00188$
00176$:
;main.c:922: prev_pad = current_pad;
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(#_prev_pad),a
;main.c:923: performantdelay(5);
	ld	a, #0x05
	call	_performantdelay
	jp	00178$
;main.c:926: }
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
	.area _CABS (ABS)
