@echo off
cd /d %~dp0
set rep_user=Arika0093
set rep_name=tootdeck
set branch=master
::------------------------------------------------------------
set current=%~dp0
set repository="https://github.com/%rep_user%/%rep_name%/archive/%branch%.zip"
echo -------------------------------------
echo  tootdeck update program
echo -------------------------------------
::Download
echo git repositoryから最新版をダウンロードします…
::Powershell script吐き出し
echo add-type @^"										>  _d.ps1
echo     using System.Net;									>> _d.ps1
echo     using System.Security.Cryptography.X509Certificates;					>> _d.ps1
echo     public class TrustAllCertsPolicy : ICertificatePolicy {				>> _d.ps1
echo         public bool CheckValidationResult( 						>> _d.ps1
echo             ServicePoint srvPoint, X509Certificate certificate,				>> _d.ps1
echo             WebRequest request, int certificateProblem) {					>> _d.ps1
echo             return true;									>> _d.ps1
echo         }											>> _d.ps1
echo     }											>> _d.ps1
echo ^"@											>> _d.ps1
echo $AllProtocols = [System.Net.SecurityProtocolType]'Ssl3,Tls,Tls11,Tls12'			>> _d.ps1
echo [System.Net.ServicePointManager]::SecurityProtocol = $AllProtocols				>> _d.ps1
echo [System.Net.ServicePointManager]::CertificatePolicy = New-Object TrustAllCertsPolicy	>> _d.ps1
echo Invoke-WebRequest -Uri %repository% -OutFile %rep_name%.zip				>> _d.ps1
powershell -file _d.ps1

::Unzip
echo ダウンロードしたzipファイルを解凍します。
powershell Expand-Archive -Path %rep_name%.zip -DestinationPath tmp/ -Force

::moved
echo ダウンロードしたファイルを反映させます。
echo update.bat > ignorelist
xcopy /S /E /F /Q /G /R /K /Y /V .\tmp\%rep_name%-master\* %current% /EXCLUDE:ignorelist

::filedelete
echo 一時ファイルを削除します。
del %rep_name%.zip
del _d.ps1
del ignorelist
rmdir /s /q tmp\

echo Update finish.
pause

