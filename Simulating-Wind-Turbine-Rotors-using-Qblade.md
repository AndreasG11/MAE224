#Designing Wind Turbine Rotors using Qblade

In lab 5, you will be tasked with designing a wind turbine. This will make use of your knowledge of aerodynamics and airfoil theory from lecture and lab 4. There are many variables available in the design space of a wind turbine, and deciding how to alter your rotor shape to maximize power output will be your primary task. Using the Qblade tool, and your knowledge of airfoils, you will attempt to produce the most power possible with your design. Once your rotor is designed in Qblade, you will be exporting the geometry into Creo and then 3-D printing the rotors to test in the wind tunnel (covered in a separate tutorial).  This guide covers some of the basics of wind turbine design as well as how to test your design in Qblade. 
In the most general terms, wind turbine rotors are constructed using various airfoils stacked vertically to create a rotor blade. The type, thickness, chord, twist and radial position of the airfoils are chosen by the designer to optimize the blade shape for a set of input conditions. See figure 1 for an example rotor blade. 

<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/Final%20Project/BEM.png" width="800"> Figure 1:Example wind turbine blade, note that z is the radial direction out from the rotor hub.  

The innermost section of the blade is known as the root (z = 0 in the figure above), and the tip is the section farthest from the root. Each airfoil section is given a specific chord and twist. Twist is the rotation of the airfoil around the y axis. You can see in the figure above that the sections closer to the root appear to have more twist than the tip sections. When rotor blades are designed, each airfoil is considered as an individual 2-D section and we locally solve for the flow around that airfoil. Figure 2 shows the velocity triangle for an individual airfoil section, note how similar this is to what you saw in Lab 4. In fact we use the exact same airfoil data (![](http://latex2png.com/output//latex_c82e65bbf37b2f47a371932817eb105e.png) and ![](http://latex2png.com/output//latex_1dd428313457da8064fb91ce2038bbf1.png) versus ![](http://latex2png.com/output//latex_6bca1400106cb4aef18b4bd527545d74.png)) to solve for the lift and drag forces produced by this airfoil section. The only difference being the rotational velocity due to the rotor movement,![](http://latex2png.com/output//latex_0f3b89bcb2de74b082c58411deac1faf.png), and the induced velocity W. 
The induced velocity arises from the vortex system trailing the wind turbine, and it produces an axial component opposite the free-stream velocity ![](http://latex2png.com/output//latex_c0a38ee83d82ecb15e50651f1021bdbc.png), and a tangential component which increases the rotational velocity seen by the blade. These velocities combine to produce ![](http://latex2png.com/output//latex_dbddc054497557c8fe11f07a1a15928e.png), or the velocity seen by the blade. The angle of attack is given by ![](http://latex2png.com/output//latex_1da7d0b3cf0de2ec27423b7fa75dd5ad.png), where φ is known as the flow angle and θ is the local twist. 

The method by which we solve for the induced velocity is an iterative procedure known as Blade Element Momentum (or BEM) and combines the forces produced by each individual blade element (or section as in figure 2) and places them on a global momentum balance of the rotor disk. This must be solved iteratively until the solution converges. You will not need to be familiar with the theory behind BEM for the lab, but if you are interested there are many resources available such as the book by Martin O.L. Hansen, “Aerodynamics of Wind Turbines”. Qblade has a BEM solver built in which will take your rotor geometry, along with the Cl and Cd vs α curves you generated for each airfoil section and return the power output of a turbine (along with many other useful data points). 

<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/Final%20Project/QB1.png" width="800"> Figure 2: Airfoil section velocity triangle

##Wind Turbine Design Overview
There are a few basic non-dimensional parameters which are typically used in the wind industry, you will need these to interpret your results from Qblade.   

**Parameter** | **Definition** | **Explanation**
--- | --- | ---
![](http://latex2png.com/output//latex_b9440a2a1a27b86fb6f24967d749de96.png)| `renders` | **nicely**
![](http://latex2png.com/output//latex_101adfd42181c796410d2904aa18823a.png) | 2 | 3  
![](http://latex2png.com/output//latex_865ddaf133b432b351d4abd96524cfda.png) | 2 | 3
![](http://latex2png.com/output//latex_b8d2bebd6fcf01865d26e7f6f9e06590.png) | 2 | 3
![](http://latex2png.com/output//latex_f2bc3c4d8a306214b976baa8a6c40afa.png) | 2 | 3
![](http://latex2png.com/output//latex_b8d2bebd6fcf01865d26e7f6f9e06590.png) | 2 | 3