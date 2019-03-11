Download the [Source](https://github.com/mkfu/MAE224/tree/master/Source%20Files) files if you have not already.

In this tutorial, we will learn how to control a servo.

# MATLAB
## Servo
For this example we need to connect a servo to the Photon. A standard servo has 3 wires that need to be connected. Typically, these wires are red, black, and white.  These colors correspond to  

 **Wire Color** | Electrical | Pin   
 --- | --- | ---   
 Red | +5V | VIN   
 Black | Ground | GND 
White | Signal | SIG  

<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/example2circuit.png" width="600">  
</p>   

Paste the following Matlab code into a new script. Note that you should have added Photon.m to your Matlab path in an earlier tutorial.

Matlab code:

```matlab
%% Move Servo Example %%

%Enter the Photon ID
photon =  'my_photon'; %YOUR PHOTON ID OR NAME HERE
%Enter access token below. This can be found in the settings of your Particle Account
atoken = 'abc123'; %YOUR ACCESS TOKEN HERE


%Instantiates a new Photon object
g = Photon(photon,atoken);
g.getConnectedDevices()

%% Move a servo

%Attach a servo to D0
g.attachServo('D0');

%Check if the device is connected
if g.getConnection()
%Fully extend servo:
    curpos = g.move(115);
    pause(10); %Wait 10 seconds
    disp(['Servo sent to position: ' num2str(curpos)])
    pause(5); %Wait 5 seconds
%Retract Servo:
    curpos = g.move(60);
    pause(10);
    disp(['Servo sent to position: ' num2str(curpos)])
    pause(10);
end
%Detach the servo
g.detachServo()
```

The first few lines should look exactly like example 1. Remember that we need to replace the authorization token and name of the Photon correctly. The end result is that the servo should extend then retract.

## Let's break down what the code means
The first three lines are the most important. We can instantiate a new Photon object that will have all of the information it needs to interact with our physical Photon. The two pieces of information that we need are the authorization token and the name of the Photon.
```matlab
atoken = 'abc123'; %YOUR ACCESS TOKEN HERE
photon =  'class1'; %YOUR PHOTON ID OR NAME HERE

g = Photon(photon,atoken);
```

Replace the strings in the above code with your Particle account authorization token and photon name.  Lastly, we will make a new object and pass those arguments via the constructor.

We can check that everything is working by trying a function call
```matlab
g.getConnectedDevices()
```
which will print out a list of all of the connected devices related to your account.  

Next, we will tell the Photon that we want to attach a servo to a given pin, namely the pin where we attached the signal wire (D0). We use the following line.

```matlab
g.attachServo('D0');
```
Note that the `attachServo()` command returns the numeric value of the pin you attached to (i.e. pin D0 returns 0). It is also important for servos that you only use pins which are PWM capable, check the [pinout diagram](https://github.com/d008/MAE224/wiki/Particle-Photon-Pinout-Diagram).

At this moment, while the Physical photon can support many, many servos simultaneously, the Matlab Photon.m class which you are utilizing can only support attaching a single servo at a time. Moving the servo is as simple as using the move command. Here, we simply have the servo move to position from position 40 to 180 and then back again. For the linear actuators we use in the lab, the available range is approximately 40 to 180, with each tick corresponding to roughly 1 mm, but you may wish to calibrate this value (you will do so in Lab 3). Although in lab you will only be using the linear actuators, this command is perfectly valid for any servo, including axial rotation (which typically takes a value from 0 to 180).

Note that if you set the linear actuator to a value outside the range of 40-180, the actuator will not move.

We first check to make sure that the Photon is connected to the internet.
```matlab
if g.getConnection
```

We first fully extend the servo:
```matlab
%Fully extend servo:
    curpos = g.move(180);
    pause(10); %Wait 10 seconds
    disp(['Servo sent to position: ' num2str(curpos)])
    pause(5); %Wait 5 seconds
```
and then retract it back

```matlab
%Retract Servo:
    curpos = g.move(45);
    pause(10);
    disp(['Servo sent to position: ' num2str(curpos)])
    pause(10);
```
Note that the `move()` command returns the servo position that you requested, you can save this into a variable if you like (as we did above with `curpos`).

Finally, we detach the servo with the `detachServo()` functions
```matlab
g.detachServo()
```

You should now be able to modify this code and use it to control servo motors attached to your Photon. Note that some servos have limitations on their range of motion, make sure to not go outside this range or you will damage the servo!

**Demonstrate to your TA that you can extend and retract the servo.**
