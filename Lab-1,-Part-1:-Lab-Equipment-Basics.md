Lab 1 is broken down into two parts:
- The first part will introduce you to the lab equipment used throughout this semester and teach you some of the basic measurement methods and debugging concepts used for any experiment (covered in this manual)
- In the second part of the lab you will be performing an experiment on fluid hydrostatics (covered _INSERT_LINK_)

## Introduction

This course begins by quickly leading you through the basics of the equipment used in the lab and the basics of some simple measurements. You are expected to be familiar with the concepts of voltage, current, resistance, and Ohm's law; although these will be reviewed briefly in this guide.

At certain points in the lab your lab group will be required to demonstrate the successful completion of an activity to either the TA or Mike. **These points will be indicated in boldface type** and must be completed before moving on to the next section of the lab manual

## Laboratory Tools and Equipment

The first step of this lab is to set up your Particle Photon. Follow the tutorial [here](https://github.com/d008/MAE224/wiki/Setting-Up-a-Particle-Photon). Make sure to verify with the TA that your LED is blinking!

Now on to some of the other electronic equipment in the lab, first is the power supply:

<p align="center">
<img src="https://github.com/d008/MAE224/blob/master/images/Power_Supply.png?raw=true" width="800">  
</p>

The power supplies we use in the lab have 3 outputs. Channel 1 and 2 have adjustable voltage outputs and current limits, channel 3 is fixed at 5 volts (the small connectors at the bottom right). Two modes can be run, constant voltage (C.V.) and constant current (C.C.), with the limits of these two modes being set by the two dials. In C.V. mode, the supply will give out as much current as the connected circuit will accept (up to the current limit point) to maintain the output voltage. C.C. mode is similar, however the supply now adjusts the voltage (up to the voltage limit point) to maintain a constant current. The mode currently running is indicated by the two LEDs below each channel. 

You may have also noticed that there are 3 connections for channels 1 and 2: Ground, V-, and V+. Ground is the building ground, and you can shunt or jumper either V- or V+ with ground to force one side of the power supply low. This is handy if, for example, your circuit requires a supply which is -15V to 0V (you would jumper V+ to ground).

Using the image above, turn on your power supply and set the output to be 1.0 Volts with a current limit of 0.05 Amps. 







