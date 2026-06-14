@echo off
:: Windows Mobile Hotspot TTL Fix
:: Applies TTL=65 so carrier hotspot throttling is bypassed
:: Run as Administrator (automatically via Startup folder)

netsh int ipv4 set glob defaultcurhoplimit=65
netsh int ipv6 set glob defaultcurhoplimit=65

echo.
echo ========================================
echo TTL Hotspot Fix Applied Successfully!
echo Default Hop Limit set to 65
echo ========================================
echo.
echo You can now use your phone hotspot with improved speeds.
pause