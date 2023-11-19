; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_read.s                                          :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: bguyot <bguyot@student.42mulhouse.fr>      +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2023/11/18 16:01:44 by bguyot            #+#    #+#              ;
;    Updated: 2023/11/19 16:45:47 by bguyot           ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

SECTION .text

extern	__errno_location

global ft_read

;ssize_t read(int fd, void *buf, size_t count);
ft_read:
	mov		rax, 0x0				;	Setup for syscall 0 (read)
	syscall							;	Call the syscall

	cmp		rax, 0x0				;	if ret >= 0
	jns		no_errors				;	jump to no error
	xor		rbx, rbx				;	rbx = 0
	sub		rbx, rax				;	rbx -= ret (rbx = -ret)
	call	__errno_location				;
	mov		[rax], rbx				;	errno = -ret (i think)
	mov		rax, 0xFFFFFFFFFFFFFFFF	;	set ret to -1

	no_errors:
	ret								;
