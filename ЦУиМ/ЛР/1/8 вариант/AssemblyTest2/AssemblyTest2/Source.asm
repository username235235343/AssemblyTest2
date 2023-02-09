
.686
.model flat, stdcall
.stack 4096
.data
	;M=(Z’+X*Y)xor(X + Y)

	X	dw	8
	Y	dw	7
	Z	dw	-81

	M			dw	?
	Z_			dw	?
	XY			dw	?
	Z_plusXY	dw	?
	XplusY		dw	?

.code
	ExitProcess PROTO STDCALL :DWORD
	main:

	mov ax, 0
	sub ax, Y
	mov Y, ax
	xor ax,ax

	
	mov ax, Z
	ROL ax, 1
	ROL ax, 1
	ROL ax, 1
	mov Z_, ax
	xor ax, ax


	mov bx, X
	mov ax, Y
	imul  bx, ax
	mov XY, bx
	xor bx, bx
	xor ax, ax

	mov ax, Z_
	add ax, XY
	mov Z_plusXY, ax
	xor ax, ax

	mov ax, X
	add ax, Y
	mov XplusY, ax
	xor ax, ax

	mov ax, Z_plusXY
	mov bx, XplusY
	xor ax, bx

	mov M, ax
	xor ax, ax
	xor bx, bx

	exit:
Invoke ExitProcess,1
End main