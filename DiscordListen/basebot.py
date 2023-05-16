try:
    from discord.ext import commands
    from discord import Intents
    import discord, asyncio, json
    import ss
    import subprocess
    import os
except Exception:
    print("Discord dependency not found, installing... This should take about 20 seconds...")
    import os, time
    os.system("python -m pip install discord.py")
    time.sleep(10)
    from discord.ext import commands
    from discord import Intents
    import discord, asyncio, json

global admin_id, discord_id, TOKEN


already_started = False
intents = Intents.all()

client = commands.Bot(command_prefix = '=', intents=intents, description = 'Hello World!!! <3')

def read_file(file_path):
    with open(file_path, 'r', encoding="utf8", errors="ignore") as file:
        return file.read()

def write_file(file_path, content):
    with open(file_path, "w") as file:
        file.write(content)

try:
    my_json = read_file("./settings.json")
except FileNotFoundError:
    print("You do not have a file called settings.json in the same folder as your discord bot. Would you like for me to create one for you?")
    answer = input("(yes/no)\n>")
    if answer.lower() == "yes":
        write_file("./settings.json", '{\n    "discord_server_id": 0,\n    "admin_role_id": 0,\n    "bot_token": "My_Token_Here__Please_Keep_Quotes"\n}')
        input("Awesome! I have created the file. Please add the ID of the admin role to the 'settings.json' file, then restart the program! You can now close this program...")
        exit()
    else:
        input("Okay, I will not create the file. Without the file in the same folder, I cannot continue. You can now close this program...")
        exit()
try:
    my_json = json.loads(my_json)
except Exception:
    input("Uhh ohh! Looks like the format you used for 'settings.json' is incorrect. Please make sure it is a correctly formatted json file! You can now close this program...")
    exit()
try:
    admin_id = int(my_json["admin_role_id"])
    discord_id = int(my_json["discord_server_id"])
    TOKEN = str(my_json["bot_token"])
    botlog = int(my_json["botlog_server_id"])
    botlog2 = int(my_json["botlog2_server_id"])
except KeyError:
    input("admin_role_id or discord_server_id or bot_token not found in settings.json. Please correct this before restarting the program. You can now close this program...")
    exit()
except Exception as e:
    print(e)
    input("There was an error loading your settings.json file. Looks like you have an incorrect admin role ID or discord server ID! The IDs needs to be the number ID of the admin role and discord server. You can now close this program...")
    exit()


@client.event
async def on_message(message):
    global admin_id_obj
    if message.author == client.user:
        return
        
    if message.content.startswith('!help'):
        if admin_id_obj in message.author.roles:
            if message.channel.id == (botlog2):
                await message.channel.send("Commands:\n```!start\n> Sends 'startbot' to the text file.\n!stop\n> Sends 'stopbot' to the text file.\n!stats\n> Replies with the stats found in pos.ini.\n!help\n> Replies with this message```")


    if message.content.startswith('!zeny'):
        if admin_id_obj in message.author.roles:
            await message.channel.send("```Please wait 40 seconds. Do not send new command.```")
            try:
                context = read_file("./data.txt")
            except Exception:
                context = ""
            write_file("./data.txt", "zeny\n"+context)
            if message.channel.id == (botlog):
                #file = discord.File("C:/Users/snowi/Desktop/AHK/DiscordListen/BlueStacks.png", filename="BlueStacks.png")
                subprocess.run(["C:/Program Files/AutoHotkey/AutoHotkey.exe", "listen.ahk", "snow"])
            if message.channel.id == (botlog2):
                #file = discord.File("C:/Users/snowi/Desktop/AHK/DiscordListen/zahey.png", filename="zahey.png")
                subprocess.run(["C:/Program Files/AutoHotkey/AutoHotkey.exe", "listen.ahk", "zahey"])
            
            
            try:
                if message.channel.id == (botlog):
                    await message.channel.send(file=discord.File('./BlueStacks.png'))
                if message.channel.id == (botlog2):
                    await message.channel.send(file=discord.File('./zahey.png'))
            except Exception:
                await message.channel.send("```Unable to capture zeny amount, please try again when changing channel.```")
        if os.path.exists("./data.txt"):
            os.remove("./data.txt")
            print("Data file has been deleted successfully")
        else:
            print("Data file does not exist!")
        if os.path.exists("./zahey.png"):
            os.remove("./zahey.png")
            print("Image file has been deleted successfully")
        else:
            print("Image file does not exist!")    
        if os.path.exists("./BlueStacks.png"):
            os.remove("./BlueStacks.png")
            print("Image file has been deleted successfully")
        else:
            print("Image file does not exist!")  

            
    if message.content.startswith('!login'):
        if admin_id_obj in message.author.roles:
            if message.channel.id == (botlog2):
                try:
                    context = read_file("./data.txt")
                except Exception:
                    context = ""
                await message.channel.send("Initiating login process, please wait...")
                write_file("./data.txt", "login\n"+context)
                subprocess.run(["C:/Program Files/AutoHotkey/AutoHotkey.exe", "listen.ahk"]) 
                if os.path.exists("./data.txt"):
                    os.remove("./data.txt")           

    if message.content.startswith('!rebootpc'):
        if admin_id_obj in message.author.roles:
            print("REBOOTING")
            await message.channel.send("Rebooting your computer..")
            os.system("shutdown -t 10 -r -f")
    
 

    
    if message.content.startswith('!logout'):
        if admin_id_obj in message.author.roles:
            if message.channel.id == (botlog2):
                try:
                    context = read_file("./data.txt")
                except Exception:
                    context = ""
                await message.channel.send("Initiating logout process, please wait...")
                write_file("./data.txt", "logout\n"+context)
                subprocess.run(["C:/Program Files/AutoHotkey/AutoHotkey.exe", "listen.ahk"])
                if os.path.exists("./data.txt"):
                    os.remove("./data.txt")   
   
    
    if message.content.startswith('!stats'):
        if admin_id_obj in message.author.roles:
            if message.channel.id == (botlog):
                message_to_send = "```"
                try:
                    my_ini = read_file("C:/Users/snowi/Desktop/AHK/pos.ini")
                    my_ini2 = my_ini.replace("\x00","").split("\n")
                    for x in my_ini2:
                        if "kill" in x and "=" in x:
                            kills = x.split("=")[1].strip()
                            message_to_send += f"\nYou have killed {kills} monsters"
                        if "prevamt" in x and "=" in x:
                            prevamt = x.split("=")[1].strip()
                            message_to_send += f"\nYour music status is: {prevamt}"
                        elif "currentchannel" in x and "=" in x:
                            currentchannel = x.split("=")[1].strip()
                            message_to_send += f"\nYou are currently in: {currentchannel}"
                    from pathlib import Path
                    try:
                        txt = Path('C:/Users/snowi/Desktop/AHK/logfound.txt').read_text()
                        txt = txt.replace('\n', ',')
                    except Exception:
                        txt = ""
                    try:
                        txt2 = Path('C:/Users/snowi/Desktop/AHK/logfoundbackup.txt').read_text()
                        txt2 = txt2.replace('\n', ',')
                    except Exception:
                        txt2 = ""
                    message_to_send += f"\nNext Que:{txt}"
                    message_to_send += f"\nBackup Que:{txt2}"
                    message_to_send += "```"
                    await message.channel.send(message_to_send)
                except FileNotFoundError:
                    await message.channel.send("Cannot display values, sorry about that!")
                    
                    
            if message.channel.id == (botlog2):
                message_to_send = "```"
                try:
                    my_ini = read_file("C:/Users/snowi/Desktop/AHK/botschmitz_zahey/pos.ini")
                    my_ini2 = my_ini.replace("\x00","").split("\n")
                    for x in my_ini2:
                        if "kill" in x and "=" in x:
                            kills = x.split("=")[1].strip()
                            message_to_send += f"\nYou have killed {kills} monsters"
                        if "prevamt" in x and "=" in x:
                            prevamt = x.split("=")[1].strip()
                            message_to_send += f"\nYour music status is: {prevamt}"
                        elif "currentchannel" in x and "=" in x:
                            currentchannel = x.split("=")[1].strip()
                            message_to_send += f"\nYou are currently in: {currentchannel}"
                    from pathlib import Path
                    try:
                        txt = Path('C:/Users/snowi/Desktop/AHK/botschmitz_zahey/logfound.txt').read_text()
                        txt = txt.replace('\n', ',')
                    except Exception:
                        txt = ""
                    try:
                        txt2 = Path('C:/Users/snowi/Desktop/AHK/botschmitz_zahey/logfoundbackup.txt').read_text()
                        txt2 = txt2.replace('\n', ',')
                    except Exception:
                        txt2 = ""
                    message_to_send += f"\nNext Que:{txt}"
                    message_to_send += f"\nBackup Que:{txt2}"
                    message_to_send += "```"
                    await message.channel.send(message_to_send)
                except FileNotFoundError:
                    await message.channel.send("Cannot display values, sorry about that!")        

    if message.content.startswith('!ss'):
        if admin_id_obj in message.author.roles:
            if __name__== '__main__':
                if message.channel.id == (botlog):
                    ss.sshot("BlueStacks")
                    await message.channel.send(file=discord.File('./BlueStacks.png'))
                if message.channel.id == (botlog2):
                    ss.sshot("zahey")
                    await message.channel.send(file=discord.File('./zahey.png'))

@client.event
async def on_ready():
    global admin_id, discord_id, admin_id_obj
    if not already_started:
        discord_id_obj = client.get_guild(discord_id)
        admin_id_obj = discord_id_obj.get_role(admin_id)
        print("If you see the word 'None' below, you have set the wrong Discord server ID in settings.json")
        print(discord_id_obj)
        print("\n")
        print("If you see the word 'None' below, you have set the wrong Admin role ID in settings.json")
        print(admin_id_obj)
        print("\n\n")
        print('The bot is now running! Keep this window open.')

try:
    client.run(TOKEN)
except Exception as e:
    input("Looks like you've given the settings.json file an invalid bot token, or you haven't configured your bot intents yet. Please fix this. You may now close this program...")
    exit()