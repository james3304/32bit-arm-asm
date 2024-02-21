# 32bit-arm-asm

assembly code for computer org @ blinn fall 2023
all folders will eventually contain a makefile to compile the .s files

standard flow
cd [local lab directory]
make
./[lab main file]
  i.e. ./simpleAdd

debugging
gdb [lab name]
  i.e. gdb simpleAdd

useful commands for gdb after entering file 

layout reg
- shows your working registers

/x lwx [hex memory address]
- displays what is in that memory address. hit enter
  again to get the next address 4 bytes away

n
- takes you to next instruction. if current instruction is a function
  it will take you INTO the function

s
- does the same as next but will step over functions and automatically run them 
