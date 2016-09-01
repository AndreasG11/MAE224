#Hydrostatics 
**Your mission, should you choose to accept it, involves calibrating a pressure transducer.**

## Background
As you are by now aware (or will be as of Monday, depending on when you’re reading this), the pressure in a fluid system varies with depth.  This is why scuba divers get the bends when they rise too quickly, and why wooden submarines never really caught on.  The governing relationship for pressure with depth is generally:

![](http://latex2png.com/output//latex_216b6246eb545de4dd03616add3e99e2.png)

This relationship allows us to relate pressure of the fluid at one position in a control volume to the pressure at another position.  This principle is why mmHg is a unit of pressure measurement: we can construct a device which can accurately measure pressure from a column of mercury.  Such a device is known as a barometer, and it looks like this:  

<p align="center">
<img src="http://2012books.lardbucket.org/books/principles-of-general-chemistry-v1.0/section_14/8cec964659fd2bb7ec4dc6c2c78eb4f9.jpg" width="400">  
</p>Source: http://2012books.lardbucket.org/books/principles-of-general-chemistry-v1.0/s14-02-gas-pressure.html  


This device is used to measure atmospheric pressure through the hydrostatic principle.  Essentially, the weight of the mercury in the tube must balance the “weight” of the atmosphere, or the pressure.  Today, we will be constructing something similar called a manometer, which can be used to measure the difference between a pressurized region and the atmosphere.  This is often done via a U-tube (not YouTube) manometer, which looks like this:

<p align="center">
<img src="https://2.bp.blogspot.com/-TDRlZhhKwFk/U4ryRq532PI/AAAAAAAAAh4/AWs0TZNXncY/s1600/U-tubes.jpg" width="400">  
</p>Source: https://2.bp.blogspot.com/-TDRlZhhKwFk/U4ryRq532PI/AAAAAAAAAh4/AWs0TZNXncY/s1600/U-tubes.jpg  

Now, we can use the principle of hydrostatics to measure a pressure difference between two reservoirs.   The gravitational force is balanced by the pressure force and so by a simple force balance, the pressure can be deduced by knowing the column height.

## Tools and Materials
You have several tools and materials at your disposal to complete the lab. This includes but is not necessarily limited to:  
- Particle Photon w/ Breadboard + USB  
- pithy/MATLAB  
- Flexible Tubing  
- Large PVC Tube  
- Pressure Transducers  
- Electrical doodads of various types  
- Graduated Cylinders  
- Mass Scale  
- Hand-pumping-ball  
- Computer  
-  Fresh Princeton water  
- [Code](https://github.com/mkfu/MAE224/tree/master/Lab%201%20Shells)  * * * 

##Build a manometer
The goal of this lab is to calibrate the pressure sensor given to you using the manometer and the Particle Photon. You should build a device that allows you to do so and record the data with your Photon. 
At this point, you should derive an expression relating the pressure to the column height. Follow, these steps in your derivation:  

1.    In a manometer, if one end is open to the air, the pressure difference is the difference between the atmospheric pressure at the open end, P0, and the pressure established by the hand pump at the closed end, P1.  

2.    By drawing a free body diagram on an appropriate volume of water in the manometer (or you can use the differential equation you learned in class), write the expression that relates the difference in pressure to the liquid height and density.  

In order to build the manometer, connect the cylinders and tubing such that you can pressurize one side with the hand pump and observe the displacement. 

##Connect the pressure sensor to the Particle Photon  

Pressure sensors can measure pressure in a multitude of ways - the ones we have use the change in electrical resistivity of silicon due to strain (piezoresistive effect) to detect pressure.
You will use your Particle Photon to measure the voltage signal from the pressure sensor.
To connect the pressure sensor to the Particle Photon:  

1.	Plug the pressure sensor into your breadboard.  

2.	Look at the data sheet for the pressure sensor and find out what each pin of the pressure sensor should connect to (data sheet is on Blackboard).   

3.	Connect the pressure sensor pins to the corresponding pins on the Particle Photon (be careful not to switch the pins for +3.3 V and ground).  

N.B. Some of you aspiring fluid mechanicians might notice that the sensors provided are supposed to work on 5V. Fear Not! The sensor will still be sensitive to the changes in pressure, but you will probably develop a new calibration curve.  

##Test your setup with the fluid
Your goal is to calibrate the pressure sensor given to you using the manometer and the Particle Photon.  By pressurizing the system, you are changing the manometer height, and you should have a relationship between pressure, fluid density, and height by this time. By taking the appropriate data, you will be able to construct a calibration curve relating the pressure applied to the sensor to the voltage output.

 
Photon
Pressure sensors can measure pressure in a multitude of ways - the ones we have use the change in electrical resistivity of silicon due to strain (piezoresistive effect) to detect pressure.
You will use your Particle Photon to measure the voltage signal from the pressure sensor.
To connect the pressure sensor to the Particle Photon:
1.	Plug the pressure sensor into your breadboard.  

2.	Look at the data sheet for the pressure sensor and find out what each pin of the pressure sensor should connect to (data sheet is on Blackboard).  

3.	Connect the pressure sensor pins to the corresponding pins on the Particle Photon (be careful not to switch the pins for +3.3 V and ground).  


N.B. Some of you aspiring fluid mechanicians might notice that the sensors provided are supposed to work on 5V. Fear Not! The sensor will still be sensitive to the changes in pressure, but you will probably develop a new calibration curve.

##Test your setup with the fluid
Your goal is to calibrate the pressure sensor given to you using the manometer and the Particle Photon.  By pressurizing the system, you are changing the manometer height, and you should have a relationship between pressure, fluid density, and height by this time. By taking the appropriate data, you will be able to construct a calibration curve relating the pressure applied to the sensor to the voltage output.

1.	The calibration curve should give you a pressure if you give it a voltage (p(V)).    

2.	What kind of curve-fit makes the most sense?   

##Test your setup with water
Fill your manometer with water and use your calibration curve. See how you can control the heights of the columns by changing the pressure.  

1.	Look at how pressure changes in time (live) as you pressurize it. Explain this behavior (can you figure out a way to reduce unwanted behavior?).  

2.	Plot pressure versus the difference in heights between the water columns. Use at least 10 data points, and think about how you want to measure the height.  

##Ain’t No Mountain High Enough...:
As you should have noticed by now, there appears to be a relationship between heights and pressures (Ever considered why pressure sometimes is measured in mmHg or inH2O? ). Elevate one of the graduated cylinders, say on top of one of the tool boxes.  Is there a clever way to determine the height that you elevated the cylinder (aside from measuring it directly with a ruler)? What happens if you lift the flexible tubing connecting the graduated cylinders above the free surface of the water? Does the manometer still work? Why or why not?  

##Other questions for write-up:  

1.	Estimate the uncertainty in your data. What is the biggest source of error?  

2.	Does the calibration curve you found for the sensor match that in the manual? Why might it be different?  

3.	What is the shape of the calibration curve (can you show that this truly is the shape)?  

#Guidelines for the report
Your report is expected to include (remember maximum 5 pages):
###Abstract  
- A short paragraph summarizing your work, including the task and the results. 
   
###Introduction   
- Discuss the scientific concept of the lab.  
- Effectively present the objectives and purpose of the lab and any equation or concept you need. 
 
###Experimental Procedure  
- Provide some details about the experiment and methodology and why you chose your particular setup  

###Results
- Provide plots and pictures to illustrate your results  

###Discussion
-  Outline sources of error and perhaps answer any of the questions brought up in the lab manual

###Conclusion  
- Summarize findings 



