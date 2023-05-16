import os
import json
import discord
import aiohttp
import asyncio
       
from pathlib import Path
from dotenv import load_dotenv
from discord.ext import commands
from discord import Client, Message, Guild, TextChannel, utils, Embed, Role, Emoji, RawReactionActionEvent

env_path = Path('.') / '.env'
if os.path.isfile(".env.local"):
    env_path = Path('.') / '.env.local'

load_dotenv(dotenv_path=env_path)

token = os.getenv("TOKEN")
prefix = os.getenv("PREFIX")
description = os.getenv("DESC")

client = Client(command_prefix=prefix, description=description)

base_server_id: int = 790188475403206656
base_bot_id: int = 793137295796076544

server_id: int = 641548720802103296
serverrole_id: int = 716364791215816766
webhooks = {}
session = None 
category: int = 790572551361003522
role_select_name: str = "role-selection"
role_select_chan: TextChannel = None
role_select_msg: Message = None

roles: dict = {
    '💨' :{ 'id': 717120320665813042, 'text':' : Zeal (Auto Dmg)', 'icon': ':dash:' },
    '👚' :{ 'id': 717120446344069240, 'text':' : Armor (Crit Res.)', 'icon': ':womans_clothes:' },
    '🐦' :{ 'id': 717120507417460837, 'text':' : Rare Items (MVP/MINI/Star Cards, Mounts)', 'icon': ':bird:' },
    '🧙‍♀️' :{ 'id': 717120697792725053, 'text':' : Anti-Mage (M.Pen+)', 'icon': ':woman_mage:' },
    '🏹' :{ 'id': 717121327156428811, 'text':' : Arch (Range Atk)', 'icon': ':bow_and_arrow:' },
    '🛡️' :{ 'id': 717121453480345600, 'text':' : Morale (Ignore Def)', 'icon': ':shield:' },
    '🗡️' :{ 'id': 717122837105868831, 'text':' : Sharp Blade (Melee Atk)', 'icon': ':dagger:' },
    '☀️' :{ 'id': 717123718534529034, 'text':' : Divine Blessing (Magic Reduc)', 'icon': ':sunny:' },
    '💪' :{ 'id': 717125738624712774, 'text':' : Tenacity (Dmg Reduc.)', 'icon': ':muscle:' },
    '👓':{ 'id': 717127241825255538, 'text':' : Insight (Ignore MDef)', 'icon': ':eyeglasses:' },
    '💥' :{ 'id': 717134161864818789, 'text':' : Blasphemy (Skill Dmg. Reduc)', 'icon': ':boom:' },
    '❄️' :{ 'id': 717137560014553159, 'text':' : Magic (Shorten CT Variable)', 'icon': ':snowflake:' },
    '🔪' :{ 'id': 717151526782500914, 'text':' : Sharp (Crit. Dmg)', 'icon': ':knife:' },
    '⚙️': { 'id': 717293462050963466, 'text':' : Armor Breaking (P.Pen+)', 'icon': ':gear:' },
}

@client.event
async def on_ready():
    print("Started")

@client.event
async def on_connect():
    print("on_connect")
    global role_select_chan
    global role_select_msg
    guild: Guild = client.get_guild(serverrole_id)
    role_select_chan = utils.get(guild.channels, name=role_select_name)

    if role_select_chan is None:
        role_select_chan = await guild.create_text_channel(role_select_name)

    if role_select_chan.last_message_id is not None:
        async for message in role_select_chan.history(limit=200, oldest_first=True):
            if message.author.id == client.user.id and 'Select a role by adding a reaction to this message' in message.content:
                role_select_msg = message
                break

    if role_select_msg is None:
        #await role_select_chan.purge()
        role_select_msg = await role_select_chan.send(".")

    msg = 'Select a role by adding a reaction to this message\n'
    for role in roles:
        msg += '{0}{1}\n'.format(roles[role]['icon'], roles[role]['text'])
    
    for role in roles:
        await role_select_msg.add_reaction(role)
    
    await role_select_msg.edit(content=msg)

@client.event
async def on_raw_reaction_remove(payload: RawReactionActionEvent):
    if payload.user_id != client.user.id:
        if role_select_msg and payload.channel_id == role_select_chan.id:
            emoji = payload.emoji
            guild: Guild = client.get_guild(serverrole_id)
            member = guild.get_member(payload.user_id)
            if str(emoji) in roles:
                role: Role = guild.get_role(roles[str(emoji)]['id'])
                if role:
                    await member.remove_roles(role, reason="#BOT: Reaction Role", atomic=True)

@client.event
async def on_raw_reaction_add(payload: RawReactionActionEvent):
    if payload.user_id != client.user.id:
        if role_select_msg and payload.channel_id == role_select_chan.id:
            emoji = payload.emoji
            guild: Guild = client.get_guild(serverrole_id)
            member = guild.get_member(payload.user_id)
            if str(emoji) in roles:
                role: Role = guild.get_role(roles[str(emoji)]['id'])
                if role:
                    await member.add_roles(role, reason="#BOT: Reaction Role", atomic=True)

@client.event
async def on_message(message):
    if message.guild and message.guild.id == base_server_id and message.author.id == base_bot_id and message.channel.category is not None and "Snap Notifier - SEA EL" in message.channel.category.name:
        guild: Guild = client.get_guild(server_id)
        channel = utils.get(guild.channels, name=message.channel.name)

        if channel is None:
            category = guild.get_channel(category)
            channel = await guild.create_text_channel(message.channel.name, category=category)
        
        new_message = message.clean_content
        
        if len(message.role_mentions) > 0:
            base_role: Role = message.role_mentions[0]
            role: Role = utils.get(guild.roles, name=base_role.name)
            
            if role is None:
                role = await guild.create_role(name=base_role.name, colour=base_role.colour)

            new_message = role.mention

        if message.attachments:
            new_message += '\n{}'.format(message.attachments[0].url)
            print(new_message)
                
        
        webhook = webhooks.get(channel.id, None)
            
        if webhook is None:
            channel_webhooks = await channel.webhooks()
            if channel_webhooks:
                webhook = channel_webhooks[0]
                print(f"Requested webhooks for {message.channel.name}")
            
            else:
                webhook = await channel.create_webhook(name="s")
                print(f"Created a new webhook for {message.channel.name}")
            
		
        if channel.id not in webhooks.keys():
            webhooks[channel.id] = webhook
        
        await webhook.send(content=new_message, embeds=message.embeds)
        
client.run(token)

async def test():
    # Load discord.Webhook objects from url.
    if session is None:
        session = aiohttp.ClientSession()
        
    raw_webhooks = {}
    with open("webhooks.json", "r") as file:
        raw_webhooks = json.load(file)
        
    for key in raw_webhooks.keys():
        value = raw_webhooks[key]
        
        webhook = discord.Webhook.from_url(value, adapter=discord.AsyncWebhookAdapter(session)) 
        webhooks.update({key: webhook})

    print(raw_webhooks)
    print(webhooks)
    
    # Convert discord.Webhook objects to the webhook url and save them.
    raw_webhooks = {}
    for key in webhooks.keys():
        value = webhooks[key]
        raw_webhooks.update({key: value.url})

    with open("webhooks.json", "w") as file:
        json.dump(raw_webhooks, file)
        
        
asyncio.run(test())