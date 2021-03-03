#Jazmine Lavasani
#Laurel Miller
#Dimitar Ivanov
#Christian Navarro

#t0 = Number to guess
.data
nl: .asciiz "\n"
space: .asciiz ", "
prompt1: "\n\n Please enter your guess: "
toohigh: "\n\n Your guess is too hi! "
toolow: "\n\n Your guess is too low! "
winner: "\n\n Good guess "
guesses: "\n\n Your guesses: "
youlose: "\n\n You had your five guesses! "
youlose2: "\n\n The number was: "
.text

li $v0, 42      #random number generator
li $a1, 21      #upper bound, gen number from 0-20
syscall         # runs whatever is in $v0 (command 42-RNG)
move $t0, $a0   #move stuff from $a0 to $t0

li $v0, 9       #allocate memory for new record
li $a0, 10      #enough memory for 5 guesses
syscall
move $s0, $v0   #hang onto the initial address of our array (memory)

li $t6, 0       #Current Offset of our array = 0


loop:
li $v0, 4       #prompt for Number:
la $a0, prompt1
syscall

li $v0, 5           #enter integer
syscall

add $s1, $s0, $t6   #add our offset to our initial memory location

sw $v0, 0($s1)      #Store the guess

add $t6, $t6, 4     #add 4 to our offset
beq $v0, $t0, win   #win?
bge $t6, 20, lose   #lose? (20 = 4 * 5) We can use that to tell how many guesses we tried
blt $v0, $t0, less  #Is our number less than the right number?

li $v0, 4           #too high 
la $a0, toohigh
syscall
j loop

less:
li $v0, 4           #guessed too low 
la $a0, toolow
syscall
j loop

win:
li $v0, 4          #We won!
la $a0, winner
syscall

showlist:         #Show us what was guessed
li $v0, 4
la $a0, guesses
syscall

li $t1, 0         #Set our initial offset to 0

listloop:
add $s1, $s0, $t1 #Add our offset to our initial memory location

li $v0, 1
lw $a0, 0($s1)    #Print the number at our memory address + offset
syscall

add $t1, $t1, 4    #Add 4 to our offset
bge $t1, $t6, done #If our offset is >= our final guess offset, we're done

li $v0, 4         #Prints coma and space
la $a0, space
syscall

j listloop

lose:              #We lost
li $v0, 4
la $a0, youlose    #Let us know
syscall

li $v0, 4
la $a0, youlose2  #Display "The number was: \n"
syscall

move $a0, $t0    #Move the right number into $a0 to display it
li $v0, 1
syscall

j showlist        #shows the guesses

done:
li $v0, 10        #end program
syscall