StreetPass
==========
A script for OSX to cycle through a set of HomePass MAC addresses for 3DS units to StreetPass with

You can find out more about HomePass here:

https://docs.google.com/spreadsheet/ccc?key=0AvvH5W4E2lIwdEFCUkxrM085ZGp0UkZlenp6SkJablE#gid=0

The sample MAC address list included in this repository contains most of the addresses in the google document mentioned above, except some of the more specific ones which are set up for specific locations and Mii colors. It is reccomended that you look at the Google doc above and pick some MAC addresses that matter to you, but if you are too lazy to do so the included list should work. 

Notes / A Warning
===========================
As of OS X version 10.10 or "Yosemite", an easy way to toggle Internet Connection Sharing (the method used to bridge your internet connection to your WiFi so that your 3DS can get online) is no longer available. Previously this was done with a simple script which ran without requiring GUI interaction but for users running Yosemite or newer, this is not an option. 

To get around this, I did some Googling and found an Apple Script that someone else had written. This script will interact with the Network Settings GUI, preventing you from actively using your computer while this script is running. I am fully aware that this is annoying and I will keep an eye out for a better way to do this but, for now, it seems that this is what we're stuck with. Please let me know if you have found a better workaround so that I can incorporate it.

Requirements / Instructions
===========================
You will need a computer running OSX with both a Wi-Fi adapter and ethernet port. 

Use these instructions to initially set up internet connection settings:

http://gbatemp.net/threads/how-to-have-a-homemade-streetpass-relay.352645/#post-4736991

To summarize, find the Sharing item in System Preferences and set up Internet Sharing to share your Ethernet over your Wi-Fi adapter. Set this connection's SSID to be "attwifi"

The script takes two parameters, the first is the name of the file where you have a list of MAC addresses stored. The second is an optional parameter, the name of your Wi-Fi adapter. If you do not specify one, the script will default it to en0. For more details on finding your adapter's name, see the gbatemp.net link mentioned above.  

Be sure to run the command with 'sudo', or it won't have the necessary permissions to change the MAC address. 

NOTE: The script assumes that Internet Connection Sharing is turned off when the script starts, please make sure it is. 