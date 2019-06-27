@echo off
setlocal enabledelayedexpansion

if %command%==help (
set channel=%arg2%
set msg=%prefix%help - Shows this\n%prefix%echo - Repeat a message\n%prefix%xkcd - Gets a random comic\n%prefix%userinfo - Get basic info about a user\n%prefix%setnick - Set the bots nickname to user input\n\nYou are using the discord.bat demo bot. Go and start making your own.
%cmd%sendMessage.bat
)

if %command%==echo (
set channel=%arg2%
set msg=%arg4%
%cmd%sendMessage.bat
)

if %command%==xkcd (
set msg=
set /a comicnum=%RANDOM% * 2000 / 32768 + 1
call batchhttp.bat "https://xkcd.com/!comicnum!/info.0.json" -method GET -saveTO response.txt
set filter=.img
%extra%jsonFilter.bat
set filter=.title
%extra%jsonFilter.bat
set filter=.alt
%extra%jsonFilter.bat
set color=FFFF00
set title=!json[.title]!
set url=!json[.img]!
set description=Comic Number: !comicnum!
set footer=!json[.alt]!
set channel=%arg2%
%cmd%sendEmbedImage.bat
)

if %command%==cpuIntensiveCommand (
set channel=%arg2%
%cmd%triggerTyping.bat
timeout 10 >nul
%cmd%triggerTyping.bat
)

if %command%==userinfo (
set channel=%arg2%
set user=%arg4%
%cmd%getUser.bat
set filter=.username
%extra%jsonFilter.bat
set filter=.discriminator
%extra%jsonFilter.bat
set filter=.id
%extra%jsonFilter.bat
set msg=Username: !json[.username]!\nDiscriminator: !json[.discriminator]!\nID: !json[.id]!
%cmd%sendMessage.bat
)

if %command%==setnick (
set guild=%arg3%
set nick=%arg4%
%cmd%modifyOwnNick.bat
)

if %command%==sendfile (
set channel=%arg2%
set tts=false

REM This will be the filename displayed in the chat
set filename=Hello.txt

REM Leave content type to text/plain when its just a simple text file
set filetype=text/plain

REM This is the actual file content. Change this or read a file to the variable
set file=Hello, this is a file upload

REM This will be the message before the file.
set msg=Test
set hasSpoiler=true
%cmd%sendFile.bat
)