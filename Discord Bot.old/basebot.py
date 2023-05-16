try:
    from discord.ext import commands
    from discord import Intents
    import discord, asyncio, json
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
        
    if message.content.startswith('@help'):
        if admin_id_obj in message.author.roles:
            await message.channel.send("Commands:\n```@start\n> Sends 'startbot' to the text file.\n@stop\n> Sends 'stopbot' to the text file.\n@stats\n> Replies with the stats found in pos.ini.\n@help\n> Replies with this message```")

    if message.content.startswith('@start'):
        if admin_id_obj in message.author.roles:
            context = read_file("./data.txt")
            write_file("./data.txt", context+"\nstartbot")
            await message.channel.send("Wrote `startbot` to file.")
    
    if message.content.startswith('@stop'):
        if admin_id_obj in message.author.roles:
            context = read_file("./data.txt")
            write_file("./data.txt", context+"\nstopbot")
            await message.channel.send("Wrote `stopbot` to file.")
    
    if message.content.startswith('@stats'):
        if admin_id_obj in message.author.roles:
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
                message_to_send += "```"
                await message.channel.send(message_to_send)
            except FileNotFoundError:
                await message.channel.send("pos.ini file not found. Cannot display values, sorry about that!")

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