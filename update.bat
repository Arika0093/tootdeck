@echo off
cd /d %~dp0
echo -------------------------------------
echo  tootdeck update program
echo -------------------------------------
::Download
echo git repository����ŐV�ł��_�E�����[�h���܂��c
curl -L -O -# "https://github.com/Arika0093/tootdeck/archive/master.zip"

::Unzip
echo �_�E�����[�h����zip�t�@�C�����𓀂��܂��B
powershell Expand-Archive -Path master.zip -DestinationPath tmp/ -Force

::moved
echo �_�E�����[�h�����t�@�C���𔽉f�����܂��B
xcopy /S /E /F /G /R /K /Y /V .\tmp\tootdeck-master\* %~dp0 /EXCLUDE:ignorelist

::filedelete
echo �ꎞ�t�@�C�����폜���܂��B
del master.zip
rmdir /s /q tmp\

echo Update finish.
pause
