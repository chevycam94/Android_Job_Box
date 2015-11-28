mode 140,50
@echo off
Color a
Title Android Job Box v1.30 by ChevyCam94
cd >> tmp.log
set /p current=< tmp.log
del tmp.log
cd %current%\Data

:start
cls
Echo.
Echo    лллллллллллл Android Job Box v1.30 лллллллллллл             \   /
Echo    л          ллллл By ChevyCam94 ллллл          л             ллллл
Echo    л                                             л           ллллллллл
Echo    л  [1] Unlock bootloader          (fastboot)  л          ллл ллл ллл
Echo    л  [2] Relock bootloader          (fastboot)  л          ллллллллллл
Echo    л  [3] Backup and Restore...      (adb)       л       лл ллллллллллл лл
Echo    л  [4] Flash images...                        л       ллллллллллллллллл
Echo    л                                             л       лл ллллллллллл лл
Echo    ллллллллллллллллллллллллллллллллллллллллллллллл       лл ллллллллллл лл
Echo    л                                             л       лл ллллллллллл лл
Echo    л [r]    Reboot...                            л          ллллллллллл
Echo    л [e]    Exit                                 л            ллл ллл
Echo    л                                             л            ллл ллл
Echo    ллллллллллллллллллллллллллллллллллллллллллллллл            ллл ллл
Echo.
set /p choice=Select: 
if %choice% == 1 goto unlock
if %choice% == 2 goto relock
if %choice% == 3 goto backuprestore
if %choice% == 4 goto flash
if %choice% == r goto reboot
if %choice% == e goto exit
if not %choice% == 1 goto start
if not %choice% == 2 goto start
if not %choice% == 3 goto start
if not %choice% == 4 goto start
if not %choice% == r goto start
if not %choice% == e goto start

:unlock
cls
Echo.
Echo    лллллллллллллллллллллллллллллллллл
Echo    л                                л      ллл
Echo    л  Unlock bootloader:            л     л   л
Echo    л                                л     л   л
Echo    л  [1] fastboot flashing unlock  л         л
Echo    л  [2] fastboot oem unlock       л    ллллллл
Echo    л                                л    ллллллл
Echo    л  [0] Main Menu                 л    ллллллл
Echo    л                                л    ллллллл
Echo    лллллллллллллллллллллллллллллллллл
Echo.
@echo off
set /p choice=Select: 
if %choice% == 1 goto ffu
)
if %choice% == 2 (
Echo.
fastboot oem unlock
Echo.
goto start
)
if %choice% == 0 goto start
if not %choice% == 1 goto unlock
if not %choice% == 2 goto unlock
if not %choice% == 0 goto unlock

:ffu
cls
Echo.
Echo    лллллллллллллллллллллллллллллллллллл
Echo    л                                  л      ллл
Echo    л  Unlock bootloader:              л     л   л
Echo    л                                  л     л   л
Echo    л  [1] WITH backup     (adb)       л         л
Echo    л  [2] WITHOUT backup  (fastboot)  л    ллллллл
Echo    л                                  л    ллллллл
Echo    л  [0] Unlock menu                 л    ллллллл
Echo    л                                  л    ллллллл
Echo    лллллллллллллллллллллллллллллллллллл
Echo.
@echo off
set /p choice=Select: 
if %choice% == 1 (
Echo.
set /p backupname=Enter a name for your backup: 
adb backup -all -f "%current%\Backup\%backupname%.ab"
fastboot flashing unlock
Pause
goto start
)
if %choice% == 2 (
Echo.
fastboot flashing unlock
Echo.
Pause
goto start
)
if %choice% == 0 goto unlock
if not %choice% == 1 goto ffu
if not %choice% == 2 goto ffu
if not %choice% == 0 goto ffu

:relock
cls
Echo.
Echo    лллллллллллллллллллллллллллллллл
Echo    л                              л
Echo    л  Relock bootloader:          л      ллл
Echo    л                              л     л   л
Echo    л  [1] fastboot flashing lock  л     л   л
Echo    л  [2] fastboot oem lock       л    ллллллл
Echo    л                              л    ллллллл
Echo    л  [0] Main Menu               л    ллллллл
Echo    л                              л    ллллллл
Echo    лллллллллллллллллллллллллллллллл
Echo.
@echo off
set /p choice=Select: 
if %choice% == 1 goto ffl
)
if %choice% == 2 (
Echo.
fastboot oem lock
Echo.
Pause
goto start
)
if %choice% == 0 goto start

if not %choice% == 1 goto relock
if not %choice% == 2 goto relock
if not %choice% == 0 goto relock

:ffl
cls
Echo.
Echo    лллллллллллллллллллллллллллллллллллл
Echo    л                                  л
Echo    л  Relock bootloader:              л      ллл
Echo    л                                  л     л   л
Echo    л  [1] WITH backup     (adb)       л     л   л
Echo    л  [2] WITHOUT backup  (fastboot)  л    ллллллл
Echo    л                                  л    ллллллл
Echo    л  [0] Relock menu                 л    ллллллл
Echo    л                                  л    ллллллл
Echo    лллллллллллллллллллллллллллллллллллл
Echo.
@echo off
set /p choice=Select: 
if %choice% == 1 (
Echo.
set /p backupname=Enter a name for your backup: 
adb backup -all -f "%current%\Backup\%backupname%.ab"
fastboot flashing lock
Pause
goto start
)
if %choice% == 2 (
Echo.
fastboot flashing lock
Echo.
Pause
goto start
)
if %choice% == 0 goto relock
if not %choice% == 1 goto ffl
if not %choice% == 2 goto ffl
if not %choice% == 0 goto ffl

:backuprestore
cls
Echo.
Echo    лллллллллллллллллллллллллллл
Echo    л                          л
Echo    л  Backup and Restore:     л
Echo    л                          л     ллл                    ллл
Echo    л  [b] Backup...           л    лБББлллл         л     лБББлллл
Echo    л  [r] Restore...          л    лББББББл          л    лББББББл
Echo    л                          л    лББББББл   ллллллллл   лББББББл
Echo    л  [o] Open backup folder  л    лББББББл          л    лББББББл
Echo    л                          л    лллллллл         л     лллллллл
Echo    л  [0] Main Menu           л
Echo    л                          л
Echo    лллллллллллллллллллллллллллл
Echo.
set /p choice=Select: 
if %choice% == b goto backup
if %choice% == r goto restore
if %choice% == o goto open
if %choice% == 0 goto start
if not %choice% == b goto backuprestore
if not %choice% == r goto backuprestore
if not %choice% == o goto backuprestore
if not %choice% == 0 goto backuprestore

:backup
cls
Echo.
Echo    лллллллллллллллллллллллллллллллллллллл
Echo    л                                    л
Echo    л  Backup:                           л
Echo    л                                    л
Echo    л  [f] Full backup                   л
Echo    л                                    л
Echo    лллллллллллллллллллллллллллллллллллллл
Echo    л                                    л
Echo    л   The following are pulled from    л
Echo    л    -= INTERNAL STORAGE ONLY =-     л
Echo    л                                    л
Echo    л  [d] Downloads                     л
Echo    л  [p] Pictures                      л
Echo    л  [v] Videos                        л
Echo    л  [m] Music                         л
Echo    л                                    л
Echo    л  [a] Application data              л
Echo    л                                    л
Echo    л  [0] Backup/Restore menu           л
Echo    л                                    л
Echo    лллллллллллллллллллллллллллллллллллллл
Echo.
set /p choice=Select: 
if %choice% == f (
Echo.
set /p backupname=Enter a name for your backup: 
adb backup -all -f "%current%\Backup\%backupname%.ab"
Echo.
Pause
goto backup
)
if %choice% == d (
Echo.
if not exist "%current%\Backup\Files\Download" mkdir "%current%\Backup\Files\Download"
adb pull /sdcard/Download "%current%\Backup\Files\Download"
Echo.
Pause
goto backup
)
if %choice% == p (
Echo.
if not exist "%current%\Backup\Files\Pictures" mkdir "%current%\Backup\Files\Pictures"
if not exist "%current%\Backup\Files\DCIM\Camera" mkdir "%current%\Backup\Files\DCIM\Camera"
adb pull /sdcard/Pictures "%current%\Backup\Files\Pictures"
adb pull /sdcard/DCIM/Camera "%current%\Backup\Files\DCIM\Camera"
Echo.
Pause
goto backup
)
if %choice% == m (
Echo.
if not exist "%current%\Backup\Files\Music" mkdir "%current%\Backup\Files\Music"
adb pull /sdcard/Music "%current%\Backup\Files\Music"
Echo.
Pause
goto backup
)
if %choice% == v (
Echo.
if not exist "%current%\Backup\Files\Video" mkdir "%current%\Backup\Files\Video"
if not exist "%current%\Backup\Files\Videos" mkdir "%current%\Backup\Files\Videos"
adb pull /sdcard/Video "%current%\Backup\Files\Video"
adb pull /sdcard/Videos "%current%\Backup\Files\Videos"
Echo.
Pause
goto backup
)
if %choice% == a (
Echo.
if not exist "%current%\Backup\Files\Android" mkdir "%current%\Backup\Files\Android"
adb pull /sdcard/Android "%current%\Backup\Files\Android"
Echo.
Pause
goto backup
)
if %choice% == 0 goto backuprestore
if not %choice% == f goto backup
if not %choice% == d goto backup
if not %choice% == p goto backup
if not %choice% == m goto backup
if not %choice% == v goto backup
if not %choice% == a goto backup
if not %choice% == 0 goto backup

:restore
cls
Echo.
Echo    лллллллллллллллллллллллллллллллллллллл
Echo    л                                    л
Echo    л  Restore:                          л
Echo    л                                    л
Echo    л  [f] Full restore                  л
Echo    л                                    л
Echo    лллллллллллллллллллллллллллллллллллллл
Echo    л                                    л
Echo    л    The following are pushed to     л
Echo    л    -= INTERNAL STORAGE ONLY =-     л
Echo    л                                    л
Echo    л  [d] Downloads                     л
Echo    л  [p] Pictures                      л
Echo    л  [v] Videos                        л
Echo    л  [m] Music                         л
Echo    л                                    л
Echo    л  [a] Application data              л
Echo    л                                    л
Echo    л  [0] Backup/Restore menu           л
Echo    л                                    л
Echo    лллллллллллллллллллллллллллллллллллллл
Echo.
set /p choice=Select: 
if %choice% == f (
Echo.
set /p backupname=Enter the name of your backup: 
adb restore "%current%\Backup\%backupname%.ab"
Echo.
Pause
goto restore
)

if %choice% == d (
Echo.
  if not exist "%current%\Backup\Files\Download" (
    Echo    Nothing in "Download"
    @ping localhost -n 2 >NUL
    goto restore
  ) else (
    adb push "%current%\Backup\Files\Download" /sdcard/Download
    Pause
    goto restore
  )
)

if %choice% == p (
Echo.
  if not exist "%current%\Backup\Files\Pictures" (
    Echo    Nothing in "Pictures"
    @ping localhost -n 2 >NUL
  ) else (
    adb push "%current%\Backup\Files\Pictures" /sdcard/Pictures
    Echo.
  )
  if not exist "%current%\Backup\Files\DCIM\Camera" (
    Echo    Nothing in "DCIM\Camera"
    @ping localhost -n 2 >NUL
    goto restore
  ) else (
    adb push "%current%\Backup\Files\DCIM\Camera" /sdcard/DCIM/Camera
    Pause
    goto restore
  )
)

if %choice% == m (
Echo.
  if not exist "%current%\Backup\Files\Music" (
    Echo    Nothing in "Music"
    @ping localhost -n 2 >NUL
  ) else (
    adb push "%current%\Backup\Files\Music" /sdcard/Music
    Pause
    goto restore
  )
)

if %choice% == v (
Echo.
  if not exist "%current%\Backup\Files\Video" (
    Echo    Nothing in "Video"
    @ping localhost -n 2 >NUL
  ) else (
    adb push "%current%\Backup\Files\Video" /sdcard/Video
    Echo.
  )
  if not exist "%current%\Backup\Files\Videos" (
    Echo    Nothing in "Videos"
    @ping localhost -n 2 >NUL
    goto restore
  ) else (
    adb push "%current%\Backup\Files\Videos" /sdcard/Videos
    Pause
    goto restore
  )
)

if %choice% == a (
Echo.
  if not exist "%current%\Backup\Files\Android" (
    Echo    Nothing in "Android"
    @ping localhost -n 2 >NUL
  ) else (
    adb push "%current%\Backup\Files\Android" /sdcard/Android
    Pause
    goto restore
  )
)

if %choice% == 0 goto backuprestore
if not %choice% == f goto restore
if not %choice% == d goto restore
if not %choice% == p goto restore
if not %choice% == m goto restore
if not %choice% == v goto restore
if not %choice% == a goto restore
if not %choice% == 0 goto restore

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
if not %choice% == rda goto reboot
if not %choice% == rdf goto reboot
if not %choice% == rr goto reboot
if not %choice% == rb goto reboot
if not %choice% == 0 goto reboot

:rdf
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

:rda
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

:rb
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
adb reboot bootloader
goto reboot

:flash
cls
Echo.
Echo    лллллллллллллллллллллллллллллл
Echo    л                            л    лллллллл
Echo    л  Flash images:             л    л      л               ллллл
Echo    л                            л    л      л         л     лБББл
Echo    л  [fr] Flash recovery       л    л      л          л    лБББл
Echo    л                            л    лллллллл   ллллллллл   лБББл
Echo    л  [0] Main Menu             л    лББББББл          л    лБББл
Echo    л                            л    лллллллл         л     ллллл
Echo    лллллллллллллллллллллллллллллл
Echo.
set /p choice=Select: 
if %choice% == fr goto flashrecovery
if %choice% == 0 goto start
if not %choice% == fr goto flash
if not %choice% == 0 goto flash

:flashrecovery
cls
Echo.
Echo    ллллллллллллллллллллллллллллллллллллл
Echo    л                                   л    лллллллл
Echo    л  Flash recovery:                  л    л      л               ллллл
Echo    л                                   л    л      л         л     лБББл
Echo    л  [fr] "recovery.img"  (fastboot)  л    л      л          л    лБББл
Echo    л       (in /Data)                  л    лллллллл   ллллллллл   лБББл
Echo    л                                   л    лББББББл          л    лБББл    
Echo    л  [0] Flash menu                   л    лллллллл         л     ллллл
Echo    л                                   л
Echo    ллллллллллллллллллллллллллллллллллллл
Echo.
set /p choice=Select: 
if %choice% == fr (
Echo.
fastboot flash recovery %current%/Data/recovery.img
Echo.
Pause
goto start
)
if %choice% == 0 goto flash
if not %choice% == fr goto flashrecovery
if not %choice% == 0 goto flashrecovery

:exit
cls
Echo.
Echo    ллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
Echo    л                                                       лл
Echo    л        Thank you for choosing Android Job Box!        лБл
Echo    л  If you found this helpful, please consider donating  лБл
Echo    л                                                       лБл
Echo    л   Credit to Lexmazter for the original script that    лБл
Echo    л                 this is based off of                  лБл
Echo    л                                                       лБл
Echo    лллллллллллллллллллллллллллллллллллллллллллллллллллллллллБл
Echo     лБББББББББББББББББББББББББББББББББББББББББББББББББББББББлл
Echo      ллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
Echo.
@ping localhost -n 3 >NUL
exit