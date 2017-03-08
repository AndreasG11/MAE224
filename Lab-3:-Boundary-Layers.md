Today, we explore the velocity profile of a shear layer in a channel flow. You will do this by measuring the velocity along the cross section of the channel using a pitot tube. Pitot tubes can be used, with the help of Bernoulli’s equation, to measure the velocity at a point in the flow.  Actuators connected to the pitot tubes allow the pitot tubes to be moved up and down with commands from the Photon. You will again be using pressure transducers to measure pressure differences. 

The objective is to plot the boundary layer thickness as a function of wind tunnel speed for a few different wind tunnel speeds.

To do this, you will first obtain plots of velocity vs. distance from the wall in the channel. The boundary layer should be clearly visible!

#Week 1  
##Concepts  
You are already familiar with measuring pressure in a flow. We often talk about three types of pressures in a flow:   

1.	Static pressure, ps: This is the pressure at an undisturbed point in the flow. In lab 2, you used pressure taps to find the static pressure drop along a pipe.  
2.	Total pressure, pt: the pressure at a point where the fluid has been brought to rest.    
3.	Dynamic pressure: this is the difference between the total and the static pressure and is related to the velocity of the fluid.  

<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Pitot1.png?raw=true" width="300">  
</p>  

In class you learned Bernoulli’s equation,   
<p align="center">
<img src="https://github.com/d008/MAE224/blob/master/equations/lab3%201.png">  
</p>   

**Be sure you understand why we can apply Bernoulli’s equation in our channel flow. **  

Since we can apply Bernoulli’s equation in the flow, let’s think about the two points where we want to apply the equation:  

<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Pitot2.png" width="500">  
</p>  

This brings us back to the word small. The opening in the pitot tube is so small that air doesn’t enter it, which means that the flow sees the pitot tube as a bluff body (the zoomed-in figure). 

Using Bernoulli’s equation and thinking about the boundary conditions at point 2 on the pitot probe, derive an expression for P2-P1  in the channel flow.  

Given the definitions we have provided, what is P1 and what is P2?

**_Check with your TA to make sure your equations are correct before proceeding._** 

###Boundary Layers  
In order to satisfy the no-slip condition at solid boundaries in flows at high Reynolds numbers, a thin boundary layer forms in which the velocity changes from 0 at the wall to the free-stream value U at some distance away. The boundary layer thickness ![](https://github.com/d008/MAE224/blob/master/equations/delta.png) is typically defined as the distance from the wall at which the velocity reaches the free-stream value, U. For laminar flow over a flat plate, one can show that the boundary layer thickness ![](https://github.com/d008/MAE224/blob/master/equations/delta.png) grows as ![](https://github.com/d008/MAE224/blob/master/equations/sqrtx.png). Use dimensional analysis together with the fact that ![](https://github.com/d008/MAE224/blob/master/equations/deltasimx.png) to figure out the functional form for ![](https://github.com/d008/MAE224/blob/master/equations/delta.png). That is, consider the dimensions of the other important variables (U and ![](https://github.com/d008/MAE224/blob/master/equations/nu.png)) to see how they can fit together with ![](https://github.com/d008/MAE224/blob/master/equations/sqrtx.png) to form a length scale. This will be correct up to a numerical prefactor, which turns out to be about 4.91.

<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/BL1.png" width="600">  
</p>  

Divide both sides of your equation by x. Do you notice anything familiar about the right hand side? (Hint: what's your favorite dimensionless parameter?)

**_Check with a TA to make sure you arrive at the correct equations before proceeding._**

Finally, let's plug in some numbers to see what to expect. For air flowing past a flat plate at 10 m/s, how thick should the boundary layer be 50 cm from the leading edge? 

Boundary layers eventually become turbulent far enough down a plate, typically at ![](https://github.com/d008/MAE224/blob/master/equations/lab3%202.png), where ![](https://github.com/d008/MAE224/blob/master/equations/lab3%203.png) is the Reynolds number based on distance x. What is the value of ![](https://github.com/d008/MAE224/blob/master/equations/Rex.png) in the previous example? At roughly what distance x do we expect the boundary layer to become turbulent?  

##Check out the anemometer in the tunnel  
Go next door to the wind tunnel lab and see the anemometer in action. The rate of spin of the cups is proportional to the velocity in the tunnel. The instrument was calibrated to output the velocity reading you see. We will use this value as a sanity check when we are looking at the pitot tube readings.   

##Control the experiment with the Particle  
In this experiment, each group will control an individual linear actuator connected to a pitot tube in a wind tunnel next door. The actuator allows you to set the distance between the pitot tube and the wall, and a differential pressure sensor is connected between the pitot tube and a separate static pressure tube. What kind of pressure are you measuring then?

For the linear actuator, there are three wires. The red and black ones should be connected to the power supply and GND of the Particle Photon, and the white one is for the signal input and should be connected to an analog pin you define in your Particle Photon codes.

Now try to challenge yourself. You need to write out all your codes. 

**For Matlab:**  
You will use the class of Matlab commands provided to move the servo-mounted pitot tube to a location in the tunnel and then record the output of the pressure transducer. The servo can move from values of 40 to 180, **but should only be set to values from 60 to 115 when in the wind tunnel**. If you go out of the range, you will damage the actuator. A larger value means that the actuator moves closer to the bottom wall. Before proceeding, please do [Example 3: Servos](https://github.com/d008/MAE224/wiki/Example-3-:-Servos).  

_In order to check that your code is moving the actuator as desired and safely, we'll have webcams set up so that one or two members of your group can be at the wind tunnel and talk to the remainder of the group back at the lab computer._  
 
To prepare for taking measurements, complete the following steps:

1.	Test that you can move your actuator with your Matlab codes *BEFORE* going into the tunnel. **_You must show the TA or Mike your setup before proceeding to use the tunnel!_**  
2.	Find the input value for the actuator that corresponds to your “0 point” at which the pitot tube just touches (or almost touches) the wall without bending. Be careful as you do this! A suggested range is from 60 to 115.  
NOTE: An input of 60 corresponds to a fully retracted actuator. An input of 115 corresponds to an actuator that fully extends to the wall. The setup is such that the actuator cannot fully retract, so don’t set the input below 60. Since the flow is symmetric, you just need to go from the bottom wall to the middle height of the channel. The input will be somewhere between these two values.   
3.	Calibrate the distance corresponding to one tick of the actuator based on linear interpolation. The value should be around 1 mm/tick.  
4.	Remember that the Photon only outputs voltages from the `analogRead()` command. You will need to convert this using the calibration equations shown below to actual pressures. You can then use the Bernoulli equation to convert the pressure into the velocity. 
5.     Write a simple Matlab script to give you a live, continuously updating plot of measured velocity versus time. Check that you see velocity decrease as you move closer to the wall and that the velocity approaches a constant value (which is close to the wind speed measured by the anemometer) far enough from the wall. Use this script to debug your setup!  
6.	Write another Matlab code to measure velocity as a function of distance from the wall, traversing through wall distances. This should be in the format of a "for" loop where each iteration measures the velocity at a new wall distance. You should take several measurements at each location and average the values to reduce error.

**NOTE**: Make sure to wait enough time between measurements for the pressure to stabilize, several seconds using `pause()` is recommended. Once you have enough points, you can have the actuator move the pitot tube to its next position. (You can use your live plot to see how long you should wait.)  

<p align="center">
<img src="https://github.com/d008/MAE224/blob/master/Lab%20Equipment%20and%20Etc/HSCDRRN001NDAA3%20Lab%203%20Low%20Range%20Pitot%20Tube%20Sensor.png" width="600">  
</p> 

[Link to pressure transducer data sheet is here](https://github.com/d008/MAE224/blob/master/Lab%20Equipment%20and%20Etc/Honeywell%20HSC%20Pressure%20Sensors.pdf)

#Week 2
##Take your measurements  
Run your Matlab code to traverse the cross section. You can choose the way you like to record the data, such as saving data to a csv file while plotting the velocity profile.  

There are two positions at different distances from the inlet. Taking the inlet of the glass tunnel as x=0, the first position of the probe is around x = 594 mm and the second position of the probe is around x = 1495 mm.  

You need to put your actuator at these two positions and generate plots with 3 wind tunnel velocities for each. Use the knob on the side of the wind tunnel, setting it to 10, 7, and 4, and make sure you coordinate with other groups that are trying to take data.  

Estimate the boundary layer thickness for each velocity using your plots.  

##Questions  
How does the measured boundary layer thickness change with wind tunnel velocity? From a physical perspective, does this make sense?  

Can you perceive a difference in the shape of your boundary layer profile between the different wind tunnel velocities? Should you be able to? Why or why don’t you see a difference?  

##Extra Credit  
The laminar boundary layer solution is self-similar (or has a similarity solution) which means that the flow “looks the same” at all lengths and times. This means we can express the velocity in terms of a single similarity variable ![](https://github.com/d008/MAE224/blob/master/equations/eta.png), which in this case is ![](https://github.com/d008/MAE224/blob/master/equations/lab3%204.png) The similarity solution is then ![](https://github.com/d008/MAE224/blob/master/equations/lab3%205.png).  

Put your measurements in this form and plot u/U as a function of ![](https://github.com/d008/MAE224/blob/master/equations/eta.png), with all 3 data sets on the same plot. How well do your data sets collapse with each other? How well do they agree with the numerical solution? Explain why you may see differences.  

##Suggested Lab Write Up  
Your report is expected to include:  
###Abstract (10%)  
- A short paragraph summarizing your work, including the task and the results.   

###Introduction (15%)   
- Clearly state lab objective.  
- Physics of boundary layers.  
o	Why do they exist?  
o	What do you expect the boundary layer to look like in the channel?  

###Experimental procedure (10%) 
- Physics of pitot tubes.  
o	Why were we able to apply Bernoulli’s equation in the channel flow?  
- Explain why (and how) you made each of your measurements.  

###Results (15%) 
- Clearly (and logically) present your boundary layer data.  

###Discussion (35%)
- Explain if your results were what you expected.  
- Can you think of other ways that velocity can be measured at a point in a flow?  
- What are the sources of error, and how do they contribute to making the measurements either higher, or lower, than expected?  

###Conclusions (15%)  
- Summarize your **findings** (don’t just state what you did!).  


