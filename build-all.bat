@echo off
echo Running Flex...
flex -oalgebraic2.yy.c algebraic2.l
echo Running YACC...
bison -d algebraic2.y
echo Running GCC...
gcc -lm algebraic2.yy.c algebraic2.tab.c -oalgebraic2
echo Running compiled program...
echo ================================================
algebraic2.exe
echo Program exited.
pause