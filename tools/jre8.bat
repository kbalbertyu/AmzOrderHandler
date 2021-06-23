@echo off
title jre8u131 online installation script
echo Current directory: %~dp0
cd /d %~dp0
set BEGIN_TIME=%TIME%
if exist "C:\Program Files (x86)\Java\jre1.8.0_131\bin\java.exe" (
    echo jre8u131 was installed already.
    goto end
) else (
    if exist "C:\Program Files (x86)\Java\jre1.8.0_131" (
        rd "C:\Program Files (x86)\Java\jre1.8.0_131" /S /Q
        echo Conflict directory jre1.8.0_131 deleted successfully.
    )
)
echo Please wait for 2 - 4 minutes till jre8u131 online installation finish.
start /wait jre-8u131-windows-i586.exe /s
if %ERRORLEVEL% NEQ 0 (
    start /wait jre-8u131-windows-i586.exe /s
)
if %ERRORLEVEL% NEQ 0 (
    echo Sorry, but we fail to install jre8u131 online after twice attempts. Please try again later.
    echo You may also install jre8112 or jre8u131 according to opened instruction page.
    start http://ec2-35-166-131-3.us-west-2.compute.amazonaws.com/Tutorial/MailMan/InstallJRE8.html
    pause
    exit
) else (
    echo ===================================================================
    echo Congratulations! jre8u131 installed successfully.
    echo Begin time: %BEGIN_TIME%
    echo End time: %TIME%
    echo ===================================================================
)

:end
set PATH=%PATH%;C:\Program Files (x86)\Java\jre1.8.0_131\bin;
java -cp jre-cleaner.jar com.kber.tool.JreCleaner

if not exist C:\SuperLabour (
    goto version
)
cd /d C:\SuperLabour
if exist jre (
    rd jre /S /Q
    echo Obsolete jre deleted successfully.
)
if exist ".install4j" (
    rd ".install4j" /S /Q
    echo Obsolete install4j files deleted successfully.
)

:version
java -version
echo ===============================================================
echo Please start SuperLabour to verify jre8u131 installation afterwards.
echo ===============================================================
pause