# StreetPass
This is a script for OSX. It uses an ethernet adapter, a Wi-Fi adpater, and an "Internet Connection Sharing" link between the two to cycle through a set of HomePass MAC addresses for 3DS units to connect to and StreetPass with.

You can find out more about HomePass here:

https://docs.google.com/spreadsheet/ccc?key=0AvvH5W4E2lIwdEFCUkxrM085ZGp0UkZlenp6SkJablE#gid=0

The sample MAC address list included in this repository contains most of the addresses in the google document mentioned above, except some of the more specific ones which are set up for specific locations and Mii colors. It is reccomended that you look at the Google doc above and pick some MAC addresses that matter to you. If you are too lazy to do so, the included list should work. 

# Requirements / Instructions
You will need a computer running OSX with both a Wi-Fi adapter and ethernet port. Use these instructions to initially set up internet connection settings: http://gbatemp.net/threads/how-to-have-a-homemade-streetpass-relay.352645/#post-4736991

### To summarize
1. Open System Preferences and then the "Sharing" item.
2. Click on the "Internet Sharing" item in the service list (NOT its checkbox)
2. Set up Internet Sharing to share your Ethernet over your Wi-Fi adapter.
3. Configure the connection's SSID to be "attwifi".
4. Click the checkbox to enable the service.
5. Connect to your new network with your 3DS and make sure you have internet connectivity.
6. Finally, make sure that you turn Internet Sharing back off once you confirm that you have internet access on your 3DS.
  * NOTE: If you don't live in the US, you may need to use one of these SSIDs instead of "attwifi": http://3dbrew.org/wiki/Nintendo_Zone#Hotspot_list_from_NZone_hotspot.conf

##### If you are using OSX 10.10 Yosemite or newer follow these further instructions. Otherwise, skip to [Executing the script](#executing-the-script)

1. Open System Preferences and then the "Network" item.
2. Highlight the interface you want to share your connection from (probably "Thunderbolt Ethernet") and click the gear at the bottom of the interface list.
3. Select "Duplicate Service..."
4. Give the duplicated service the name "ICS" and save it.
5. Select the newly created "ICS" service on the left.
6. Set the "Configure IPv4" option to "Using DHCP with manual address".
  * We do this because some DHCP servers will not assign multiple IPs to a single MAC address.
7. In the "IP Address" box, specify an IP which is valid for your network.
  * Instructions for choosing a valid IP which does not conflict with an existing one are out of the scope of this guide. Maybe [Google it](https://www.google.com/search?q=how+choose+static+ip+conflict&ie=utf-8&oe=utf-8) if you're having trouble?
8. Go back to System Preferences and then the "Sharing" item.
9. Reconfigure Internet Sharing. Choose "ICS" from the "Share your connection from:" dropdown instead of the default Ethernet service.
10. Enable Internet Connection Sharing by checking the checkbox next to "Internet Sharing" in the service list on the left.
11. Run the CycleMacs.sh script as detailed below.
  * NOTE: Because of the way the script is written, the first 5-minute cycle will use whatever MAC address is currently set. If you would like to make the script start working immediately, run this command first: 
```
sudo networksetup -setnetworkserviceenabled ICS off
```

### Executing the script

The script takes two parameters, the first is the name of the file where you have a list of MAC addresses stored. The second is an optional parameter, the name of your Wi-Fi adapter. If you do not specify one, the script will default it to ```en0```. For more details on finding your adapter's name, see the [gbatemp.net link](http://gbatemp.net/threads/how-to-have-a-homemade-streetpass-relay.352645/#post-4736991) mentioned above. 

Be sure to run the command with 'sudo', or it won't have the necessary permissions to change the MAC address. What you run should look something like this: 
```
sudo sh cycleMacs.sh MacAddresses.txt
```

Technical Notes
===========================
In order for changes to the MAC address of the Wi-Fi adapter to take effect, some change must take place in the ICS link or its "from" network connection. 

In OSX version 10.9 and below, there was an easy way to toggle the Internet Connection Sharing link itself. It is done using these two commands: 
```
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.InternetSharing.plist
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.InternetSharing.plist
```

As of OS X version 10.10 or "Yosemite", this method is no longer available. However, a workaround was [found by MGStan0](https://github.com/champgm/StreetPass/pull/5). If the ICS link is set up using a duplicate of the original ethernet adapter's network service, that dummy service can be disabled and re-enabled without affecting overall internet connectivity. In the script, we disable and enable the dummy service using these commands:
```
sudo networksetup -setnetworkserviceenabled ICS on
sudo networksetup -setnetworkserviceenabled ICS off
```

