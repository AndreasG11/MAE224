#Introduction

##Setting up your new Photon
This tutorial is to set up and initialize your Particle Photon unit. You will get the unit connected to the internet and your own lab group account. Then, a test programs will be loaded on your unit to verify communication between the online account and the Particle Photon.

You can make a serial connection to the unit through the USB cable. The following steps will open up that connection to allow you to communicate with the unit. (The lab computers should have the drivers in them, and it will take a moment to install.  If there are issues, or you wish to do the update at home, the drivers can be found at https://s3.amazonaws.com/spark-website/Particle.zip).

1.	Start by saving (“save as” on the desktop) and unzip the CoolTerm program to the desktop (we did this for you! (Lucky you)): http://freeware.the-meiers.org/CoolTermWin.zip
2.	Plug your Particle Photon unit into the computer through the USB cable.  The large LED should flash green then breath cyan (Trust us, it happens).  This means it is connected to puwireless. If it does not make this color, contact Cody. He’ll know what to do.
3.	To communicate with the unit, you will need to open a serial port. Hold down the SETUP button until the light flashes blue. This means it is able to connect through the serial port. Open the CoolTerm folder on your desktop and start the program.
4.	Click on the “Options” button on the top of the program. In the popup window, click the “Re-Scan Serial Ports” button. The drop down window labeled “Port:” should have at least one selectable option. Select the port your unit is on (likely COM19 or something similar, you can find it in the device manager from control panel in windows. NEVER COM 1). Alternatively, you can use download and use particle-cli. Ask Cody about it if you are curious.
5.	Set the Baudrate to 9600, data bits to 8, parity to none, stop bits to 1. 
6.	Click ok, which will close the popup window.
7.	Click the “Connect” button at the top of the program.  You should see a connection timer begin at the bottom of the program.

If everything has worked up to now, you will be able to communicate with your unit through the serial terminal!

8.	Press the “i” key (i as in India) on your keyboard to obtain the Particle Photon ID. Write this down; you will connect your lab team’s Particle account to it so you can access the unit wirelessly. It should be a hex string that looks like: 42ff60063478505467883424. 
9.	Close the Connection to the computer and click the RESET button on your Particle Photon. Make sure Particle breathes cyan.
