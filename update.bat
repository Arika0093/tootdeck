@echo off
echo -------------------------------------
echo  tootdeck update program
echo -------------------------------------
::Download
echo git repository����ŐV�ł��_�E�����[�h���܂��c
curl -L -O -# "https://github.com/Arika0093/tootdeck/archive/master.zip"

::Unzip
echo �_�E�����[�h����zip�t�@�C�����𓀂��܂�
powershell Expand-Archive -Path master.zip -DestinationPath tmp/ -Force

::moved
echo �_�E�����[�h�����t�@�C�����㏑�����܂�
move ./tmp/tootdeck-master/ ./

::file delete
echo �ꎞ�t�@�C�����폜���܂�
del master.zip
rmdir ./tmp/

echo Update finish.
pause
