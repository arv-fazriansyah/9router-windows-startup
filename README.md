# 9router Windows Startup (Auto-Start Tray)

> Lightweight utility/script to automatically run **9router** in the system tray (`--tray`) when Windows boots up, completely hidden without annoying terminal windows.

## Features
- **Plug & Play Installer**: One-click PowerShell installation script.
- **Background Tray Mode**: Runs silently via VBScript wrapper so it doesn't clutter your taskbar or open persistent command prompt windows.
- **Interactive Prompt**: Asks for confirmation before making changes to your Windows Startup folder.

---

## Quick Install

Run the following command in **PowerShell**:

```powershell
iex (iwr -useb https://raw.githubusercontent.com/arv-fazriansyah/9router-windows-startup/main/install.ps1).Content
```

## License

MIT License
