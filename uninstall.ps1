#!/usr/bin/env pwsh
# 9router Windows Startup Uninstaller

$ErrorActionPreference = "Stop"

Write-Host "=== 9router Windows Startup Uninstaller ===" -ForegroundColor Cyan

$StartupDir = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"
$VbsPath = Join-Path $StartupDir "start-9router.vbs"

Write-Host "[*] Looking for startup script at: $VbsPath" -ForegroundColor Yellow

if (Test-Path $VbsPath) {
    try {
        Remove-Item -Path $VbsPath -Force
        Write-Host "[SUCCESS] 9router auto-start configuration removed successfully." -ForegroundColor Green
    } catch {
        Write-Host "[ERROR] Failed to remove startup script: $_" -ForegroundColor Red
        exit 1
    }
} else {
    Write-Host "[INFO] Startup script not found. It might have been already uninstalled." -ForegroundColor Yellow
}

Write-Host "[READY] 9router will no longer start automatically on Windows boot." -ForegroundColor Cyan
