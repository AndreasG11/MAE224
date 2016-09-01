The objective of this lab is to investigate laminar and turbulent flow, and the difference between them, in a pipe by creating a Moody diagram.   
In this experiment you will have to relate the pressure drop in the pipe to the Reynolds number.  
#Control the Experiment with Particle Photon  
In this experiment you will use a flow meter, electric pump and an optional pressure transducer. With your python, Particle Photon programming, and circuitry knowledge combined you can control and measure all of these things from the comfort of your own computer (with a little help from your Particle Photon friend). 
You will need to control the pump to a known flow rate and then record the pressure drop in the pipe. 
The Particle Photon cannot output the correct voltage or current needed to drive the pump, but it can output a PWM (pulse width modulation) signal! Therefore we will be using a transistor setup known as a MOSFET which will allow you to use an external power source to power the motor, but utilize the Particle Photon to control the motor output.  For those of you who like analogies, using a transistor is like controlling the flow of a firehose with a squirt gun.  The Particle Photon outputs a small square wave which tells the transistor to let a large amount of current flow through the motor.  The real working is a bit more complicated than that and involve quite a bit more applied physics knowledge, band gap theory, and understanding of NPN and PNP transistors, all of which Mike knows a lot about if you are interested in learning more. You can also look at this handy resource [Wikipedia](https://en.wikipedia.org/wiki/MOSFET) or if you are brave [Caltech APh9](http://nanofab.caltech.edu/images/stories/classes/aph9/lecture11.pdf).  All you need to know is that we can now control the motor with a Particle Photon.  Below is a diagram for wiring up the motor control.  

The MOSFET component is the Darlington pair transistor.  It has a gate (g), drain (d) and source (s) are in almost alphabetical order when looking at this component.  The base will be taking the analog output signal from your Particle Photon and will be what controls the output to the motor. The external 12V+ power will come into the motor, then out of it into the collector.  Across the power leads to and from the motor, there is a diode to prevent any back EMF from damaging the motor. The emitter will receive the black wire from the external power supply, which should be referenced to ground.  

<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/Motor%20Diagram.png?raw=true" width="800">  
</p>

The pressure drop in the pipe can be recorded manually by a manometer setup, or by using the pressure transducer and the code that you wrote in the previous lab. It’s a good idea to start using the manometer just because we took all the trouble to make it and it works really well, but as an addendum to the lab you can double check the pressure with the transducer that you just calibrated!  

You are provided with a Photon code outline that you need to modify in order to control the pump and by that, control the flow rate in the pipe. You are also provided with a code that reads the flow rate using the brass flowmeter on the setup. You should familiarize yourself with the code and make sure you understand exactly what is happening. You will be required to add in a minimal amount of code, otherwise it will not work.  From last week you should now be completely familiar with how to get data from the Photon using the cloud and how to save the data to a file. If not, ask your partner(s) or your TA for help in understanding. This week we are going to learn how to send data to the Photon.
If you recall getting data was as simple as making a global variable in the Photon, say:  

```c
int myVar = 0;
```  
and putting the following line in the setup of your code  
```c
Particle.variable(“PithyName”, myVar);
```  
This allowed you to call the function `fetch(“PithyName”)` from pithy to get the value of `myVar` whenever you wanted.  Now we are going to push data using a similar syntax. To tell the Particle Photon to run some code, we will put the following command in our setup

```c
Particle.function(“FunctionCall”,execute);
```  

Some of you might have guessed something like this. What this is actually saying is that when someone from the outside world tries to access the webpage of `FunctionCall` associated with your Particle Photon, the Particle Photon will run a function called execute. This function could look something like this, written outside of both setup and loop.

```c
int execute(String arg){
//Somethings desirable like say turn a motor
return 1;
}
```  

NOTE: The names of commands and function (i.e. `FunctionCall` and execute) are limited to 12 characters and you can only make 4 functions. So be thrifty with your functions  

We will be using this code to adjust the rpm of the motor by changing the duty cycle of a pwm signal. 

Your programming goal is to combine all these codes together and create a python script that will allow you to control the pump, record the flow rate and pressure and write the values to a CSV file. You will need to calibrate the duty cycle ([Wikipedia](https://en.wikipedia.org/wiki/Duty_cycle)) of the pwm going to the pump so that you know the flow rate for a certain duty cycle.  

Because the flow meter works by measuring the rpm on an internal impeller, the digital output is simply a square wave signal where each step corresponds to 2 milliliters of fluid past the impeller. In other words, the code will be reading the frequency of the rotor and you will need to use the following links ([Adafruit](https://www.adafruit.com/product/833)) to relate this frequency to the flow rate in each pipe.  

In the above link for the flow meter, pay attention to the description of the wires. You will need to provide power to the flow meter and read the pulses with your Particle Photon in addition to powering and controlling the pump. 
In you pithy accounts you will find Lab2Shell.py for some initial code to work from. You’ll add some missing code to 1) read data into pithy, 2) write a value to a spark function to control the pump, and 3) append collected data to given arrays and plot accordingly.   

#How to measure pressure drop  

To propel a flow in a pipe there needs to be a pressure gradient. You will see later in class that this pressure gradient is constant and thus the pressure varies linearly along the pipe axis. The pressure “drop” is just the change in pressure from one point to another. There are a set of five open water columns that you can use to calculate the pressure drop. Think back to lab 1 and hydrostatics to relate these water columns to pressure.  

Alternatively (this is optional), connect the first and last pressure taps on a given pipe to the two openings on your pressure sensor to measure the differential pressure. Additionally, you can use the fact that the outlet of the pipe is exposed to atmospheric pressure, think how this information can make your life easier in measuring pressure drop.

# Quick intro to Pipe Flows  
Before we get into the details of the data collection, here is a quick overview on pipe flow (since the lab is now slightly ahead of the lectures). 

Pipe flow can be analyzed through the Navier-Stokes equations. The details of this analysis are a bit beyond what is required of you, but what is important is to understand that pipe flow is a balance of the internal pressure gradient and viscous forces (shear stress). Your goal is to relate the pressure drop in a pipe to the flow rate through it. There are two different regimes of fully developed pipe flow: laminar, seen in figure 1(a), and and turbulent, seen in figure 1(b).

<p align="center">
<img src="http://me.queensu.ca/People/Sellens/images/Profiles.jpg" width="500">  
</p>Figure 1 - (a) laminar velocity profile and (b) turbulent velocity profile. http://me.queensu.ca/People/Sellens/PowerLaw.html  

#Laminar Pipe Flow
A simple analysis of the Navier Stokes equation for flow within the pipe readily yields the above assertion that the viscous drag from the wall is balanced by the imposed pressure gradient:  

<p align="center">
<img src="http://latex2png.com/output//latex_f379384ea7e3961126fae14f057d9ba1.png" width="200">  
</p>
If we assume that our flow is fully developed (for our experiment, this means we are sufficiently far away from the entrance of the pipe), we can readily analyze this equation.  Since the pressure gradient is constant, the velocity profile can analytically be found to be parabolic (see figure 1(a)). This is one of the few analytical results in fluid mechanics but unfortunately does not occur very often in the real world. Real world applications, like oil pipelines, or water pipes, typically require high flow rates which facilitate the growth of instabilities in the flow making the flow turbulent.  
##Turbulent Pipe Flow  
Turbulence adds random (chaotic like) fluctuations to flow field, and we lose the nice parabolic velocity profile seen in figure 1(a). In a turbulent flow, the velocity profile is fuller (figure 1(b)) and there is a higher viscous stress at the wall. This in turn works to cause a greater pressure drop in turbulent flow, since there is a balance between pressure drop and shear stress. There is no nice analytical expression for turbulent pipe flow like there is for laminar flow, so we are required to conduct experiments to understand this type of flow.  

#Moody Diagram  
Instead of analyzing the equations of motion for the different flow regimes, you will build what is called a “Moody diagram.” This is an empirical relation between the frictional forces in the pipe and the Reynolds number of the pipe flow.   

<p align="center">
<img src="https://upload.wikimedia.org/wikipedia/commons/8/80/Moody_diagram.jpg" width="800">  
</p>  Source: https://upload.wikimedia.org/wikipedia/commons/8/80/Moody_diagram.jpg  

The setup you’re working with involves two pipes with different inner diameters (0.195” and 0.625”) producing laminar and turbulent flows. Whether the flow is turbulent or laminar can be determined by looking at your pressure data (or by calculating the Reynolds number). The Reynolds number, Re, is a dimensionless quantity defined as the ratio of inertia forces to viscous forces and is given by:

<p align="center">
<img src="http://latex2png.com/output//latex_30ccb3956bfc357d71cdcd6530ac3527.png" width="200">  
</p>  

- U = Flow Velocity
- d = Pipe Diameter
- rho = Fluid Density
- mu = Dynamics Viscosity  

In terms of the flow rate, the Reynolds number can be expressed by:

<p align="center">
<img src="http://latex2png.com/output//latex_e0f9cf22290ad76d7bc1596aab0ce6da.png" width="200">  
</p>  

- Q = Volumetric Flow Rate
- A = Pipe Cross-sectional Area  

The flow in a pipe is regarded as laminar when Re < 2300. Above 2300 it can transition to turbulence. Typically there is a range of Reynolds number where the flow is neither laminar nor turbulent, but transitional. 
A Moody diagram is a graph in non-dimensional form that relates the “head loss” (pressure drop) in a pipe to Reynolds number (or flow rate). As was explained in section 3, the pressure drop in the pipe is balanced by the frictional forces in the pipe. **Therefore, to construct your Moody diagram, you will need to know the flow rate and the pressure drop.** The Moody diagram is typically a plot of the friction factor versus Reynolds number. The friction factor can be related to the pressure drop by:  

<p align="center">
<img src="http://latex2png.com/output//latex_78c0eb90c107d61dad726dd43b81e329.png" width="200">  
</p>  

