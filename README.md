StreetPass
==========
A script for OSX to cycle through a set of HomePass MAC addresses for 3DS units to StreetPass with

You can find out more about HomePass here:

https://docs.google.com/spreadsheet/ccc?key=0AvvH5W4E2lIwdEFCUkxrM085ZGp0UkZlenp6SkJablE#gid=0

The sample MAC address list included in this repository contains most of the addresses in the google document mentioned above, except some of the more specific ones which are set up for specific locations and Mii colors. 


Requirements / Instructions
===========================
You will need a computer running OSX with both a Wi-Fi adapter and ethernet port. 

Use these instructions to initially set up internet connection settings:

http://gbatemp.net/threads/how-to-have-a-homemade-streetpass-relay.352645/#post-4736991

To summarize, find the Sharing item in System Preferences and set up Internet Sharing to share your Ethernet over your Wi-Fi adapter. Set this connection's SSID to be "attwifi"

The script takes two parameters, the first is the name of the file where you have a list of MAC addresses stored. The second is an optional parameter, the name of your Wi-Fi adapter. If you do not specify one, the script will default it to en0. For more details on finding your adapter's name, see the gbatemp.net link mentioned above.  



