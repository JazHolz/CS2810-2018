* HELLO WORLD program

# define a data segment
.data
	txtout: .asciiz "Hello\nWorld!" # string variables
# define the text segment
.text
# assembler directive
.globl main # 

main:
	la $a0, txtout # string to display	
	li $v0, 4 # load print_string code
	syscall # print the string
	li $v0, 10 # load exit code
	syscall  # exit