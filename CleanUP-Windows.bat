FOR /F "tokens=2-6 delims=/ " %%g in ('date/t') do SET DDMMAAAA=%%g-%%h-%%i
FOR /F "tokens=1,2 delims=: " %%j in ('time/t') do SET HHMM=%%j-%%k

==========================================================================================================

REM ECHO ANTES>c:\ibm_intel\clear_%DDMMAAAA%_%HHMM%.log
REM c:\ibm_intel\psinfo -d | find /i "C: ">>c:\ibm_intel\clear_%DDMMAAAA%_%HHMM%.log

copy C:\Windows\winsxs\amd64_microsoft-windows-cleanmgr_31bf3856ad364e35_6.1.7600.16385_none_c9392808773cd7da\cleanmgr.exe %systemroot%\System32 /y
copy C:\Windows\winsxs\amd64_microsoft-windows-cleanmgr.resources_31bf3856ad364e35_6.1.7600.16385_en-us_b9cb6194b257cc63\cleanmgr.exe.mui %systemroot%\System32\en-US /y

rem Arquivos Temporários


rd %SystemDrive%\temp /s /q
rd %SystemDrive%\tmp /s /q
rd %SystemRoot%\temp /s /q
rd %SystemRoot%\tmp /s /q

md %SystemDrive%\temp
md %SystemDrive%\tmp
md %SystemRoot%\temp
md %SystemRoot%\tmp

compact /C /I /F /S:%SystemDrive%\temp
compact /C /I /F /S:%SystemRoot%\temp
compact /C /I /F /S:%SystemDrive%\tmp
compact /C /I /F /S:%SystemRoot%\tmp

cacls %SystemDrive%\temp /e /g system:f administrators:f everyone:w /t>>.\clear_%DDMMAAAA%_%HHMM%.log
cacls %SystemDrive%\tmp /e /g system:f administrators:f everyone:w /t>>.\clear_%DDMMAAAA%_%HHMM%.log
cacls %SystemRoot%\temp /e /g system:f administrators:f everyone:w /t>>.\clear_%DDMMAAAA%_%HHMM%.log
cacls %SystemRoot%\tmp /e /g system:f administrators:f everyone:w /t>>.\clear_%DDMMAAAA%_%HHMM%.log

=======================================================

rem 

dir %SystemRoot%\$NtUninstall* /a /b>.\x.y

for /f %%i in (.\x.y) do rd %SystemRoot%\%%i /s /q

========================================================

dir "%SystemDrive%\Users" /b>.\x.w
dir "%SystemDrive%\Documents and Settings" /b>.\x.x


FOR /F "tokens=1,2* delims= " %%i in (.\x.x) do rd "%SystemDrive%\Documents and Settings\%%i\Local Settings\Temporary Internet Files" /s /q
FOR /F "tokens=1,2* delims= " %%i in (.\x.x) do rd "%SystemDrive%\Documents and Settings\%%i\Local Settings\Application Data\Microsoft\Dr Watson" /s /q
FOR /F "tokens=1,2* delims= " %%i in (.\x.x) do rd "%SystemDrive%\Documents and Settings\%%i\Local Settings\Application Data\PCHealth" /s /q
FOR /F "tokens=1,2* delims= " %%i in (.\x.x) do rd "%SystemDrive%\Documents and Settings\%%i\Local Settings\Application Data\javasharedresources" /s /q
FOR /F "tokens=1,2* delims= " %%i in (.\x.x) do rd "%SystemDrive%\Documents and Settings\%%i\Local Settings\Application Data\Microsoft\Windows NT\NTBackup\data" /s /q
FOR /F "tokens=1,2* delims= " %%i in (.\x.x) do rd "%SystemDrive%\Documents and Settings\%%i\Application Data\Microsoft\CryptnetUrlCache\Content" /s /q
FOR /F "tokens=1,2* delims= " %%i in (.\x.x) do rd "%SystemDrive%\Documents and Settings\%%i\Microsoft\Windows\Wer\ReportQueue" /s /q
FOR /F "tokens=1,2* delims= " %%i in (.\x.x) do compact /C /I /F /S:"%SystemDrive%\Documents and Settings\%%i\Desktop"
FOR /F "tokens=1,2* delims= " %%i in (.\x.x) do compact /C /I /F /S:"%SystemDrive%\Documents and Settings\%%i\My Documents"
FOR /F "tokens=1,2* delims= " %%i in (.\x.x) do compact /C /I /F /S:"%SystemDrive%\Documents and Settings\%%i\Local Settings"

FOR /F "tokens=1,2* delims= " %%i in (.\x.x) do rd "%SystemDrive%\Documents and Settings\%%i %%j\Local Settings\Temp" /s /q
FOR /F "tokens=1,2* delims= " %%i in (.\x.x) do md "%SystemDrive%\Documents and Settings\%%i %%j\Local Settings\Temp"
FOR /F "tokens=1,2* delims= " %%i in (.\x.x) do rd "%SystemDrive%\Documents and Settings\%%i %%j\Local Settings\Temporary Internet Files" /s /q
FOR /F "tokens=1,2* delims= " %%i in (.\x.x) do rd "%SystemDrive%\Documents and Settings\%%i\Local Settings\Application Data\Microsoft\Dr Watson" /s /q
FOR /F "tokens=1,2* delims= " %%i in (.\x.x) do rd "%SystemDrive%\Documents and Settings\%%i\Local Settings\Application Data\PCHealth" /s /q
FOR /F "tokens=1,2* delims= " %%i in (.\x.x) do rd "%SystemDrive%\Documents and Settings\%%i\Local Settings\Application Data\javasharedresources" /s /q
FOR /F "tokens=1,2* delims= " %%i in (.\x.x) do rd "%SystemDrive%\Documents and Settings\%%i\Local Settings\Application Data\Microsoft\Windows NT\NTBackup\data\" /s /q
FOR /F "tokens=1,2* delims= " %%i in (.\x.x) do rd "%SystemDrive%\Documents and Settings\%%i\Application Data\Microsoft\CryptnetUrlCache\Content" /s /q
FOR /F "tokens=1,2* delims= " %%i in (.\x.x) do rd "%SystemDrive%\Documents and Settings\%%i\Microsoft\Windows\Wer\ReportQueue" /s /q
FOR /F "tokens=1,2* delims= " %%i in (.\x.x) do compact /C /I /F /S:"%SystemDrive%\Documents and Settings\%%i %%j\Desktop"
FOR /F "tokens=1,2* delims= " %%i in (.\x.x) do compact /C /I /F /S:"%SystemDrive%\Documents and Settings\%%i %%j\My Documents"
FOR /F "tokens=1,2* delims= " %%i in (.\x.x) do compact /C /I /F /S:"%SystemDrive%\Documents and Settings\%%i %%j\Local Settings"

FOR /F "tokens=1,2* delims= " %%i in (.\x.w) do rd "%SystemDrive%\Users\%%i\Local Settings\Temporary Internet Files" /s /q
FOR /F "tokens=1,2* delims= " %%i in (.\x.w) do rd "%SystemDrive%\Users\%%i\Local Settings\Application Data\Microsoft\Dr Watson" /s /q
FOR /F "tokens=1,2* delims= " %%i in (.\x.w) do rd "%SystemDrive%\Users\%%i\Local Settings\Application Data\PCHealth" /s /q
FOR /F "tokens=1,2* delims= " %%i in (.\x.w) do rd "%SystemDrive%\Users\%%i\Local Settings\Application Data\javasharedresources" /s /q
FOR /F "tokens=1,2* delims= " %%i in (.\x.w) do rd "%SystemDrive%\Users\%%i\Local Settings\Application Data\Microsoft\Windows NT\NTBackup\data" /s /q
FOR /F "tokens=1,2* delims= " %%i in (.\x.w) do rd "%SystemDrive%\Users\%%i\Application Data\Microsoft\CryptnetUrlCache\Content" /s /q
FOR /F "tokens=1,2* delims= " %%i in (.\x.w) do rd "%SystemDrive%\Users\%%i\Microsoft\Windows\Wer\ReportQueue" /s /q
FOR /F "tokens=1,2* delims= " %%i in (.\x.w) do rd "%SystemDrive%\Users\%%i\AppData\Local\Microsoft\Windows\WebCache" /s /q
FOR /F "tokens=1,2* delims= " %%i in (.\x.w) do rd "%SystemDrive%\Users\%%i\AppData\Local\Microsoft\Windows\SchCache" /s /q
FOR /F "tokens=1,2* delims= " %%i in (.\x.w) do compact /C /I /F /S:"%SystemDrive%\Users\%%i\Desktop"
FOR /F "tokens=1,2* delims= " %%i in (.\x.w) do compact /C /I /F /S:"%SystemDrive%\Users\%%i\My Documents"
FOR /F "tokens=1,2* delims= " %%i in (.\x.w) do compact /C /I /F /S:"%SystemDrive%\Users\%%i\Local Settings"

FOR /F "tokens=1,2* delims= " %%i in (.\x.w) do rd "%SystemDrive%\Users\%%i %%j\Local Settings\Temp" /s /q
FOR /F "tokens=1,2* delims= " %%i in (.\x.w) do md "%SystemDrive%\Users\%%i %%j\Local Settings\Temp"
FOR /F "tokens=1,2* delims= " %%i in (.\x.w) do rd "%SystemDrive%\Users\%%i %%j\Local Settings\Temporary Internet Files" /s /q
FOR /F "tokens=1,2* delims= " %%i in (.\x.w) do rd "%SystemDrive%\Users\%%i\Local Settings\Application Data\Microsoft\Dr Watson" /s /q
FOR /F "tokens=1,2* delims= " %%i in (.\x.w) do rd "%SystemDrive%\Users\%%i\Local Settings\Application Data\PCHealth" /s /q
FOR /F "tokens=1,2* delims= " %%i in (.\x.w) do rd "%SystemDrive%\Users\%%i\Local Settings\Application Data\javasharedresources" /s /q
FOR /F "tokens=1,2* delims= " %%i in (.\x.w) do rd "%SystemDrive%\Users\%%i\Local Settings\Application Data\Microsoft\Windows NT\NTBackup\data\" /s /q
FOR /F "tokens=1,2* delims= " %%i in (.\x.w) do rd "%SystemDrive%\Users\%%i\Application Data\Microsoft\CryptnetUrlCache\Content" /s /q
FOR /F "tokens=1,2* delims= " %%i in (.\x.w) do rd "%SystemDrive%\Users\%%i\Microsoft\Windows\Wer\ReportQueue" /s /q
FOR /F "tokens=1,2* delims= " %%i in (.\x.w) do rd "%SystemDrive%\Users\%%i\AppData\Local\Microsoft\Windows\WebCache" /s /q
FOR /F "tokens=1,2* delims= " %%i in (.\x.w) do rd "%SystemDrive%\Users\%%i\AppData\Local\Microsoft\Windows\SchCache" /s /q
FOR /F "tokens=1,2* delims= " %%i in (.\x.w) do rd "%SystemDrive%\Users\%%i\AppData\Local\Microsoft\Windows\Temporary Internet Files" /s /q
FOR /F "tokens=1,2* delims= " %%i in (.\x.w) do compact /C /I /F /S:"%SystemDrive%\Users\%%i\Desktop"
FOR /F "tokens=1,2* delims= " %%i in (.\x.w) do compact /C /I /F /S:"%SystemDrive%\Users\%%i\My Documents"
FOR /F "tokens=1,2* delims= " %%i in (.\x.w) do compact /C /I /F /S:"%SystemDrive%\Users\%%i\Local Settings"
FOR /F "tokens=1,2* delims= " %%i in (.\x.w) do compact /C /I /F /S:"%SystemDrive%\Users\%%i\AppData\Local\Microsoft\Windows\Explorer"

=========================================================

rem Arquivos de Instalação do TSM

rd %SystemDrive%\tsm_images* /s /q
rd %SystemDrive%\tsm_images_old /s /q

=========================================================
rem Limpeza da lixeira

rd %SystemDrive%\$recycle.bin /s /q
rd %SystemDrive%\Recycler /s /q

=========================================================

rem Log do SCM

del /s /q "%SystemDrive%\Program Files\ibm\SCM\client\*.txt"

=========================================================

rem temp do B r i g h t S t o r (Software de Backup)

del /s /q %SystemDrive%\cst*.tmp
del /s /q %SystemDrive%\Tsm\*.bkf

=========================================================

md %SystemDrive%\dump
compact /C /I /F /S:%SystemDrive%\dump
compact /C /I /F /S:%SystemDrive%\temp
compact /C /I /F /S:%SystemDrive%\TSM
compact /C /I /F /S:%SystemDrive%\FIX
compact /C /I /F /S:%SystemDrive%\IBM_Support
compact /C /I /F /S:%systemdrive%\IBM_INTEL
compact /C /I /F /S:%systemdrive%\Program Files\Ibm
compact /C /I /F /S:%systemdrive%\Program Files\Common Files
compact /C /I /F /S:%windir%\Installer
compact /C /I /F /S:%windir%\$hf_mig$
compact /C /I /F /S:%windir%\Downloaded Installations
compact /C /I /F /S:%windir%\inf
compact /C /I /F /S:%windir%\SoftwareDistribution
compact /C /I /F /S:%windir%\repair
compact /C /I /F /S:%windir%\*.log
compact /C /I /F /S:%windir%\Debug
compact /C /I /F /S:%windir%\Driver Cache
compact /C /I /F /S:%windir%\Help
compact /C /I /F /S:%windir%\ie7updates
compact /C /I /F /S:%windir%\ie8updates
compact /C /I /F /S:%windir%\ie8
compact /C /I /F /S:%windir%\IIS Temporary Compressed Files
compact /C /I /F /S:%windir%\ime
compact /C /I /F /S:%windir%\inf
compact /C /I /F /S:%windir%\system32\LogFiles
compact /C /I /F /S:%windir%\system32\system32\mui
compact /C /I /F /S:%windir%\system32\system32\wbem
compact /C /I /F /S:%windir%\ServiceProfiles
compact /C /I /F /S:%windir%\System32\winevt\Logs\
del /s /q %windir%\ServicePackFiles\i386
del /s /q %windir%\SoftwareDistribution\Download
del /s /q %SystemDrive%\IBM_Support

=========================================================

move %SystemRoot%\memory.dmp %SystemDrive%\dump>>.\clear_%DDMMAAAA%_%HHMM%.log

.\robocopy %SystemDrive%\dump %SystemDrive%\temp memory.dmp /minage:7 /mov /r:0 /w:0 /log+:.\clear_%DDMMAAAA%_%HHMM%.log
.\robocopy . %SystemDrive%\temp clear*.log /minage:30 /mov /r:0 /w:0

move %SystemDrive%\dump\memory.dmp %SystemRoot%>>.\clear_%DDMMAAAA%_%HHMM%.log

=========================================================

ECHO DEPOIS>>.\clear_%DDMMAAAA%_%HHMM%.log
.\psinfo -d | find /i "C: ">>.\clear_%DDMMAAAA%_%HHMM%.log