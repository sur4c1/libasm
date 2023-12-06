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

ERR_BASE_TOO_SHORT equ 0x0
ERR_INVALID_BASE equ 0x0
ERR_NO_NUMBERS equ 0x0
ERR_FOUND_A_PLUS equ 0x0
ERR_FOUND_A_MINUS equ 0x0
ERR_FOUND_A_WP equ 0x0
ERR_FOUND_DUP equ 0x0

SECTION .text

extern ft_strlen
global ft_atoi_base

;int	ft_atoi_base(char *str, char *base);
;                          %rdi       %rsi
ft_atoi_base:
	push	rdi			; Save RDI (str)
	push	rsi			; Save RSI (base)
	mov		r10, 0x0
	mov		r11, 0x1

	cmp		rdi, 0x0
	jnz		end_null_rdi
		mov		rax, 0x0
		jmp		return
	end_null_rdi:

	cmp		rsi, 0x0
	jnz		end_null_rsi
		mov		rax, 0x0
		jmp		return
	end_null_rsi:

	mov		rdi, rsi	; Set arguments to call strlen on base
	call	ft_strlen
	cmp		rax, 0x2	; if strlen(base) < 2
	jnc		end_strlen_check
		mov		rax, ERR_BASE_TOO_SHORT
		jmp		return
	end_strlen_check:
	mov		rbx, rax	; save the strlen (base size)

	call	check_base
	cmp		rax, 0x0	; if(check_base)
	jnz		return

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
		mov		rax, ERR_NO_NUMBERS
		jz		return

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
		mov		rax, ERR_NO_NUMBERS
		jz		return

		cmp		BYTE [rdi], '+'
		jz		loop_go_over_signs			; is a +

		cmp		BYTE [rdi], '-'
		jnz		end_loop_get_over_signs		; not a + AND not a -
			; else
			mov		rax, 0xFFFFFFFFFFFFFFFF
			mul		r11 	; sign *= -1
			mov		r11, rax
		jmp		loop_go_over_signs
	end_loop_get_over_signs:

	loop:
		cmp		BYTE [rdi], 0x0
		jz		end_loop

		push	rdi
		push	rsi
			mov		cl, BYTE [rdi]
			mov		rdi, rsi
			call	get_index

			cmp		rax, 0	; if rax < 0
			jns		end_check_last
				; then
				pop		rsi
				pop		rdi
				jmp		ret_no_err
			end_check_last:



			mov	rcx, rax	;	save the new digit value
			mov	rax, r10	;	set the multiplication buffer to previous nb
			mul	rbx			;	multiply by base_size
			mov	r10, rax	;	save the result back in our value reg

			add	r10, rcx	;	add the new digit value
		pop		rsi
		pop		rdi

		inc		rdi
		jmp		loop
	end_loop:

	ret_no_err:
	mov	rax, r10	; rax = r10
	mul	r11			; rax *= r11
	return:
	pop		rsi
	pop		rdi
	ret

;; Returns 0 if the base is valid ; 1 if it is invalid
check_base:
	push	rdi

	loop_char_check:
		cmp		BYTE [rdi], 0x0
		jz		end_loop_char_check

		cmp		BYTE [rdi], '+' ; if *rdi != '+'
		jnz		end_plus_if		; skip error
		mov		rax, ERR_FOUND_A_PLUS
		jmp		return_check
		end_plus_if:

		cmp		BYTE [rdi], '-'
		jnz		end_minus_if
		mov		rax, ERR_FOUND_A_MINUS
		jmp		return_check
		end_minus_if:

		cmp		BYTE [rdi], ' '
		jnz		end_space_if
		mov		rax, ERR_FOUND_A_WP
		jmp		return_check
		end_space_if:

		cmp		BYTE [rdi], 0x09 ; if *rdi < 0x09 (\t)
		jc		end_if_white
		cmp		BYTE [rdi], 0x0E ; if *rdi >= 0x0E (\r + 1)
		jnc		end_if_white
		mov		rax, ERR_FOUND_A_WP
		jmp		return_check
		end_if_white:

		mov	rax, rdi
		inc	rax
		loop_double:
			cmp		BYTE [rax], 0x0
			jz		end_loop_double

			mov		sil, BYTE [rax]
			cmp		BYTE [rdi], sil	; if *rax == *rdi
			jnz		end_if_dup
				mov		rax, ERR_FOUND_DUP
				jmp		return_check
			end_if_dup:
			inc		rax
			jmp		loop_double
		end_loop_double:

		inc		rdi
	end_loop_char_check:

	mov		rax, 0x0
	return_check:
	pop		rdi
	ret

;	Check the position of the char stored in cl inside of the string pointed by rdi
;	return 0xFFFFFFFFFFFFFFFF (-1) if the char is not found
get_index:
	push	rdi
	push	rsi

	mov	rax, 0
	get_index_loop:
		cmp	BYTE [rdi], 0x0
		jz	end_get_index_loop

		cmp BYTE [rdi], cl
		jz	found_it

		inc rdi
		inc rax
		jmp get_index_loop
	end_get_index_loop:

	mov		rax, 0xFFFFFFFFFFFFFFFF
	found_it:
	pop		rsi
	pop		rdi
	ret
