@echo off
setlocal

rem Find OpenSSL configuration file in PATH
for %%i in (openssl.exe) do (
    set OPENSSL=%~$PATH:i
)
if not defined OPENSSL (
    echo Error: OpenSSL not found in PATH.
    exit /b
)
for %%i in (%OPENSSL%) do (
    set OPENSSL_DIR=%%~dpi
)

set OPENSSL_CONF=%OPENSSL_DIR%openssl.cfg

set KEY_FILE=privatekey.pem
set CERT_FILE=csr.pem
set COMBINED_FILE=combined.pem
set PFX_FILE=%USERPROFILE%\Desktop\certificate.pfx

rem Check if both key and certificate files exist
if not exist %KEY_FILE% (
    echo Error: Private key file (%KEY_FILE%) not found.
    exit /b
)
if not exist %CERT_FILE% (
    echo Error: CSR file (%CERT_FILE%) not found.
    exit /b
)

rem Combine key and certificate into a .pem file
copy /b %KEY_FILE%+%CERT_FILE% %COMBINED_FILE%

rem Convert .pem file to .pfx format
openssl pkcs12 -export -out %PFX_FILE% -in %COMBINED_FILE% -name "YourCertificateName"

rem Cleanup: Delete the combined .pem file
del %COMBINED_FILE%

echo Conversion complete. Your .pfx file is ready at: 
echo %PFX_FILE%

pause