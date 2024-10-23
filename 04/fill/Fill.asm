// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(RESET) 
    @SCREEN
    D=A
    @cur_screen_key
    M=D

(LOOP)
    @KBD
    D=M
    @KEY_PRESSED
    D; JNE  // Jump to KEY_PRESSED if a key is pressed
    
    // No key is pressed, clear the screen
    @BLANK
    0; JMP
    
(KEY_PRESSED)
    // A key is pressed, fill the screen with black
    @FILL
    0; JMP
    
(BLANK)
    // Fill the screen with white
    @SCREEN
    D=A
    @cur_screen_key
    M=D
    @CLEAR_WHITE
    D; JLT
    @LOOP
    0; JMP
    
(FILL)
    // Fill the screen with black
    @SCREEN
    D=A
    @cur_screen_key
    M=D
    @FILL_LOOP
    D; JMP
    
(CLEAR_WHITE)
    // Fill the screen with white (value 0)
    @SCREEN
    D=A
    @cur_screen_key
    M=D
    @CLEAR_LOOP
    D; JMP
    
(FILL_LOOP)
    @cur_screen_key
    A=M
    M=-1
    @NEXT_PIXEL
    D; JMP
    
(CLEAR_LOOP)
    @cur_screen_key
    A=M
    M=0
    @NEXT_PIXEL
    D; JMP
    
(NEXT_PIXEL)
    // Increment the pixel address
    @cur_screen_key
    M=M+1
    @SCREEN_END
    D; JLT
    @LOOP
    0; JMP
    
(SCREEN_END)
    // Check if we are at the end of the screen
    @cur_screen_key
    D=M
    @END
    D; JGE
    @LOOP
    0; JMP
    
(END)
    @LOOP
    0; JMP
