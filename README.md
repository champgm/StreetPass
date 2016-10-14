StreetPass
==========
A script for OSX to cycle through a set of HomePass MAC addresses for 3DS units to StreetPass with

You can find out more about HomePass here:

https://docs.google.com/spreadsheet/ccc?key=0AvvH5W4E2lIwdEFCUkxrM085ZGp0UkZlenp6SkJablE#gid=0

The sample MAC address list included in this repository contains most of the addresses in the google document mentioned above, except some of the more specific ones which are set up for specific locations and Mii colors. It is reccomended that you look at the Google doc above and pick some MAC addresses that matter to you, but if you are too lazy to do so the included list should work. 

Notes / A Warning
===========================
As of OS X version 10.10 or "Yosemite", an easy way to toggle Internet Connection Sharing (the method used to bridge your internet connection to your WiFi so that your 3DS can get online) is no longer available. Previously this was done with a simple script which ran without requiring GUI interaction but for users running Yosemite or newer, this is not an option. 

Internet sharing can be enabled and disabled by toggling the network service that is being shared from. To utilize this method the user must duplicate the Network Service and name it "ICS" and choose "ICS" in the "Share your connection from" dropdown in sharing preferences (See Requirements / Instructions for more details).

Requirements / Instructions
===========================
You will need a computer running OSX with both a Wi-Fi adapter and ethernet port. 

Use these instructions to initially set up internet connection settings:

http://gbatemp.net/threads/how-to-have-a-homemade-streetpass-relay.352645/#post-4736991

To summarize, find the Sharing item in System Preferences and set up Internet Sharing to share your Ethernet over your Wi-Fi adapter. Set this connection's SSID to be "attwifi"

**If running El Capitan follow these further instructions:**

1. Open System Preferences > Network
2. Highlight the interface you want to share your connection FROM and click the gear below the interface list
3. Select 'Duplicate Service...'
4. Give the duplicated service the name "ICS" and save it 
5. Set the "ICS" service to 'DHCP with manual address' (because some DHCP servers will not assign an additional address to a MAC) and input a valid IP
6. Open System Preferences > Sharing
7. Select Internet Sharing and choose "ICS" from the "Share your connection from:" dropdown.
8. Run the CycleMacs.sh script as detailed below.

The script takes two parameters, the first is the name of the file where you have a list of MAC addresses stored. The second is an optional parameter, the name of your Wi-Fi adapter. If you do not specify one, the script will default it to en0. For more details on finding your adapter's name, see the gbatemp.net link mentioned above.  

Be sure to run the command with 'sudo', or it won't have the necessary permissions to change the MAC address. 

NOTE: The script assumes that Internet Connection Sharing is turned off when the script starts, please make sure it is. 
