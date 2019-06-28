# Discord.bat
Yes.. its real.
Made for Discord's Hack Week by `Mad Max#8495`
The only true Discord API wrapper that matters
![Discord Hack Week](https://cdn-images-1.medium.com/max/2560/1*lh6NS8hx0pu5mlZeSqnu5w.jpeg)

---
# WARNING
**Please use this only in private testing servers to avoid security related issues**
This is might not be fully secure. Windows batchfile is not a good language for anything, especially not something like this.
**Using this might give users access to your system variables or bot information like the token or bot files.**
If you do find large security issues please report it to me by sending me a private message (Mad Max#8495)

---
### Features (Yes, there are features)

- Send messages, files or embeds
- Get user information
- Create roles or channels 
- Delete roles, channels or messages
- Kick and ban members
- And a bunch more basic features

You can also:
  - Make webrequests
  - Filter json
  - Log the bot's actions for help when creating one
---
### Installation
Discord.bat requires [Discord.py](https://pypi.org/project/discord.py/) to run.
Additionally you should have the python modules `subprocess` and `configparser`
(Yes, before you get angry there is a python file there which allows message logging. Maybe it can be replaced some time.)
When you downloaded Discord.bat and extracted it to your file location, its ready to use. View the next section for setting it up.

---
### Setup
First of, go and edit the fields in `config.ini`. You should end with something like
```ini
[CONFIG]
token=[Your bot token]
developer=[Your user ID]
prefix=!
useragent=DiscordBot (https://github.com/Mad0Max/discord.bat, 0.2)
debug=true
```
The `useragent`field should not be changed.
The `debug`field enables advanced logging to `output.log`. Set it to `false` when you dont need it


When you filled the config in you are ready to make your bot and run it with `run.bat` in a console or double click `run.bat`.

---
### Coding a bot
Making a bot can be pretty simple but also complicated to do in discord.bat depending on the task.
The bot should be made in the file called `bot.bat` and run only with `run.bat`,

A simple echo/repeat command for example may look like this
```bat
if %command%==echo (
set channel=%arg2%
set msg=%arg4%
%cmd%sendMessage.bat
)
```


Using more complicated commands may require `setlocal enabledelayedexpansion` at the top of bot.bat under `@echo off`
Such a command may be for example a XKCD Comic requester. This one gets a random one and sends an embed to the channel
```bat
if %command%==xkcd (
set msg=
set /a comicnum=%RANDOM% * 2000 / 32768 + 1
call batchhttp.bat "https://xkcd.com/%comicnum%/info.0.json" -method GET -saveTO response.txt
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
```
You might notice that the `%random%` is not so random. It generates a number based on your time and it updates every second so you will see similar values.

`%cmd%` will be the path to `.\discordbat\`
`%extra%` will be the path to `.\discordbat\extra\`
This is for better readability and usage

---
### Variables
Because how batchfiles work, the variable content must be set by the user.
There are a bunch of "internal" variables used which have to be set by the user to work.
For example:
```bat
set msg=Hello
%cmd%sendMessage.bat
```
This will send an API request with the JSON body `{"content":"%msg%"}`


| Variable Name  | Set variable to          | Purpose                                                                                     |
|----------------|--------------------------|---------------------------------------------------------------------------------------------|
| %msg%          | String (message content) | Used by sendMessage and related commands to send a message.                                 |
| %msgid%        | Message ID               |                                                                                             |
| %user%         | User ID                  |                                                                                             |
| %guild%        | Guild ID                 |                                                                                             |
| %channel%      | Channel ID               |                                                                                             |
| %role%         | Role ID                  |                                                                                             |
| %dmd%          | int                      | Delete-message-days. Used for ban to delete N amount of days worth of messages by the user. |
| %reason%       | String (action reason)   | Used by commands like ban. Adds a reason to the action.                                     |
| %age%          | int                      | Max age for invites                                                                         |
| %uses%         | int                      | Amount of invite uses                                                                       |
| %temporary%    | boolean                  | If the the invite is temporary                                                              |
| %unique%       | boolean                  | If the invite is unique                                                                     |
| %emoji%        | Emoji ID                 |                                                                                             |
| %dmid%         | DM Channel ID            |                                                                                             |
| %title%        | string                   | Embed title                                                                                 |
| %description%  | string                   | Embed description                                                                           |
| %color%        | hex                      | Embed hex color                                                                             |
| %footer%       | string                   | Embed footer                                                                                |
| %url%          | string                   | Embed image url                                                                             |
| %filename%     | string                   | Name of file to send                                                                        |
| %filetype%     | string                   | Content type. text/plain is for plaintext files.                                            |
| %file%         | string                   | The file content                                                                            |
| %tts%          | boolean                  | If the message should be tts                                                                |
| %hasSpoiler%   | boolean                  | If the file contains spoilers                                                               |
| %rolename%     | string                   | Name of role                                                                                |
| %perms%        | int                      | Permission integer                                                                          |
| %rolecolor%    | hex                      | Role color hex value                                                                        |
| %hoist%        | boolean                  | If role is displayed in separate group                                                      |
| %mentionable%  | boolean                  | If role is mentionable                                                                      |
| %webhook%      | Webhook ID               |                                                                                             |
| %webhooktoken% | Webhook Token            | Token to send information to a webhook   

The `%argN%` variables can be used to get more information about an executed command.

| Variable      | What is it?     | Purpose                                                                     |
|---------------|-----------------|-----------------------------------------------------------------------------|
| %arg1%        | Command name    | Same as %command%. This gets set to the name of the command thats executed. |
| %arg2%        | Channel ID      | The channel id the command was made in                                      |
| %arg3%        | Guild ID        | The guild id the command was made in                                        |
| %arg4%        | Custom argument | This will store everything after the command.                               |
| %arg5%-%arg9% | Custom argument | Planed for sometime. **These are currently unused.**                        |
---
### Notes
This is made as a joke and not for real world use.
A demo-bot is also included with a few commands such as `userinfo`, `echo` and `xkcd`
Remember to not mess with many variables such as `%USERNAME%`, `%TEMP%`, `%Path%` and many others. You can get a list of your system's variables when doing `set` in a command prompt - you should not use those.

I could not test every file. So if you got weird errors from a file like `sendMessage.bat`  let me know.

Also the file `messages.py` is just there to output and filter commands. This is totally replaceable and I will most likely do it but for now its not worth it and will be a complicated re-do.

Why did I write a decent readme for a shitpost submission? Well, I don't even know..
