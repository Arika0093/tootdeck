@echo off
echo -------------------------------------
echo  tootdeck update program
echo -------------------------------------
::Download
echo git repositoryから最新版をダウンロードします…
curl -L -O -# "https://github.com/Arika0093/tootdeck/archive/master.zip"

::Unzip
echo ダウンロードしたzipファイルを解凍します
powershell Expand-Archive -Path master.zip -DestinationPath tmp/ -Force

::moved
echo ダウンロードしたファイルを上書きします
move ./tmp/tootdeck-master/ ./

::file delete
echo 一時ファイルを削除します
del master.zip
rmdir ./tmp/

echo Update finish.
pause
