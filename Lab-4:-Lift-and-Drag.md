The objective of this lab is to understand lift and drag on 2D objects of different shapes.  Using the given objects, you will have to determine lift and drag characteristics using pressure measurements around the body as well as force measurements.  During the course of this lab, you will explore the lift and drag characteristics of an airfoil through experiment and simulation, as well as that of a cylinder.  You will need to understand the pressure distribution around these objects and how it relates to the generated lift.

# Background
## Terminology

<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Airfoil1.png" width="700">  
Figure 1 - Airfoil.
</p> 


-	The **leading edge** of an airfoil is the portion that meets the air first.   
-	The **trailing edge** is the back of the airfoil.  
-	The **chord line** is an imaginary straight line drawn through the airfoil from its leading edge to its trailing edge.   
-	The **camber line** is the characteristic curve of the airfoil. It is always halfway between the upper and lower surfaces of the airfoil. The **max camber ratio** is the ratio of the maximum distance between the camber and chord line to the chord length.  
-	The **angle of attack** or ![](https://github.com/d008/MAE224/blob/master/equations/alpha.png) is the angle formed by the chord line and the flow direction.  
-	The **thickness** is the maximum distance between the upper and lower surfaces. The **thickness ratio** is the ratio of the maximum thickness to the chord length.  

## Theory
The aerodynamic force on an airfoil is the result of redirecting fluid momentum. For example, a typical airfoil in flow (Figure 2) will exert a force, redirecting the incoming flow downward. Consequently, the flow will exert an equal and opposite force on the airfoil which we can decompose into tangential and perpendicular components relative to the incoming flow. The tangential component of the aerodynamic force is called _drag_ and the perpendicular component is called _lift_.   

Streamlines deflected over the top of the airfoil experience a higher velocity than streamlines under the bottom of the airfoil. From Bernoulli’s equation, we know that this velocity difference will manifest itself as a pressure difference between the top and bottom surfaces. Integrating the net pressure forces along the airfoil surface is one way to calculate the lift and drag force on the airfoil. The shape of the airfoil and the angle of attack determine the amount of lift and drag.  

<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Airfoil2.png" width="600">  
</p> 

<p align="center"> Figure 2: Lift and drag forces on an airfoil.</p>

Lift is typically expressed in terms of the “lift coefficient”. This is a non-dimensional parameter, similar to the friction factor in last week’s lab. The “lift coefficient” is defined as:  

<p align="center">
<img src="https://github.com/d008/MAE224/blob/master/equations/lab4%201.png">  
</p>

Where L is the total lift force, ![](https://github.com/d008/MAE224/blob/master/equations/rho.png) is the density, U is the freestream velocity, c is the chord length, and s is the span of the airfoil. The lift coefficient is related to but separate from the "section lift coefficient"

<p align="center">
<img src="https://github.com/d008/MAE224/blob/master/equations/lab4%202.png">  
</p>

which is given for an infinite (or 2-D) airfoil. If we assume that our 3-D, real life airfoil acts like a 2-D airfoil then ![](https://github.com/d008/MAE224/blob/master/equations/lab4%203.png). Without delving too far into the theory, a 3-D airfoil is influenced by having a finite span where tip vortices form and cause the velocity distribution along the wing to deviate from the 2-D case. **Be careful which lift coefficient you are using, most simulations output the section lift coefficient since the solver is set up for 2-D airfoils!**

For a given airfoil and flow conditions, a typical plot of lift coefficient versus angle of attack can be seen in Figure 3. For thin profiles at low angles of attack, the section lift coefficient predicted by potential flow theory is approximately ![](https://github.com/d008/MAE224/blob/master/equations/lab4%204.png). The slope of ![](https://github.com/d008/MAE224/blob/master/equations/2pi.png) is a very good approximation. The major difference between potential flow theory and real life flows is the effect of viscosity, characterized by the Reynolds number, which you know from the second lab. As can be seen, lift increases with angle of attack until a maximum point beyond which a dramatic decrease is observed due to a phenomenon known as stall (or separation). Physically, stall is flow separation caused by the inability of the flow to withstand the adverse pressure gradient along the top of the airfoil (see Figure 3).  

<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Airfoil3.png" width="200"> 
<img src="https://github.com/mkfu/MAE224/blob/master/images/Airfoil4.png" width="200">
</p> 

Figure 3: Lift coefficient versus angle of attack and the flow separation. Note that the top right airfoil has zero angle of attack, and the bottom right is a stalled airfoil.  

In addition to the lift force (which often is the reason we use an airfoil), we need to worry about the drag force. The drag on an airfoil can be decomposed into two main sources – viscous shear and pressure: 

* Viscous drag comes from “fluid friction” between the fluid and the surfaces due to the effect of viscosity (no-slip at the wall). This friction is associated with the development of boundary layers, and depends on the Reynolds number.   

* Form drag or pressure drag results from the pressure difference between the forward and rearward-facing  areas of the airfoil. This drag is responsible for the significant increase in drag around stall as the flow separates from the airfoil, resulting in an unbalanced pressure distribution.  

Similar to the lift coefficient, drag can be expressed in terms of the “drag coefficient” given by  

<p align="center">
<img src = "https://github.com/d008/MAE224/blob/master/equations/lab4%205.png">  
</p>

where D is the drag force. A typical plot of drag coefficient versus angle of attack can be seen in Figure 4.  

<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/ClCd1.png" width="300">  
</p> 

<p align="center"> Figure 4: Drag coefficient versus angle of attack. </p>
  
To calculate the lift and drag coefficients to study airfoils, one is interested in finding the flow pattern and pressure distribution. A method to achieve this is called Joukowski's transformation (fun fact: his name is actually spelled [Zhukovsky](https://en.wikipedia.org/wiki/Nikolay_Yegorovich_Zhukovsky)). This is a mathematical trick (using complex analysis). Basically, it is relatively easy to know the velocity and pressures for a flow around a cylinder in potential flow. Through a mapping function that converts a circular cylinder into a family of airfoil shapes, we can find the velocities and pressures around a certain type of airfoil, and then compute the lift and drag. The computations are difficult to perform by hand, but can be solved quickly on a computer. If you want to learn more, please refer to ([NASA](http://www.grc.nasa.gov/WWW/k-12/airplane/map.html)) .

# Procedure:
This lab will occur in three different parts, and groups will rotate between the different activities at different times to ensure that everyone gets a crack at the wind tunnel (oh yeah!).  The three components are a simulation of the airfoil in the tunnel, measurements of the airfoil in the wind tunnel, and measurements of a cylinder in the wind tunnel.  You will be comparing the three different components to see the effects of shape on a pressure distribution and the difference between a real experiment and a simulation.  

## Airfoil Simulations: 
The first component of the lab is to simulate the airfoil you’ll be using in Qblade.  You will find an introduction to modeling airfoils with Qblade here: [Introduction to Airfoils and Qblade](https://github.com/d008/MAE224/wiki/Introduction-to-Airfoils-and-Qblade). Note that Qblade returns the section lift coefficient, ![](https://github.com/d008/MAE224/blob/master/equations/section_lift.png), which will need to be converted to the lift coefficient for comparison to experiments. You should follow the tutorial to determine the lift and drag coefficients for the configuration used in the lab, specifically the NACA 0018 airfoil.  Make sure that you include plots of pressure coefficient ![](https://github.com/d008/MAE224/blob/master/equations/Cp.png) as well as ![](https://github.com/d008/MAE224/blob/master/equations/Cl.png) and ![](https://github.com/d008/MAE224/blob/master/equations/Cd.png) vs. ![](https://github.com/d008/MAE224/blob/master/equations/alpha.png) in your lab report.  

### Questions
  

1. Change the Reynolds number of your simulations and compare with your results from above. What happens to the lift and drag curves?     

2. The “Stall Point” is known as the location where the lift curve drops off.  How does Re affect this point?  

3. Make some new airfoils with varying thicknesses and cambers either by using the NACA profile generator or downloading and importing them from airfoiltools.com. Can you determine the following:    

      a.	Generally, what is the effect of camber on an airfoil in terms of the stall point and maximum lift generated?  
      b.	How does the thickness of an airfoil affect its lift and drag?  

## Experiment: Airfoil

<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Airfoilexp.png" width="600">  
</p>

<p align="center">
Figure 5: Airfoil in the wind tunnel.  
</p>

You will note that an airfoil has been mounted into a large wind tunnel, which forms the second portion of this lab.  The airfoil is hollow and contains 30 pressure taps along the center of the body completely encircling it.  Using these pressure taps, you can determine the coefficient of lift and drag around the body.  To measure the surface pressure you will need to use the Matlab function `mrsairfoil`. This function returns two variables which you can access using the following:

```matlab
%Name of the photon inside the airfoil
name = 'mrsairfoil'; 
%Replace abc123 with the access token given to you by the TA for mrsairfoil
atoken = 'abc123'; 

g = Photon(name,atoken);

[cpress,aoa] = g.mrsairfoil;

```
The output of the matlab function `mrsairfoil` will give you two variables, in the above example we have called these `cpress` and `aoa` but you may name them whatever you like. The variable `cpress` is a matrix with the first column corresponding to pressure taps on the top of the airfoil, with position (1,1) being the tap closest to the leading edge. The second column contains measurements of the pressure taps on the bottom of the airfoil, same deal with ordering. Pressure output is in Pascals (Pa). The other variable, `aoa`, is the angle of attack measured by an accelerometer located inside the airfoil, the corresponding units are degrees. It has a resolution of +/- 1 degree for this setup.

To find the lift and drag coefficients, you will require the forces on the body.  Can you think of a way to determine the forces based on the pressures measured via the taps?  If not, you should definitely ask your TA.  Direct force measurements are also taken via the LabVIEW setup on the adjacent computer and should be recorded for use in your lab report.

For the airfoil, you should take data sets for, at minimum, three different wind speeds and a large number of angles of attack, sufficient to trace out a relatively good plot of lift coefficient vs. angle of attack.  To determine the speed of the tunnel, you will need to use the digital pitot probe read-out on the wind tunnel and calculate the freestream velocity (Note: do **not** go above 20 m/s in the wind tunnel.  This could result in damage to the equipment).  For all runs, you should have successfully collected pressure data, angle of attack as measured by the Photon, and the forces measured by the force balance in the wind tunnel.  You should, in your report, make a comparison between ![](https://github.com/d008/MAE224/blob/master/equations/Cp.png), ![](https://github.com/d008/MAE224/blob/master/equations/Cl.png) and ![](https://github.com/d008/MAE224/blob/master/equations/Cd.png), the curves for the simulation, the direct force measurements, and the determinations made from the pressure taps.  

### Questions:
1.  For both the experiment and simulation, what happens to the lift at zero angle of attack? Why?
2.  The lift appears to decrease at a certain angle of attack, why do you think this is the case?
3.  The drag increases sharply also, why is this? Are these two phenomena related?
4.  Given the above, why is a plot of the lift and drag coefficients useful?
5.  Where do you suppose most aircraft operate in terms of angle of attack?
6.  Stunt planes are capable of flying upside down. How is this possible?
7.  How do your experimental results compare with the simulations? Comment on any differences and explain them.

## Experiment: Cylinder  

<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/cylinderexp.png" width="600">  
</p>

<p align="center">
Figure 6: Cylinder in the wind tunnel. 
</p>

The third task of this lab is to measure the pressure distribution around a cylinder.  In another wind tunnel, there is a medium-sized cylinder with holes evenly distributed along both sides.  The holes are connected to pressure sensors.  Similar to the airfoil tests, you can determine drag coefficient for the cylinder using the pressure distribution around the cylinder.  You should take measurements at two different speeds.  Additionally, you should take sets of measurements with and without the tripwire set up in the tunnel. The Matlab code to access the cylinder pressure data is similar to the airfoil:

```matlab
%Name of the photon inside the cylinder
name = 'mrcylinder'; 
%Replace abc123 with the access token given to you by the TA for mrcylinder
atoken = 'abc123'; 

g = Photon(name,atoken);

cpress = g.mrcylinder;
```
Here `cpress` is again a matrix, with the first column corresponding to the top of the cylinder and the value in position (1,1) is the pressure tap closest to the leading edge. The second column is simply the pressure taps along the cylinder bottom. All values have units of Pascals (Pa).

### Questions:
1.  Does the pressure along the upper and lower surface of the cylinder match?  Should it?  
2.  Compare the results between the cases which utilize the tripwire.  Do the results look different?  What is physical phenomena that underlies this?  

## Lab Write-Up  
Your report is expected to include:  

### Abstract (10%)  
- A short paragraph summarizing your work, including the task and the results.   

### Introduction (15%)   
- Discuss the scientific concept of the lab.  
- Effectively present the objectives and purpose of the lab.  

### Experimental procedure (10%) 
- Generally describe the procedure, including a basic sketch.  

### Results (15%) 
- Pressure distributions for the cylinder and airfoil.  
o	How did you calculate lift and drag?
- Lift and drag coefficient plots for both experiment and simulation.
- Detailed findings.

### Discussion (35%)
- Compare results from experiment and simulation for airfoil.  
-	Compare cylinder to theoretical prediction.  
-	Discuss flow separations for airfoil.  
-	Answer discussion questions.  
-	Error analysis.  

### Conclusion (15%) 
- Summarize your **findings** (don’t just state what you did!).  

