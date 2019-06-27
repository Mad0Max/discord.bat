@echo off
setlocal enabledelayedexpansion
set filecount=0

echo Loading.. & echo/
set "cmd=call .\discordbat\"
set "extra=call .\discordbat\extra\"
for /f "delims=" %%x in (config.ini) do (set "%%x") & (
    echo content-type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW
    echo Authorization: Bot !token!

) >headerform.txt
for /f "delims=" %%x in (config.ini) do (set "%%x") & (
    echo content-type: application/json
    echo Authorization: Bot !token!
) >header.txt
for /f %%A in ('dir /a-d-s-h /b /s ^| find /v /c ""') do set filecount=%%A
type .\discordbat\extra\bootscreen.txt
echo/
echo/
echo Finished loading.
echo Found %filecount% files. & if %debug% equ true echo [%date% - %time%] Found %filecount% files. >>output.log
echo Showing bot output below.
echo/
echo ==============================
echo/
python .\discordbat\_messages.py