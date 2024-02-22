@echo off
echo.
echo.
echo                     PLEASE NOTE , THIS THINKS YOU HAVE OPENSSL INSTALLED > IF YOU DO NOT > YOU WILL NEED IT!!! 
echo                     PLEASE NOTE , THIS THINKS YOU HAVE OPENSSL INSTALLED > IF YOU DO NOT > YOU WILL NEED IT!!!
echo. 
echo     Win64 OpenSSL v3.2.1
echo     `EXE` | MSI	`200MB Installer	Installs Win64 OpenSSL v3.2.1` (Recommended for software developers by the creators of OpenSSL). 
echo     Only installs on `64-bit versions` of Windows and targets `Intel x64 chipsets`. 
echo     Note that this is a `default build of OpenSSL` and is subject to local and state laws. 
echo     More information can be found in the legal agreement of the installation.
echo.
echo    Win32 OpenSSL v3.2.1
echo    `EXE` | MSI	`162MB Installer	Installs Win32 OpenSSL v3.2.1` `(Only install this if you need 32-bit OpenSSL for Windows)`. 
echo    Note that this is a `default build of OpenSSL` and is subject to local and state laws. 
echo    More information can be found in the legal agreement of the installation.
echo.
echo                          ********************************************
echo                         Both Installers For Windows Are Located Here 
echo                        https://slproweb.com/products/Win32OpenSSL.html 
echo
echo                          ********************************************  
echo
echo
echo
echo
echo
echo
echo
echo
echo.
echo
echo                              ********************************************
echo                              ****                                    ****
echo                              ****      IMPORTANT: BEFORE RUNNING,    ****  
echo                              ****     PLEASE CUSTOMIZE THE SCRIPT    ****
echo                              ****      WITH YOUR OWN INFORMATION!    ****
echo                              ****                                    ****
echo                              ********************************************
echo.
echo          ****************************************************************************************
echo          **Before running this script, please ensure that you update the following information:**
echo          ****************************************************************************************                                                                                     
echo.            
echo                         ********************************************************
echo                         ***************    Hostname (domain)       *************
echo                         *  Domain Extension (.key .cnf) (example= DO BOTH!!!)  *
echo                         ********************  Country   ************************
echo                         ********************   State    ************************
echo                         ********************    City      **********************
echo                         *************       Organization        ****************
echo                         ***********      Organization Unit         *************
echo                         ***************        Email        ********************
echo                         ********************************************************
echo.
echo             Failure to customize these values may result in incorrect SSL certificate generation.
echo.
echo.
echo                              ******************************************** 
echo                              ****                                    ****
echo                              ****      IMPORTANT: BEFORE RUNNING,    ****  
echo                              ****     PLEASE CUSTOMIZE THE SCRIPT    ****
echo                              ****      WITH YOUR OWN INFORMATION!    ****
echo                              ****                                    ****
echo                              ********************************************
echo.
echo   On line 194 of BubblesOpenSSLCertMaker.bat change the following: fnbubbles420_%hostname%.key to yourname_%hostname%.key and fnbubbles420_%hostname%.cnf to yourname_%hostname%.cnf
echo   Remember to change it on line 191 as well as line 194  
echo   Remember to save the file after you change it from fnbubbles420_%hostname%.key to yourname_%hostname%.key and fnbubbles420_%hostname%.cnf to yourname_%hostname%.cnf 
echo   On line 78 and 80 make sure to change the following: fnbubbles420_%hostname%.key to yourname_%hostname%.key and fnbubbles420_%hostname%.cnf to yourname_%hostname%.cnf 
echo   Remember to save the file after you change it from fnbubbles420_%hostname%.key to yourname_%hostname%.key and fnbubbles420_%hostname%.cnf to yourname_%hostname%.cnf
echo.       
echo.     
echo                   *********************************************************************************
echo                   *************                                                          **********
echo                   *************    THANKS FOR USING IF YOU HAVE ANY QUESTIONS OR ISSUES  **********
echo                   *************     PLEASE ASK IN THE ISSUES SECTION OF THE GITHUB PAGE  **********
echo                   *********************************************************************************         
echo.
echo.                   

pause