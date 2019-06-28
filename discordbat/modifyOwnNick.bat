@echo off
call ratelimitcheck.bat
echo|set /p ="{"nick":%nick%}" > request.txt
call batchhttp.bat "https://discordapp.com/api/v6/guilds/%guild%/members/@me/nick" -method PATCH -headers-file header.txt -saveTO response.txt -body-file request.txt
if %debug% equ true echo [%date% - %time%] Changed own nick ^| Guild "%role%" ^| Nickname %nick% >>output.log