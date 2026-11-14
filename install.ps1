#!/usr/bin/env pwsh
# 9router Windows Startup Installer (Plug & Play)

$ErrorActionPreference = "Stop"

Write-Host "=== 9router Windows Startup Installer ===" -ForegroundColor Cyan

# Interactive Prompt
$Confirm = Read-Host "Apakah Anda ingin 9router berjalan otomatis di background saat Windows dinyalakan? (Y/N)"
if ($Confirm -eq 'n' -or $Confirm -eq 'N') {
    Write-Host "[INFO] Instalasi dibatalkan oleh pengguna." -ForegroundColor Yellow
    exit 0
}

Write-Host "[*] Configuring 9router to auto-start on Windows boot (Background Tray)..." -ForegroundColor Yellow
try {
    $StartupDir = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"
    
    if (!(Test-Path $StartupDir)) {
        New-Item -ItemType Directory -Force -Path $StartupDir | Out-Null
    }

    $VbsPath = Join-Path $StartupDir "start-9router.vbs"
    $Code = @"
Set WshShell = CreateObject("WScript.Shell")
WshShell.Run "9router --tray", 0, False
"@
    [System.Text.Encoding]::ASCII
    [System.IO.File]::WriteAllText($VbsPath, $Code, [System.Text.Encoding]::ASCII)
    
    Write-Host "[SUCCESS] 9router auto-start configured successfully at: $VbsPath" -ForegroundColor Green
    Write-Host "[READY] 9router will now run automatically in the background on every Windows boot!" -ForegroundColor Cyan
} catch {
    Write-Host "[ERROR] Failed to configure 9router auto-start: $_" -ForegroundColor Red
    exit 1
}
