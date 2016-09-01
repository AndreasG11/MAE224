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



