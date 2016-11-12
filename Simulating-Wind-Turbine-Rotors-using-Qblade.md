#Designing Wind Turbine Rotors using Qblade
<p align="center">
<img src="https://github.com/d008/MAE224/blob/master/images/tumblr_inline_ncvqpnnT1k1sfsefv.gif" width="600">
</p>
In lab 5, you will be tasked with designing a wind turbine. This will make use of your knowledge of aerodynamics and airfoil theory from lecture and lab 4. There are many variables available in the design space of a wind turbine, and deciding how to alter your rotor shape to maximize power output will be your primary task. Using the Qblade tool, and your knowledge of airfoils, you will attempt to produce the most power possible with your design. Once your rotor is designed in Qblade, you will be exporting the geometry into Creo and then 3-D printing the rotors to test in the wind tunnel (covered in a separate tutorial).  This guide covers some of the basics of wind turbine design as well as how to test your design in Qblade. 
In the most general terms, wind turbine rotors are constructed using various airfoils stacked vertically to create a rotor blade. The type, thickness, chord, twist and radial position of the airfoils are chosen by the designer to optimize the blade shape for a set of input conditions. See figure 1 for an example rotor blade. 

<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Final%20Project/BEM.png" width="800">
</p>  
Figure 1:Example wind turbine blade, note that z is the radial direction out from the rotor hub.  


The innermost section of the blade is known as the root (z = 0 in the figure above), and the tip is the section farthest from the root. Each airfoil section is given a specific chord and twist. Twist is the rotation of the airfoil around the y axis. You can see in the figure above that the sections closer to the root appear to have more twist than the tip sections. When rotor blades are designed, each airfoil is considered as an individual 2-D section and we locally solve for the flow around that airfoil. Figure 2 shows the velocity triangle for an individual airfoil section, note how similar this is to what you saw in Lab 4. In fact we use the exact same airfoil data (![](http://latex2png.com/output//latex_c82e65bbf37b2f47a371932817eb105e.png) and ![](http://latex2png.com/output//latex_1dd428313457da8064fb91ce2038bbf1.png) versus ![](http://latex2png.com/output//latex_6bca1400106cb4aef18b4bd527545d74.png)) to solve for the lift and drag forces produced by this airfoil section. The only difference being the rotational velocity due to the rotor movement,![](http://latex2png.com/output//latex_0f3b89bcb2de74b082c58411deac1faf.png), and the induced velocity W. 
The induced velocity arises from the vortex system trailing the wind turbine, and it produces an axial component opposite the free-stream velocity ![](http://latex2png.com/output//latex_c0a38ee83d82ecb15e50651f1021bdbc.png), and a tangential component which increases the rotational velocity seen by the blade. These velocities combine to produce ![](http://latex2png.com/output//latex_dbddc054497557c8fe11f07a1a15928e.png), or the velocity seen by the blade. The angle of attack is given by ![](http://latex2png.com/output//latex_1da7d0b3cf0de2ec27423b7fa75dd5ad.png), where φ is known as the flow angle and θ is the local twist. 

The method by which we solve for the induced velocity is an iterative procedure known as Blade Element Momentum (or BEM) and combines the forces produced by each individual blade element (or section as in figure 2) and places them on a global momentum balance of the rotor disk. This must be solved iteratively until the solution converges. You will not need to be familiar with the theory behind BEM for the lab, but if you are interested there are many resources available such as the book by Martin O.L. Hansen, “Aerodynamics of Wind Turbines”. Qblade has a BEM solver built in which will take your rotor geometry, along with the Cl and Cd vs α curves you generated for each airfoil section and return the power output of a turbine (along with many other useful data points). 

<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Final%20Project/Vectors.png" width="600"> 
</p>   
Figure 2: Airfoil section velocity triangle  

##Wind Turbine Design Overview  

There are a few basic non-dimensional parameters which are typically used in the wind industry, you will need these to interpret your results from Qblade.   

**Parameter** | **Definition** | **Explanation**
--- | --- | ---
![](http://latex2png.com/output//latex_b9440a2a1a27b86fb6f24967d749de96.png)| _Power Coefficient_ | Power the turbine produces divided by the available power in the incoming wind  
![](http://latex2png.com/output//latex_101adfd42181c796410d2904aa18823a.png) | _Thrust Coefficient_  | Force acting on the turbine hub in the axial direction (same direction as free-stream velocity)    
![](http://latex2png.com/output//latex_865ddaf133b432b351d4abd96524cfda.png) | _Tip Speed Ratio_ | Ratio of the blade tip velocity to the free-stream velocity  
![](http://latex2png.com/output//latex_b8d2bebd6fcf01865d26e7f6f9e06590.png) | _Reynolds Number Based on Diameter_ | This value does not change with rotational speed  
![](http://latex2png.com/output//latex_f2bc3c4d8a306214b976baa8a6c40afa.png) | _Reynolds number based chord and estimated local velocity_ | This value is the “local” Reynolds number, and changes at each radial station, r, which has a chord, c.  
![](http://latex2png.com/output//latex_45c61860d2ba1433265a1167c0d44fb1.png) | _Betz Limit Power_ | This is the theoretical maximum value of the power coefficient a turbine can produce.  

For your design, you will want to maximize the value of Cp for a given rotational rate and inflow velocity, or Tip Speed Ratio. Note that the theoretical maximum value a wind turbine can achieve is the so-called Betz Limit, which can be derived by considering a simple quasi-1-D momentum balance on the turbine rotor and has a value of about 60%. If you find that you can exceed Betz’s limit, you are either the next billionaire or you have mis-calculated something (the stakes are high!). 

#Wind Turbine Design Rules/Guidelines
The design of a rotor is itself an iterative procedure, and may take several trials to produce a design which maximizes the amount of power produced and which can be physically manufactured (or in our case 3-D printed). You will be given broad guidelines for designing your turbine, some things to consider are:  

1.	Root Airfoil: Your Friendly Neighborhood TA’s have specified a root geometry (a diamond shape) which will be provided in a qblade starter file (see blackboard). You must NOT change this root airfoil, doing so will make the CREO import fail and most likely the 3-D print will fail as well. The diamond root airfoil will in no way affect the performance of your design, but rather makes the import/export procedure to CREO easier.  
2.	You must stay within the material and time constraints for printing. Exceeding them will disqualify your design from being printed.  
3.	Choose a thick airfoil for the sections nearest the root. Use something with 12% or greater thickness, and if possible try to keep the angle of attack near 90 degrees. You may find that this actually has little effect on the performance of the turbine as most of the aerodynamic lift (which is primarily responsible for producing the motor torque) is created by the outermost 2/3 of the blade.   

Some things which are not mandatory, but you may wish to consider:  

1.	What is the Reynolds number of my blade section (based on chord and ![](http://latex2png.com/output//latex_dbddc054497557c8fe11f07a1a15928e.png)), and how does this affect my Qblade results?
2.	Will my turbine be sturdy enough to survive inside the tunnel, and should the design be changed to mitigate the chance my turbine will disintegrate? (The answer should be yes to both.)

#Wind Turbine Design in Qblade
This section picks up where the previous Qblade tutorial left off, by now you should be familiar with creating and simulating the flow around a 2-D airfoil, if not please review the first tutorial.
The first step when creating a wind turbine blade is to take our 2-D airfoil data and extrapolate the angle of attack range using a curve fit. Why do we need to do this? The answer is essentially twofold, the first reason is that unlike airplane designs, wind turbines occasionally operate in what is known as deep stall, or very high angles of attack. This may occur during high wind conditions or if the rotor is parked. The second reason is that the BEM solver used will occasionally need to iterate over various values of α which are outside the -10 to 20 degrees or so that we actually simulated. Obviously we would prefer to simulate the entire 360 degrees of α, but unfortunately no one has yet developed an accurate enough method to quickly simulate the flow at very high/very low angles of attack.

<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Final%20Project/QB1.png" width="1000">
</p>

The first step is to click on the 360° tab in Qblade. In the first drop-down, select the 2412 airfoil if it is not already selected. Now click New to start the extrapolation procedure. The window should refresh and look similar to the following:

<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Final%20Project/QB2.png" width="1000">
</p>  

Notice in the top graph is our simulated Cl vs α curve, and the fitted curve overlaying it. You can adjust the sliders to the left to try and match the two. Also keep an eye on your Cd vs α fit at the bottom, note especially how much of the curve we have to fit. Do you think this could cause any issues with our predictions later?  

After you are satisfied with your fit, click save. Notice the final curve is a composite of the simulated data and the curve fit data. Now move on to the rotor tab by clicking the button next to the 360° one.  

<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Final%20Project/QB3.png" width="1000">
</p>  

Here we will be actually filling out the geometry of our rotor shape. The Qblade_starter file has been created with the diamond shaped hub to assist with importing the rotor into Creo later in this tutorial. Click Edit at the bottom left to add new airfoil sections to the rotor. 

A table will open up on the left side and you will be able to add new rotor sections using the “Insert after section ##” command. Click on section 2 (second row) in the table and then click “Insert after section 2” to put in a new airfoil, then click row 3 that was just created and insert another section after that for a total of 4. Note in the following figure we are going to use our 2412 airfoil from before for all new sections for now. Later you may wish to choose more aerodynamically efficient airfoils, this is up to you. For now keep all sections 2412. 

<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Final%20Project/QB4.png" width="300">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Final%20Project/QB5.png" width="300">
</p>  

ou will need to select the 2412 airfoil from the 3rd column, and leave the first two rows alone.
Note the red text at the top informing us we have not made a very physical rotor, and need to change some of the dimensions in the first two columns. Enter the following data:  

Section 3: 0.006, 0.02, 75  

Section 4: 0.15, 0.02, 25   

Then click save and your rotor should look like the following (tip: click show rotor in the top left):   

Now click the next tab to the right of the rotor design and enter the BEM simulation module. This module will solve the BEM equations for us and output the results in exportable graphs. Click “Define Simulation” on the right to begin.

<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Final%20Project/QB6.png" width="1000">  
</p>  
<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Final%20Project/QB7.png" width="300">  
</p>  


A new window will pop up where you can enter the parameters for the BEM run. The solver has several options, most of which we will leave at the default values for now. The blade is automatically discretized into N blade elements (first dialog box) and the local flow is solved at each element. Some convergence and iteration tolerances can also be changed if you are experiencing issues with the solution converging, and finally the free-stream density and viscosity must be input. The checkboxes to the left are various corrections which can be applied to the simulation. For instance Prandtl’s tip loss corrects for the fact that our blade has tip vortices which have an effect on ![](http://latex2png.com/output//latex_dbddc054497557c8fe11f07a1a15928e.png). If you would like more information on the corrections, see the Qblade manual V0.6. We will leave all these parameters to the defaults and hit “Create”.  

Now three blank graphs will appear, and to the right we must set the range of Tip Speed Ratios we expect to run at (you will need to calculate these for your blade, use the Radius and a guess at the rotation rate to get close). We will go from 0.5 to 3 for now at a wind speed of 20 m/s since that is the wind tunnel velocity we will be using.  

<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Final%20Project/QB8.png" width="300">  
</p>  

Our output is Cp and Ct as a function of TSR in the top two graphs, the bottom graph shows some other variables as a function of radius, double click to change what is displayed on any of the graphs. 
The first thing we note is that our Cp is negative, what happened! Essentially the BEM is telling us that to spin the turbine at the TSRs given we would need to supply power, not a great way to build a wind turbine! You will notice, however, that there is a small portion of the Cp curve where we produce a net positive amount of power, but there is room for improvement.
Your task is to use the Qblade tool to tweak each of the values of the wind turbine to try and bump up your Cp values. We recommend you tweak each parameter separately at first to get an idea for how sensitive the design is to each change.
Lastly, even though BEM is a powerful tool, it is not without inaccuracies. Most of the corrections are based on either experimental data or simplified theoretical model. We are really pushing the limits of BEM by simulating very small rotors, it works best for large rotors with large Reynolds numbers. If you start to experience very strange results, it is best to track down where those changes occurred and see if they physically make sense to you. 
The next tutorial goes through the export procedure for Creo, you can continue on with our simple 3 bladed rotor, or you may use your own design. The steps are exactly the same, but remember, do NOT change the root geometry (innermost 2 sections), copy it to new rotor designs EXACTLY as it appears in the Qblade_starter file!
