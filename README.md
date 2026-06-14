# Windows Mobile Hotspot TTL Fix

**Project:** Bypass carrier mobile hotspot throttling by adjusting IP packet TTL (Time To Live)

This solution makes tethered laptop traffic appear as native phone traffic to the carrier's network, dramatically improving bandwidth when using your phone's personal hotspot.

## Problem
Many carriers (T-Mobile, Verizon, AT&T, Visible, etc.) detect and throttle hotspot/tethered connections using TTL inspection and other fingerprinting methods. Direct phone speeds are fast, but laptop via hotspot becomes unusable.

## Solution
Change the default hop limit (TTL) on Windows from 128 to 65 so that after the phone decrements it by 1, it matches typical phone traffic.

## Features
- One-click automated fix via startup Batch file
- Easy on/off scripts
- Verified with `netsh` commands
- Works across restarts

## Installation (Automatic on Boot)

1. Copy `TTL_Hotspot_Fix.bat` to your Windows Startup folder:
   - Press `Win + R`, type `shell:startup`, press Enter
   - Paste the `.bat` file there

2. Reboot

## Files

- **`TTL_Hotspot_Fix.bat`** – Applies TTL=65 on startup
- **`TTL_Reset.bat`** – Restores default TTL=128
- `README.md` – This documentation

## Usage

**Manual Apply (Admin Command Prompt):**
```cmd
netsh int ipv4 set glob defaultcurhoplimit=65
netsh int ipv6 set glob defaultcurhoplimit=65
```

**Verification:**
```cmd
netsh int ipv4 show global | findstr Hop
```

**Reset:**
```cmd
netsh int ipv4 set glob defaultcurhoplimit=128
netsh int ipv6 set glob defaultcurhoplimit=128
```

## Screenshots / Results
*(Add your before/after speed test screenshots here)*

## Technologies
- Windows Networking (`netsh`)
- Batch Scripting
- IP Packet Manipulation (TTL/Hop Limit)

---

**Made with ❤️ for Solutions Engineering & Field Productivity**

## License
MIT License - feel free to use and modify.