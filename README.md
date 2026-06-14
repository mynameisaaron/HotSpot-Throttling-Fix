# Windows Mobile Hotspot TTL Fix







## **The Goal:**
Use your phone's mobile internet connection (tethered as a hotspot) to your laptop
and have labtop connectivity when on the road.


## Problem
U.S. Mobile Carriers generally rate among the most expensive places worldwide for mobile internet service.
Despite the cost, they throttle the consumers' traffic when tethering/hotspot connecting their labtops.

## throttling is implemented by inspecting each IPv4 packet's Time To Live Field 
In the TCP/IP protocol that we all use everyday, every file is chopped into Packets 1500 bytes in size.  This packet payload has a 20 byte header added to the front of the payload so the router knows what to do with it.  
In the TCP/IP protocol, each packet has a value called 'Time to Live' with a default value of 64, with each hop between routers, the TTL is decremented by 1.  This exists to prevent an endless loop situation that can plauge a network.

In our situation, the Mobile Carrier is counting the TTL number of each packet to determine if this is coming direclty from the phone, or, if it has already hopped once from the phone to your labtop. i.e. if the TTL value has been decremented by 2 (hopped twice), the carrier sees that you've teathered a device.

## Solution
Change the default hop limit (TTL) on Windows from 64 to 65 so that after the phone decrements it by 1, it matches the typical phone traffic.

## Try this out (the temporary fix)
open windows powershell, and put this in:

```cmd
netsh int ipv4 set glob defaultcurhoplimit=65
```


## Installation (the Long term fix)

1. Copy `TTL_Hotspot_Fix.bat` to your Windows Startup folder:
   - Press `Win + R`, type `shell:startup`, press Enter
   - Paste the `.bat` file there

2. Reboot

3. Now enjoy your labtop on the road.

## License
MIT License - feel free to use and modify.
