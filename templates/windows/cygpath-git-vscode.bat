@echo off
REM #
REM # author: nickbudi
REM # https://gist.github.com/nickbudi/4b489f50086db805ea0f3864aa93a9f8
REM #
REM # this script fixes vscode-cygwin-git integration so that only 
REM # files which are actually modified show up as being modified in vscode
REM #
REM # "git.path"="C:\\this\\file.bat" in the vscode settings.json

setlocal
set PATH=C:\cygwin\bin;%PATH%

if "%1" equ "rev-parse" goto rev_parse
git %*
goto :eof
:rev_parse
for /f %%1 in ('git %*') do cygpath -w %%1