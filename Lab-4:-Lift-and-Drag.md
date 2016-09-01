The objective of this lab is to understand the lift and drag on 2D objects of different shapes.  Using the given objects, you will have to determine lift and drag characteristics using pressure measurements around the body as well as force measurements.  During the course of this lab, you will explore the lift and drag characteristics of an airfoil through experiment and simulation, as well as that of a cylinder.  You will need to understand the pressure distribution around these objects and how it relates to the generated lift.

#Background
##Terminology
Figure 1 - Airfoil 
<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Airfoil1.png" width="800">  
</p> 


-	The **leading edge** of an airfoil is the portion that meets the air first.   
-	The **trailing edge** is the back of the airfoil.  
-	The **chord line** is an imaginary straight line drawn through the airfoil from its leading edge to its trailing edge.   
-	The **camber line** is the characteristic curve of its upper or lower surface. The **max camber ratio** is the ratio of the maximum distance between the camber and chord line to the chord length.  
-	The **angle of attack** is the angle formed by the chord line and the flow direction.  
-	The **thickness** is the maximum distance between the upper and lower surfaces. The **max thickness ratio** is the ratio of the maximum thickness to the chord length.  

##Theory
The aerodynamic force on an airfoil is the result of a redirecting fluid momentum. For example, a typical airfoil in flow (Figure 2) will exert a force, redirecting the incoming flow downward. Consequently, the flow will exert and equal and opposite force on the airfoil which we can decompose into tangential and perpendicular components relative to the incoming flow. The tangential component of the aerodynamic force is called Drag, and the tangential is called Lift.   

Streamlines deflected over the top of the airfoil experience a higher velocity than streamlines under the bottom of the airfoil. From Bernoulli’s equation, we know that this velocity difference will manifest itself as a pressure difference between the top and bottom surfaces. Integrating the net pressure forces along the airfoil surface is one way to calculate the lift and drag force on the airfoil. The shape of the airfoil and the angle of attack determine the amount of lift and drag.  

<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Airfoil2.png" width="800">  
</p> Figure 2: Lift and drag force on an airfoil  

Lift is typically expressed in terms of the “lift coefficient”. This is a non-dimensional parameter, similar to the friction factor in last week’s lab. The “lift coefficient” is defined as:  

<p align="center">
<img src="http://latex2png.com/output//latex_a68258b9b44211125f58acc55af1aa1a.png" width="200">  
</p>

Where L is the lift force per unit span (the length into the page),![](http://latex2png.com/output//latex_685b0db7aecbeca0e7ba39ecfd36dc30.png)  is the density, U is the freestream velocity and c is the chord length. 

For a given airfoil and flow conditions, a typical plot of lift coefficient versus angle can be seen in Figure 3. For thin profiles at low angles of attack, the coefficient predicted by potential flow theory is approximately ![](http://latex2png.com/output//latex_ca0071e8bf8d773d7b2607f6c50c1cb3.png).This slope (![](http://latex2png.com/output//latex_bcc5f7fec5fdce9aef1571f320cb0631.png)) is a very good approximation. The major difference between potential flow theory and real life flows is the effect of viscosity, characterized by Reynolds number, which you know from the second lab. As can be seen, lift increases with angle of attack until a maximum point beyond which a dramatic decrease is observed due to a phenomenon known as stall (or separation). Physically, stall is flow separation caused by the inability of the flow to withstand the adverse pressure gradient along the top of the airfoil (see Figure 3).  

<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Airfoil3.png" width="200"> 
<img src="https://github.com/mkfu/MAE224/blob/master/images/Airfoil4.png" width="200">
</p> Figure 3: Lift coefficient versus angle of attack and the flow separation. Note the top right has zero angle of attack, and the bottom right is a stalled airfoil.  

In addition to the lift (which often is the reason we use an airfoil), we need to worry about the drag force. The drag on an airfoil can be decomposed into two main sources – viscous and pressure:   

Viscous drag comes from “fluid friction” between the fluid and the surfaces due to the effect of viscosity (no-slip at the wall). This friction is associated with the development of boundary layers, and depends on the Reynolds number.   

Form drag or pressure drag results from the pressure difference between the forward and rearward-facing  areas of the airfoil. This drag is responsible for the significant increase in drag around stall as the flow separates from the airfoil, resulting in an unbalanced pressure distribution.  

Similarly, drag can be expressed in terms of the “drag coefficient” given by  

<p align="center">
<img src="http://latex2png.com/output//latex_cfeb053ba76a3075e80939610aa28a9e.png" width="200">  
</p>

Where ![](http://latex2png.com/output//latex_f681cb4e34e279ca78f2f2924b376b65.png) is the drag force per unit span (the length into the page),![](http://latex2png.com/output//latex_685b0db7aecbeca0e7ba39ecfd36dc30.png)  is the density, U is the freestream velocity and c is the chord length. A typical plot of drag coefficient versus angle of attack can be seen in Figure 4.  

<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/ClCd1.png" width="300">  
</p> Figure 4: Drag coefficient versus angle of attack.
  
To calculate the lift and drag coefficient to study airfoils, one is interested in finding the flow pattern and pressure distribution. A method to achieve this is called Joukowski's transformation. This is a mathematical trick (using complex analysis). Basically, it is relatively easy to know the velocity and pressures for a flow around a cylinder in potential flow. Through a mapping function that converts a circular cylinder into a family of airfoil shapes, we can find the velocity and pressures around a certain type of airfoil, and then compute the lift and drag. The computations are difficult to perform by hand, but can be solved quickly on a computer. If you want to learn more, please refer to ([NASA](http://www.grc.nasa.gov/WWW/k-12/airplane/map.html)) .

#Procedure:
This lab will occur in three different parts, and groups will rotate between the different activities at different times to ensure that everyone gets a crack at the wind tunnel (oh yeah!).  The three components are a simulation of the airfoil in the tunnel, measurements of the airfoil in the wind tunnel, and measurements of a cylinder in the wind tunnel.  You will be comparing the three different components to see the effects of shape on a pressure distribution and the difference between a real experiment and a simulation.  

##Airfoil Simulations: 
The first component of the lab is to simulate the airfoil you’ll be using in Qblade.  You will find a Qblade tutorial on Blackboard to assist you with modeling and determining aspects of the airfoil.  You should follow the tutorial to determine the lift and drag coefficients for the configuration used in the lab, specifically the NACA 0018 airfoil.  Make sure that you include plots of pressure coefficient (![](http://latex2png.com/output//latex_b85506e982d5e3cb67d76e057a39ff4c.png)) as well as ![](http://latex2png.com/output//latex_c82e65bbf37b2f47a371932817eb105e.png) and ![](http://latex2png.com/output//latex_1dd428313457da8064fb91ce2038bbf1.png) vs. angle of attack in your lab report.  

###Questions
Questions:  

1. Change the Reynolds number of your simulations and compare with your results from above. What happens to the lift and drag curves?     

2. The “Stall Point” is known as the location where the lift curve drops off.  How does Re affect this point?  

3. Make some new airfoils with varying thicknesses and cambers either by using the NACA profile generator or downloading and importing them from airfoiltools.com. Can you determine the following:    

      a.	Generally, what is the effect of camber on an airfoil in terms of the stall point and maximum lift generated?  
      b.	How does the thickness of an airfoil affect its lift and drag?  

##Experiment: Airfoil

<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Airfoilexp.png" width="600">  
</p> Figure 5: Airfoil in the Wind Tunnel  


You will note that an airfoil has been mounted into a large wind tunnel, which forms the second portion of this lab.  The airfoil is hollow and contains 30 pressure taps along the center of the body completely encircling it.  Using these pressure taps, you can determine the coefficient of lift and drag around the body.  To find the drag and lift coefficients, you will require the forces on the body.  Can you think of a way to determine the forces based on the pressures measured via the taps?  If not, you should definitely ask your TA.  Direct force measurements are also taken via the LabVIEW setup on the adjacent computer.

For the airfoil in the wind tunnel, you should take sets of data for, at minimum, three different wind speeds and a large number of angles of attack, sufficient to trace out a relatively good plot of lift coefficient vs. angle of attack.  To determine the speed of the tunnel, you will need to use the digital pitot probe read out on the wind tunnel and calculate the freestream velocity (Note: do **not** go above 20 m/s in the wind tunnel.  This could result in damage to the equipment).  For all runs, you should have successfully collected pressure data, angle of attack as measured by the Photon, and the forces measured by the force balance in the wind tunnel.  You should, in your report, make a comparison between ![](http://latex2png.com/output//latex_1dd428313457da8064fb91ce2038bbf1.png), ![](http://latex2png.com/output//latex_b85506e982d5e3cb67d76e057a39ff4c.png) and ![](http://latex2png.com/output//latex_c82e65bbf37b2f47a371932817eb105e.png) the  curves for the simulation, the direct force measurements, and the determinations made from the pressure taps.  

##Experiment: Cylidner  

<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/cylinderexp.png" width="600">  
</p> Figure 5: Cylinder in the Wind Tunnel  

The third task of this lab is to measure the pressure distribution around a cylinder.  In another wind tunnel, there is a medium-sized cylinder with holes evenly distributed along one side.  The holes are connected to pressure sensors.  Similar to in the airfoil testing, you can determine drag coefficient for the cylinder using the pressure distribution around the cylinder.  You should take measurements at two different speeds.  Additionally, you should take sets of measurements with and without the tripwire set up in the tunnel.  

###Questions:
1.  If there were pressure taps along the other side of the cylinder, would you expect to see a lift force?  Why or why not?  
2.  Compare the results between the cases which utilize the tripwire.  Do the results look different?  What is physical phenomenon underlies this?  

##Suggested Lab Write Up  
Your report is expected to include:  

###Abstract:  
- A short paragraph summarizing your work, including the task and the results.   

###Introduction:   
- Discuss the scientific concept of the lab  
- Effectively present the objectives and purpose of the lab  

###Experimental procedure  
- Generally describe the procedure, including a basic sketch  

### Results  
- Pressure distributions for the cylinder and airfoil  
o	How did you calculate Lift and Drag?
- Lift and drag coefficient plots for both experiment and simulation

##Discussion
- Compare results from experiment and simulation for airfoil  
-	Compare cylinder to theoretical prediction  
-	Discuss flow separations for airfoil  
-	Answer discussion questions  
-	Error analysis  

###Conclusion  
- Summarize your **findings** (don’t just state what you did!)  
