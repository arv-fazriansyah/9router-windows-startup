<div align="center">

# 🚀 9router Windows Startup

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B-blue.svg)](https://github.com/PowerShell/PowerShell)
[![Platform: Windows](https://img.shields.io/badge/Platform-Windows-lightgrey.svg)](-windows)

> **Seamlessly run [9router](https://github.com/anomalyco/9router) in the background system tray automatically on every Windows boot.**

</div>

---

## 📌 Overview

When managing local AI model routers like **9router**, manually launching the terminal or window every time you turn on your PC can be tedious. 

`9router-windows-startup` provides a lightweight, **Plug & Play** solution that registers 9router into your Windows Startup sequence. It runs silently in the **System Tray (`--tray`)** via a secure VBScript wrapper—meaning **no annoying command prompt windows** cluttering your taskbar or screen.

---

## ✨ Key Features

- **⚡ One-Click Installation**: Install and configure instantly via a single PowerShell command.
- **🥷 Stealth Background Mode**: Runs completely hidden in the Windows System Tray without persistent terminal windows.
- **🛡️ Interactive Prompt**: Asks for your explicit confirmation (Y/N) before modifying system folders.
- **🔄 Clean Uninstall / Toggle**: Easily opt-out or clean up during setup.

---

## 🛠️ Quick Installation (Plug & Play)

Open **PowerShell** as your normal user and run the following command:

```powershell
iex (iwr -useb https://raw.githubusercontent.com/arv-fazriansyah/9router-windows-startup/main/install.ps1).Content
```

The installer will interactively prompt you:
> `Apakah Anda ingin 9router berjalan otomatis di background saat Windows dinyalakan? (Y/N)`

- Type **`Y`** (or press Enter) to configure auto-start.
- Type **`N`** to cancel.

---

## 🗑️ Uninstall

To remove 9router from Windows Startup, run this command in PowerShell:

```powershell
iex (iwr -useb https://raw.githubusercontent.com/arv-fazriansyah/9router-windows-startup/main/uninstall.ps1).Content
```

---

## 📂 Under the Hood

The installer places a lightweight VBScript wrapper (`start-9router.vbs`) into your user Startup folder (`shell:startup`):
```vbscript
Set WshShell = CreateObject("WScript.Shell")
WshShell.Run "9router --tray", 0, False
```
* **`0`**: Hides the command window (`SW_HIDE`).
* **`False`**: Does not wait for the process to exit (asynchronous background execution).

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check out the [issues page](https://github.com/arv-fazriansyah/9router-windows-startup/issues).

---

## 📄 License

Distributed under the [MIT License](LICENSE). See `LICENSE` for more information.
