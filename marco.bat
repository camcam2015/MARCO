echo off
setlocal enabledelayedexpansion

echo Welcome to Marco.
echo %progLoc%
if not exist %progLoc%marcos (
	echo "marcos" folder not found. Creating...
	md %progLoc%marcos
)

:home
echo:
echo -home-
set /P cmdprompt=Enter command: 
if /i "%cmdprompt%"=="list" goto list
if /i "%cmdprompt%"=="add" goto add
if /i "%cmdprompt%"=="remove" goto remove
if /i "%cmdprompt%"=="delete" goto remove
if /i "%cmdprompt%"=="run" goto run
if /i "%cmdprompt%"=="rename" goto rename
if /i "%cmdprompt%"=="info" goto info
if /i "%cmdprompt%"=="edit" goto edit
goto error

:run:
set /P runProgram=Enter Marco: 
for /f "tokens=1-4 delims=," %%G IN (%progLoc%marcos\%runProgram%.txt) DO (
	if "%%G"=="website" start chrome "%%H"
	if "%%G"=="program" (
		TASKLIST /fi "imagename eq %%I" | find "%%I" >nul
		if errorlevel 1 (
			start "%%J" /d "%%H" "%%I" && echo %%I opened.
		) else echo %%I is already running.
	)
)
goto home

:list:
for %%G in ("%progLoc%marcos\*txt") do @echo ^|%%~nG
goto home

:add:
set /P add=Enter new Marco name: 
copy nul "%progLoc%marcos\%add%.txt " 
goto home

:remove:
set /P remove=Enter Marco deletion: 
if exist %progLoc%marcos\%remove%.txt (
	del /p %progLoc%marcos\%remove%.txt
	echo Removed.
) else echo File does not exist.
goto home

:rename:
set /P source=Rename Marco source: 
set /P target=Rename Marco target: 
ren %progLoc%marcos\%source%.txt %target%.txt && echo File name changed.
goto home

:edit:
set /P editing=Enter file to edit: 
if exist %progLoc%marcos\%editing%.txt (set /P editconfirm=Confirm? Y/N: ) else (echo File does not exist.)
if /i "!editconfirm!"=="n" echo Cancelling...
if /i "!editconfirm!"=="y" goto editmarco
goto home

:editmarco:
echo editing marco...
start "marco" /d "%progLoc%marcos\" "%editing%.txt" && echo %editing% opened.
goto home

:info:
echo:
set /P editing=Enter file to view: 
if exist %progLoc%marcos\%editing%.txt (
	echo Marcos: 
	for /f "tokens=1-4 delims=," %%G IN (%progLoc%marcos\%editing%.txt) DO (
		if "%%G"=="website" echo type: %%G    name: %%I    URL: %%H
		if "%%G"=="program" echo type: %%G    name: %%J    path: %%H    file: %%I
	)
) else echo File does not exist.
goto home

:error:
echo Invalid command.
echo:
goto home