@echo off
call ratelimitcheck.bat
echo|set /p ="{"messages":%bulkarray%}" > request.txt
call batchhttp.bat "https://discordapp.com/api/v6/channels/%channel%/messages/bulk-delete" -method POST -headers-file header.txt -saveTO response.txt -body-file request.txt
if %debug% equ true echo [%date% - %time%] Bulk deleted messages ^| Channel %channel% ^| Message array %bulkarray% >>output.log