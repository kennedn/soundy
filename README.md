# soundy
Allows easy switching of output audio devices in the command line. Implements similar sink switching to gnome-volume-control.

Inspired by the paswitch project by Tomaž Šolc [(link to blog post)](https://www.tablix.org/~avian/blog/archives/2012/06/switching_pulseaudio_output_device/). 

Successor to my [soundx project](https://github.com/kennedn/soundx/) which was originally written entirely in Bash. Due to limitations in the `pacmd` and `pactl` tools it is actually impossible to fully migrate a sink on the command line. So instead we use the pulsectl module to achieve migrations :) 

## How to run

### Prerequisites
- A linux system with PulseAudio
- Python3:
  - pulsectl module 
  
To install python3 and dependancies, run the following:
```bash
sudo apt update
sudo apt install python3 pip3
python3 -m pip install pulsectl
```
You can then run the script by doing the following:
```bash
chmod 744 soundy
./soundy
```

A wrapper script is optionally provided that opens soundy interactivly in a gnome terminal of the correct size. This can be run by doing the following:
```bash
chmod 744 soundy_wrapper.sh
./soundy_wrapper.sh
```

## Modes
### Normal
Normal mode is what the script assumes if you don't pass any flags. It accepts a partial/full sink name.

You can list available sink names by passing -l or --list:
```bash
./soundy --list
alsa_output.usb-Generic_Blue_Microphones_2032BAB0E6F8-00.analog-stereo
alsa_output.pci-0000_2d_00.4.analog-stereo
alsa_output.usb-AudioQuest_AudioQuest_DragonFly_Red_v1.0_AQDFRD0120007986-00.iec958-stereo
```
After which you can pass a partial or full sink name without any other arguments to switch to that sink:
```bash
./soundy DragonFly
```
**Note if there is more than one sink with a partial match, the first is selected.**

### Interactive
Interactive mode allows you to select from available alsa sinks in a user friendly way and can be run by passing -i or --interactive, or simply invoking `soundy_wrapper.sh` to spawn a pre-sized terminal window:

![](resources/soundy.gif)