@echo off
cd /d %~dp0
set rep_user=Arika0093
set rep_name=tootdeck
echo -------------------------------------
echo  tootdeck update program
echo -------------------------------------
::Download
echo git repository����ŐV�ł��_�E�����[�h���܂��c
curl -L -O -# "https://github.com/%rep_user%/%rep_name%/archive/master.zip"

::Unzip
echo �_�E�����[�h����zip�t�@�C�����𓀂��܂��B
powershell Expand-Archive -Path master.zip -DestinationPath tmp/ -Force

::moved
echo �_�E�����[�h�����t�@�C���𔽉f�����܂��B
echo update.bat > ignorelist
xcopy /S /E /F /Q /G /R /K /Y /V .\tmp\%rep_name%-master\* %~dp0 /EXCLUDE:ignorelist

::filedelete
echo �ꎞ�t�@�C�����폜���܂��B
del master.zip
del ignorelist
rmdir /s /q tmp\

echo Update finish.
pause
