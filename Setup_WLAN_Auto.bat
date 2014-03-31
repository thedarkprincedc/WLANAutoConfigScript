@ECHO OFF
cls
SET OSVersion=Unknown

VER | FINDSTR /L "5.0" > NUL
IF %ERRORLEVEL% EQU 0 SET OSVersion=2000

VER | FINDSTR /L "5.1." > NUL
IF %ERRORLEVEL% EQU 0 SET OSVersion=XP

VER | FINDSTR /L "5.2." > NUL
IF %ERRORLEVEL% EQU 0 SET OSVersion=2003

VER | FINDSTR /L "6.0." > NUL
IF %ERRORLEVEL% EQU 0 SET OSVersion=Vista

VER | FINDSTR /L "6.1." > NUL
IF %ERRORLEVEL% EQU 0 SET OSVersion=7

VER | FINDSTR /L "6.2." > NUL
IF %ERRORLEVEL% EQU 0 SET OSVersion=7

IF %OSVersion%==Unknown (
 ECHO Unable to determine your version of Windows.
) ELSE (
 ECHO You appear to be using Windows %OSVersion%
)

IF %OSVersion%==7 goto :Win7
IF %OSVersion%==Vista goto :Vista

:Win7
echo Begin Import  
netsh wlan add profile filename="profiles\mykeuka W7.xml" user=all
echo We will now display the WLAN Profile 
netsh wlan sho profile name="MyKeuka"
cls
echo Wireless Profile for Windows 7 has been added sucessfully
goto :end

:Vista
echo Begin Import  
netsh wlan add profile filename="profiles\mykeuka Vista.xml" user=all
echo We will now display the WLAN Profile  
netsh wlan sho profile name="MyKeuka"
cls
echo Wireless Profile for Windows Vista has been added sucessfully
goto :end

:end
pause.
EXIT



ECHO.
PAUSE
