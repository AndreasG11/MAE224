The objective of this lab is to understand lift and drag on an airfoil. You will be provided with force sensor measurements and surface pressure measurements. You will have to use this data to determine the lift and drag characteristics. You will need to understand the pressure distribution around the airfoil and how it relates to the generated lift.

# Background
## Terminology

<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Airfoil1.png" width="700">  
Figure 1 - Airfoil.
</p> 

-	The **leading edge** of an airfoil is the portion that meets the air first.   
-	The **trailing edge** is the sharp edge at the back of the airfoil.  
-	The **chord line** is an imaginary straight line drawn through the airfoil from its leading edge to its trailing edge.   
-	The **camber line** is the characteristic curve of the airfoil. It is always halfway between the upper and lower surfaces of the airfoil. The **max camber ratio** is the ratio of the maximum distance between the camber and chord line to the chord length.  
-	The **angle of attack** or ![](https://github.com/d008/MAE224/blob/master/equations/alpha.png) is the angle formed by the chord line and the flow direction.  
-	The **thickness** is the distance between the upper and lower surfaces. The **thickness ratio** is the ratio of the maximum thickness to the chord length.  

## Theory
The aerodynamic force on an airfoil is the result of redirecting fluid momentum. For example, a typical airfoil in flow (Figure 2) will exert a force, redirecting the incoming flow downward. Consequently, the flow will exert an equal and opposite force on the airfoil which we can decompose into tangential and perpendicular components relative to the incoming flow. The tangential component of the aerodynamic force is called _drag_ and the perpendicular component is called _lift_.   

Streamlines deflected over the top of the airfoil experience a higher velocity than streamlines under the bottom of the airfoil. From Bernoulli’s equation, we know that this velocity difference will manifest itself as a pressure difference between the top and bottom surfaces. Integrating the net pressure forces along the airfoil surface is one way to calculate the lift and drag force on the airfoil. The shape of the airfoil and the angle of attack determine the amount of lift and drag.  

<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Airfoil2.png" width="600">  
</p> 

<p align="center"> Figure 2: Lift and drag forces on an airfoil.</p>

Lift is typically expressed in terms of the “lift coefficient”. This is a non-dimensional parameter, similar to the friction factor in Lab 2. The “lift coefficient” is defined as:  

<p align="center">
<img src="https://github.com/d008/MAE224/blob/master/equations/lab4%201.png">  
</p>

Where L is the total lift force, ![](https://github.com/d008/MAE224/blob/master/equations/rho.png) is the density, U is the freestream velocity, c is the chord length, and s is the span of the airfoil. The lift coefficient is related to but separate from the "section lift coefficient"

<p align="center">
<img src="https://github.com/d008/MAE224/blob/master/equations/lab4%202.png">  
</p>

which is given for an infinite (or 2-D) airfoil. If we assume that our 3-D, real life airfoil acts like a 2-D airfoil then ![](https://github.com/d008/MAE224/blob/master/equations/lab4%203.png). Without delving too far into the theory, a 3-D airfoil is influenced by having a finite span where tip vortices form and cause the velocity distribution along the wing to deviate from the 2-D case. **Be careful which lift coefficient you are dealing with!**

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
  
To calculate the lift and drag coefficients to study airfoils, one is interested in finding the flow pattern and pressure distribution. A method to achieve this is called the Joukowski transformation (fun fact: the name of the man who determined this transformation is actually spelled [Zhukovsky](https://en.wikipedia.org/wiki/Nikolay_Yegorovich_Zhukovsky)). This is a mathematical trick (using complex analysis). Basically, it is relatively easy to know the velocity and pressures for a flow around a cylinder in potential flow. Through a mapping function that converts a circular cylinder into a family of airfoil shapes, we can find the velocities and pressures around a certain type of airfoil, and then compute the lift and drag. The computations are difficult to perform by hand, but can be solved quickly on a computer. If you want to learn more, please refer to ([NASA](http://www.grc.nasa.gov/WWW/k-12/airplane/map.html)) .

Finally, the coefficient of pressure is defined the following way:

<p align="center">
<img src = "https://github.com/d008/MAE224/blob/master/equations/Cpress_eqn.png">  
</p>

## Experiment

<p align="center">
<img src="https://github.com/mkfu/MAE224/images/airfoil_setup.jpg" width="600">  
</p>

<p align="center">
Figure 5: Airfoil in the wind tunnel.  
</p>

The airfoil was mounted into a wind tunnel, similar to the picture shown above. However, the data you will be using was obtained in a pressurised wind tunnel. Therefore, you cannot assume that density is constant across all data. The chord of the airfoil is 0.17 m, and the span is 0.255 m. The airfoil is hollow and contains 32 pressure taps along the center of the body completely encircling it. Using these pressure taps, you can determine the coefficients of lift and drag around the body. Since you did not take this data yourself, you should include a citation like this: Brunner C E, Kiefer J, Hansen M O L, and Hultmark M. Unpublished data, 2020.

The data you are provided with consists of three text files, each corresponding to a different velocity. The columns in the text file are angle of attack, velocity, density, lift from force sensor, drag from force sensor, and the pressures from all pressure taps. The first pressure tap is at the trailing edge. The order then moves along the bottom of the airfoil to the leading edge, and then along the top of the airfoil towards the trailing edge. Thus, the top side is taps [17:32,1] and the bottom side is taps [1:17]. Pressure output is in Pascals (Pa). Force output is in Newtons.

Calculate the Reynolds number of each data set.

Choose one Reynolds number and plot the pressure distribution of the top surface and the bottom surface at zero angle of attack. Is this what you would expect? When plotting pressure distributions, make sure your signs are correct.

Choose one Reynolds number and plot the pressure distribution on the top of the airfoil at the angle right before stall, and the angle right after stall. Compare them.

To find the lift and drag coefficients, you will need to know the forces on the body. Can you think of a way to determine the forces based on the pressures measured via the taps?  If not, you should definitely ask your TA or refer to the lab lecture slides.  Once you have calculated the lift and drag coefficients using the pressure measurements, calculate the lift and drag coefficients using the force sensor measurements, and compare the two methods.

For each velocity, make a plot showing the lift and drag coefficients as a function of angle of attack from pressure transducers and from force sensors. Specify the Reynolds number of each plot. Include error bars. Is this what you expected? Are they measuring the exact same things? What accounts for the difference between the drag from pressure and the drag from the force sensor?

Make one plot showing only the lift and drag coefficients from the pressure transducers for all three velocities.

Theory tells us that the slope of the lift curve in the attached region should be 2*pi, so that the function of the slope is cL = 2 * pi * alpha. Choose a Reynolds number and fit a line to the data points in the attached region. What is the slope? Why is it not 2 * pi? What do the endplates have to do with this? (Hint: downwash!)

Error analysis:
What is the standard deviation in the velocity? In the density? Use these as your errors in velocity and density. Use a value of +- 25 Pa as the error in the pressure taps, and +- 2.5 N in the force sensor. Assume all other measurements have no error. Show error bars on lift and drag coefficients from pressure and force sensors in the three plots in which you compared the pressure sensors to the force sensors. Don't include error bars in the plot in which you compare the three Reynolds numbers.

You should, in your report, make a comparison between ![](https://github.com/d008/MAE224/blob/master/equations/Cp.png), ![](https://github.com/d008/MAE224/blob/master/equations/Cl.png) and ![](https://github.com/d008/MAE224/blob/master/equations/Cd.png), the direct force measurements, and the determinations made from the pressure taps.

### Questions:
1.  What happens to the lift at zero angle of attack? Why?
2.  The lift appears to decrease at a certain angle of attack, why do you think this is the case?
3.  The drag increases also, why is this? Are these two phenomena related?
4.  Given the above, why is a plot of the lift and drag coefficients useful?
5.  Where do you suppose most aircraft operate in terms of angle of attack?
6.  Stunt planes are capable of flying upside down. How is this possible?
7.  Why is the pressure coefficient never higher than 1 (although it can be much lower than -1)?

## Matlab Code to help with Pressure Integration

We have added a matlab function to blackboard called `airfoil_normals.m`. This function has the following format:

```matlab
[ xn, yn, u, v ] = airfoil_normals( aoa );
```

`aoa` is the input angle of attack for the airfoil. The function returns 4 vectors: `xn` and `yn` are the x and y locations of the pressure taps given from the leading edge of the airfoil and cylinder. `u` and `v` are the surface normals at those locations. Each function also generates a plot of the body with the associated surface normals, note that flow is from left to right (as it should be). You will need the information about the surface normals in order to integrate the pressure distribution along the airfoil to resolve lift and drag.
## Lab Write-Up  

**Remember, you will be submitting a group report and an individual report. The group report will contain the abstract, introduction, experimental procedure, and results, and must be a maximum of 5 pages. The individual report will contain the discussion and conclusion, and should reference the results from the group section. This report must be a maximum of 2 pages.**

All lab manuals are to be emailed to mae224lab@gmail.com as a PDF. The group portion of the lab should have group member last names, group number, and lab number in the filename. For example: Novoselov_Meehan_Huang_Group51_Lab1.PDF

The individual portion should include your name, your group number, and your lab number. For example: Novoselov_Group51_Lab1.PDF

Your report is expected to include:  

### Abstract (10%)  
- A short paragraph summarizing your work, including the task and the results.   

### Introduction (15%)   
- Discuss the scientific concept of the lab.  
- Effectively present the objectives and purpose of the lab.

### Results (25%) 
- Pressure distributions for the airfoil.  
o	How did you calculate lift and drag from the pressure data?
- Lift and drag coefficient plots.
- Detailed findings.

### Discussion (35%)
- Compare results from experiment.  
- Discuss flow separations for airfoil.  
- Answer discussion questions for each part of the lab (see above in Lab Manual Procedure).  
- Error analysis.

### Conclusion (15%) 
- Summarize your **findings** (don’t just state what you did!).  