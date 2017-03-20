As you might have guessed, the flow around airfoils can be very complicated since the lift changes with Reynolds number and α. The two types of drag also depend on these quantities. The motivation for doing experiments, or computer simulations, is to accurately determine these quantities so that when we use an airfoil we can accurately predict the forces it will generate. For Lab 4, you will be doing both simulations and experiments. And finally, in Lab 5 (the final project) you will be taking what you know about airfoils and using them to build a wind turbine. 

The first tool you will learn to use is called Qblade, <http://www.q-blade.org/>. It is an open-source wind turbine design and simulation software package (note that it does not currently run on Macs, you may have to use it in the student lounge). This tutorial focuses mainly on how to use the airfoil solver inside Qblade which is known as Xfoil. This airfoil solver will allow you to quickly and efficiently simulate the flow around an airfoil and calculate the lift and drag coefficients on the fly for some given airfoil shape. Once you have downloaded Qblade, continue with the following steps to perform a simulation.

<p align="center">
<img src="https://github.com/d008/MAE224/blob/master/images/AF%20menu%201.png" width="800">  
</p>

In the above figure are the main tab descriptions, Qblade has a full graphical interface and the idea is that you just click through the tabs from left to right to perform your wind turbine design. Today we will focus only on the Airfoil Design Tools tabs. Click on the first red airfoil tab.

<p align="center">
<img src="https://github.com/d008/MAE224/blob/master/images/AF%20menu%202.png" width="600">  
</p>

You are now in the airfoil design tab, this tab lets you create or import airfoils. Today we will make a simple NACA profile. Click the Foil menu at the very top.

<p align="center">
<img src="https://github.com/d008/MAE224/blob/master/images/AF%20menu%203.png" width="600">  
</p>

Next create a 4 digit NACA profile by inputting 2412. This means we want an airfoil with a max camber of 2% (the first 2) located at 40% (the 4), with 12% thickness.
<p align="center">
<img src="https://github.com/d008/MAE224/blob/master/images/AF%20menu%204.png" width="400">  
</p>
Leave the number of panels at 100, this is the number of individual panels the solver will use to resolve the airfoil surface, 100 is plenty for our case. Hit OK.

<p align="center">
<img src="https://github.com/d008/MAE224/blob/master/images/AF%20menu%205.png" width="800">  
</p>

And your airfoil is displayed in red. This is a good time to discuss where these numbers came from. The National Advisory Committee for Aeronautics (NACA), the precursor to NASA, spent a huge amount of time in the middle of the 20th century developing efficient shapes that maximized the lift to drag ratio, L/D, among other goals. You may have heard of these shapes as the NACA foils, some examples are 4 digit series, i.e. 2412, and the 5 digit series, i.e. 24012. The number specifies the input to an equation which will give you the airfoil shape.

There are many good ways to research the different types of airfoils you can create, the website <http://airfoiltools.com/> (see below) is a repository where you can search by Reynolds number and other parameters. You can also download the airfoil coordinates by copying the two columns in the grey box and saving them as a .dat file. You can then import these points into Qblade by going to Foil-->Import Foil. This option can be seen in the above screen capture.

<p align="center">
<img src="https://github.com/d008/MAE224/blob/master/images/AF%20menu%206.png" width="800">  
</p>

Back to Qblade, now let’s simulate the flow around this airfoil. Go to the next red airfoil tab at the top.

<p align="center">
<img src="https://github.com/d008/MAE224/blob/master/images/AF%20menu%207.png" width="800">  
</p>

This is where your simulations are stored (from the Xfoil tool mentioned earlier), since we have not run any simulations there are –No Polar in Database (yet). To get started click the Define Xfoil Polar button to the right.

<p align="center">
<img src="https://github.com/d008/MAE224/blob/master/images/AF%20menu%208.png" width="500">  
</p>

Here we have a few setup parameters, including one you should recognize, our old friend the Reynolds number.
Ideally you should calculate the Reynolds number of whatever airfoil you want to analyze. Note that in Qblade we work almost exclusively in non-dimensional parameters, so get used to seeing them! In Lab 4 we will be experimenting with an airfoil in the wind tunnel, and you will need to calculate Re for you experimental cases and set that value here.

You may also wish to calculate the Mach number for your airfoils, but unless your velocity is over 100 m/s we can leave it set to zero.

Leave the other parameters at their default values for now but change Re to something like 1,000,000. Click OK.

<p align="center">
<img src="https://github.com/d008/MAE224/blob/master/images/AF%20menu%209.png" width="800">  
</p>

Now your simulation is almost ready to run. Look to the right at the other parameters you need to choose. Since we have set our Reynolds number, the other parameter we have to vary is the angle of attack, α. You can set the start, end, and increment (Δ) values of α that you want to run. Click Analyze!

<p align="center">
<img src="https://github.com/d008/MAE224/blob/master/images/AF%20menu%2010.png" width="800">  
</p>

You should see a window pop-up (not shown here) which displays the solver’s progress at each value of α, when it has solved for all the values you specified the results should look like the above plots.
The top left plot should show Cl vs Cd, or change in lift versus a change in drag. To the right of that plot (in the middle top row) is the Cl vs α curve, and next to that is the Cd vs α curve. The bottom left-most plot is the pitching moment, Cm, which tells you where the center of the aerodynamics forces are acting on an airfoil (we will not be using this value in our analysis, but you can imagine it would be important if you were building an airplane!). The final graph is the lift to drag ratio we discussed earlier. If these graphs don't match what is shown, double-click on your graphs to change the x- and y- axes.

A final note: Qblade/Xfoil returns all values of C_l and C_d in terms of a 2-D airfoil. You will need to convert these to their equivalent 3-D values (<img src="https://github.com/d008/MAE224/blob/master/equations/Cl.png"> and <img src="https://github.com/d008/MAE224/blob/master/equations/Cd.png">) in order to compare them with any experimental values. See the [Lab 4 Manual](https://github.com/d008/MAE224/wiki/Lab-4:-Lift-and-Drag) on how to do this if you are lost.

***
## Questions:
- What happens to the lift at zero angle of attack? Why?
- The lift appears to decrease at a certain angle of attack, why do you think this is the case?
- The drag increases sharply also, why is this? Are these two phenomena related?
- Given the above, why is a plot of lift versus drag useful?
- Where do you suppose most aircraft operated in terms of the angle of attack?

That’s it for generating lift and drag curves, with a nice tool it’s pretty easy right? To get some more experience, try the following:

* Change the Reynolds number of your simulations and compare with your results from above. What happens to the lift and drag curves?
* The “Stall Point” is known as the location where the lift curve drops off (approximately 15 degrees in the above example). How does Re effect this point?
* Make some new airfoils with varying thicknesses and cambers either by using the NACA profile generator or downloading and importing them from airfoiltools.com. Can you determine the following:

    o Generally, what is the effect of camber on an airfoils in terms of the stall point and maximum lift generated?

    o How does the thickness of an airfoil affect the lift and drag?


