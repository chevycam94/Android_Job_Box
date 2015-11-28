@echo off
Color a
Android Job Box v1.00 by ChevyCam94
cd >> tmp.log
set /p current=< tmp.log
del tmp.log
cd %current%\Data

:start
cls
Echo.
Echo    лллллллллллл Android Job Box v1.00 лллллллллллл              \   /
Echo    л          ллллл By ChevyCam94 ллллл          л              ллллл
Echo    л                                             л            ллллллллл
Echo    л  [1] Unlock bootloader          (fastboot)  л           ллл ллл ллл
Echo    л  [2] Relock bootloader          (fastboot)  л           ллллллллллл
Echo    л  [3] Backup and Restore...      (adb)       л        лл ллллллллллл лл
Echo    л                                             л        ллллллллллллллллл
Echo    л                                             л        лл ллллллллллл лл
Echo    ллллллллллллллллллллллллллллллллллллллллллллллл        лл ллллллллллл лл
Echo    л                                             л        лл ллллллллллл лл
Echo    л [r]    Reboot...                            л           ллллллллллл
Echo    л [e]    Exit                                 л             ллл ллл
Echo    л                                             л             ллл ллл
Echo    ллллллллллллллллллллллллллллллллллллллллллллллл             ллл ллл
Echo.
@echo off
set /p choice=Select:

if %choice% == 1 goto bootloader
if %choice% == 2 goto relock
if %choice% == 3 goto backuprestore

if %choice% == r goto reboot
if %choice% == e goto exit

if not %choice% == 1 goto restart
if not %choice% == 2 goto restart
if not %choice% == 3 goto restart
if not %choice% == r goto restart
if not %choice% == e goto restart

:bootloader
cls
Echo.
Echo    лллллллллллллллллллллллллллл      ллл
Echo    л                          л     л   л
Echo    л  Unlock the bootloader?  л         л
Echo    л  Must be in "fastboot"   л    ллллллл
Echo    л    Abort with CTRL+C     л    ллллллл
Echo    л                          л    ллллллл
Echo    лллллллллллллллллллллллллллл    ллллллл
Echo.
Pause
Echo.
fastboot oem unlock
Echo.
Pause
goto start

:relock
cls
Echo.
Echo    лллллллллллллллллллллллллллл      ллл
Echo    л                          л     л   л
Echo    л  Relock the bootloader?  л     л   л
Echo    л  Must be in "fastboot"   л    ллллллл
Echo    л    Abort with CTRL+C     л    ллллллл
Echo    л                          л    ллллллл
Echo    лллллллллллллллллллллллллллл    ллллллл
Echo.
Pause
Echo.
fastboot oem lock
Echo.
Pause
goto start

:backuprestore
cls
Echo.
Echo    лллллллллллллллллллллллллллллл
Echo    л                            л
Echo    л  Backup and Restore:       л     ллл                    ллл
Echo    л                            л    л   лллл         л     л   лллл
Echo    л  [b] Backup                л    л      л          л    л      л
Echo    л  [r] Restore               л    л      л   ллллллллл   л      л
Echo    л  [o] Open backup folder    л    л      л          л    л      л
Echo    л                            л    лллллллл         л     лллллллл
Echo    л  [0] Main Menu             л
Echo    л                            л
Echo    лллллллллллллллллллллллллллллл
Echo.
set /p choice=Select:
if %choice% == b goto backup
if %choice% == r goto restore
if %choice% == o goto open
if %choice% == 0 goto start
Echo.
Pause
goto start

:backup
cls
Echo.
Echo    лллллллллллллллллллллллллллллллллллллл
Echo    л                                    л
Echo    л  Create a backup:                  л
Echo    л                                    л
Echo    л  Enter a name for your backup.     л
Echo    л  Find your backups in Data/Backup  л
Echo    л  folder with the name you gave it  л
Echo    л                                    л
Echo    л    Abort with CTRL+C               л
Echo    л                                    л
Echo    лллллллллллллллллллллллллллллллллллллл
Echo.
Pause
Echo.
set /p backupname=Enter a name for your backup:
adb backup -all -f "%whereami%\Backup\%backupname%.ab"
Echo.
Pause
goto backuprestore

:restore
cls
Echo.
Echo    лллллллллллллллллллллллллллллллллллллл
Echo    л                                    л
Echo    л  Restore a backup:                 л
Echo    л                                    л
Echo    л  Enter the name of your backup or  л
Echo    л  find your backups in Data/Backup  л
Echo    л  folder with the name you gave it  л
Echo    л                                    л
Echo    л    Abort with CTRL+C               л
Echo    л                                    л
Echo    лллллллллллллллллллллллллллллллллллллл
Echo.
Pause
Echo.
set /p backupname=Enter the name of your backup:
adb restore "%current%\Backup\%backupname%.ab"
Echo.
Pause
goto backuprestore

:open
cls
%SystemRoot%\explorer.exe "%current%\Backup"
Pause
goto backuprestore

:reboot
cls
Echo.
Echo    ллллллллллллллллллллллллллллллллллллллллллл         лллллллл
Echo    л                                         л       лл        лл
Echo    л  Choose reboot method:                  л      л            л
Echo    л                                         л     л
Echo    л  [rda] Reboot device (via adb)          л    л               л
Echo    л  [rdf] Reboot device (via fastboot)     л    л              ллл
Echo    л  [rr]  Reboot into recovery             л    л             л л л
Echo    л  [rb]  Reboot into bootloader           л    л               л
Echo    л                                         л     л              л
Echo    л  [0]   Main Menu                        л      л            л
Echo    л                                         л       лл        лл
Echo    ллллллллллллллллллллллллллллллллллллллллллл         лллллллл
Echo.
set /p choice=Select:
if %choice% == rda goto rda
if %choice% == rdf goto rdf
if %choice% == rr goto rr
if %choice% == rb goto rb
if %choice% == 0 goto start
Echo.
Pause
goto start

:rda
cls
Echo.
Echo    ллллллллллллллллллллллллллллллл
Echo    л                             л
Echo    л  Reboot device?             л
Echo    л  Must be in "fastboot"      л
Echo    л                             л
Echo    л    Abort with CTRL+C        л
Echo    л                             л
Echo    ллллллллллллллллллллллллллллллл
Echo.
Pause
Echo.
fastboot reboot
goto reboot

:rdf
cls
Echo.
Echo    ллллллллллллллллллллллллллллллл
Echo    л                             л
Echo    л  Reboot device?             л
Echo    л  Must NOT be in "fastboot"  л
Echo    л                             л
Echo    л    Abort with CTRL+C        л
Echo    л                             л
Echo    ллллллллллллллллллллллллллллллл
Echo.
Pause
Echo.
adb reboot
goto reboot

:rr
cls
Echo.
Echo    ллллллллллллллллллллллллллллллл
Echo    л                             л
Echo    л  Reboot into recovery?      л
Echo    л  Must NOT be in "fastboot"  л
Echo    л                             л
Echo    л    Abort with CTRL+C        л
Echo    л                             л
Echo    ллллллллллллллллллллллллллллллл
Echo.
Pause
Echo.
adb reboot recovery
goto reboot

:rr
cls
Echo.
Echo    ллллллллллллллллллллллллллллллл
Echo    л                             л
Echo    л  Reboot into bootloader?    л
Echo    л  Must NOT be in "fastboot"  л
Echo    л                             л
Echo    л    Abort with CTRL+C        л
Echo    л                             л
Echo    ллллллллллллллллллллллллллллллл
Echo.
Pause
Echo.
adb reboot-bootloader
goto reboot

:restart
set /p _ok=* Invalid entry! Please choose again  *
@ping localhost -n 2 >NUL
goto start

:exit
cls
Echo.
Echo    ллллллллллллллллллллллллллллллллллллллллллллллллллллллллл      \ /
Echo    л                                                       л      ллл
Echo    л  Thank you for choosing Android Job Box!              л     л л л
Echo    л  If you found this helpful, please consider donating  л  л ллллллл л
Echo    л                                                       л  ллллллллллл
Echo    л  Credit to Lexmazter for the original script that     л  л ллллллл л
Echo    л  this is based off of                                 л  л ллллллл л
Echo    л                                                       л     лл лл
Echo    ллллллллллллллллллллллллллллллллллллллллллллллллллллллллл     лл лл
Echo.
@ping localhost -n 3 >NUL
exit