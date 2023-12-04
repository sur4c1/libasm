; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_atoi_base.s                                     :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: bguyot <bguyot@student.42mulhouse.fr>      +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2023/12/04 09:39:35 by bguyot            #+#    #+#              ;
;    Updated: 2023/12/04 09:40:02 by bguyot           ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

SECTION .text

extern ft_strlen
global ft_atoi_base

;int	ft_atoi_base(char *str, char *base);
;                          %rdi       %rsi
ft_atoi_base:
	push	0
	push	1
	push	rdi			; Save RDI (str)
	push	rsi			; Save RSI (base)

	mov		rdi, rsi	; Set arguments to call strlen on base
	call	ft_strlen
	cmp		rax, 0x2	; if strlen(base) < 2
	jc		err
	mov		rbx, rax	; save the strlen (base size)

	call	check_base
	cmp		rax, 0x0	; if(check_base)
	jnz		err

	; reset the RSI and RDI to original values
	pop		rsi
	pop		rdi
	push	rdi
	push	rsi

	call	ft_strlen
	mov		rcx, rax	; Save strlen(str) inside counter

	dec		rdi
	loop_skip_wp:
	inc		rdi
	cmp		BYTE [rdi], 0x0
	jz		err

	cmp		BYTE [rdi], ' '
	jz		loop_skip_wp

	cmp		BYTE [rdi], 0x09 ; if *rdi < 0x09 (\t)
	jc		end_loop_skip_wp
	cmp		BYTE [rdi], 0x0E ; if *rdi >= 0x0E (\r + 1)
	jnc		end_loop_skip_wp
	jmp		loop_skip_wp
	end_loop_skip_wp:

	dec		rdi
	loop_go_over_signs:
	inc		rdi
	cmp		BYTE [rdi], 0x0
	jz		err

	cmp		BYTE [rdi], '+'
	jz		loop_go_over_signs			; is a +

	cmp		BYTE [rdi], '-'
	jnz		end_loop_get_over_signs		; not a + AND not a -
	mov		r8, sign
	mul		r8, 0xFFFFFFFFFFFFFFFF	; sign *= -1
	mov		sign, r8
	jmp		loop_go_over_signs
	end_loop_get_over_signs

	loop:
		; while (index--)
		jrcxz	end_loop
		dec		rcx

		; rdx = rdi + index
		mov		rdx, rdi
		add		rdx, rcx

		push	rdi
		push	rsi
		push	rcx

			mov		rdi, rsi
			mov		sil, BYTE [rdx]
			call	get_index

			cmp		rax, 0xFFFFFFFFFFFFFFFF
			jz		err

			mov		r8, value
			add		r8, rax	; value += base equivalent
			mul		r8, rbx	; value *= base size
			mov		value, r8

		pop		rcx
		pop		rsi
		pop		rdi
	end_loop:

	mov	rax, value
	mul	rax, sign
	jmp	return

	err:
	mov		rax, 0

	return:
	pop		rsi
	pop		rdi
	ret

check_base:
	push	rdi

	loop_char_check:
		cmp		BYTE [rdi], 0x0
		jz		end_loop_char_check

		cmp		BYTE [rdi], '+' ; if *rdi != '+'
		jnz		end_plus_if		; skip error
		jmp		err_check
		end_plus_if:

		cmp		BYTE [rdi], '-'
		jnz		end_minus_if
		jmp		err_check
		end_minus_if:

		cmp		BYTE [rdi], ' '
		jnz		end_space_if
		jmp		err_check
		end_space_if:

		cmp		BYTE [rdi], 0x09 ; if *rdi < 0x09 (\t)
		jc		end_if_white
		cmp		BYTE [rdi], 0x0E ; if *rdi >= 0x0E (\r + 1)
		jnc		end_if_white
		jmp		err_check
		end_if_white:

		mov	rax, rdi
		loop_double:
			cmp		BYTE [rax], 0x0
			jz		end_loop_double

			mov		bh, BYTE [rax]
			cmp		BYTE [rdi], bh	; if *rax == *rdi
			jz		err_check				; error

			inc		rax
		end_loop_double:

		inc		rdi
	end_loop_char_check:

	mov		rax, 0x0
	jmp		return_check

	err_check:
	mov	rax, 0x1

	return_check:
	pop		rdi
	ret

get_index:
	push	rdi
	push	rsi

	mov		rax, 0xFFFFFFFFFFFFFFFF
	mov		rcx, 0

	loop_get_index:
	cmp		BYTE [rdi], 0x0
	jz		end_loop_get_index

	cmp		BYTE [rdi], sil
	jz		end_loop_get_index

	inc		rcx
	inc		rdi
	end_loop_get_index:

	cmp		BYTE [rdi], sil
	jnz		err_index
	mov		rax, rcx
	err_index:
	pop		rsi
	pop		rdi
	ret
