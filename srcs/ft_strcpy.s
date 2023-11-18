; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcpy.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: bguyot <bguyot@student.42mulhouse.fr>      +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2023/11/18 16:01:44 by bguyot            #+#    #+#              ;
;    Updated: 2023/11/18 16:01:44 by bguyot           ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global ft_strcpy

SECTION .text

; char *ft_strcpy(char *dest, const char *src)
ft_strcpy:
	push	rdi		;	Save RDI (dest)
	push	rsi		;	Save RSI (src)

	_increment_loop:
		cmp		BYTE [rsi],	0x0		;	if [RSI] == 0
		jz		_end_of_loop		;	jump tp end of loop
		mov		ah, BYTE [rsi]		;	tmp = *rsi
		mov		BYTE [rdi], ah		;	*rdi = rax
		inc		rsi					;	RSI++
		inc		rdi					;	RDI++

	jmp		_increment_loop			;	jump back to begining of the loop

	_end_of_loop:
	pop		rsi		;	Retrieve RSI (non-volatite)
	pop		rdi		;	Retrieve RDI (non-volatite)
	mov		rax, rdi;	Return dest
	ret
