REM Code started from here
@echo off
call :setWindowProperty
title ©Hamzie
goto :main

:setWindowProperty
 title ©Hamzie
  mode con: cols=65 lines=22
  color 2f
goto :eof
goto :eof


:main
 cls
 if "%messageCode%"=="welcome" (
  call :welcomeMesssage
 ) else if "%messageCode%"=="pathnotfounderror" (
  call :pathnotfounderror
 ) else if "%messageCode%"=="success" (
  call :success
 ) else if "%messageCode%"=="error" (
  call :error
 ) else if "%messageCode%"=="contact" (
  call :contact
 ) else (
  call :error
 )
 echo [1] Hide
 echo [2] Unhide
 echo [3] Log History
 echo [4] Contact Us
 echo [5] Update
 echo [6] Exit
 echo ©Hamzie V0.1
 echo *****************************************************************
 set /p option="Enter your Choice: "
 
 call :operation %option%
 
goto :main

:welcomeMesssage
 cls
 echo *****************************************************************
 echo *       Welcome!                                                *
 echo *       This is a Batch Program for YouTube.                    *
 echo *       Choose option below                                     *  
 echo *****************************************************************
goto :eof

:error  
 cls
 echo *****************************************************************
 echo *       Sorry!                                                  *
 echo *       Choice is Incorrect!                                    *
 echo *       Please Choose option below                              *  
 echo ***************************************************************** 
goto :eof 

:success
 cls
 echo *****************************************************************
 echo *       Congratulations...!!                                    *
 echo *       Operation Done Successfully..!!                         *
 echo *       Please Choose option below                              *  
 echo *****************************************************************   
goto :eof

:pathnotfounderror
 cls
 echo *****************************************************************
 echo *       Sorry...!!                                              *
 echo *       File/Folder Does not Exists..!!                         *
 echo *       Please Choose option below                              *  
 echo *****************************************************************
goto :eof

:update
 cls
 echo *****************************************************************
 echo *       Installing the latest Version..                         *
 echo *       Please wait..                                           *
 echo *                                                               *  
 echo *****************************************************************
curl https://github.com/yuzu-emu/yuzu-canary/releases/download/canary-1760/yuzu-windows-msvc-20181227-03a06b5.zip --output ©HamzieLatestVersion
pause
goto :eof

:exit
exit

:: errorcode401.blogspot.in

:operation
 if %~1==1 (
  call :hide
 ) else if %~1==2 (
  call :unhide
 ) else if %~1==3 (
  call :log
 ) else if %~1==4 (
  set messageCode=contact
 ) else if %~1==5 (
  call :update
 ) else if %~1==6 (
  call :exit
 )else (
  set messageCode=error
 )
goto :eof


:hide
 cls
 set /p folderpath="Enter path of File/Folder to Hide : "
  if exist "%folderpath%" (
   attrib +h +s "%folderpath%"
   cd %setupPath%
   echo Operation: Hide     ^Date^&Time : %date% %time%    FolderPath: "%folderpath%" >> log.txt
   set messageCode=success
  ) else (
   set messageCode=pathnotfounderror
  )
goto :eof

:unhide
 cls
 set /p folderpath="Enter path of File/Folder to Unhide : "
 if exist "%folderpath%" (
  attrib -h -s "%folderpath%"
  cd %setupPath%
  echo Operation: Unhide   ^Date^&Time : %date% %time%    FolderPath: "%folderpath%" >> log.txt
  set messageCode=success
 ) else (
  set messageCode=pathnotfounderror
 )
goto :eof

:log
 cd %setupPath%
 start log.txt
goto :eof

:contact
 cls
 echo *****************************************************************
 echo *       If you have any problem or you need any help            *
 echo *       You can Contact Us by bolow EmailID                     *
 echo *       Site	   :   https://Hamzie.8b.io/                  *  
 echo *       YouTube      :          @Hamzie                         *
 echo *****************************************************************
goto :eof

:error  
 cls
 echo *****************************************************************
 echo *       Sorry...!!                                              *
 echo *       Choice is Incorrect..!!                                 *
 echo *       Please Choose option below                              *  
 echo ***************************************************************** 
goto :eof 
REM Code ended from here
