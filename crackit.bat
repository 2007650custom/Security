@echo off
color 03
REM Ensure Path to WinRAR & 7ZIP executables
set path="C:\Program Files\WinRAR\";"C:\Program Files\7-Zip\";%path%
cls
REM This script will read in a text file of passwords, and test it against a file.  
REM If a match is found, it will save the password to a file, echo it to the screen, and abort the script. 
REM Since this is meant to loop through many passwords, this does not try to extract the file in order to save processing time.  
REM Once then password is provided, manually use it to extract. 


REM Obligatory h4x0r ASCII art
echo[
echo[
echo $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
echo  _          _   _       _____ ______  ___  _____  _   ___ _   _  
echo ^| ^|        ^| ^| ( )     ^/  __ ^\^| ___ ^\^/ _ ^\^/  __ ^\^| ^| ^/ (_) ^| ^| ^| 
echo ^| ^|     ___^| ^|_^|^/ ___  ^| ^/  ^\^/^| ^|_^/ ^/ ^/_^\ ^\ ^/  ^\^/^| ^|^/ ^/ _^| ^|_^| ^| 
echo ^| ^|    ^/ _ ^\ __^| ^/ __^| ^| ^|    ^|    ^/^|  _  ^| ^|    ^|    ^\^| ^| __^| ^| 
echo ^| ^|___^|  __^/ ^|_  ^\__ ^\ ^| ^\__^/^\^| ^|^\ ^\^| ^| ^| ^| ^\__^/^\^| ^|^\  ^\ ^| ^|_^|_^| 
echo ^\_____^/^\___^|^\__^| ^|___^/  ^\____^/^\_^| ^\_^\_^| ^|_^/^\____^/^\_^| ^\_^/_^|^\__(_) 
ECHO[
echo $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

REM	The line below should point to your list of passwords. The file should have one password on each line.
for /F "delims=" %%f in (c:\crack\passlist.txt) do (

REM The line below will show every password as it is being tested, this can be noisy so only uncomment if you are troubleshooting. 
REM echo %%f

REM	If using 7zip file, use the line below, and comment out the RAR line below.
7z l "c:\crack\files\file00.7z.001" -p"%%f"  | findstr "Path ">NUL && echo found "%%f" > c:\crack\foundpass.txt && GOTO SUCCESS

REM	If using RAR file, use the line below, and comment out the 7zip line above.
rem unrar l "c:\crack\files\file01.part1.rar" -p"%%f" | findstr "Attributes">NUL && echo found "%%f" > c:\crack\foundpass.txt && GOTO SUCCESS

)

echo[
echo No luck! Try more passwords. 
echo[
GOTO END

:SUCCESS
color 30
cls
echo[
echo[
REM audio beep on success, comment this out for silent
echo 
echo ## SUCCESS!! ##
echo[
echo The correct password has been saved. 
echo[
REM This will echo the password to the screen for convenience, but you may want to comment this out. 
type c:\crack\foundpass.txt
echo[

:END
echo Goodbye
pause