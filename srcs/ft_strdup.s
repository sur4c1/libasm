; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strdup.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: bguyot <bguyot@student.42mulhouse.fr>      +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2023/11/18 16:01:44 by bguyot            #+#    #+#              ;
;    Updated: 2023/11/19 16:45:47 by bguyot           ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

SECTION	.text

extern	malloc
extern	ft_strlen

global	ft_strdup

;char *ft_strdup(const char *s);
ft_strdup:
	push	rdi						;	save s for later

	call	ft_strlen				;	rax = ft_strlen(s)
	mov		rdi, rax				;	rdi = rax
	inc		rdi
	call	malloc					;	rax = malloc(rdi)

	pop		rdi						;	retrieve s
	push	rdi						;	save it again
	push	rax						;	save beggining of allocated zone

	_increment_loop:
	cmp		BYTE [rdi], 0x0				;	if rcx == 0
	jz		_end_loop				;	jump end loop
	mov		cl, BYTE [rdi]	;	*rax = *rdi
	mov		BYTE [rax], cl	;	*rax = *rdi
	inc		rax						;	rax++
	inc		rdi						;	rdi++
	jmp		_increment_loop			;	jump decrement loop

	_end_loop:
	mov	BYTE [rax], 0x0
	pop rax
	pop	rdi							;	retrieve rdi to give it back to caller
	ret
