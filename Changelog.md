# Version 1.2  
## Builds:  

**1036** - (15.03.2019)
> - fixed bug : black rain
> - fixed bug: Skills with `<noTarget>` and `<castTime>` caused an error _Target too far_
> - new plugin command `ABS spawnV [Id] [varID] [varID]` - spawn Enemy with Id in X and Y from Variables
> - new plugin parameter `Use advanced pathfinding?`
> - new plugin parameter `Auto bind new items to the Skill panel?`
> - many small changes

```diff
+ Only for Patrons
```

> - new UI element - Skill information window  
[Check Wiki for information](https://github.com/KageDesu/Alpha-ABS/wiki/Skill-Information-Window-JSON-Configuration)
> - new plugin parameter `Use old style skill info window?`

**1030** [Test only] - (21.02.2019)
> - new UI element - Notifications
> - new UI element - Enemy Cast Bar
> - new UI element - Weapon cool down timer
> - many small changes

**1024** [Test only] - (9.02.2019)
> - new UI element - Spells panel

**1018** [Test only] - (21.01.2019)
> - new UI element - Actor Cast progress bars
> - improved pathfinding algorithm  
> - some fixes and small changes  

**1015** [Test only] - (15.01.2019)  
> - new UI element - Target panel
> - new UI element - Target states panel
> - fixed bug in default UI Buttons settings
> - new .JSON configuration file: `EnemyStatusPanelSettings.json`
> - new parameters for .JSON file StatesPanelSettings: `maxLines`, `textVisible`
> - new parameters for Enemies: `faceName`, `faceIndex` - used for image *(optional)*
> - many fixes and small changes  

**1010** [Test only] - (9.01.2019)  
> - new UI element - Actor Panel  
> - fixed bug with target selection keys  
> - many fixes and small changes

**998** - (01.12.2018)  
> - new UI elements - UI Status Panel  [Check Wiki for information](https://github.com/KageDesu/Alpha-ABS/wiki/Status-Panel-JSON-Configuration)

```diff
+ Only for Patrons
```

> - Custom UI styles for states  


**996** - (24.11.2018)  
> - fixed bug: Items Notify `stayTime` JSON parameter not works  
> - add new Items Notify JSON parameter `margin` - space between lines  
> - new UI elements - UI Buttons [Check Wiki for information](https://github.com/KageDesu/Alpha-ABS/wiki/UI-Buttons-JSON-Configuration)
> - added many new `uAPI Script calls` [Check WiKi](https://github.com/KageDesu/Alpha-ABS/wiki/Script--Calls-API)  

```diff
+ Only for Patrons
```

> - Custom UI Buttons


**990** - (18.11.2018)
> - fixed small issues
> - new UI elements customization system through JSON files
>> - now it works only with a new `Items Notify panel`, in the future it will be expanded for all UI elements
> - updated UI element `Items Notify panel`
>> - supports any items name length
>> - supports different styles (through JSON customization)
> - new feature: select nearest enemy as target (default key  `F`)  
> - fixed: select next target (`Q` key by default) now select targets by distance from nearest to farther

```diff
+ Only for Patrons
```
> - Text Font loader. `.ttf` fonts files in `fonts/` folder will be load in game automatically and can be used to customize UI elements with new customization system. **(Works only on PC or MAC)**

**980** - (28.10.2018)  
> - fixed many small issues
> - added API for script calls. [Check WiKi](https://github.com/KageDesu/Alpha-ABS/wiki/Script--Calls-API)  
> - updated feature **No Target System** - [Check Wiki for information](https://github.com/KageDesu/Alpha-ABS/wiki/No-Target-Weapons)
>> - `<noTarget>` works with  <ABS:1> weapons  
>> - `<pierce:X>` - X - limits of pierced enemies in a row  
>> - `<noTarget>` works with <ABS:1> skill types  
>> - now enemies can use too `<ABS:1> <noTarget>` skills
> - <ABS:1> skill type graphic now can be animated (use sprite sheet format image file) [Check WiKi](https://github.com/KageDesu/Alpha-ABS/wiki/How-set-animated--ABS:1--type-skill)


**965** - (17.10.2018)
> - fixed small issues
> - fixed bug: enemy no longer active after returning to spawn point (lost player)
> - fixed glitch: player can reload firearm when it is full loaded
> - new feature **Motion System** - [Check Wiki for information](https://github.com/KageDesu/Alpha-ABS/wiki/Motion-System)
> - updated feature **No Target System** - [Check Wiki for information](https://github.com/KageDesu/Alpha-ABS/wiki/No-Target-Weapons)


**955**  - (9.10.2018)
> - fixed issues with save and load game
> - fixed bug: repeated firearm reloading
> - fixed bug: firearm can be reloaded on non ABS map
> - fixed bug: control panel functions (like rotate, jump) work on non ABS map
> - fixed: game followers transparent glitch on ABS map
> - added firearm panel settings to plugin parameters  
> - new feature **No Target System** (_beta_) - you can create melee weapons that do not require a selected target to perform attack. Attacks perform on Attack button press (or on left mouse click on enemy)  
>> - new ABS parameter (only for weapons) `<noTarget:1>`  activate no target weapon mode when player equip this weapon  
![](https://github.com/KageDesu/TestRepo/blob/master/2018-10-09_19-37-11.png)

```diff
+ Only for Patrons
```
> - new feature `Mini HP bars` - display HP bars above enemies and allies on ABS map  
![](https://github.com/KageDesu/TestRepo/blob/master/2018-10-09_19-24-57.png)
>> - new plugin parameter `Show Mini HP Bars` - mini HP bar show mode
![](https://github.com/KageDesu/TestRepo/blob/master/2018-10-09_19-14-35.png)
>> - new plugin parameter `Mini Bars Settings` - for configurate mini HP bars
>> - new enemy ABS parameter `<showHP:1>` - for always display HP bar above enemy



**950** - (25.09.2018)
> - fixed major bug with AI and multithreading
> - fixed bug: invisible enemies will appears after transfer from ABS to ABS map
> - fixed bug: activated by command enemy don't fighting
> - fixed bug: in rare cases, the save game file did not want to load with erased ABS enemies on map
> - fixed bug: some skills and items sounds not playing
> - new feature `Firearms system` (https://youtu.be/ncW4RAWWggs)
>> - new ABS parameter (only for weapons) `<firearm:1>` - activate firearm system when player equip this weapon
>> - new plugin parameter for change keyboard key for firearm weapon magazine reload


**946** - (17.09.2018)
> - fixed bug: followers not follow the player after transfer from ABS to ABS map
> - fixed bug: player and party got experience when monsters killed each other
> - fixed bug: `<stack>` parameter not working with `<ammo>`
> - fixed bug: game crush with YEP_SaveCore plugin
> - fixed bug: images for some UI elements not loading from plugin parameters
> - new abs param `<cEonEnd:X>` for States. Call common event Id (x) when the state ends
> - added line for `multi hit` skills in popup description window
> - Starting with this build skills or weapons with multi charges create allowed only without consuming ammo. To do this, a new parameter will be introduced


**944** - (8.09.2018)
> - AI optimization
> - new abs parameter `<repeatDelay:X>` allows set delay for skill (item) that use repeat option between multi hits in millisecond (default 120)
> - new abs parameter `<castTimeFormula>` allows set formula for calculate casting time of skill (item). Formula format like `reloadParam` for weapons (see User Manual)
> - fixed bug: party members did not follow the player after change map from ABS to normal
> - fixed bug: after transfering between different sizes ABS maps pathfinding did not work properly
> - fixed bug: player image did not disappeared when player get in transport
> - fixed bug: some skills animations did not work if player has not target
> - fixed bug: skills information not updated when player learn new skills
> - fixed small Issues

**936** - (30.08.2018)
> - fixed bug: ABS parameters not changed when player change weapons
> - fixed bug: Wrong Level Up animation when someone in Party is leveling up
> - fixed bug: After death player can be still invisible on other Map
> - new plugin parameter `Party experience` - now you can change how will the experience be shared in the group
> - new feature: `Enemy Spawning`  - you can spawn enemies on Map with plugin command
>> - new plugin parameter `Enemy Spawn Map Id` - The map ID of the map you are using to store spawnable enemy
>> - new plugin command `ABS spawn [Id] [x] [y]` - spawn Enemy with Id in X and Y
>> - new plugin command `ABS spawn [Id] [region Id]` - spawn Enemy with Id in random place in Region  
![image](https://github.com/KageDesu/TestRepo/blob/master/936_spawn.png)

**924** - (22.08.2018)
> - new feature : `Solid Regions System` (https://youtu.be/5gGV6htF4Kg)
> - new plugin parameter `Solid Regions` - id's map regions for obstacles for enemy and spells
> - new abs parameter `<ignoreObstacles:X>` for skills (items) - allowing ignore solid regions on Map
> - new abs parameter `<ignoreObstacles:X>` for enemies - allowing enemies see through solid regions
> - new abs parameter `<impulseRandom:X>` for skills (items) - combined with `<impulse: X>`, allowing make impulse in random direction  
> new abs parameter `<heavy:X>` for enemies - if this parameter = 1, the enemy will be ignoring impulse effect
> - fixed: HP and MP regeneration PopUp always been displayed
> - fixed bug: dead enemy lost they position on map and can be looted many times when player transfering on the map

**915** - (14.08.2018)
> - fixed issues with images loading from plugin parameters
> - fixed bug: enemy looting not working after calling common event on enemy
> - fixed bug: players not gains EXP after enemy killing
> - fixed bug: enemy full HP regeneration after battle
> - fixed bug: enemy with <noMove:1> not changes direction
> - no more ballon popUp 'Zzz' when enemy in stun (not moving or sleep)
> - new abs param `<cEonStart:X>` for States. Call common event Id (x) when stated applies to the target  
![image](https://github.com/KageDesu/TestRepo/blob/master/915_event.png)
> - new parameters for player transfering after death:  
>> `Game Over Map Position`  
>> `Game Over Common Event` - Common event will called after Player death  
>> `Transfer character direction`   
![image](https://github.com/KageDesu/TestRepo/blob/master/915_deadMapParams.png)


**910** - (7.08.2018)
> - fixed small Issues
> - fixed bug:  the game could lose fps in auto-attack mode by the player
> - new plugin parameter `Player Damage Outline`  
![image](https://github.com/KageDesu/TestRepo/blob/master/Build910Params.png)   
![image](https://github.com/KageDesu/TestRepo/blob/master/Build910Param2.png)  
> - new plugin parameter `Spell zone image`   
![image](https://github.com/KageDesu/TestRepo/blob/master/Build910Param1.png)
> - new ABS parameter for skills and items `<impulse: X>` - you can set impulse force to skill for knockback enemy or to bring them closer
> - **Multi hit** - now skill can hit enemy multi times (RPG Maker MV parameter `Repeat` is now come back like it do in original MV)



**903** - (3.08.2018)
> - fixed small Issues
> - fixed bug with AI parameter `escapeOnBattle:1`

**902** - (31.07.2018)

> - fixed small issues

**901** - (23.07.2018)

> - fixed small issues  

**900** - (23.07.2018)

> - fixed bug: game crush after load ABS map with enemy in revive state
> - fixed bug: some items and skills are not installed in the slots from menu
> - added support MV 1.5.1 and above
> - new plugin parameter: `Auto Hide` for the Spell panel. If false, spell panel will always be visible, even when there is no single skill
> - many small changes and fixes

This build based on new Core scripts. In this regard, many changes have been made. The most interesting of them:
  - Now all standard image files are built into the code. Folder img\ABS is no longer needed. Only .js file.
  - *Settings.js file also no longer needed*. All the plugin parameters in plugin .js file
  - New controls key binding system (more compatible with other plugins)
  - Some parts of the plugin have been moved into the another .js files (extensions). They can be optionally connected with the plugin (below main plugin file)

**800** - initial build (26.05.2018)  
