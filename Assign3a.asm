# Jazmine M Lavasani
# Laurel Miller
# Christain Navarro
# Dimitar Ivanov

.data
prompt1: .asciiz "Enter the first integer please: "
prompt2: .asciiz "Enter the second integer please: "
prompt3: .asciiz "Enter the third integer please: "
result: .asciiz "The result is: "

.text
main:
    #t0-to hold first integer
    #t1-to hold second integer
    #t2-to hold third integer
    #t2- used to hold the sum of t$1 and t$2
    
    #first number
    li $v0, 4 #syscall to print string
    la $a0, prompt1  #address of string to print
    syscall
#
    li $v0, 5 #syscall to read an integer
    syscall
    move $t0, $v0  #move the number to read into $t0
    
    #second number
    li $v0, 4
    la $a0, prompt2
    syscall
#
    li $v0,5        
    syscall
    move $t1,$v0
#
   #third number
   li $v0, 4
   la $a0, prompt3
   syscall
   
   li $v0, 5
   syscall
   move $t2,$v0


    #print out sum 
    li $v0, 4
    la $a0, result
    syscall
#
    add $t3, $t0, $t1
    add  $a0, $t2, $t3  #compute the sum
    li $v0, 1
    syscall 
#
    li $v0, 10
    syscall
  								