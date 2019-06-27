@echo off
echo %filter%
echo %json%
%extra%jq.exe "%filter%" response.txt >temp.txt
set /p json=<temp.txt
set json=%json:~1%
set json[%filter%]=%json:~0,-1%
echo %json[.img]%
echo %json[.num]%
echo %json[.alt]%
set json=