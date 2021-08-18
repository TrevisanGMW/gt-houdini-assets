@echo off
@title =  Auto Installer for GT Houdini Assets
SET CopyDirDestination=%UserProfile%\Documents\
SET CopyDirSource=%~dp0
SET CopyDirSourceAssets=%~dp0assets
SET CopyDirSourcePackages=%~dp0packages
SET JsonPackagePathPlaceholder=PATHPLACEHOLDER
SET ManualInstallationURL=https://github.com/TrevisanGMW/gt-houdini-assets
SET ExtractionDirAssets=%~dp0assets
SET ExtractionDirPackages=%~dp0packages

:MENU
@echo off
cls
color 06
@echo on
@echo.
@echo.
@echo        лллллл  лллллллл     лл   лл  лллллл  лл    лл лллллл  лл ллл    лл лл
@echo       лл          лл        лл   лл лл    лл лл    лл лл   лл лл лллл   лл лл    
@echo       лл   ллл    лл        ллллллл лл    лл лл    лл лл   лл лл лл лл  лл лл
@echo       лл    лл    лл        лл   лл лл    лл лл    лл лл   лл лл лл  лл лл лл
@echo        лллллл     лл        лл   лл  лллллл   лллллл  лллллл  лл лл   лллл лл
@echo.
@echo    	         ллллл  ллллллл ллллллл ллллллл лллллллл ллллллл 
@echo     	        лл   лл лл      лл      лл         лл    лл      
@echo     	        ллллллл ллллллл ллллллл ллллл      лл    ллллллл 
@echo      	        лл   лл      лл      лл лл         лл         лл 
@echo      	        лл   лл ллллллл ллллллл ллллллл    лл    ллллллл 
@echo.
@echo                     ллллллл ллллллл лллллллл лл    лл лллллл  
@echo                     лл      лл         лл    лл    лл лл   лл 
@echo                     ллллллл ллллл      лл    лл    лл лллллл  
@echo                          лл лл         лл    лл    лл лл      
@echo                     ллллллл ллллллл    лл     лллллл  лл   
@echo.
@echo.
@echo.
@echo. 	1 = Install GT Houdini Assets
@echo. 	2 = Uninstall GT Houdini Assets
@echo. 	3 = About Installer
@echo.
@echo.
@echo off
SET /P M=Type 1, 2 or 3 then press ENTER:
IF %M%==1 GOTO INSTALL
IF %M%==2 GOTO UNINSTALL
IF %M%==3 GOTO ABOUT
GOTO EOF

REM Main Function
:INSTALL

IF NOT EXIST %ExtractionDirAssets% ( GOTO SETUP_MISSING_ASSETS ) 
IF NOT EXIST %ExtractionDirPackages% ( GOTO SETUP_MISSING_ASSETS ) 
IF EXIST %CopyDirDestination% (
	GOTO VALID_DOCS_DIR
) ELSE (
	GOTO MISSING_EXTRACTED_DIR
)

:VALID_DOCS_DIR
CD /D %CopyDirDestination%
for /D %%s in (.\*) do CALL :get_houdini_folders %%s
IF %RobocopyError%==1 GOTO robocopy_error
GOTO INSTALLATION_COMPLETE
EXIT /B %ERRORLEVEL% 

REM Start installation for every version
:get_houdini_folders
echo %~1|findstr /r "[a-z]*houdini" >nul  && ( CALL :build_path %%~1 )
EXIT /B 0

:build_path
SET version=%~1
SET version_no_dot=%version:.\=%
CALL :copy_asset_files %CopyDirDestination%%version_no_dot%\gt-houdini-assets
CALL :copy_json_files %CopyDirDestination%%version_no_dot%\packages
CALL :check_json_existence %CopyDirDestination%%version_no_dot%\packages
EXIT /B 0

:copy_asset_files
SET RobocopyError=0
IF EXIST "%CopyDirSourceAssets% " (
	ROBOCOPY "%CopyDirSourceAssets% " "%~1 "  /Z /IF "*.hda" /njh /njs /ndl /nc /ns
	IF %ERRORLEVEL%==16 SET RobocopyError=1
) 
EXIT /B 0

:copy_json_files
SET RobocopyError=0
IF EXIST "%CopyDirSourcePackages% " (
	ROBOCOPY "%CopyDirSourcePackages%" "%~1 "  /Z /IF "*.json" /njh /njs /ndl /nc /ns
	IF %ERRORLEVEL%==16 SET RobocopyError=1
) 
EXIT /B 0

:check_json_existence
SET JsonPackagePath=%~1\gt-houdini-assets.json
IF EXIST %JsonPackagePath% ( CALL :check_import_existence %JsonPackagePath% ) ELSE ( GOTO MISSING_EXTRACTED_DIR )
EXIT /B 0

:check_import_existence
>nul findstr "%JsonPackagePathPlaceholder%" %~1 && (
  CALL :add_assets_path %~1
) || (
  REM No placeholder string found
)
EXIT /B 0

:add_assets_path
SET backSlashPath=%CopyDirDestination%%version_no_dot%\gt-houdini-assets
SET forwardSlashPath=%backSlashPath:\=/%

setlocal enableextensions disabledelayedexpansion
set "search=PATHPLACEHOLDER"
set "replace=%forwardSlashPath%"

set "jsonFile=%~1"
    for /f "delims=" %%i in ('type "%jsonFile%" ^& break ^> "%jsonFile%" ') do (
        set "line=%%i"
        setlocal enabledelayedexpansion
        >>"%jsonFile%" echo(!line:%search%=%replace%!
        endlocal
    )
EXIT /B 0


REM Start uninstall
:UNINSTALL
IF EXIST %CopyDirDestination% (
	GOTO VALID_HOUDINI_DIR_UNINSTALL
) ELSE (
	GOTO MISSING_HOUDINI_DIR_UNINSTALL
)

:VALID_HOUDINI_DIR_UNINSTALL
CD /D %CopyDirDestination%
for /D %%s in (.\*) do CALL :get_houdini_folders_uninstall %%s
GOTO UNINSTALLATION_COMPLETE
EXIT /B %ERRORLEVEL% 

:get_houdini_folders_uninstall
echo %~1|findstr /r "[a-z]*houdini" >nul  && ( CALL :build_path_uninstall %%~1 )
EXIT /B 0

:build_path_uninstall
SET version=%~1
SET version_no_dot=%version:.\=%
CALL :remove_json_file %CopyDirDestination%%version_no_dot%\packages
del /q /f /s %CopyDirDestination%%version_no_dot%\gt-houdini-assets
rmdir /q /s %CopyDirDestination%%version_no_dot%\gt-houdini-assets
EXIT /B 0

:remove_json_file
del /q /f %~1\gt-houdini-assets.json
EXIT /B 0


REM Install Feedback
:MISSING_EXTRACTED_DIR
@echo off
color 0C
cls
@echo on
@echo.
@echo.
@echo       ллллллл лллллл  лллллл   лллллл  лллллл  
@echo       лл      лл   лл лл   лл лл    лл лл   лл 
@echo       ллллл   лллллл  лллллл  лл    лл лллллл  
@echo       лл      лл   лл лл   лл лл    лл лл   лл 
@echo       ллллллл лл   лл лл   лл  лллллл  лл   лл 
@echo.
@echo.
@echo       Documents directory was not found. 
@echo       You might have to install the assets manually.
@echo       Learn how to fix this issue in the "About Installer" option.
@echo.
@echo.
@echo off
SET /P AREYOUSURE=Would you like to open the instructions for the manual installation (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO EOF
start "" %ManualInstallationURL%
GOTO EOF

:robocopy_error
@echo off
color 0C
cls
@echo on
@echo.
@echo.
@echo       ллллллл лллллл  лллллл   лллллл  лллллл  
@echo       лл      лл   лл лл   лл лл    лл лл   лл 
@echo       ллллл   лллллл  лллллл  лл    лл лллллл  
@echo       лл      лл   лл лл   лл лл    лл лл   лл 
@echo       ллллллл лл   лл лл   лл  лллллл  лл   лл 
@echo.
@echo.
@echo       An error was raised when copying the files. 
@echo       The installation might have succeeded, but the script can't confirm that. 
@echo       You might have to install the scripts manually.
@echo       Learn how to possibly fix this issue in the "About Installer" option.
@echo.
@echo.
@echo off
SET /P AREYOUSURE=Would you like to open the instructions for the manual installation (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO EOF
start "" %ManualInstallationURL%
GOTO EOF

:INSTALLATION_COMPLETE
@echo off
color 0A
cls
@echo on
@echo.   
@echo.                                   
@echo       лллллл   лллллл  ллл    лл ллллллл 
@echo       лл   лл лл    лл лллл   лл лл      
@echo       лл   лл лл    лл лл лл  лл ллллл   
@echo       лл   лл лл    лл лл  лл лл лл      
@echo       лллллл   лллллл  лл   лллл ллллллл 
@echo.     
@echo.  
@echo       Please restart Houdini to load the assets.
@echo.  
@echo. 
@echo off      
pause               
GOTO EOF

REM Uninstall Feedback
:MISSING_HOUDINI_DIR_UNINSTALL
@echo off
color 0C
cls
@echo on
@echo.
@echo.
@echo       ллллллл лллллл  лллллл   лллллл  лллллл  
@echo       лл      лл   лл лл   лл лл    лл лл   лл 
@echo       ллллл   лллллл  лллллл  лл    лл лллллл  
@echo       лл      лл   лл лл   лл лл    лл лл   лл 
@echo       ллллллл лл   лл лл   лл  лллллл  лл   лл 
@echo.
@echo.
@echo       Houdini directory was not found. 
@echo       You might have to uninstall the scripts manually.
@echo       Learn how to fix this issue in the "About Installer" option.
@echo.
@echo.
@echo off
SET /P AREYOUSURE=Would you like to open the instructions for the manual uninstallation (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO EOF
start "" %ManualInstallationURL%
GOTO EOF



:UNINSTALLATION_COMPLETE
@echo off
color 0A
cls
@echo on
@echo.   
@echo.                                   
@echo       лллллл   лллллл  ллл    лл ллллллл 
@echo       лл   лл лл    лл лллл   лл лл      
@echo       лл   лл лл    лл лл лл  лл ллллл   
@echo       лл   лл лл    лл лл  лл лл лл      
@echo       лллллл   лллллл  лл   лллл ллллллл 
@echo.     
@echo.  
@echo       Assets were removed.
@echo       Json package file was removed.
@echo.  
@echo. 
@echo off      
pause                   
GOTO EOF


:SETUP_MISSING_ASSETS
@echo off
color 0C
cls
@echo on
@echo.
@echo.
@echo       ллллллл лллллл  лллллл   лллллл  лллллл  
@echo       лл      лл   лл лл   лл лл    лл лл   лл 
@echo       ллллл   лллллл  лллллл  лл    лл лллллл  
@echo       лл      лл   лл лл   лл лл    лл лл   лл 
@echo       ллллллл лл   лл лл   лл  лллллл  лл   лл 
@echo.
@echo.
@echo       The setup file can't find one of the necessary folders.
@echo       Missing "assets" or "packages".
@echo       Did you properly extract the files before running it?
@echo.
@echo.
@echo off
pause
GOTO MENU


:ABOUT
@echo off
color 02
cls
@echo on
@echo.
@echo.                _
@echo.               ( )                 GT Houdini Assets Setup
@echo.                H                  
@echo.                H                  This batch file attempts to automatically install gt houdini assets
@echo.               _H_                 using a Houdini package.
@echo.            .-'-.-'-.
@echo.           /         \             It assumes that the Houdini preferences are stored in the default path
@echo.          !           !            under "Documents\houdini#.#"  (#.# being the version number)
@echo.          !   .-------'._          
@echo.          !  / /  '.' '. \         This is what the script does when installing:
@echo.          !  \ \ @   @ / /         1. It copies necessary assets to all "houdini#.#" folders.
@echo.          !   '---------'          2. It creates a json containg the path to the assets.
@echo.          !    _______!            3. It copies this generated json file to "Documents\houdini#.#\packages"
@echo.          !  .'-+-+-+!             
@echo.          !  '.-+-+-+!             
@echo.          !    """""" !            This is what the script does when uninstalling:
@echo.          '-._______.-'            1. It removes the installed assets.
@echo.                                   2. It removes the generated json file.
@echo. 
@echo. 
@echo. 
@echo off
pause
GOTO MENU

:EOF
EXIT