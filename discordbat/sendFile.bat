@echo off   
call ratelimitcheck.bat
echo %msg%
(
echo ------WebKitFormBoundary7MA4YWxkTrZu0gW
echo Content-Disposition: form-data; name="file"; filename="%filename%"
echo Content-Type: %filetype%
echo.
echo %file%
echo ------WebKitFormBoundary7MA4YWxkTrZu0gW
echo Content-Disposition: form-data; name="content"
echo.
echo %msg%
echo ------WebKitFormBoundary7MA4YWxkTrZu0gW
echo Content-Disposition: form-data; name="tts"
echo.
echo %tts%
echo ------WebKitFormBoundary7MA4YWxkTrZu0gW
echo Content-Disposition: form-data; name="hasSpoiler"
echo.
echo %hasSpoiler%
echo ------WebKitFormBoundary7MA4YWxkTrZu0gW--
)>multipart.txt
call batchhttp.bat "https://discordapp.com/api/v6/channels/%channel%/messages" -method POST -headers-file headerform.txt -saveTO response.txt -body-file multipart.txt
if %debug% equ true echo [%date% - %time%] Sent file ^| Channel %channel% >>output.log