Lab 1 is broken down into two parts:
- The first part (one you are currently reading) will introduce you to the lab equipment used throughout this semester and teach you some of the basic measurement methods and debugging concepts used for any experiment.
- In the second part of the lab you will be performing an experiment on fluid hydrostatics (covered [here](https://github.com/d008/MAE224/wiki/Lab-1:--Hydrostatics))

## Introduction

This course begins by quickly leading you through the basics of the equipment used in the lab and some simple measurements. You are expected to be familiar with the concepts of voltage, current, resistance, and Ohm's law; although these will be reviewed briefly in this guide.

At certain points in the lab your lab group will be required to demonstrate the successful completion of an activity to either the TA or Mike. **These points will be indicated in boldface type** and must be completed before moving on to the next section of the lab manual

## Laboratory Tools and Equipment

The first step of this lab is to set up your Particle Photon. Follow the tutorial [here](https://github.com/d008/MAE224/wiki/Setting-Up-a-Particle-Photon). **Make sure to verify with the TA that your LED is blinking!**

Now, with your Particle Photon unplugged and powered off, insert it into the breadboard as shown below.

<p align="center">
<img src="https://github.com/d008/MAE224/blob/master/images/breadboard.png?raw=true" width="600">  
</p>

The breadboard or prototyping board will allow you to easily try out new circuits. Some important things to note:

1. The two columns on each side of the board are for the power supply rails (a 3.3 or 5.0V connection, for example) and the column pins are connected only in the vertical direction. Use these rails by jumping over (with a section of wire) the 3.3V or GND output from the Photon to the corresponding rail you wish to power. Be very careful to get these connections right!
2. The lettered rows in the middle of the board are connected horizontally in two groups. Pins a-e are connected and pins f-j are connected. Directly in the middle is a small valley to remind you that pins a-e and f-j are not connected to each other. This allows you to branch off from each side of the Photon independently (useful if you don't always want pin A1 going to D1 for example).

You are now prepared to do the first example on how to read/write with your Photon: [Example 1: Read and Write Pins](https://github.com/d008/MAE224/wiki/Example-1-:-Read-and-Write-Pins). **Once you have completed the tutorial, show your Matlab plot to the TA before continuing.**

Now on to some of the other electronic equipment in the lab, first is the Direct Current (D.C.) power supply:

<p align="center">
<img src="https://github.com/d008/MAE224/blob/master/images/Power_Supply.png?raw=true" width="800">  
</p>

The power supplies we use in the lab have 3 outputs. Channels 1 and 2 have adjustable voltage outputs and current limits, channel 3 is fixed at 5 volts (it is the small connectors at the bottom right). Two modes are available, constant voltage (C.V.) and constant current (C.C.), with the limits of these two modes being set by the two dials. In C.V. mode, the supply will give out as much current as the connected circuit will accept (up to the current limit point) to maintain the output voltage. C.C. mode is similar, however the supply now adjusts the voltage (up to the voltage limit point) to maintain a constant current. The mode being used is indicated by the LEDs below each channel. 

You may have also noticed the 3 connections for channels 1 and 2: Ground, V-, and V+. Ground is the building ground, and you can shunt or jumper either V- or V+ with ground to force one side of the power supply low. This is handy if, for example, your circuit requires a supply which is -15V to 0V (you would jumper V+ to ground).

Using the image above, turn on your power supply and set the output to be +1.0 Volts with a current limit of 0.05 Amps. Now with what you learned in  [Example 1](https://github.com/d008/MAE224/wiki/Example-1-:-Read-and-Write-Pins), read the voltage of the power supply into Matlab to verify the power supply display.

The Particle Photon is a surprisingly useful little tool, and you will find it can replicate the functions of almost all the electronic tools we will talk about in the next few paragraphs. This also means you can use the lab tools to check if your Photon (and Matlab code!) is working as expected. In future labs, you will be asked to verify the Photon's readings using these devices, so be prepared!

### Digital Multi-Meters

The next two tools are known as Digital Multi-Meters (DMMs) and are the swiss-army knife of anyone working with electronics (i.e. they work good if you are in a bind or need something quick, but better tools are available). The first of these is the Fluke 73, and is the simplest of the two.

<p align="center">
<img src="https://github.com/d008/MAE224/blob/master/images/Fluke_73.png?raw=true" width="800">  
</p>

We will mainly be reading D.C. voltages and currents in this lab. The meter is also capable or reading the average and root-mean-square Alternating Current (A.C.) voltages (and a few other things). Note we can easily measure resistance and check the polarity of diodes with this tool as well. With the leads connected to the proper terminals, check the voltage output from your power supply and compare that value with the one you obtained with the Photon.

The second DMM available to you is the Keithley.
<p align="center">
<img src="https://github.com/d008/MAE224/blob/master/images/Keithley.png?raw=true" width="800">  
</p>

This unit has more functionality than the Fluke 73, as you might have guessed. Also notice the number of decimal places in the display, what does this tell you about the accuracy of the measurements? Try taking a reading of the DC voltage again with the Keithley.

### Oscilloscope

Finally we come to what could be considered the most useful tool available to you, the Techtronix Oscilloscope. An oscilloscope is perhaps the only tool which allows you to "see" electricity, more specifically electric signals in the time domain. 

<p align="center">
<img src="https://github.com/d008/MAE224/blob/master/images/oscilloscope.png?raw=true" width="800">  
</p>

There are a variety of measurements that can be made with the oscilloscope, including signal frequency, voltage (mean, peak-to-peak, RMS), rise/fall time, etc. This tool will be essential in diagnosing and debugging your experimental setups. A screen shot of the oscilloscope display is shown below.

<p align="center">
<img src="https://github.com/d008/MAE224/blob/master/images/oscilloscope%20screen.png?raw=true" width="600">  
</p>

On the rightmost side is the measurement display (you can access this menu by pressing the "measurement" button) a variety of options are available for each channel. Note that there are 4 windows available for measurement display on this screen. Along the bottom of the screen is the information regarding the X and Y axis divisions. For instance, Channel 1 is reading a square wave and the division between each horizontal dashed line is 5 Volts. 

## Read a PWM with the Oscilloscope and Particle Photon
Follow this example: [Example 2: PWMs](https://github.com/d008/MAE224/wiki/Example-2-:-PWMs). Make sure to show your TA the output from the Photon on the oscilloscope at the end! 

When you have completed the above and feel comfortable with all the lab equipment, you have finished the first week of required lab material. If not, please ask for assistance and experiment outputting various signals with your Particle Photon the TA's and Mike are here to help!





