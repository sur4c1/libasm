; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strlen.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: bguyot <bguyot@student.42mulhouse.fr>      +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2023/11/18 16:01:44 by bguyot            #+#    #+#              ;
;    Updated: 2023/11/18 16:01:44 by bguyot           ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global ft_strlen

SECTION .text
; size_t ft_strlen(const char *str)
ft_strlen:
	xor		rax,	rax				;	Set the counter register to 0
	mov		rdx,	rdi				;	Copy rdi into RDX

	_increment_loop:
		cmp		BYTE [rdx],	0x0		;	if [RDX] == 0
		jz		_end_of_loop		;	jump tp end of loop
		inc		rdx					;	RDX++
		inc		rax					;	RAX++
	jmp		_increment_loop			;	jump back to begining of the loop

	_end_of_loop:
	ret								;	returns (the return value is inside RAX)
