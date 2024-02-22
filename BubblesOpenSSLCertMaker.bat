@echo off

:: Author: KernFerm
:: GitHub: https://github.com/KernFerm/Bubbles-OpenSSL-CertMaker
:: Purpose: Makes A Self-Signed SSL Certificate using OpenSSL

setlocal enabledelayedexpansion

set VERSION=4.20
set OPTION=%1
set SECOND_OPTION=%2

set CONFIG_FILE=%USERPROFILE%\makecert-config.ini
set CONFIG_TEMP=%TEMP%\makecert-config.txt

set HOSTNAME="" 
set DOT=""
set COUNTRY=""
set STATE=""
set CITY=""
set ORGANIZATION=""
set ORGANIZATION_UNIT=""
set EMAIL=""

title OpenSSL Cert Creator v%VERSION%

if "%OPTION%" equ "--help" (
    goto ShowHelp
)
if "%OPTION%" equ "-h" (
    goto ShowHelp
)

if "%OPTION%" equ "--set-config" (
    goto SetConfig
)
if "%OPTION%" equ "-s" (
    goto SetConfig
)

if "%OPTION%" equ "--open-repo" (
    start https://github.com/KernFerm/Bubbles-OpenSSL-CertMaker
    goto :EOF
)
if "%OPTION%" equ "-o" (
    start https://github.com/KernFerm/Bubbles-OpenSSL-CertMaker
    goto :EOF
)

echo.
echo Welcome to OpenSSL Cert Creator v%VERSION% by KernFerm
echo NOTE: Info entered must not contain any blank space ( ), use hyphen (-) or underscore (_) instead!
echo.

goto EnterInfo

:EnterInfo

set HOSTNAME=
echo What's your hostname? (domain)
set /p HOSTNAME=
if "%HOSTNAME%"=="" (
    set "HOSTNAME=domain"
)

set DOT=
echo What's your domain extension? (.key .cnf)
set /p DOT=
if "%DOT%"=="" (
    set "DOT=key"
)

if "%DOT%"=="" (
    set "DOT=cnf"
)

if "%DOT%"=="key" (
    set "FILENAME=fnbubbles420_%HOSTNAME%.key"
) else (
    set "FILENAME=fnbubbles420_%HOSTNAME%.cnf"
)

if "%DOT%"=="key" (
    set "FILEEXTENSION=.key"
) else (
    set "FILEEXTENSION=.cnf"
)

if "%OPTION%" equ "--use-config" (
    goto GetConfig
)
if "%OPTION%" equ "-c" (
    goto GetConfig
)

set COUNTRY=US
echo What's your country? (example=US)
set /p COUNTRY=
if "%COUNTRY%"=="" (
    set "COUNTRY=US"
)

set STATE=MI
echo What's your state? (example=MI)
set /p STATE=
if "%STATE%"=="" (
    set "STATE=MI"
)

set CITY=
echo What's your city? (example=Detroit)
set /p CITY=
if "%CITY%"=="" (
    set "CITY=City"
)

set ORGANIZATION=
echo What's your organization? (example=Organization)
set /p ORGANIZATION=
if "%ORGANIZATION%"=="" (
    set "ORGANIZATION=Organization"
)

set ORGANIZATION_UNIT=
echo What's your organization unit? (example=Development)
set /p ORGANIZATION_UNIT=
if "%ORGANIZATION_UNIT%"=="" (
    set "ORGANIZATION_UNIT=Organization_Unit"
)

set EMAIL=
echo What's your email? (example=email@email.com)
set /p EMAIL=
if "%EMAIL%"=="" (
    set "EMAIL=email@example.com"
)

:DisplayInfo

echo.
echo Hostname : %HOSTNAME%
echo Domain Extension : %DOT%
echo Country : %COUNTRY%
echo State : %STATE%
echo City : %CITY%
echo Organization : %ORGANIZATION%
echo Organization Unit : %ORGANIZATION_UNIT%
echo Email : %EMAIL%

echo.
echo Does this look good to you?
echo If yes, press Y to proceed; else, press N to provide the fields again.
echo.

SET /P CHOICE=Would you like to continue? (Y/N):
if /i "%CHOICE%"=="N" (
    cls
    goto EnterInfo
) else if /i "%CHOICE%"=="Y" (
    goto ProceedAhead
)

:ProceedAhead

echo.
(
echo [req]
echo default_bits = 4096
echo prompt = no
echo default_md = sha256
echo x509_extensions = v3_req
echo distinguished_name = dn
echo:
echo [dn]
echo C = %COUNTRY%
echo ST = %STATE%
echo L = %CITY%
echo O = %ORGANIZATION%
echo OU = %ORGANIZATION_UNIT%
echo emailAddress = %EMAIL%
echo CN = %HOSTNAME%
echo:
echo [v3_req]
echo subjectAltName = @alt_names
echo:
echo [alt_names]
echo DNS.1 = *.%HOSTNAME%
echo DNS.2 = %HOSTNAME%
) > %FILENAME%

call openssl req -new -x509 -newkey rsa:4096 -sha256 -nodes -keyout fnbubbles420_%HOSTNAME%.key -days 1096 -out fnbubbles420_%HOSTNAME%.crt -config %FILENAME%

echo.
echo Generated your certificates fnbubbles420_%HOSTNAME%.key and fnbubbles420_%HOSTNAME%.crt.
pause
goto :EOF

:GetConfig

for /f "tokens=1,2 delims==" %%a in (%CONFIG_FILE%) do (
    set %%a=%%b
)
goto DisplayInfo

:SetConfig

echo Set your config fields here.
echo.

set COUNTRY=("")
echo What's your country? ("")
set /p COUNTRY=
echo COUNTRY=%COUNTRY%>>%CONFIG_TEMP%

set STATE=("")
echo What's your state? ("")
set /p STATE=
echo STATE=%STATE%>>%CONFIG_TEMP%

set CITY=("")
echo What's your city? ("")
set /p CITY=
echo CITY=%CITY%>>%CONFIG_TEMP%

set ORGANIZATION=("")
echo What's your organization? ("")
set /p ORGANIZATION=
echo ORGANIZATION=%ORGANIZATION%>>%CONFIG_TEMP%

set ORGANIZATION_UNIT=("")
echo What's your organization unit? ("")
set /p ORGANIZATION_UNIT=
echo ORGANIZATION_UNIT=%ORGANIZATION_UNIT%>>%CONFIG_TEMP%

set EMAIL=("")
echo What's your email? ("")
set /p EMAIL=
echo EMAIL=%EMAIL%>>%CONFIG_TEMP%

echo.
echo COUNTRY=%COUNTRY%
echo STATE=%STATE%
echo CITY=%CITY%
echo ORGANIZATION=%ORGANIZATION%
echo ORGANIZATION_UNIT=%ORGANIZATION_UNIT%
echo EMAIL=%EMAIL%

echo.
echo Does this look good to you?
echo If yes, press Y to proceed; else, press N to provide fields again.
echo.

SET /P CHOICE=Would you like to continue? (Y/N):
if /i "%CHOICE%"=="N" (
    cls
    del /q %CONFIG_TEMP%
    goto SetConfig
) else if /i "%CHOICE%"=="Y" (
    goto CopyConfig
)

:CopyConfig

type %CONFIG_TEMP% > %CONFIG_FILE%
del /q %CONFIG_TEMP%
echo.
echo Configuration fields set successfully!
goto :EOF

:ShowHelp

echo.Usage:
echo.
echo.   makecert [options]
echo.
echo.Options:
echo.
echo.   --no-cfg -n         Do not create the .cfg file.
echo.
echo.   --use-config -c     Use the config file to prepopulate secondary fields.
echo.                       Default: %CONFIG_FILE%
echo.
echo.   --set-config -s     Set the secondary fields in the config file.
echo.                       Set to: %CONFIG_FILE%
echo.
echo.   --open-repo -o      Open the project repo in the browser.
echo.                       Repo link: https://github.com/KernFerm/Bubbles-OpenSSL-CertMaker
echo.
echo.   --help -h           Show the help dialog.
echo.
exit /b
