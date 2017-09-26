mode 140,50
@echo off
Color a
Title Android Job Box v3.21 by ChevyCam94
cd >> tmp.log
set /p current=< tmp.log
del tmp.log
cd %current%\Data
set choice=0

:start
cls
Echo/
Echo    лллллл  Android Job Box v3.21  лллллл             \   /
Echo    л    лллллл By ChevyCam94 лллллл    л             ллллл
Echo    л                                   л           ллллллллл
Echo    л  [1]  Unlock bootloader           л          ллл ллл ллл
Echo    л  [2]  Relock bootloader           л          ллллллллллл
Echo    л                                   л       лл ллллллллллл лл
Echo    л  [3]  Backup and Restore          л       ллллллллллллллллл
Echo    л                                   л       ллллллллллллллллл
Echo    л  [4]  Install APKs                л       лл ллллллллллл лл
Echo    л                                   л       лл ллллллллллл лл
Echo    л  [5]  Optimizations               л          ллллллллллл
Echo    л                                   л            ллл ллл
Echo    л  [6]  Flash images                л            ллл ллл
Echo    л                                   л            ллл ллл
Echo    ллллллллллллллллллллллллллллллллллллл
Echo    л                                   л
Echo    л  [r]  Reboot...                   л
Echo    л  [e]  Exit                        л
Echo    л                                   л
Echo    ллллллллллллллллллллллллллллллллллллл
Echo/
set /p choice=Select: 
if %choice% == 1 goto unlock
if %choice% == 2 goto relock
if %choice% == 3 goto backuprestore
if %choice% == 4 goto installapks
if %choice% == 5 goto optimizations
if %choice% == 6 goto flash
if %choice% == r goto reboot
if %choice% == e goto exit
if not %choice% == 1 goto start
if not %choice% == 2 goto start
if not %choice% == 3 goto start
if not %choice% == 4 goto start
if not %choice% == 5 goto start
if not %choice% == 6 goto start
if not %choice% == r goto start
if not %choice% == e goto start

:installapks
cls
Echo/
Echo    ллллллллллллллллллллллллллллллллллллллллл
Echo    л                                       л   лллллллл
Echo    л  Install APKs:                        л   лБББББББл
Echo    л                                       л   лБлллллБл
Echo    ллллллллллллллллллллллллллллллллллллллллл   лБлллллБл
Echo    л                                       л   лБББББББл
Echo    л  [i]  Install from 'APKs' folder      л   лББAPKББл
Echo    л                                       л   лБББББББл
Echo    л  [o]  Open 'APKs' folder              л   ллллллллл
Echo    л                                       л
Echo    ллллллллллллллллллллллллллллллллллллллллл
Echo    л                                       л
Echo    л  [0]  Main menu                       л
Echo    л                                       л
Echo    ллллллллллллллллллллллллллллллллллллллллл
Echo/
set /p choice=Select: 
if %choice% == i (
  if not exist "%current%\Data\APKs" (
    Echo  'APKs' directory doesnt exist!
    timeout 2 >nul 2>&1
    goto installapks
  ) else (
    If not exist "%current%\Data\APKs\*.apk" (
      Echo  No APKs found in 'APKs' directory!
      timeout 2 >nul 2>&1
      goto installapks
    ) else (
      Echo  Installing APKs to device...
      Echo/
      For /R APKs %%G IN (*.apk) do (
        For %%a in ("%%G") do (
          set "filePath=%%~dpa"
          set "file=%%~nxa"
          Echo %%~nxa
        )
        adb install "%%G"
      )
    )
  )
  Echo/
  Echo  -= APK INSTALLS COMPLETE =-
  Echo/
  Pause
  goto installapks
)
if %choice% == o (
  if not exist "%current%\Data\APKs" mkdir "%current%\Data\APKs"
  %SystemRoot%\explorer.exe "%current%\Data\APKs"
  goto installapks
)
if %choice% == 0 goto start
if not %choice% == a goto installapks
if not %choice% == o goto installapks
if not %choice% == 0 goto installapks

:optimizations
cls
Echo/
Echo    ллллллллллллллллллллллллллллллллллллллллл
Echo    л                                       л     ллллллл
Echo    л  Optimizations:                       л   лллБББББллл
Echo    л                                       л     лБББББл
Echo    ллллллллллллллллллллллллллллллллллллллллл   лллБББББллл
Echo    л                                       л     лБББББл
Echo    л  [a]  Zipalign APKs            (adb)  л   лллБББББллл
Echo    л  [o]  Optimize OGGs            (adb)  л     ллллллл
Echo    л                                       л
Echo    ллллллллллллллллллллллллллллллллллллллллл
Echo    л                                       л
Echo    л  [0]  Main menu                       л
Echo    л                                       л
Echo    ллллллллллллллллллллллллллллллллллллллллл
Echo/
set /p choice=Select: 
if %choice% == a goto zipalignapk
if %choice% == o goto optimizeogg
if %choice% == 0 goto start
if not %choice% == a goto optimizations
if not %choice% == o goto optimizations
if not %choice% == 0 goto optimizations

:zipalignapk
cls
Echo/
Echo    ллллллллллллллллллллллллллллллллллллллллл
Echo    л                                       л     ллллллл
Echo    л  Zipalign APKs:                       л   лллБББББллл
Echo    л                                       л     лБББББл
Echo    ллллллллллллллллллллллллллллллллллллллллл   лллБББББллл
Echo    л                                       л     лБББББл
Echo    л  [a]  \system\app              (adb)  л   лллБББББллл
Echo    л  [p]  \system\priv-app         (adb)  л     ллллллл
Echo    л  [d]  \data\app                (adb)  л
Echo    л                                       л
Echo    л  [o]  Optimize ALL APKs        (adb)  л
Echo    л                                       л
Echo    ллллллллллллллллллллллллллллллллллллллллл
Echo    л                                       л
Echo    л  [0]  Optimizations menu              л
Echo    л                                       л
Echo    ллллллллллллллллллллллллллллллллллллллллл
Echo/
set /p choice=Select: 
if %choice% == a (
  cls
  Echo  Zipaligning APKs from '\system\app'
  Echo/
  Echo  Rebooting into recovery
  adb reboot recovery
  if exist TEMP rmdir /s /q TEMP
  mkdir TEMP
  Echo/
  Echo  When TWRP has fully loaded, press any key to begin...
  pause >nul 2>&1
  Echo  Mounted SYSTEM...
  adb shell twrp mount system >nul 2>&1
  Echo  Pulling APP APKs...
  adb pull /system/app/ TEMP
  Echo  Removing all non-apk files...
  for /R "TEMP" %%f in (*) do (if not "%%~xf"==".apk" del "%%~f") >nul 2>&1
  Echo  Removing all empty directories...
  for /f "usebackq delims=" %%d in (`"dir /ad/b/s | sort /R"`) do rd "%%d" >nul 2>&1
  call :subzipalign
  Echo  Pushing APKs...
  adb push TEMP\. /system
  Echo  Cleaning up local temporary files...
  rmdir /s /q TEMP
  Echo/
  Echo  -= ZIPALIGN COMPLETE =-
  Echo/
  Pause
  goto zipalignapk
)
if %choice% == p (
  cls
  Echo  Zipaligning APKs from '\system\priv-app'
  Echo/
  Echo  Rebooting into recovery
  adb reboot recovery
  if exist TEMP rmdir /s /q TEMP
  mkdir TEMP
  Echo/
  Echo  When TWRP has fully loaded, press any key to begin...
  pause >nul 2>&1
  Echo  Mounted SYSTEM...
  adb shell twrp mount system >nul 2>&1
  Echo  Pulling PRIV-APP APKs...
  if exist TEMP rmdir /s /q TEMP
  mkdir TEMP
  adb pull -a /system/priv-app TEMP
  Echo  Removing all non-apk files...
  for /R "TEMP" %%f in (*) do (if not "%%~xf"==".apk" del "%%~f") >nul 2>&1
  Echo  Removing all empty directories...
  for /f "usebackq delims=" %%d in (`"dir /ad/b/s | sort /R"`) do rd "%%d" >nul 2>&1
  call :subzipalign
  Echo  Pushing APKs...
  adb push TEMP\. /system
  Echo  Cleaning up local temporary files...
  rmdir /s /q TEMP
  Echo/
  Echo  -= ZIPALIGN COMPLETE =-
  Echo/
  Pause
  goto zipalignapk
)
if %choice% == d (
  cls
  Echo  Zipaligning APKs from '\data\app'
  Echo/
  Echo  Rebooting into recovery
  adb reboot recovery
  adb shell twrp mount system >nul 2>&1
  Echo  Pulling DATA APKs...
  if exist TEMP rmdir /s /q TEMP
  mkdir TEMP
  adb pull -a /data/app TEMP
  Echo  Removing all non-apk files...
  for /R "%current%\Data\TEMP" %%f in (*) do (if not "%%~xf"==".apk" del "%%~f") >nul 2>&1
  Echo  Removing all empty directories...
  for /f "usebackq delims=" %%d in (`"dir /ad/b/s | sort /R"`) do rd "%%d" >nul 2>&1
  call :subzipalign
  Echo  Pushing APKs...
  adb push TEMP\. /data
  Echo  Cleaning up local temporary files...
  rmdir /s /q TEMP
  Echo/
  Echo  -= ZIPALIGN COMPLETE =-
  Echo/
  Pause
  goto zipalignapk
)
if %choice% == o (
  cls
  Echo  Zipaligning ALL APKs
  Echo/
  Echo  Rebooting into recovery
  adb reboot recovery
  adb wait-for-usb-recovery
  Echo RECOVERY FOUND
  adb shell twrp mount system >nul 2>&1
  ECHO MOUNTED SYSTEM
  Echo  Preparing to zipalign ALL APKs...
  Echo/
  Echo  Zipaligning APKs from '\system\app'
  Echo/
  Pause
  Echo  Pulling APKs...
  if exist TEMP rmdir /s /q TEMP
  mkdir TEMP
  adb pull /system/app TEMP
  Echo  Removing all non-apk files...
  for /R "%current%\Data\TEMP" %%f in (*) do (if not "%%~xf"==".apk" del "%%~f") >nul 2>&1
  Echo  Removing all empty directories...
  for /f "usebackq delims=" %%d in (`"dir /ad/b/s | sort /R"`) do rd "%%d" >nul 2>&1
  call :subzipalign
  Echo  Pushing APKs...
  adb push TEMP\. /system/app
  rmdir /s /q TEMP
  Echo/
  Echo/
  Echo  Zipaligning APKs from '\system\priv-app'
  Echo/
  Pause
  Echo  Pulling APKs...
  if exist TEMP rmdir /s /q TEMP
  mkdir TEMP
  adb pull  /system/priv-app TEMP
  Echo  Removing all non-apk files...
  for /R "TEMP" %%f in (*) do (if not "%%~xf"==".apk" del "%%~f") >nul 2>&1
  Echo  Removing all empty directories...
  for /f "usebackq delims=" %%d in (`"dir /ad/b/s | sort /R"`) do rd "%%d" >nul 2>&1
  call :subzipalign
  Echo  Pushing APKs...
  adb push TEMP\. /system/priv-app
  rmdir /s /q TEMP
  Echo/
  Echo/
  Echo  Zipaligning APKs from '\data\app'
  Echo/
  Echo  Pulling APKs...
  if exist TEMP rmdir /s /q TEMP
  mkdir TEMP
  adb pull /data/app TEMP
  Echo  Removing all non-apk files...
  for /R "TEMP" %%f in (*) do (if not "%%~xf"==".apk" del "%%~f") >nul 2>&1
  Echo  Removing all empty directories...
  for /f "usebackq delims=" %%d in (`"dir /ad/b/s | sort /R"`) do rd "%%d" >nul 2>&1
  call :subzipalign
  Echo  Pushing APKs...
  adb push TEMP\. /data/app
  Echo  Cleaning up local temporary files...
  rmdir /s /q TEMP
  Echo/
  Echo  -= ZIPALIGN COMPLETE =-
  Echo/
  Pause
  goto zipalignapk
)
if %choice% == 0 goto optimizations
if not %choice% == a goto zipalignapk
if not %choice% == p goto zipalignapk
if not %choice% == d goto zipalignapk
if not %choice% == o goto zipalignapk
if not %choice% == 0 goto zipalignapk

:optimizeogg
cls
Echo/
Echo    ллллллллллллллллллллллллллллллллллллллллл
Echo    л                                       л     ллллллл
Echo    л  Optimizations:                       л   лллБББББллл
Echo    л                                       л     лБББББл
Echo    ллллллллллллллллллллллллллллллллллллллллл   лллБББББллл
Echo    л                                       л     лБББББл
Echo    л  -OGG-                                л   лллБББББллл
Echo    л  [a]  Optimize ALARMS          (adb)  л     ллллллл
Echo    л  [n]  Optimize NOTIFICATIONS   (adb)  л
Echo    л  [r]  Optimize RINGTONES       (adb)  л
Echo    л  [u]  Optimize UI SOUNDS       (adb)  л
Echo    л                                       л
Echo    л  [aa] Optimize ALL AUDIO       (adb)  л
Echo    л                                       л
Echo    ллллллллллллллллллллллллллллллллллллллллл
Echo    л                                       л
Echo    л  [0]  Optimizations menu              л
Echo    л                                       л
Echo    ллллллллллллллллллллллллллллллллллллллллл
Echo/
set /p choice=Select: 
if %choice% == a (
  cls
  adb wait-for-usb-recovery
  adb shell twrp mount system >nul 2>&1
  call :suboggpreopt
  Echo  Pulling alarms files...
  adb pull -a /system/media/audio/alarms %current%\Data\OGG
  move %current%\Data\OGG\alarms\*.ogg %current%\Data\OGG >nul 2>&1
  rmdir /s /q %current%\Data\OGG\alarms
  call :suboggopt
  Echo  Finished compression...
  Echo  Pushing optimized audio back to device...
  adb push %current%\Data\OGG\. /system/media/audio/alarms
  call :suboggpostopt
  goto optimizeogg
)
if %choice% == n (
  cls
  adb wait-for-usb-recovery
  adb shell twrp mount system >nul 2>&1
  call :suboggpreopt
  Echo  Pulling notifications files...
  adb pull -a /system/media/audio/notifications %current%\Data\OGG
  move %current%\Data\OGG\notifications\*.ogg %current%\Data\OGG >nul 2>&1
  rmdir /s /q %current%\Data\OGG\notifications
  call :suboggopt
  Echo  Finished compression...
  Echo  Pushing optimized audio back to device...
  adb push %current%\Data\OGG\. /system/media/audio/notifications
  call :suboggpostopt
  goto optimizeogg
)
if %choice% == r (
  cls
  adb wait-for-usb-recovery
  adb shell twrp mount system >nul 2>&1
  call :suboggpreopt
  Echo  Pulling ringtones files...
  adb pull -a /system/media/audio/ringtones %current%\Data\OGG
  move %current%\Data\OGG\ringtones\*.ogg %current%\Data\OGG >nul 2>&1
  rmdir /s /q %current%\Data\OGG\ringtones
  call :suboggopt
  Echo  Finished compression...
  Echo  Pushing optimized audio back to device...
  adb push %current%\Data\OGG\. /system/media/audio/ringtones
  call :suboggpostopt
  goto optimizeogg
)
if %choice% == u (
  cls
  adb wait-for-usb-recovery
  adb shell twrp mount system >nul 2>&1
  call :suboggpreopt
  Echo  Pulling ui files...
  adb pull -a /system/media/audio/ui %current%\Data\OGG
  move %current%\Data\OGG\ui\*.ogg %current%\Data\OGG >nul 2>&1
  rmdir /s /q %current%\Data\OGG\ui
  call :suboggopt
  Echo  Finished compression...
  Echo  Pushing optimized audio back to device...
  adb push %current%\Data\OGG\. /system/media/audio/ui
  call :suboggpostopt
  goto optimizeogg
)
if %choice% == aa (
  cls
  adb wait-for-usb-recovery
  adb shell twrp mount system >nul 2>&1
  call :suboggpreopt
  Echo  Pulling ALARMS...
  adb pull -a /system/media/audio/notifications %current%\Data\OGG
  move %current%\Data\OGG\notifications\*.ogg %current%\Data\OGG >nul 2>&1
  rmdir /s /q %current%\Data\OGG\notifications
  Echo  Optimizing ALARMS...
  call :suboggopt
  Echo  Pushing ALARMS...
  adb push %current%\Data\OGG\. /system/media/audio/alarms
  rmdir /s /q %current%\Data\OGG
  Echo/
  Echo  Pulling NOTIFICATIONS...
  adb pull -a /system/media/audio/notifications %current%\Data\OGG
  move %current%\Data\OGG\notifications\*.ogg %current%\Data\OGG >nul 2>&1
  rmdir /s /q %current%\Data\OGG\notifications
  Echo  Optimizing NOTIFICATIONS...
  call :suboggopt
  Echo  Pushing NOTIFICATIONS...
  adb push %current%\Data\OGG\. /system/media/audio/alarms
  rmdir /s /q %current%\Data\OGG
  Echo/
  Echo  Pulling RINGTONES...
  adb pull -a /system/media/audio/ringtones %current%\Data\OGG
  move %current%\Data\OGG\ringtones\*.ogg %current%\Data\OGG >nul 2>&1
  rmdir /s /q %current%\Data\OGG\ringtones
  Echo  Optimizing RINGTONES...
  call :suboggopt
  Echo  Pushing RINGTONES...
  adb push %current%\Data\OGG\. /system/media/audio/ringtones
  rmdir /s /q %current%\Data\OGG
  Echo/
  Echo  Pulling UI...
  adb pull -a /system/media/audio/ui %current%\Data\OGG
  move %current%\Data\OGG\ui\*.ogg %current%\Data\OGG >nul 2>&1
  rmdir /s /q %current%\Data\OGG\ui
  Echo  Optimizing UI...
  call :suboggopt
  Echo  Pushing UI...
  adb push %current%\Data\OGG\. /system/media/audio/ui
  rmdir /s /q %current%\Data\OGG
  Echo/
  Echo  All audio optimizations complete!
  Pause
  goto optimizeogg
)
if %choice% == 0 goto optimizations
if not %choice% == a goto optimizeogg
if not %choice% == n goto optimizeogg
if not %choice% == r goto optimizeogg
if not %choice% == u goto optimizeogg
if not %choice% == aa goto optimizeogg
if not %choice% == 0 goto optimizeogg

:unlock
cls
Echo/
Echo    ллллллллллллллллллллллллллллллллллл
Echo    л                                 л      ллл
Echo    л  Unlock bootloader:             л     л   л
Echo    л                                 л     л   л
Echo    л  [1]  fastboot flashing unlock  л         л
Echo    л  [2]  fastboot oem unlock       л    ллллллл
Echo    л                                 л    ллллллл
Echo    л  [0]  Main menu                 л    ллллллл
Echo    л                                 л    ллллллл
Echo    ллллллллллллллллллллллллллллллллллл
Echo/
set /p choice=Select: 
if %choice% == 1 goto ffu
if %choice% == 2 (
  cls
  fastboot oem unlock
  Pause
  goto start
)
if %choice% == 0 goto start
if not %choice% == 1 goto unlock
if not %choice% == 2 goto unlock
if not %choice% == 0 goto unlock

:ffu
cls
Echo/
Echo    ллллллллллллллллллллллллллллллллллллл
Echo    л                                   л      ллл
Echo    л  Unlock bootloader:               л     л   л
Echo    л                                   л     л   л
Echo    л  [1]  WITH backup     (adb)       л         л
Echo    л  [2]  WITHOUT backup  (fastboot)  л    ллллллл
Echo    л                                   л    ллллллл
Echo    л  [0]  Unlock menu                 л    ллллллл
Echo    л                                   л    ллллллл
Echo    ллллллллллллллллллллллллллллллллллллл
Echo/
set /p choice=Select: 
if %choice% == 1 (
  cls
  call :subfullbackup
  adb reboot bootloader
  Echo  Waiting for fastboot...
  timeout 15 >nul 2>&1
  fastboot flashing unlock
  Pause
  goto start
)
if %choice% == 2 (
  cls
  adb reboot bootloader
  Echo  Waiting for fastboot...
  timeout 15 >nul 2>&1
  fastboot flashing unlock
  Pause
  goto start
)
if %choice% == 0 goto unlock
if not %choice% == 1 goto ffu
if not %choice% == 2 goto ffu
if not %choice% == 0 goto ffu

:relock
cls
Echo/
Echo    ллллллллллллллллллллллллллллллллл
Echo    л                               л
Echo    л  Relock bootloader:           л      ллл
Echo    л                               л     л   л
Echo    л  [1]  fastboot flashing lock  л     л   л
Echo    л  [2]  fastboot oem lock       л    ллллллл
Echo    л                               л    ллллллл
Echo    л  [0]  Main menu               л    ллллллл
Echo    л                               л    ллллллл
Echo    ллллллллллллллллллллллллллллллллл
Echo/
set /p choice=Select: 
if %choice% == 1 goto ffl
if %choice% == 2 (
  cls
  adb reboot bootloader
  Echo  Waiting for fastboot...
  timeout 15 >nul 2>&1
  fastboot oem lock
  Pause
  goto start
)
if %choice% == 0 goto start
if not %choice% == 1 goto relock
if not %choice% == 2 goto relock
if not %choice% == 0 goto relock

:ffl
cls
Echo/
Echo    ллллллллллллллллллллллллллллллллллллл
Echo    л                                   л
Echo    л  Relock bootloader:               л      ллл
Echo    л                                   л     л   л
Echo    л  [1]  WITH backup     (adb)       л     л   л
Echo    л  [2]  WITHOUT backup  (fastboot)  л    ллллллл
Echo    л                                   л    ллллллл
Echo    л  [0]  Relock menu                 л    ллллллл
Echo    л                                   л    ллллллл
Echo    ллллллллллллллллллллллллллллллллллллл
Echo/
set /p choice=Select: 
if %choice% == 1 (
  cls
  call :subfullbackup
  adb reboot bootloader
  Echo  Waiting for fastboot...
  timeout 15 >nul 2>&1
  fastboot flashing lock
  Pause
  goto start
)
if %choice% == 2 (
  cls
  adb reboot bootloader
  Echo  Waiting for fastboot...
  timeout 15 >nul 2>&1
  fastboot flashing lock
  Pause
  goto start
)
if %choice% == 0 goto relock
if not %choice% == 1 goto ffl
if not %choice% == 2 goto ffl
if not %choice% == 0 goto ffl

:backuprestore
cls
Echo/
Echo    ллллллллллллллллллллллллллллл
Echo    л                           л
Echo    л  Backup and Restore:      л
Echo    л                           л     ллл                    ллл
Echo    л  [b]  Backup...           л    лБББлллл         л     лБББлллл
Echo    л  [r]  Restore...          л    лББББББл          л    лББББББл
Echo    л                           л    лББББББл   ллллллллл   лББББББл
Echo    л  [o]  Open backup folder  л    лББББББл          л    лББББББл
Echo    л                           л    лллллллл         л     лллллллл
Echo    л  [0]  Main menu           л
Echo    л                           л
Echo    ллллллллллллллллллллллллллллл
Echo/
set /p choice=Select: 
if %choice% == b goto backup
if %choice% == r goto restore
if %choice% == o (
  %SystemRoot%\explorer.exe "%current%\Backup"
  goto backuprestore
)
if %choice% == 0 goto start
if not %choice% == b goto backuprestore
if not %choice% == r goto backuprestore
if not %choice% == o goto backuprestore
if not %choice% == 0 goto backuprestore

:backup
cls
Echo/
Echo    ллллллллллллллллллллллллллллллллллллллл
Echo    л                                     л
Echo    л   The following are pulled from     л
Echo    л    -= INTERNAL STORAGE ONLY =-      л
Echo    л                                     л
Echo    ллллллллллллллллллллллллллллллллллллллл
Echo    л                                     л
Echo    л  Backup:                            л
Echo    л                                     л
Echo    л  [f]  Full Backup                   л
Echo    л                                     л
Echo    л  [c]  Camera                        л
Echo    л  [d]  Downloads                     л
Echo    л  [m]  Music                         л
Echo    л  [p]  Pictures                      л
Echo    л  [v]  Videos                        л
Echo    л                                     л
Echo    л  [a]  Application data              л
Echo    л                                     л
Echo    л  [0]  Backup/Restore menu           л
Echo    л                                     л
Echo    ллллллллллллллллллллллллллллллллллллллл
Echo/
set /p choice=Select: 
if %choice% == f (
  cls
  call :subfullbackup
  goto backup
)
if %choice% == c (
  cls
  mkdir %current%\Backup >nul 2>&1
  if not exist %current%\Backup\DCIM (
    adb pull -a /sdcard/DCIM/ "%current%\Backup\DCIM"
    Echo/
    Pause
    goto backup
  )
  if exist %current%\Backup\DCIM (
    adb pull -a /sdcard/DCIM/ "%current%\Backup"
    Echo/
    Pause
    goto backup
  )
)
if %choice% == d (
  cls
  mkdir %current%\Backup >nul 2>&1
  if not exist %current%\Backup\Download (
    adb pull -a /sdcard/Download/ "%current%\Backup\Download"
    Echo/
    Pause
    goto backup
  )
  if exist %current%\Backup\Download (
    adb pull -a /sdcard/Download/ "%current%\Backup"
    Echo/
    Pause
    goto backup
  )
)
if %choice% == m (
  cls
  mkdir %current%\Backup >nul 2>&1
  if not exist %current%\Backup\Music (
    adb pull -a /sdcard/Music "%current%\Backup\Music"
    Echo/
    Pause
    goto backup
  )
  if exist %current%\Backup\Music (
    adb pull -a /sdcard/Music/ "%current%\Backup"
    Echo/
    Pause
    goto backup
  )
)
if %choice% == p (
  cls
  mkdir %current%\Backup >nul 2>&1
  if not exist %current%\Backup\Pictures (
    adb pull -a /sdcard/Pictures "%current%\Backup\Pictures"
    Echo/
    Pause
    goto backup
  )
  if exist %current%\Backup\Pictures (
    adb pull -a /sdcard/Pictures/ "%current%\Backup"
    Echo/
    Pause
    goto backup
  )
)
if %choice% == v (
  cls
  mkdir %current%\Backup >nul 2>&1
  if not exist %current%\Backup\Video (
    adb pull -a /sdcard/Video "%current%\Backup\Video"
    Echo/
  )
  if not exist %current%\Backup\Videos (
    adb pull -a /sdcard/Videos "%current%\Backup\Videos"
    Echo/
    Pause
    goto backup
  )
  if exist %current%\Backup\Video (
    adb pull -a /sdcard/Video/ "%current%\Backup"
    Echo/
  )
  if exist %current%\Backup\Videos (
    adb pull -a /sdcard/Videos/ "%current%\Backup"
    Echo/
    Pause
    goto backup
  )
)
if %choice% == a (
  cls
  mkdir %current%\Backup >nul 2>&1
  if not exist %current%\Backup\Android (
    adb pull -a /sdcard/Android "%current%\Backup\Android"
    Echo/
    Pause
    goto backup
  )
  if exist %current%\Backup\Android (
    adb pull -a /sdcard/Android/ "%current%\Backup"
    Echo/
    Pause
    goto backup
  )
)
if %choice% == 0 goto backuprestore
if not %choice% == f goto backup
if not %choice% == c goto backup
if not %choice% == d goto backup
if not %choice% == p goto backup
if not %choice% == m goto backup
if not %choice% == v goto backup
if not %choice% == a goto backup
if not %choice% == 0 goto backup

:restore
cls
Echo/
Echo    ллллллллллллллллллллллллллллллллллллллл
Echo    л                                     л
Echo    л    The following are pushed to      л
Echo    л    -= INTERNAL STORAGE ONLY =-      л
Echo    л                                     л
Echo    ллллллллллллллллллллллллллллллллллллллл
Echo    л                                     л
Echo    л  Restore:                           л
Echo    л                                     л
Echo    л  [f]  Full Restore                  л
Echo    л                                     л
Echo    л  [c]  Camera                        л
Echo    л  [d]  Downloads                     л
Echo    л  [m]  Music                         л
Echo    л  [p]  Pictures                      л
Echo    л  [v]  Videos                        л
Echo    л                                     л
Echo    л  [a]  Application data              л
Echo    л                                     л
Echo    л  [0]  Backup/Restore menu           л
Echo    л                                     л
Echo    ллллллллллллллллллллллллллллллллллллллл
Echo/
set /p choice=Select: 
if %choice% == f (
  cls
  if not exist "%current%\Backup" (
    Echo  No backup to push back to device!
    goto restore
  ) else (
    Echo  Performing a full restore to 'sdcard'
    Echo/
    Echo  Depending on how much data you have,
    Echo  this could take a while!
    Echo/
    Echo  Restoring...
    adb push %current%\Backup\. /sdcard
    Echo/
    Echo  -= RESTORE COMPLETE =-
    Echo/
  )
  Pause
  goto restore
)
if %choice% == c (
  cls
  if not exist "%current%\Backup\DCIM" (
    Echo  Nothing in 'DCIM'
  ) else (
    Echo  Restoring DCIM...
    adb push "%current%\Backup\DCIM\Camera" /sdcard
    Echo/
    Echo  -= RESTORE COMPLETE =-
    Echo/
  )
  Pause
  goto restore
)
if %choice% == d (
  cls
  if not exist "%current%\Backup\Download" (
    Echo  Nothing in 'Download'
    goto restore
  ) else (
    Echo  Restoring downloads...
    adb push "%current%\Backup\Download" /sdcard
    Echo/
    Echo  -= RESTORE COMPLETE =-
    Echo/
  )
  Pause
  goto restore
)
if %choice% == m (
  cls
  if not exist "%current%\Backup\Music" (
    Echo  Nothing in 'Music'
    Pause
    goto restore
  ) else (
    Echo  Restoring music...
    adb push "%current%\Backup\Music" /sdcard
    Echo/
    Echo  -= RESTORE COMPLETE =-
    Echo/
  )
  Pause
  goto restore
)
if %choice% == p (
  cls
  if not exist "%current%\Backup\Pictures" (
    Echo  Nothing in 'Pictures'
  ) else (
    Echo  Restoring pictures...
    adb push "%current%\Backup\Pictures" /sdcard
    Echo/
    Echo  -= RESTORE COMPLETE =-
    Echo/
  )
  Pause
  goto restore
)
if %choice% == v (
  cls
  if not exist "%current%\Backup\Video" (
    Echo  Nothing in 'Video'
  ) else (
    Echo  Restoring video...
    adb push "%current%\Backup\Video" /sdcard
    Echo/
    Echo  -= RESTORE COMPLETE =-
    Echo/
  )
  if not exist "%current%\Backup\Videos" (
    Echo  Nothing in 'Videos'
  ) else (
    Echo  Restoring videos...
    adb push "%current%\Backup\Videos" /sdcard
    Echo/
    Echo  -= RESTORE COMPLETE =-
    Echo/
  )
  Pause
  goto restore
)
if %choice% == a (
  cls
  if not exist "%current%\Backup\Android" (
    Echo  Nothing in 'Android'
    goto restore
  ) else (
    Echo  Restoring application data...
    adb push "%current%\Backup\Android" /sdcard
    Echo/
    Echo  -= RESTORE COMPLETE =-
    Echo/
  )
  Pause
  goto restore
)
if %choice% == 0 goto backuprestore
if not %choice% == f goto restore
if not %choice% == c goto restore
if not %choice% == d goto restore
if not %choice% == p goto restore
if not %choice% == m goto restore
if not %choice% == v goto restore
if not %choice% == a goto restore
if not %choice% == 0 goto restore

:reboot
cls
Echo/
Echo    ллллллллллллллллллллллллллллллллллллллллллл         лллллллл
Echo    л                                         л       лл        лл
Echo    л  Choose reboot method:                  л      л            л
Echo    л                                         л     л
Echo    л  [ra]  Reboot device (via adb)          л    л               л
Echo    л  [rf]  Reboot device (via fastboot)     л    л              ллл
Echo    л  [rr]  Reboot into recovery             л    л             л л л
Echo    л  [rb]  Reboot into bootloader           л    л               л
Echo    л                                         л     л              л
Echo    л  [0]   Main menu                        л      л            л
Echo    л                                         л       лл        лл
Echo    ллллллллллллллллллллллллллллллллллллллллллл         лллллллл
Echo/
set /p choice=Select: 
if %choice% == ra goto ra
if %choice% == rf goto rf
if %choice% == rr goto rr
if %choice% == rb goto rb
if %choice% == 0 goto start
if not %choice% == ra goto reboot
if not %choice% == rf goto reboot
if not %choice% == rr goto reboot
if not %choice% == rb goto reboot
if not %choice% == 0 goto reboot

:rf
cls
Echo/
Echo    ллллллллллллллллллллллллллллллл
Echo    л                             л
Echo    л  Reboot device?             л
Echo    л  Must be in "fastboot"      л
Echo    л                             л
Echo    л  [y]  Yes                   л
Echo    л                             л
Echo    л  [0]  Reboot menu           л
Echo    л                             л
Echo    ллллллллллллллллллллллллллллллл
Echo/
set /p choice=Select: 
if %choice% == y (
  fastboot reboot
  goto start
)
if %choice% == 0 goto reboot
if not %choice% == y goto rf
if not %choice% == 0 goto rf

:ra
cls
Echo/
Echo    ллллллллллллллллллллллллллллллл
Echo    л                             л
Echo    л  Reboot device?             л
Echo    л  Must NOT be in "fastboot"  л
Echo    л                             л
Echo    л  [y]  Yes                   л
Echo    л                             л
Echo    л  [0]  Reboot menu           л
Echo    л                             л
Echo    ллллллллллллллллллллллллллллллл
Echo/
set /p choice=Select: 
if %choice% == y (
  adb reboot
  goto start
)
if %choice% == 0 goto reboot
if not %choice% == y goto ra
if not %choice% == 0 goto ra

:rr
cls
Echo/
Echo    ллллллллллллллллллллллллллллллл
Echo    л                             л
Echo    л  Reboot into recovery?      л
Echo    л  Must NOT be in "fastboot"  л
Echo    л                             л
Echo    л  [y]  Yes                   л
Echo    л                             л
Echo    л  [0]  Reboot menu           л
Echo    л                             л
Echo    ллллллллллллллллллллллллллллллл
Echo/
set /p choice=Select: 
if %choice% == y (
  adb reboot recovery
  goto start
)
if %choice% == 0 goto reboot
if not %choice% == y goto rr
if not %choice% == 0 goto rr

:rb
cls
Echo/
Echo    ллллллллллллллллллллллллллллллл
Echo    л                             л
Echo    л  Reboot into bootloader?    л
Echo    л  Must NOT be in "fastboot"  л
Echo    л                             л
Echo    л  [y]  Yes                   л
Echo    л                             л
Echo    л  [0]  Reboot menu           л
Echo    л                             л
Echo    ллллллллллллллллллллллллллллллл
Echo/
set /p choice=Select: 
if %choice% == y (
  adb reboot bootloader
  goto start
)
if %choice% == 0 goto reboot
if not %choice% == y goto rb
if not %choice% == 0 goto rb

:flash
cls
Echo/
Echo    лллллллллллллллллллллллллллллл
Echo    л                            л    лллллллл
Echo    л  Flash images:             л    лББББББл               ллллл
Echo    л                            л    лББББББл         л     лБББл
Echo    л  [fr]  Flash recovery      л    лББББББл          л    лБББл
Echo    л                            л    лллллллл   ллллллллл   лБББл
Echo    л  [0]   Main menu           л    л######л          л    лБББл
Echo    л                            л    лллллллл         л     ллллл
Echo    лллллллллллллллллллллллллллллл
Echo/
set /p choice=Select: 
if %choice% == fr goto flashrecovery
if %choice% == 0 goto start
if not %choice% == fr goto flash
if not %choice% == 0 goto flash

:flashrecovery
cls
Echo/
Echo    лллллллллллллллллллллллллллллллллллллл
Echo    л                                    л    лллллллл
Echo    л  Flash recovery:                   л    лББББББл               ллллл
Echo    л                                    л    лББББББл         л     лБББл
Echo    л  [fr]  "recovery.img"  (fastboot)  л    лББББББл          л    лБББл
Echo    л        (in /Data)                  л    лллллллл   ллллллллл   лБББл
Echo    л                                    л    л######л          л    лБББл
Echo    л  [0]   Flash menu                  л    лллллллл         л     ллллл
Echo    л                                    л
Echo    лллллллллллллллллллллллллллллллллллллл
Echo/
set /p choice=Select: 
if %choice% == fr (
  Echo/
  fastboot flash recovery "%current%/Data/recovery.img"
  Echo/
  Pause
  goto start
)
if %choice% == 0 goto flash
if not %choice% == fr goto flashrecovery
if not %choice% == 0 goto flashrecovery

:suboggpreopt
  rmdir /s /q %current%\Data\OGG
  md OGG
  cls
  Echo/
goto :eof

:suboggopt
  Echo  Optimizing audio files...
  for %%a in ("%current%\Data\OGG\*.ogg") do (
    sox.exe %%a -C 0 "%%a"
  )
goto :eof

:suboggpostopt
  rmdir /s /q %current%\Data\OGG
  Echo/
  Echo  Optimizations complete!
  Pause
goto :eof

:subzipalign
  Echo  Zipaligning apks...
  REM  #### THIS IS FOR NEWER SYSTEMS
  For /R TEMP\* %%G IN (*.apk) do (
    zipalign -f 4 %%G %%G_zipaligned
    del %%G >nul 2>&1
    copy %%G_zipaligned %%G >nul 2>&1
    del %%G_zipaligned >nul 2>&1
  )
  REM  #### THIS IS FOR OLDER SYSTEMS
  For /R TEMP %%G IN (*.apk) do (
    zipalign -f 4 %%G %%G_zipaligned
    del %%G >nul 2>&1
    copy %%G_zipaligned %%G >nul 2>&1
    del %%G_zipaligned >nul 2>&1
  )
goto :eof

:subfullbackup
  cls
  Echo/
  Echo    лллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
  Echo    л                                                        л
  Echo    л  [o]  Overwrite local files with current device files  л
  Echo    л  [w]  Wipe current local backups and start fresh       л
  Echo    л                                                        л
  Echo    л  [0]  Backup menu                                      л
  Echo    л                                                        л
  Echo    лллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
  Echo/
  set /p choice=Select: 
  if %choice% == o (
    cls
    Echo  Merging device files with existing local files
    Echo/
    Echo  Depending on how much data you have,
    Echo  this could take a couple hours.
    Echo/
    Echo  Backing up...
    adb pull -a /sdcard/. "%current%\Backup"
    Echo/
    Echo  -= BACKUP COMPLETE =-
    Pause
    goto :eof
  )
  if %choice% == w (
    cls
    Echo/
    Echo  Removing all current local files in 'Full_Backup'
    rmdir /s /q %current%\Backup >nul 2>&1
    Echo  -= DONE =-
    Echo/
    Echo  Depending on how much data you have,
    Echo  this could take a couple hours.
    Echo/
    Echo  Backing up...
    adb pull -a /sdcard/. "%current%\Backup"
    Echo/
    Echo  -= BACKUP COMPLETE =-
    Pause
    goto :eof
  )
  if %choice% == 0 goto backup
  if not %choice% == o goto subfullbackup
  if not %choice% == w goto subfullbackup
  if not %choice% == 0 goto subfullbackup

:exit
cls
Echo/
Echo    ллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
Echo    л                                                       лл
Echo    л        Thank you for choosing Android Job Box!        лБл
Echo    л  If you found this helpful, please consider donating  лБл
Echo    л                                                       лБл
Echo    л    No part of this script may be copied, modified     лБл
Echo    л    redistributed, or included anywhere without my     лБл
Echo    л               explicit written consent                лБл
Echo    л                                                       лБл
Echo    л   Credit to Lexmazter for the original script base    лБл
Echo    л   Credit to Chris Bagwell for SOX                     лБл
Echo    л   Credit to Google for the adb/fastboot binaries      лБл
Echo    л                                                       лБл
Echo    лллллллллллллллллллллллллллллллллллллллллллллллллллллллллБл
Echo     лББББББББББББББББББББББББББББББББББББББББББББББББББББББББл
Echo      ллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
Echo/
timeout 5 >nul 2>&1
exit