@echo off
cd /d %~dp0
set rep_user=Arika0093
set rep_name=tootdeck
echo -------------------------------------
echo  tootdeck update program
echo -------------------------------------
::Download
echo git repositoryから最新版をダウンロードします…
curl -L -O -# "https://github.com/%rep_user%/%rep_name%/archive/master.zip"

::Unzip
echo ダウンロードしたzipファイルを解凍します。
powershell Expand-Archive -Path master.zip -DestinationPath tmp/ -Force

::moved
echo ダウンロードしたファイルを反映させます。
echo update.bat > ignorelist
xcopy /S /E /F /Q /G /R /K /Y /V .\tmp\%rep_name%-master\* %~dp0 /EXCLUDE:ignorelist

::filedelete
echo 一時ファイルを削除します。
del master.zip
del ignorelist
rmdir /s /q tmp\

echo Update finish.
pause
