# soundy
Allows easy switching of output audio devices in the command line. Implements similar sink switching to gnome-volume-control.

Inspired by the paswitch project by Tomaž Šolc [(link to blog post)](https://www.tablix.org/~avian/blog/archives/2012/06/switching_pulseaudio_output_device/). 

Successor to my soundx project which was originally written in BASH, [(link)](https://github.com/kennedn/soundx/). 

## How to run

### Prerequisites
- A linux system with PulseAudio
- Python3:
  - pulsectl module 
  
To install python3 and dependancies, run the following:
```console
sudo apt update
sudo apt install python3 pip3
python3 -m pip install pulsectl
```
You can then run the script by doing the following:
```console
chmod 744 soundy
./soundy
````

## Modes
### Normal
Normal mode is what the script assumes if you don't pass any flags. It accepts a partial/full sink name.

You can list available sink names by passing -l or --list:
```console
./soundy --list
alsa_output.usb-C-Media_Electronics_Inc._USB_Advanced_Audio_Device-00.analog-stereo
alsa_output.pci-0000_01_00.1.hdmi-stereo-extra1
alsa_output.pci-0000_00_14.2.analog-stereo
```
After which you can pass a partial or full sink name without any other arguments to switch to that sink:
```console
./soundy usb
```
**Note if there is more than one sink with a partial match, the first is selected.**

### Interactive
Interactive mode allows you to select from available alsa sinks in a user friendly way and can be run by passing -i or --interactive:
```console
$ ./soundy --interactive
Available Sinks:
#	Description
--------------------------
1	USB Audio         
2	HDMI 1            
3	ALC887-VD Analog  
--------------------------
Enter #: 
```
