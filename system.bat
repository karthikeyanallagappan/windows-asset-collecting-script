@ECHO OFF
>C:\Windows\Temp\%computername%.txt (
:: This batch file details Windows 10, hardware, and networking configuration.
TITLE My System Info
ECHO Please wait... Checking system information.
:: Section 1: Windows 10 information
ECHO ==========================
ECHO DOT. 
ECHO ==========================
date /T
time /T
ECHO ==========================
ECHO WINDOWS INFO.
ECHO ============================
systeminfo | findstr /c:"Host Name"
systeminfo | findstr /c:"OS Name"
systeminfo | findstr /c:"OS Version"
systeminfo | findstr /c:"System Type"
systeminfo | findstr /c:"System Model" 
systeminfo | findstr /c:"System Manufacturer"
:: Section 2: Hardware information.
ECHO ============================
ECHO HARDWARE INFO.
ECHO ============================
systeminfo | findstr /c:"Total Physical Memory"
wmic cpu get name
wmic diskdrive get name,model,size
wmic path win32_videocontroller get name
wmic bios get serialnumber
powershell  "Get-PhysicalDisk | Format-Table -AutoSize"
ECHO =============================
ECHO product key.
ECHO =============================
wmic path softwarelicensingservice get OA3xOriginalProductKey

ECHO ------------------------------
ECHO APPLICATION LIST.
ECHO ------------------------------
wmic product get name, version
ECHO ------------------------------
:: ECHO TASK VIEW.
tasklist
ECHO ------------------------------
)
exit
