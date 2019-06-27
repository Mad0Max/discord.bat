from discord.ext import commands
import subprocess
import configparser

config = configparser.ConfigParser()
config.read('config.ini')
prefix = config["CONFIG"]['prefix']

bot = commands.Bot(command_prefix=prefix)

@bot.event
async def on_ready():
    print("READY")

@bot.event
async def on_message(message):
    if message.content.startswith(prefix):
        subprocess.call([r'.\discordbat\_messages.bat', message.content[1:].split(" ")[0], str(message.channel.id), str(message.guild.id), message.content[len(message.content[1:].split(" ")[0])+2:]])
"""
Doing something like this may be a better idea, the issue is it will break a lot of stuff and much stuff would have to be re-written for it to work. No time for that at the discord hack week.

from discord.ext import commands
import subprocess

prefix = "!"

bot = commands.Bot(command_prefix=prefix)

@bot.event
async def on_ready():
    print("READY")

@bot.event
async def on_message(message):
    if message.content.startswith(prefix):
        c = [str(message.channel.id)]
        c.extend(message.content[1:].split(" "))
        for loop in range(9-len(c)):
            c.append("NO_VALUE")
        subprocess.call([r'.\discordbat\websocket.bat', c[0], c[1], c[2], c[3], c[4], c[5], c[6], c[7], c[8]])

bot.run(config["CONFIG"]['token'])
"""

bot.run(config["CONFIG"]['token'])