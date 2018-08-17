@echo off
cd /d %~dp0
echo -------------------------------------
echo  tootdeck update program
echo -------------------------------------
::Download
echo git repositoryから最新版をダウンロードします…
curl -L -O -# "https://github.com/Arika0093/tootdeck/archive/master.zip"

::Unzip
echo ダウンロードしたzipファイルを解凍します。
powershell Expand-Archive -Path master.zip -DestinationPath tmp/ -Force

::moved
echo ダウンロードしたファイルを反映させます。
xcopy /S /E /F /G /R /K /Y /V .\tmp\tootdeck-master\* %~dp0 /EXCLUDE:ignorelist

::filedelete
echo 一時ファイルを削除します。
del master.zip
rmdir /s /q tmp\

echo Update finish.
pause
