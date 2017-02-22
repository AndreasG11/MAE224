The objective of this lab is to investigate laminar and turbulent flow, and the difference between them, in a pipe flow by creating a Moody diagram.   
In this experiment you will have to relate the pressure drop in the pipe to the Reynolds number.  
#Control the Experiment with Particle Photon  
In this experiment you will use two flow meters, an electric pump and an optional pressure transducer. With your Matlab-programmed Particle Photon, and circuitry knowledge you can control and measure all of these things from the comfort of your own computer. 
To run the experiment, you will need the ability to set the pump to a known flow rate and then record the pressure drop in the pipe. 
The Particle Photon cannot output the correct voltage or current needed to drive the pump, but it can output a PWM (pulse width modulation) signal! Therefore we will be using a transistor setup known as a MOSFET which will allow you to use an external power source to power the motor, but utilize the Particle Photon to control the motor output.  For those of you who like analogies, using a transistor is like controlling the flow of a firehose with a squirt gun.  The Particle Photon outputs a small square wave which tells the transistor to let a large amount of current flow through the motor.  The real working is a bit more complicated than that and involves quite a bit more applied physics knowledge, band gap theory, and understanding of NPN and PNP transistors, all of which Mike knows a lot about if you are interested in learning more. You can also look at this handy resource [Wikipedia](https://en.wikipedia.org/wiki/MOSFET) or if you are brave [Caltech APh9](http://nanofab.caltech.edu/images/stories/classes/aph9/lecture11.pdf).  All you need to know is that we can now control the motor with a Particle Photon.  Below is an image of the motor control board with details of each part.  

The MOSFET has three pins which correspond to gate (g), drain (d) and source (s) when looking at this component from the front.  The gate is controlled via the IDX-609 chip which is what is known as a driver chip, it converts the square-wave signal from the Photon to a higher voltage needed to drive the MOSFET efficiently. There are some other, ancillary components as well which assist in providing the necessary power to the pump. You will need to plug in your Particle Photon (with the USB connector facing left as shown below) and then connect USB power. 

<p align="center">
<img src="https://github.com/d008/MAE224/blob/master/images/Lab2_New_Circuit.jpg" width="800">  
</p>

12 Volts from the bench-top power supplies must be fed into the two, upper left connections (note that this circuit will draw upwards of 2 amps to power the pump). The pump itself must be connected to the screw terminals on the upper right (black is ground, brown is V+). **_Ask Mike or the TA to check your circuit before turning on the power supply._**

The pressure drop in the pipe can be recorded manually using the manometer tubes, you will need the value of dP/dx in order to make your Moody diagrams later in the lab. 

The Printed Circuit Board (PCB) for this lab has a few other connections you may have noticed. These are for the two flow-meters attached to the experiment. The larger brass meter is the _Total Flow Rate_ through the pipe and the smaller plastic meter measures the _Laminar Flow Rate_. Because the flow meter works by measuring the rpm on an internal impeller, the digital output is simply a square wave signal where each step corresponds to some volume of fluid moving past the impeller. In other words, the code will be reading the frequency of the rotor (giving you the time or _rate_ component) and each pulse corresponds to a volume of fluid (typically a few milli-Liters). In order to read the signal you will need to use the `getTone(apin)` command from the class file. This command measures the time between two pulses and returns the frequency (or 1 / dt) of the pulse. You can then convert this frequency to a flow rate using the following:

- _Total Flow Rate_ [Liters/min] = (frequency [Hz] + 3) / 8.1

- _Laminar Flow Rate_ [Liters/min] = (frequency [Hz] + 7.3) / 80.4

Your programming goal is to combine all of this into a Matlab script which will allow you to control the pump, record the flow rate and pressure (either manually or with a transducer) and then write those values to a file. You will need to calibrate the PWM signal going to the pump so that you know the flow rate for a given duty cycle. Check the [Example 2: PWMs](https://github.com/d008/MAE224/wiki/Example-2-:-PWMs) if you need a refresher. **_The goal here is to calibrate the voltage input to the total flow rate._** There are only 3 connections to the Photon you will need to make to control the experiment:

1. Pump PWM Output from the Particle Photon (top pin on the 6 pin strip to the right of the Photon) to control the power that is sent to the pump.
2. Total flow meter (read the frequency of this pin to get the total flow rate).
3. Laminar flow meter (small white one, read the frequency of this pin to get the laminar flow rate).

Note that power and ground for all the sensors has been taken care of for you in advance on the circuit board.

#How to measure pressure drop  

To propel a flow in a pipe there needs to be a pressure gradient. You will see later in class that this pressure gradient is constant and thus the pressure varies linearly along the pipe axis. The pressure “drop” is just the change in pressure from one point to another. There is a set of five open water columns that you can use to calculate the pressure drop. Think back to lab 1 and hydrostatics to relate these water columns to pressure.  

Alternatively (this is optional), connect the first and last pressure taps on a given pipe to the two openings on your pressure sensor to measure the differential pressure. Additionally, you can use the fact that the outlet of the pipe is exposed to atmospheric pressure, think how this information can make your life easier in measuring pressure drop.

# Quick intro to Pipe Flows  
Before we get into the details of the data collection, here is a quick overview on pipe flow (since the lab is now slightly ahead of the lectures). 

Pipe flow can be analyzed through the Navier-Stokes equations. The details of this analysis are a bit beyond what is required of you, but what is important is to understand that pipe flow is a balance of the internal pressure gradient and viscous forces (shear stress). Your goal is to relate the pressure drop in a pipe to the flow rate through it. There are two different regimes of fully developed pipe flow: laminar, seen in figure 1(a), and turbulent, seen in figure 1(b).

<p align="center">
<img src="http://me.queensu.ca/People/Sellens/images/Profiles.jpg" width="500">  
</p>
Figure 1 - (a) laminar velocity profile and (b) turbulent velocity profile. 
Source: <http://me.queensu.ca/People/Sellens/PowerLaw.html>  

#Laminar Pipe Flow
A simple analysis of the Navier-Stokes equations for flow within the pipe readily yields the above assertion that the viscous drag from the wall is balanced by the imposed pressure gradient:  

<p align="center">
<img src="https://github.com/d008/MAE224/blob/master/equations/lab2_1.png" width="100">  
</p>
Note that cylindrical coordinates are usually used to derive the analytical function between pressure gradient and velocity in pipe flows. If we assume that our flow is fully developed (for our experiment, this means we are sufficiently far away from the entrance of the pipe), we can readily analyze this equation.  Since the pressure gradient is constant, the velocity profile can analytically be found to be parabolic (see figure 1(a)). This is one of the few analytical results in fluid mechanics but unfortunately does not occur very often in the real world. Real world applications, like oil pipelines, or water pipes, typically require high flow rates which facilitate the growth of instabilities in the flow making the flow turbulent.  
##Turbulent Pipe Flow  
Turbulence adds random (chaotic-like) fluctuations to the flow field, and we lose the nice parabolic velocity profile seen in figure 1(a). In a turbulent flow, the velocity profile is fuller (figure 1(b)) and there is a higher viscous stress at the wall. This in turn works to cause a greater pressure drop in turbulent flow, since there is a balance between pressure drop and shear stress. There is no nice analytical expression for turbulent pipe flow like there is for laminar flow, so we are required to conduct experiments to understand this type of flow.  

#Moody Diagram  
Instead of analyzing the equations of motion for the different flow regimes, you will build what is called a “Moody diagram.” This is an empirical relation between the frictional forces in the pipe and the Reynolds number of the pipe flow.   

<p align="center">
<img src="https://upload.wikimedia.org/wikipedia/commons/8/80/Moody_diagram.jpg" width="800">  
</p>  
Source: <https://upload.wikimedia.org/wikipedia/commons/8/80/Moody_diagram.jpg>

The setup you’re working with involves two pipes with different inner diameters (0.195” and 0.625”) producing laminar and turbulent flows. Whether the flow is turbulent or laminar can be determined by looking at your pressure data (or by calculating the Reynolds number). The Reynolds number, Re, is a dimensionless quantity defined as the ratio of inertial forces to viscous forces and is given by:

<p align="center">
<img src="https://github.com/d008/MAE224/blob/master/equations/lab2_2.png" width="100">  
</p>  

- U = Flow Velocity [m/s]
- d = Pipe Diameter [m]
- <img src="https://github.com/d008/MAE224/blob/master/equations/rho.png" width="10">   = Fluid Density [kg/m^3]
- <img src="https://github.com/d008/MAE224/blob/master/equations/mu.png" width="10"> = Dynamic Viscosity [Pa s]  

In terms of the flow rate, the Reynolds number can be expressed by:

<p align="center">
<img src="https://github.com/d008/MAE224/blob/master/equations/lab2%203.png" width="100">  
</p>  

- Q = Volumetric Flow Rate
- A = Pipe Cross-sectional Area  

The flow in a pipe is regarded as laminar when Re < 2300. Above 2300 it can transition to turbulent. Typically there is a range of Reynolds numbers where the flow is neither laminar nor turbulent, but transitional. 
A Moody diagram is a graph in non-dimensional form that relates the “head loss” (pressure drop) in a pipe to Reynolds number (or flow rate). As was explained in the "Quick Intro To Pipe Flows" section, the pressure drop in the pipe is balanced by the frictional forces in the pipe. **Therefore, to construct your Moody diagram, you will need to know the flow rate and the pressure drop.** The Moody diagram is typically a plot of the friction factor versus Reynolds number. The friction factor can be related to the pressure drop by:  

<p align="center">
<img src="https://github.com/d008/MAE224/blob/master/equations/lab2%204.png" width="100">  
</p>  

- l = distance between pressure taps  
- f = Darcy friction factor  

Turbulent and laminar flows show different curves on a Moody diagram. The turbulent curve is sensitive to the properties of the pipe, mainly roughness, while the laminar plot admits a simple analytical solution of the governing equations given by:  

<p align="center">
<img src="https://github.com/d008/MAE224/blob/master/equations/lab%202%205.png">  
</p> 

Remember that you only know the flow rate at two locations- make sure you are using the correct one! Think of how you can isolate each pipe and get the correct flow rate.   

In this experiment, the quality of the data contributes to your grade so make sure you take enough data points and make sure you’re waiting enough time for the setup to stabilize when you change the flow rate (this may take upwards of 40 seconds).  

#Extra Credit 
-  Think of alternative ways by which you can estimate the flow rate in the small pipe and try to implement them in order to verify the relation for laminar flow.   

-  Try to construct the Moody diagram by starting with a high Re and going to low Re (without stopping the pump) and then going from low Re to high Re. To get the extra-credit, you will have to present both measurements, discuss the difference (if observed) and explain when this difference is expected to be significant.  

-  Successfully reduce drag in a novel, meaningful and verifiable way. If you succeed, please let your TA know so they can help you write a journal article.  

#Guidelines for the report  
All lab manuals are to be shared with or emailed to mae224lab(at)gmail.com
Your report is expected to include:  
###Abstract:  
- A short paragraph summarizing your work, including the task and the results.   

###Introduction:   
- Discuss the scientific concept of the lab. 
- Effectively present the objectives and purpose of the lab.  
- The Reynolds number is one of the most important parameters in fluids mechanics. Explain the physical significance of this number and give some examples of high and low Reynolds number flows around you.  
- Commercial airplanes fly at Reynolds numbers on the order of several million. Think about how you can construct an experiment to get such high Reynolds numbers without building a facility the size of a commercial airplane.  

###Experimental procedure
- Give enough details of the procedure and the scientific concept behind them.  

### Results  
- Flow Rate vs. Voltage calibration curves.
- Detailed findings.  
- Moody diagram plot for laminar and turbulent flows.  

##Discussion
-	Analysis of the results.
-	Compare with Moody diagram in textbooks.
-	Do your findings correspond? Why or why not?
-	Provide sufficient explanation of the findings and relate to concepts presented in the introduction.
-	Error analysis.

###Conclusion  
- Summarize findings.  



