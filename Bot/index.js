// --> Packages
const Discord = require('discord.js');
const client = new Discord.Client();
const chalk = require('chalk');

// --> Config
const { token, guild1 } = require('./config.json'); 

// --> Listeners
client.on("ready", () => {
    console.log(chalk.greenBright('--> Bot online'));
});
client.on("message", async message => {
    
    // filter
    if(message.channel.name == 'no-enchants' || message.author.id == client.user.id || message.guild == null) return;

    // parse
    stop1 = [];
    message.embeds.forEach(async t => {

        let guild = client.guilds.cache.get(guild1);

        // define embeds
        let embed = new Discord.MessageEmbed()
            .setDescription('Fernbot Free For All')
            .setColor(t.color)
            .setTimestamp(t.timestamp)
            .setFooter(t.footer.text, t.footer.iconURL)
            .setTitle(`💰 `+t.title.split(" ").slice(1).join(" "))
            .setThumbnail(t.thumbnail.url)

        // get details
        t.fields.forEach(async t => {

            // add
            if(t.name.includes('Price')) {
                embed.addField("💰 "+t.name.split(" ")[1], t.value);
                return;
            };

            // split
            step = t.value.split('**')[1].split(":")[0].split("");
            number = step[step.length - 1];

            // filter
            if(number < 3) {
                stop1.push('md');
            };
            
            // add
            embed.addField("🛠️ "+t.name.split(" ")[1], t.value, t.value);
        });

        // stopped?
        if(stop1.length != 0 ) return;

        // send
        try {
            test = guild.roles.cache.find(z => z.name == message.channel.name)
            zzz = await guild.channels.cache.find(z => z.name == message.channel.name).send(`<@&${test.id}>`);
            setTimeout(() => {
                zzz.delete();
            }, 60000 * 60 * 2);
        } catch(err) {
            console.log(chalk.grey(`Could not find:  ${message.channel.name} in ${guild.name}. ROLE.`))
        }

        try {
            zzz = guild.channels.cache.find(z => z.name == message.channel.name).send(embed);
            setTimeout(() => {
                zzz.delete();
            }, 60000 * 60 * 2);
        } catch(err) {
            console.log(chalk.yellow(`Could not find:  ${message.channel.name} in ${guild.name}. CHANNEL.`))
        }
    });
    if(stop1.length != 0) return;
});

// --> Login
client.login(token);