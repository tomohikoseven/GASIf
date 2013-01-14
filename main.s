	.file	"main.c"
	.section	.rodata
.LC0:
	.string	"if == 1."
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp      # スタックポイントを移動
	subl	$32, %esp       # int nのスタック領域確保
	movl	$1, 28(%esp)    # nの初期化(n=1)
	cmpl	$0, 28(%esp)    # n と 0を比較する
	je	.L2                 # n が 0だったら、.L2(return)にジャンプ
	movl	$.LC0, (%esp)   # puts()のパラメータ設定
	call	puts
.L2:
	movl	$0, %eax        # main()の戻り値(=0)設定
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 4.6.1-9ubuntu3) 4.6.1"
	.section	.note.GNU-stack,"",@progbits
