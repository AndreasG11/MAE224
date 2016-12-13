Download the [Source](https://github.com/mkfu/MAE224/tree/master/Source%20Files) files if you have not already.

In this tutorial, we will use the lessons from Example 1 to learn how to turn a servo and (independently) read the frequency of a PWM signal fed into a pin.

#MATLAB
##Servo
For this example connect the A1 and A5 analog pins together. We will also need to connect a servo to the Photon. A standard servo has 3 wires that need to be connected. Typically, these wires are red, black, and white.  These colors correspond to  

 **Wire Color** | Electrical | Pin   
 --- | --- | ---   
 Red | +5V | VIN   
 Black | Ground | GND 
Signal | White | SIG  

<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/example2circuit.png" width="600">  
</p>   

Paste the following Matlab code into a new script. Make sure that the folder containing Photon.m is contained within your file path.

Matlab code:

```matlab
%% Read Data Example
%Enter access token below. This can be found in the settings of your Particle Account
atoken = 'abc123'; %YOUR ACCESS TOKEN HERE

%Enter the Photon ID
core =  'my_photon'; %YOUR PHOTON ID OR NAME HERE

%Instantiates a new Photon object
g = Photon(core,atoken);
g.getConnectedDevices()'

%% Move a servo

%Attach a servo to D0
g.attachServo('D0');

%Check if the device is connected
if g.getConnection
%Rotate a half roration clockwise
    for i = 10:10:180
        g.move(i);
        pause(1)
    end
%Rotate a half rotation counter-clockwise    
    for i = 180:-10:10
        g.move(i);
        pause(1)
    end
end
%Detach the servo
g.detachServo()
%% Read PWM Frequency
%Set the write frequency of the analog pins
g.setFreq(3400)
%Write to A5
g.analogWrite('A5',100)
g.analogRead('A1')
g.getTone('A1')
```

The first few lines should look exactly like example 1. Remember that we need to replace the authorization token and name of the Photon correctly. The end result is that the servo should rotate

##Lets break down what the code means
The first three lines are the most important. We can instantiate a new Photon object that will have all of the information it needs to interact with our physical Photon. The two pieces of information that we need are the authorization token and the name of the Photon.
```matlab
atoken = 'abc123'; %YOUR ACCESS TOKEN HERE
core =  'class1'; %YOUR PHOTON ID OR NAME HERE

g = Photon(core,atoken);
```

Replace the strings in the above code with your Particle account authorization token and photon name.  Lastly, we will make a new object and pass those arguments via the constructor.

We can check that everything is working by trying a function call
```matlab
g.getConnectedDevices()'
```
which will print out a list of all of the connected devices related to your account.  

Next, we will tell the Photon that we want to attach a servo to a given pin, namely the pin where we attached the signal wire (D0). We use the following line.

```matlab
g.attachServo('D0');
```
Note that at this moment, while the Physical photon can support many, many servos simultaneously, the Photon class which you are utilizing can only support attaching a single Photon. Moving the servo is as simple as using the move command. Here, we simply have the servo rotate clockwise 180 degrees and then counter-clockwise 180 degress. In this instance the servo takes a value from ~10 - 180. This applies to some linear actuators as well. This is more a function of the servo library which is utilized on the Photon side more than anything else.  

We first check to make sure that the Photon is connected to the internet.
```matlab
if g.getConnection
```

We rotate 180 degrees clockwise
```matlab
    for i = 10:10:180
        g.move(i);
        pause(1)
    end
```
and then 180 degrees counter-clockwise

```matlab
    for i = 180:-10:10
        g.move(i);
        pause(1)
    end
```

Finally, we detach the servo with the `detachServo()` functions
```matlab
g.detachServo()
```

You should now be able to modify this code and use it to control servo motors attached to your Photon. Note that some servos have limitations on their range of motion, make sure to not go outside this range or you will damage the servo!
