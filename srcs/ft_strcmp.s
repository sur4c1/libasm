; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcmp.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: bguyot <bguyot@student.42mulhouse.fr>      +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2023/11/18 16:01:44 by bguyot            #+#    #+#              ;
;    Updated: 2023/11/18 16:01:44 by bguyot           ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global ft_strcmp

SECTION .text

; int ft_strcmp(char *s1, const char *s2)
ft_strcmp:
	push	rdi								;	Save RDI (s1)
	push	rsi								;	Save RSI (s2)

	cmp			rdi, 0x0;
	jz			_ret;
	cmp			rsi, 0x0;
	jz			_ret;
	_increment_loop:
		mov		ah, [rdi]					;	tmp = [RDI]
		cmp		BYTE [rsi],	ah				;	if [RSI] != tmp
		jnz		_end_of_loop				;	jump tp end of loop
		cmp		BYTE [rsi],	0x0				;	if [RSI] == 0
		jz		_end_of_loop				;	jump tp end of loop
		cmp		BYTE [rdi], 0x0				;	if [RDI] == 0
		jz		_end_of_loop				;	jump tp end of loop
		inc		rsi							;	RSI++
		inc		rdi							;	RDI++
	jmp		_increment_loop					;	jump back to begining of the loop

	_end_of_loop:
	mov		rax, 0x0						;	ret = 0
	mov		al, BYTE [rdi]					;	ret = *rdi
	mov		bl, BYTE [rsi]					;	tmp = *rsi
	sub		rax, rbx						;	ret -= tmp

	_ret:
	pop		rsi								;	Retrieve RSI (non-volatite)
	pop		rdi								;	Retrieve RDI (non-volatite)
	ret
