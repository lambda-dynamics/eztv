# EZTV

## Install Guide

- Download [Xubuntu 16.04](https://xubuntu.org/getxubuntu/) and create an install DVD or USB stick (see the "Easy Ways to Switch" section of the [main Ubuntu download page](https://www.ubuntu.com/download/desktop) for instructions for doing this from Windows, Mac, and Linux)
- Boot your computer from the install media you just created.
  - Choose "Install Xubuntu" on the first screen
  - On the "Preparing to install Xubuntu" screen, check both the "download updates" and "install 3rd party software" checkboxes
  - On the "Installation Type" screen, leave the default "erase disk and install Xubuntu" checked, then click the "Install Now" button.
    - If this computer has a previous operating system on it, that option is not the default, so you'll have to select it.
  - Click "continue" to confirm your installation
  - Choose your time zone on the "Where are you?" screen
  - Stick with the default selection on the "Keyboard layout" screen
  - Use "eztv" for the username & choose "log in automatically" - the rest of the "Who are you?" screen is your choice.
  - Once the installer finishes, follow the instructions to remove the install media & reboot the machine.
- Once you're on the desktop, click the main menu button (blue circle with a mouse icon in the upper-left) and start the "Terminal Emulator"
  - Copy & paste (right click > paste) the following into the terminal: `wget -q -O - https://bitbucket.org/lambdadynamics/eztv/raw/master/download.sh | bash` and hit ENTER to download everything
  - Copy & paste `cd EZTV && ./setup.sh` and hit ENTER to begin installing the EZTV software.  It will prompt you for your password before it starts - it won't show anything as you type.
    - Installing will take a few minutes...
  - Once it's done, reboot. (`sudo reboot` in the terminal or click the power button in the lower-right of the main menu)
- When the computer comes back on, it should have 2 things open: a web browser and OBS.  
  - You need to set up your webcam/video capture card, microphone, and any software effects in OBS (you should only need to do this once)
  - Click "Start Streaming" in OBS
  - Use the browser to go to http://localhost/, then hit F11 to go into full screen mode.
  - You're ready to record some video!


## TODO
 - Copy OBS profile
 - Set firefox home page
