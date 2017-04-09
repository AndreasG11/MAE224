# Importing Wind Turbine Rotors to Creo 3.0  
This tutorial resumes our quest to design and 3-D print a small wind turbine rotor, for this tutorial you will need to have covered the first 2 Qblade tutorials and you will also need access to Creo 3.0 (available in the student lounge and the MAE machine shop).  

The first step is to return to our rotor geometry setup tab in Qblade and edit the rotor we want to export. In this case it is the 3-bladed 2412 rotor. Above the rotor section tab, click the “Advanced Blade Design” button. You are going to change the values in the column labeled “Twist Pt (%c)” to all zeros. This does not affect our BEM results, but all of the airfoils will be aligned at the leading edges. This makes 3-D printing waaaaaay easier since we will have a flat front surface to reference. Your window should look like the following:

<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Final%20Project/Creo1.png" width="800">  
</p> 

Now click “Save” at the bottom, and enter a new name if you wish (you will overwrite any simulations if you choose not to rename). Next click “Blade/Rotor” at the very top and select “Export 3D blade geometry in STL or text format”. You will want to save the file as a .stl somewhere you can find it.

A dialog box will appear which lets you define the “resolution” of the stl file (stl files are essentially a collection of triangulated points) we will leave these at the default for now.
Hit export and we are done with the Qblade part of the tutorial. Now you will need to bring the file you just created over to a computer with Creo.

<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Final%20Project/Creo2.png" width="300">  
</p>  

#Importing STL Blades into Creo 3.0  
Once you have Creo open, select your working directory by clicking the tab of that name in the upper left. Next, click “Open” and change the drop-down menu for Type to All Files (*) in the dialog box. Maneuver to the location of the .stl blade we just created and select it for import.  

<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Final%20Project/Creo3.png" width="800">  
</p>   

NOTE: This next part is CRUCIAL to correctly importing your blade, please follow the instructions exactly!

In the new dialog that appears click the Details button at the top. Now click the “Misc” tab and change the Facet Units to Meter. This forces the dimensions of the imported stl file.

<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Final%20Project/Creo4.png" width="500">  
</p> 

Click OK twice and your imported blade should appear. If not, try the Creo import steps again and make sure you follow them exactly. If you are still having problems, check with YFNTAs.

<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Final%20Project/Creo5.png" width="500">  
</p>  

Now we have a blade which looks kind of like a bunch of triangles if you click on it and zoom in with the mouse wheel. The issue is that we do not have a coordinate system, so if we were to add a hub to this part we could only reference individual points or sides of the triangle elements. We will now use our clever diamond hub© to set up a coordinate system.  

TIP: Re-orient your part by clicking the scroll wheel to rotate, or pressing shift and clicking the wheel to pan.  

Change your view so that the diamond hub section is visible and select the “Plane” button in the “Model” tab at the top. This tool allows us to set up planes on our part, this is useful since 3 of these guys together make up a coordinate system.

<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Final%20Project/Creo6.png" width="800">  
</p>   

A dialog window appears! We want to set the bottom of the blade first, so choose the leading edge point, the trailing edge point, and another point on the bottom edge by CTRL+clicking them (3 points = definition of a plane!). See the picture below.  

<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Final%20Project/Creo7.png" width="800">  
</p> 

Click OK and move on to create the axial plane by selecting the plane tab again. This time choose the leading and trailing edge points, then CTRL+click the plane we just made and set the option to “Normal” in the Datum plane dialog box if it is not already selected. 


<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Final%20Project/Creo8.png" width="800">  
</p>   

For the final plane, we essentially want something which is normal to both our other planes + a reference point. Start another plane dialog box and click one of the 2 previously created planes, then change the dialog box to “Normal”. Then CTRL+click the other plane and set it to “Normal” as well. Finally CTRL+click the leading edge point and hit OK.

Now save your part and download the two files on Blackboard called “metric_hub.prt” and “Rotor_Assembly.asm” and put these files in your working directory. MAKE SURE THESE FILES ARE IN YOUR CURRENT WORKING DIRECTORY! Open the “Rotor_Assembly.asm” file and you should see a donut-shaped hub, this is the beginning of your wind turbine! All we have to do is bring in your rotor and quickly pattern it.  
 
<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Final%20Project/Creo9.png" width="800">  
</p>   

Once you have the assembly open, click the “Assemble” button at the top to add more parts to your assembly. 

<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Final%20Project/Creo10.png" width="800">  
</p>   

Find the rotor blade part which we just created (everything is in your working directory right?), and open it. Your screen should now look like the following:  

<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Final%20Project/Creo11.png" width="800">  
</p> 

The hub part has already been secured to the default assembly coordinate system by YFNTAs, now we will be telling the program where we want to put the rotor by using the datum planes you created earlier. The colored arrows and arcs allow you to dynamically shift the rotor blade around the workspace. Notice also that the ribbon options at the top have changed to reflect the component placement options. Basically we will need to provide a number of constraints on the location of the part so that Creo knows where to place it relative to the other parts. Clicking on the Placement tab at the top left lets you see a list of the constraints with the type and the geometry being constrained.  

For example, we will first select the axial plane (second one we created) and align it with the hub axial plane. Notice how New_Blade_1:DTM2 and ASM_Right_F1 have been selected in the “Placement” menu and the constraint type is set to Coincident. Now click New Constraint at the bottom of the current constraint to add an additional constraint.  

TIP: Drag the blue center of the part around if you need to reposition it, sometimes Creo likes to move the part around when setting constraints.


<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Final%20Project/Creo12.png" width="800">  
</p>  

Now select the last plane we made on the rotor blade (on the leading edge) and select the front face of the hub. This ensures we have a nice flat front to our part  


<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Final%20Project/Creo13.png" width="800">  
</p>   

Finally we will set the distance of the rotor to the center of the hub. Select “New Constraint” again and click the 1st plane we created on the rotor, the bottom or root plane. The final selection will depend on your particular orientation of the hub relative to the rotor, but choose the plane which looks parallel to the root plane you have selected but _passes through_ the hub axis.


<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Final%20Project/Creo14.png" width="800">  
</p> 

Click on this plane and change the constraint type in the drop down menu to “Distance” then set the “Offset” to 0.003. You may have to add a negative sign (i.e. -0.003) to get the direction of the offset right. Just make sure the center of the donut hub is clear. The result should look like the following. Note how the part changed color to a goldish-orange to indicate it is fully constrained in the assembly.  


<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Final%20Project/Creo15.png" width="800">  
</p>  

Next, click the green check mark at the top and then the Refit button which looks like a magnifying glass on a rectangle.  

<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Final%20Project/Creo16.png" width="500">  
</p>   

This will bring up the part to the center of your view. We now have a rotor with one blade, all that is left to do is to pattern the blade and export it for printing.  

Next select the blade itself by clicking on it, and click on the “Pattern” button on the top ribbon. This will bring up the following dialog:


<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Final%20Project/Creo17.png" width="800">  
</p> 

We want to pattern around an axis, but this dialog is for Cartesian patterns. Change this with the dialog box to the left, and select “Axis”.
Now you will need a reference axis, select the one at the center of the hub. Change the settings to 3 copies at 120 degrees in the top dialog boxes, so it resembles the following. If your design calls for more or less blades than three (i.e. whatever you simulated in Qblade) this is where you would enter the appropriate number and degrees of separation.


<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Final%20Project/Creo18.png" width="800">  
</p>  

Your final design should look like the following, now would be a good time to save the assembly. The final step is to export this file to use in the 3-D printer program, Cura. 


<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Final%20Project/Creo19.png" width="800">  
</p> 


Select the “File” drop down menu in Creo and choose “Save As”. In the bottom drop down box select our old pal the STL (.stl) file type and give your rotor a name DIFFERENT than rotor_assembly so it is easy to keep track of. A dialog box will appear, click the check box next to “Step Size” and input the value to 0. Click apply and you should get something like the following:  
 
<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/Final%20Project/Creo20.png" width="800">  
</p> 

Click OK to finish the export and the Creo part is complete.
