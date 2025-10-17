# Helldivers 2 Farming Guide by Igromanru

**The guide revolves around the abridged version of the released ED CT, compiled by me for farming**  
You need the "Farming" Cheat Engine Table from the [release](https://github.com/igromanru/HD2-Farming-Guide/releases) to follow the guide!
Which is an abridge version of the [Experimental Division CT v4.0.0](https://www.unknowncheats.me/forum/downloads.php?do=file&id=51228) (credits Zodiac).  
It contains only features that you need to farm Super Credits, Samples, Medals and Experience.  

## Index
- [Required resources](#required-resources)
- [Required first steps for each farming session](#required-first-steps-for-each-farming-session)
- [Super Credits Farming](#super-credits-farming)
  - [Configurations](#configurations)
    - [AutoIt script](#autoit-script)
    - [Mass SC Packs Drop](#mass-sc-packs-drop)
- [Medals and Experience Farming](#medals-and-experience-farming)
- [Samples Farming](#samples-farming)
- [FAQ](#faq)
  - [Super Credits / Medals limit per mission](#super-credits--medals-limit-per-mission)
  - [Game Crashes](#game-crashes)
  - [AntiCheat Details](#anticheat-details)
- [Related Discord Server](#related-discord-server)


## Required resources
- Basic understanding of how Cheat Engine wroks (watch video tutorials or something)
- [Cheat Engine 7.5](https://mega.nz/file/HNFRBSrY#rj4oel3UuK9hoj1BtezRVbGhNJBo8mQ3EYl7ioFprcc) or higher
- HD2 ED Farming table
- My AutoIt PickUp Macro or similar
- Installed [AutoIt](https://www.autoitscript.com/site/autoit/downloads/) (if you want to use the script)
- Understanding on how the game works

## Required first steps for each farming session
Steps that you need to do each time, no matter what you want to farm.
1. Start the game and wait until the **Super Earth Ministry of Truth** screen appears
2. As fast as possible, double-click the Cheat Table (.CT) file, to open it automatically with Cheat Engine (it should be assigned as default application to open .CT files)
3. If Windows asks you to allow Cheat Engine to make changes on your device, always press **Yes**
4. As soon you see the **Execute this lua script?** dialog window, press **Yes** to execute the GameGaurd Bypass
5. The Cheat Engine with loaded table should appear
6. Activate the initializer script **ED Farming Only**
7. Enable the **Enable All Universal features** group header to activate all the scripts inside the group

## Super Credits Farming
**[Video Tutorial](https://www.youtube.com/watch?v=kj150Uf3ljc)**

1. Follow [Required first steps for each farming session](#required-first-steps-for-each-farming-session)
2. Activate the **Enable All features for Super Credits Farming** group header to enable all SC relevant features
3. Execute the AutoIt script **PickUp-Macro.au3** (just double-click the file, if AutoIt is installed)
4. Start a **Terminids** or **Illuminate**, **Difficulty 3**, **40 min** mission
5. Drop into the mission, then call a Resupply Pod **ONCE**, which will "Mass Drop" all the Super Credits you need for the mission
6. Lay down on top of the SC pile so the interaction to pick it up is available
7. Press **F4** (default hotkey) to start the AutoIt macro and pick up SCs automatically.  
By default, it runs 10 times with 13 SC per pick-up loop. The duration is about 12 minutes, and you can’t use your PC while it’s running.  
**Attention!** The macro uses **F** key for interaction. If you use another key, read the [Configurations -> AutoIt script](#autoit-script) section!
1. Wait until the macro is done. It will show a Message Box with the message: *PickUpLoop finished*
2. If you want to do another run, you need to start a new mission. Otherwise, mass-dropping a second time in the same mission will crash the game.  
Repeat from **step 4.** or use the **Kill HD2 & CE** script to close the game.

**Important Notes**
- If you want to extract, you have to disable **Enable All features for Super Credits Farming** group before completing the mission!  
- The AutoIt script runs in the background. To exit it, right-click the AutoIt tray icon in the taskbar and select **Exit**

### Configurations
#### AutoIt script
You can configure the AutoIt Macro to your liking, to change hotkeys or reduce or increase how many "pick-up loops" it will run.  
Open **PickUp-Macro.au3** in any text editor, but preferably in AutoIt's own editor, SciTE.  
[Here](https://www.autoitscript.com/autoit3/docs/functions/Send.htm) you can find a documentation on AutoIt keys. It applies to hotkeys as well.  
**Changeable variables in script:**  
`$iPickUpsCount` is the number of "pick-up loops" the script will run. Each loop collects 13 SC and then waits for the server’s cooldown (50 sec) before continuing. The number of loops basically determines how long the macro will run.  
`$sInteractionKey` is the interaction key for picking up items. The default is `F`. If you have changed it in the game, you must change it here as well.  
`$sMacroHotKey` is the hotkey to start the macro. The default is `F4`.  
`$sMacroCancelHotKey` is the hotkey to cancel the macro. The default is `CTRL+Q`. You can interrupt the macro at any time with this hotkey.  
#### Mass SC Packs Drop
You can change the **Packs Amount** value to change the amount of SC the script will drop at once.  
But be careful, 200 is pretty much the maximum value, after that it becomes very unstable and increases the chance that your game will crash.  
For the AutoIt macro to work properly, you need to drop at least as many SC as the macro will try to pick up.  
The simple formula is: **`$iPickUpsCount` * 13**.

## Medals and Experience Farming
Can be combined with [Samples Farming](#samples-farming)

1. Follow [Required first steps for each farming session](#required-first-steps-for-each-farming-session)
2. Activate the **Enable All features for Medals and Experience farming** group header to enable all relevant features
3. Start any mission
4. After landing, use hotkey **I** to activate the feature of the `Instant Complete Mission` script
5. Extract
6. Repeat from **step 3.** for more Medals and Exp

## Samples Farming
Can be combined with [Medals and Experience Farming](#medals-and-experience-farming).  

1. Follow [Required first steps for each farming session](#required-first-steps-for-each-farming-session)
2. Activate the **Enable All features for Samples farming** group header to enable all relevant features
3. Start any mission
4. After landing, use hotkey **I** to activate the feature of the `Instant Complete Mission` script
5. Extract. You will get 100 of each Sample.
6. Repeat from **step 3.** for more Samples

## FAQ
### Super Credits / Medals limit per mission
Originally, there’s a limit on how many Super Credit or Medal stacks can be picked up in a mission. You should count in stacks, one stack equals one pick-up. The server determines how many resources you get from each stack. One Super Credit stack usually gives you 10 SC, with a 1% chance to get 100 instead. For Medals, the amount is random.  
The original limit is random between 0 and 15. The limit applies to each player individually.  
**Remove Currency Pickup Limit**  
The feature allows bypassing the original limit by changing the current session ID.  
With the feature enabled, you can pick up exactly 13 stacks every ~50 seconds.
It’s the server’s cooldown, and there’s currently no known way to skip it.

### Game Crashes
Hacking is not an "exact science". Removing GameGuard from the game will sometimes cause it to crash. Also, some features might cause crashes under different circumstances.  
To reduce any friction, read the guide carefully and follow the steps.  
Sometimes, if the timing is unlucky, GameGaurd will detect Cheat Engine before you can execute the bypass.  
In such case, try to use it later on the ship or in a mission.

### AntiCheat Details
**nProtect GameGuard in Helldivers 2** serves solely as anti-tamper software. Despite what it can do in other games, in HD2 it only attempts to preserve the integrity of the original code and prevent external software from accessing the process. It doesn't even check for foreign DLLs in the process.
If GameGuard detects ".text" code changes or one of the blacklisted programs like Cheat Engine, it will only close the game, usually with a message.  
There are no (GameGuard) bans! And until today, no bans for cheaters were reported in any of HD2 related (cheating) communities.

## Related Discord Server
<a href="https://discord.gg/jmsAX8kjVJ"><img src='https://discordapp.com/api/guilds/1417474730906095626/widget.png?style=shield'></a>  
Don’t join if you haven’t read the guide. People who refuse to read but still ask for help aren’t welcome!