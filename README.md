# Helldivers 2 Farming Guide by Igromanru

**The guide revolves around the abridged version of the released ED CT, compiled by me for farming**  
You need the "Farming" Cheat Engine Table from the [release](https://github.com/igromanru/HD2-Farming-Guide/releases) to follow the guide!
Which is an abridge version of the [Experimental Division CT v4.0.0](https://www.unknowncheats.me/forum/downloads.php?do=file&id=51228) (credits Zodiac).  
It contains only features that you need to farm Super Credits, Samples, Medals and Experience.  
You also need a working GameGuard Bypass to be able to use Cheat Engine.

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


## Required resources
- **GameGuard Bypass**
- Basic understanding of how Cheat Engine works (watch video tutorials on YT)
- [Cheat Engine 7.5](https://mega.nz/file/HNFRBSrY#rj4oel3UuK9hoj1BtezRVbGhNJBo8mQ3EYl7ioFprcc) or higher
- [HD2 ED Farming table](https://github.com/igromanru/HD2-Farming-Guide/releases)
- My AutoIt PickUp Macro or similar
- Installed [AutoIt](https://www.autoitscript.com/site/autoit/downloads/) (if you want to use the script)
- Understanding on how the game works

## Required first steps for each farming session
Steps that you need to do each time, no matter what you want to farm.
1. Start the game and use a third-party GameGuard Bypass, that you have to get somewhere first, to remove the Anti-Cheat from the game.  
3. Open the Farming CT in Cheat Engine. Usually you can simple double-click on the CT to open in directly with CE.
7. Activate the initializer script **ED Farming Only v(version number here)**
8. Enable the **Enable All Universal features** group header to activate all the scripts inside the group

## Super Credits Farming
1. Follow [Required first steps for each farming session](#required-first-steps-for-each-farming-session)
2. Activate the **Enable All features for Super Credits Farming** group header to enable all SC relevant features
3. Execute the AutoIt script **PickUp-Macro.au3** (just double-click the file, if AutoIt is installed)
4. Start a **Terminids** or **Illuminate**, **Difficulty 3**, **40 min** mission
5. Drop into the mission, then call a Resupply Pod **ONCE**, which will "Mass Drop" all the Super Credits you need for the mission
6. Lay down on top of the SC pile so the interaction to pick it up is available
7. Press **F4** (default hotkey) to start the AutoIt macro and pick up SCs automatically.  
By default, it runs 4 times with 13 SC per pick-up loop (52 overall). The duration is about 5 minutes, and you can’t use your PC while it’s running.  
**Attention!** The macro uses **F** key for interaction. If you use another key, read the [Configurations -> AutoIt script](#autoit-script) section!
8. Wait until the macro is done. It will show a Message Box with the message: *PickUpLoop finished*
9. Switch to another planet, it improves the chance that you can farm longer before your game crashes.
10. Repeat from step 5. until your game crashes.
11. (optional) Use the **Kill HD2 & CE** script to terminate the game’s process and close Cheat Engine if it gets stuck.

**Important Notes**
- If you want to extract, you have to disable **Enable All features for Super Credits Farming** group before completing the mission!  
- The AutoIt script runs in the background. To exit it, right-click the AutoIt tray icon in the taskbar and select **Exit**
- I wrote the guide as you could drop 200 SC at once. But after a  "performance" update, you can't drop as much without crashing, which makes the method not as good anymore.  

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
But be careful, right now, 59 is pretty much the maximum value. Dropping more than that at once will cause the game to crash.  
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
### Super Credits appear as question "?" mark
It means the SC model isn’t loaded in the current mission.  
You can either switch to another mission or install the [Super Credits Cheat Arrows](https://rpghq.org/forums/viewtopic.php?t=3175) mod, which forces the game to always load the model.  
Use the [HD2 Arsenal – Mod Manager](https://www.nexusmods.com/helldivers2/mods/4664) to manage your mods — it’s better than other HD2 mod managers.
### Cheat Engine closes after attaching to the process
It's an issue in CE v7.5. You can fix it easily.  
1. Open Cheat Engine (doesn't matter if with a CT or not)
2. In context menu at the top, select **Edit**->**Settings**
3. In CE settings open the **Debugging Options** tab
4. Enable the checkbox `Do not load external debug symbols like .PDB/.DBG files (Breaks tables that use these symbols)`
5. Press **OK** at the bottom to save the settings
6. Done


### Game Crashes
Hacking is not an "exact science". Removing GameGuard from the game will sometimes cause it to crash. Also, some features might cause crashes under different circumstances.  
To reduce any friction, read the guide carefully and follow the steps.  
Sometimes, if the timing is unlucky, GameGaurd will detect Cheat Engine before you can execute the bypass.  
In such case, try to use it later on the ship or in a mission.

### AntiCheat Details
**nProtect GameGuard in Helldivers 2** serves solely as anti-tamper software. Despite what it can do in other games, in HD2 it only attempts to preserve the integrity of the original code and prevent external software from accessing the process. It doesn't even check for foreign DLLs in the process.
If GameGuard detects ".text" code changes or one of the blacklisted programs like Cheat Engine, it will only close the game, usually with a message.    
There are no (GameGuard) bans! And until today, no bans for cheating were reported in any of HD2 related (cheating) communities.
