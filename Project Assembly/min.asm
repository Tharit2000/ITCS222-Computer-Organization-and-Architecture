; Tharit Chantanalertvilai
; Sec 2
; 6188068

%include "asm_io.inc"

segment _DATA public align=4 class=DATA use32
Message1	db	"Input First Number: ", 0
Message2	db	"Input Second Number: ", 0
Message3	db	"Input Third Number: ", 0
Message4	db	"The minimum number is ", 0

segment _BSS public align=4 class=BSS use32
x		resd	1	; first number
y		resd	1	; second number
z		resd	1	; third number
min		resd	1	; minimun number

group DGROUP _BSS _DATA

segment _TEXT public align=1 class=CODE use32
        global  _asm_main
_asm_main:
        	mov	eax, Message1	; printf("Input First Number: ");
	call	print_string

	call	read_int		; scanf("%d", &x);
	mov	[x], eax

	mov	eax, Message2	; printf("Input Second Number: ");
	call	print_string

	call	read_int		; scanf("%d", &y);
	mov	[y], eax

	mov	eax, Message3	; printf("Input Third Number: ");
	call	print_string

	call	read_int		; scanf("%d", &z);
	mov	[z], eax

	mov	eax, [x]
	cmp	eax, [y]		; if(x < y)
	jl	else
	mov	eax, [x]		; min = x;
	jmp	if_z

else:
	mov	eax, [y]		; min = y;
	jmp	if_z

if_z:
	cmp	eax, [z]		; if( z < min )
	jl	end_if
	mov	eax, [z]		; min = z;
	jmp	end_if
	
end_if:
	mov	[min], eax

	mov	eax, Message4	; printf("The minimum number is ");
	call	print_string

	mov	eax, [min]		; printf("%d", min);
	call	print_int

	leave
	ret


