@echo off
echo.
echo.
echo                     PLEASE NOTE , THIS THINKS YOU HAVE OPENSSL INSTALLED  
echo                               IF YOU DO NOT  YOU WILL NEED IT!!! 
echo                     PLEASE NOTE , THIS THINKS YOU HAVE OPENSSL INSTALLED  
echo                               IF YOU DO NOT  YOU WILL NEED IT!!!
echo. 
echo     Win64 OpenSSL v3.2.1
echo     EXE 200MB Installer - Installs Win64 OpenSSL v3.2.1 
echo         (Recommended for software developers by the creators of OpenSSL). 
echo     Only installs on 64-bit versions of Windows and targets Intel x64 chipsets. 
echo     Note that this is a default build of OpenSSL and is subject to local and state laws. 
echo     More information can be found in the legal agreement of the installation.
echo.
echo     Win32 OpenSSL v3.2.1
echo     EXE 162MB Installer - Installs Win32 OpenSSL v3.2.1 
echo         (Only install this if you need 32-bit OpenSSL for Windows). 
echo     Note that this is a default build of OpenSSL and is subject to local and state laws. 
echo     More information can be found in the legal agreement of the installation.
echo.
echo                      ***************************************************
echo                      *  Both Installers For Windows Are Located Here   *
echo                      * https://slproweb.com/products/Win32OpenSSL.html * 
echo                      * YOU ONLY NEED ONE INSTALLER FOR Either 32 or 64 *     
echo                      ***************************************************
echo.
echo.
echo                           ********************************************
echo                           ****                                    ****
echo                           ****      IMPORTANT: BEFORE RUNNING,    ****  
echo                           ****     PLEASE CUSTOMIZE THE SCRIPT    ****
echo                           ****      WITH YOUR OWN INFORMATION!    ****
echo                           ****                                    ****
echo                           ********************************************
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
echo                    BubblesOpenSSLCertMaker.bat DO THE FOLLOWING: 
echo.
echo                  -Make sure to do check folder path for privatekey.pem and csr.pem
echo                   after you make your privatekey.pem and csr.pem are in the file.
echo                  -Take Both Privatekey.pem and csr.pem and put them in the same folder as 
echo                   the Bubbles_PEM_To_PFX_Converter.bat file.  
echo                  -Then run the Bubbles_PEM_To_PFX_Converter.bat file and it will create 
echo                   a certificate.pfx file on your desktop.
echo                  -Once your PFX file is created you can use it to install your certificate in 
echo                   Current User.
echo                  -Double click you PFX file you made, it will ask you to import it.
echo                  -Click on Current User, then click next, if you have a password for your
echo                   PFX file you will need to enter it, if not just click next.
echo                  -Import Options: Same window click "Mark This Key as Exportable. This will
echo                   allow you to back up or transport your keys at a later time. Click Next. 
echo.                 
echo              CONGRATS!!! YOU JUST IMPORTED YOUR CERTIFICATE INTO YOUR CURRENT USER. NOW IT IS 
echo              not marked with a red X and you can use it for your website, application, or whatever
echo.
echo                     BE RESPONSIBLE WITH YOUR CERTIFICATE AND PRIVATE KEY FILES!!!!! 
echo.                          
echo.                    
echo.                                            
echo.     
echo               *********************************************************************************
echo               *************                                                          **********
echo               *************    THANKS FOR USING IF YOU HAVE ANY QUESTIONS OR ISSUES  **********
echo               *************     PLEASE ASK IN THE ISSUES SECTION OF THE GITHUB PAGE  **********
echo               *************                                                          **********
echo               *********************************************************************************
echo.                   

pause