@echo off

rem | Player variables
set /a pLvl=1
set /a pHp=100
set pName=Player
set pLeftHand=TrainingSword
set pRightHand=RookieShiled

set /a pStr=5
set /a pAgi=5
set /a pDef=5

rem | Enemy variables
set /a eHp=100
set eName=Enemy
set eLeftHand=Fist
set eRightHand=Fist

set /a eStr=1
set /a eAgi=1
set /a eDef=1

rem | Guide variables
set prevMenu=ShowStats

:Main
cls
color B
set prevMenu=Main
cls
echo RPG game for bendik my man
echo Options:
echo 1. New Game
echo 2. Continue //Incomplete
echo 3. Readme
echo 4. exit

set /p action=Enter action:

if "%action%"=="new game" goto NewGame
if "%action%"=="readme" goto readme
if "%action%"=="exit" goto End
goto Main

:readme
cls
type test.txt
echo.
set /p dummy=Press ENTER...
goto Main

:NewGame
echo Started new game %Date% %Time% >> log.txt
goto initBattle

:ShowStats
color 6
cls
echo Name: %pName%
echo.
echo.
echo.
echo HP: %pHp%
echo Left hand: %pLeftHand%
echo Right hand: %pRightHand%
set /p dummy=Press Enter to go back..
goto %prevMenu%

:initBattle
cls
set /a inBaLvl=%RANDOM% * %pLvl% / 32768 + 1
echo Chose enemy lvl (%inBaLvl%) Based on your level (%pLvl%)

IF "%inBaLvl%"=="1" set newEnemy=goblin

(
set /p eName=
set /p eLeftHand=
set /p eRightHand=
set /p eStr=
set /p eAgi=
set /p eDef=
)<Enemies\%newEnemy%.txt

echo. Found %eName%
set /p dummy=press ENTER to start battle...
goto Battle

:Battle
color D
set prevMenu=Battle
cls

echo.
echo. Battling %eName%
echo.
echo.
echo ========//Options//========	========//Enemy Stats//==========
echo 0. stats			Type: %eName%
echo 1. attack			Hp: %eHp%
echo 2. ---	 			Left hand: %eLeftHand%
echo 3. run				Right hand: %eRightHand%
echo ===========================	=================================
echo.
echo =========//Items//=========	========//Player Stats//=========
echo 4. HpPotion			Name: %pName%		
echo 5. ---				Hp: %pHp%
echo 6. ---				Left hand: %pLeftHand%
echo 7. ---				Right hand: %pRightHand%
echo ===========================	=================================
echo.
echo.
echo.
echo.
echo.
echo.

set /p attack=Select your action: 
if "%attack%"=="stats" goto ShowStats
if "%attack%"=="attack" (
set target=eHp
goto attack
)
goto Battle

:attack
set /a tempDmg=0
set /a tempStr=0
set /a tempAgi=0
set /a tempDef=0

if "%target%"=="eHp" (
	if exist Weapons\%pLeftHand%.txt (
		echo found weapon
		(
		set /p dummy=
		set /p tempStr=
		set /p tempAgi=
		set /p tempDef=
		)<Weapons\%pLeftHand%.txt
	)
	set /a tempStr+=%pStr%
	set /a tempAgi+=%pAgi%
	set /a tempDef+=%pDef%
)

echo Dmg %tempDmg%
echo Str = %tempStr%
echo Agi = %tempAgi%
echo Def = %tempDef%

set /p dummy=press enter..
goto battle

:End
echo Saving...
echo Save Failed! Error: Not yet impomented
echo You can now close the prompt
set /p dummy=Press enter to exit..