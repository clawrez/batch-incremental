@echo off
cls
set /a coins=0
set /a diamonds=0
set /a boost=1
set /a achnum=0
set /a presamnt=0

set /a presprice=1000000

set /a mltprc=100
set /a mltnum=0
set /a addmlt=1

set /a havecoin1=0
set /a havecoin2=0
set /a presamnt1=0

::home

:home
cls
echo [0m[HOME]
echo Welcome home.
echo.
echo You have [33m%coins%[0m coins.
set /p homecmd=Enter a command:[92m 

if %homecmd% == help (goto help)
if %homecmd% == info (goto info)
if %homecmd% == a (goto add)
if %homecmd% == add (goto add)
if %homecmd% == prestige (goto prestige)
if %homecmd% == shop (goto shop)
if %homecmd% == achievements (goto achievementmanager)
if %homecmd% == stats (goto achievementmanagerstats)
if %homecmd% == statistics (goto achievementmanagerstats)
if %homecmd% == devcmd (goto devcmd)
else (goto invalid)


:invalid
cls
echo [31mInvalid command. Try typing 'help'.
echo.
pause
goto home


:help
cls
echo [0m[HELP]
echo A comprehensive list of possible commands and functions.
echo.
echo    [96mhelp[0m: shows this page
echo    [96ma[0m/[96madd[0m: adds to your total coins
echo    [96mshop[0m: takes you to the shop
echo    [96mprestige[0m: takes you to the prestige menu
echo    [96machievements[0m: takes you to the achievements page
echo    [96mstats[0m/[96mstatistics[0m: takes you to the stats page
echo    (all commands must be typed in lowercase, I do not want to program in uppercase versions of each and every one)
echo    (also do not input a whitespace into anything, it will break the game!!!)
echo.
pause
goto home


:info
cls
echo [0m[INFO]
echo This game features a heap of exciting functions to treat you and your lust for incremental fun!
echo You can find a manual for the game at [TBD].
echo.
echo This batch file was written by [96mClawrez[0m.
echo Version [33m0.1[0m
echo http://clawrez.gay
echo.
pause
goto home


:add
set /a coins=%coins%+%addmlt%
goto home

::shop

:shop
cls
echo [0m[SHOP]
echo Welcome to the shop!
echo.
set /p shopcmd=What would you like to purchase?[92m 

if %shopcmd% == help (goto shophelp)
if %shopcmd% == upgrades (goto shopupgrades)
if %shopcmd% == home (goto home)
if %shopcmd% == back (goto home)
else (goto shopinvalid)


:shopinvalid
cls
echo [31mInvalid command. Please try again.
echo.
pause
goto shop


:shophelp
cls
echo [0m[SHOP HELP]
echo What you can do at the shop.
echo.
echo    [96mhelp[0m: takes you to this page
echo    [96mupgrades[0m: takes you to the upgrades section
echo    [96mhome[0m/[96mback[0m: takes you back home
echo    (Use [96mback[0m in any shop categories to go back to the main shop)
echo.
pause
goto shop


:shopupgrades
cls
echo [0m[UPGRADES]
echo You have [33m%coins%[0m coins.
echo.
echo [96mmlt[0m-[92m%mltnum%[0m (costs [33m%mltprc%[0m): Multiplies your 'add' by [92m2 [0mper level.
set /p shopupgradecmd=What would you like to buy?[92m  
if %shopupgradecmd% == back (goto shop)
if %shopupgradecmd% == mlt (goto shopupgradebuymlt) 
else (goto shopupgradeinvalid)


:shopupgradeinvalid
cls
echo [31mThat is not an acquirable upgrade.
echo.
pause
goto shopupgrades

:shopupgradebuymlt
cls
if %coins% GEQ %mltprc% (goto shopupgradeaffordmlt)
if %coins% LSS %mltprc% (goto cantaffordupgrade)
goto shopupgradeaffordmlt

:shopupgradeaffordmlt
cls
set /a coins=coins-mltprc
set /a diamonds=diamonds+1
set /a mltnum=mltnum+1
set /a mltprc=mltprc*10
set /a addmlt=addmlt*2*boost
echo [0mYou purchased [96mmlt!
echo.
pause
goto shopupgrades


:cantaffordupgrade
cls
echo [31mYou cannot afford this.
echo.
pause
goto shopupgrades


::prestige

:prestige
cls
echo [0m[PRESTIGE]
echo Your new life awaits...
echo You can prestige when you reach [33m%presprice%[0m coins.
echo.
set /p prestigecmd=Prestige? (y/n)[92m 
if %prestigecmd% == y (goto presyes)
if %prestigecmd% == n (goto home)
goto presinvalid

:presyes
if %coins% GEQ %presprice% (goto presafford)
if %coins% LSS %presprice% (goto presnotafford)

:presafford
set /a coins=0
set /a boost=boost+diamonds
set /a diamonds=0
set /a presamnt=presamnt+1
set /a mltprc=100
set /a mltnum=0
set /a addmlt=1*boost
cls
echo [95mYou have successfully prestiged.
echo.
pause
goto home

:presnotafford
cls
echo [31mYou cannot afford to prestige yet.
echo.
pause
goto prestige 

:presinvalid
cls
echo [31mInvalid input.
echo.
pause
goto prestige




::achievements

:achievements
cls
echo [0m[ACHIEVEMENTS]
echo Here are all of the amazing things you've done.
echo.
if %havecoin1% == 1 (echo [96mThe Beginning[0m: You found one lone coin.)
if %havecoin2% == 1 (echo [96mMaking A Profit [0m: You've managed to make a stunning 1000 coins.)
if %presamnt1% == 1 (echo [96mAscension [0m: Congratulations on being reborn, I guess. You prestiged a singular time.)
echo.
pause
goto home


:achievementmanager
cls
if %coins% GEQ 1 (set /a havecoin1=1 & set /a achnum=1)
if %coins% GEQ 1000 (set /a havecoin2=1 & set /a achnum=achnum+1)
if %presamnt% GEQ 1 (set /a presamnt1=1 & set /a achnum=achnum+1)
echo Achievements checked!
goto achievements


:achievementmanagerstats
cls
if %coins% GEQ 1 (set /a havecoin1=1 & set /a achnum=1)
if %coins% GEQ 1000 (set /a havecoin2=1 & set /a achnum=achnum+1)
if %presamnt% GEQ 1 (set /a presamnt1=1 & set /a achnum=achnum+1)
echo Achievements checked!
goto stats




::stats

:stats
cls
echo [0m[STATISTICS]
echo A list reflecting your tremendous progress.
echo.
echo    Coins: [33m%coins%[0m
echo    Diamonds: [33m%diamonds%[0m
echo    Boost: [33m%boost%x[0m
echo    Add: [33m%addmlt%[0m
echo    Achievements: [33m%achnum%[0m
echo.
pause
goto home


::developer commands

:devcmd
cls
echo [0m[DEV COMMANDS]
echo Way to ruin the game, asshole.
echo.
set /p devcmdcmd=Amount:[92m 
set /a coins=coins+devcmdcmd
echo [92mCoins added!
pause
goto home



@echo off

setlocal
call :setESC

cls
echo %ESC%[101;93m STYLES %ESC%[0m
echo ^<ESC^>[0m %ESC%[0mReset%ESC%[0m
echo ^<ESC^>[1m %ESC%[1mBold%ESC%[0m
echo ^<ESC^>[4m %ESC%[4mUnderline%ESC%[0m
echo ^<ESC^>[7m %ESC%[7mInverse%ESC%[0m
echo.
echo %ESC%[101;93m NORMAL FOREGROUND COLORS %ESC%[0m
echo ^<ESC^>[30m %ESC%[30mBlack%ESC%[0m (black)
echo ^<ESC^>[31m %ESC%[31mRed%ESC%[0m
echo ^<ESC^>[32m %ESC%[32mGreen%ESC%[0m
echo ^<ESC^>[33m %ESC%[33mYellow%ESC%[0m
echo ^<ESC^>[34m %ESC%[34mBlue%ESC%[0m
echo ^<ESC^>[35m %ESC%[35mMagenta%ESC%[0m
echo ^<ESC^>[36m %ESC%[36mCyan%ESC%[0m
echo ^<ESC^>[37m %ESC%[37mWhite%ESC%[0m
echo.
echo %ESC%[101;93m NORMAL BACKGROUND COLORS %ESC%[0m
echo ^<ESC^>[40m %ESC%[40mBlack%ESC%[0m
echo ^<ESC^>[41m %ESC%[41mRed%ESC%[0m
echo ^<ESC^>[42m %ESC%[42mGreen%ESC%[0m
echo ^<ESC^>[43m %ESC%[43mYellow%ESC%[0m
echo ^<ESC^>[44m %ESC%[44mBlue%ESC%[0m
echo ^<ESC^>[45m %ESC%[45mMagenta%ESC%[0m
echo ^<ESC^>[46m %ESC%[46mCyan%ESC%[0m
echo ^<ESC^>[47m %ESC%[47mWhite%ESC%[0m (white)
echo.
echo %ESC%[101;93m STRONG FOREGROUND COLORS %ESC%[0m
echo ^<ESC^>[90m %ESC%[90mWhite%ESC%[0m
echo ^<ESC^>[91m %ESC%[91mRed%ESC%[0m
echo ^<ESC^>[92m %ESC%[92mGreen%ESC%[0m
echo ^<ESC^>[93m %ESC%[93mYellow%ESC%[0m
echo ^<ESC^>[94m %ESC%[94mBlue%ESC%[0m
echo ^<ESC^>[95m %ESC%[95mMagenta%ESC%[0m
echo ^<ESC^>[96m %ESC%[96mCyan%ESC%[0m
echo ^<ESC^>[97m %ESC%[97mWhite%ESC%[0m
echo.
echo %ESC%[101;93m STRONG BACKGROUND COLORS %ESC%[0m
echo ^<ESC^>[100m %ESC%[100mBlack%ESC%[0m
echo ^<ESC^>[101m %ESC%[101mRed%ESC%[0m
echo ^<ESC^>[102m %ESC%[102mGreen%ESC%[0m
echo ^<ESC^>[103m %ESC%[103mYellow%ESC%[0m
echo ^<ESC^>[104m %ESC%[104mBlue%ESC%[0m
echo ^<ESC^>[105m %ESC%[105mMagenta%ESC%[0m
echo ^<ESC^>[106m %ESC%[106mCyan%ESC%[0m
echo ^<ESC^>[107m %ESC%[107mWhite%ESC%[0m
echo.
echo %ESC%[101;93m COMBINATIONS %ESC%[0m
echo ^<ESC^>[31m                     %ESC%[31mred foreground color%ESC%[0m
echo ^<ESC^>[7m                      %ESC%[7minverse foreground ^<-^> background%ESC%[0m
echo ^<ESC^>[7;31m                   %ESC%[7;31minverse red foreground color%ESC%[0m
echo ^<ESC^>[7m and nested ^<ESC^>[31m %ESC%[7mbefore %ESC%[31mnested%ESC%[0m
echo ^<ESC^>[31m and nested ^<ESC^>[7m %ESC%[31mbefore %ESC%[7mnested%ESC%[0m
pause

:setESC
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set ESC=%%b
  exit /B 0
)
exit /B 0