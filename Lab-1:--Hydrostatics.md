# Hydrostatics 
**Your mission, should you choose to accept it, involves calibrating a pressure transducer.**

## Background
The pressure in a fluid system varies with depth.  This is why scuba divers get the bends when they rise too quickly, and why wooden submarines never really caught on.  The governing relationship for pressure with depth is generally:

<p align="center">
<img src="https://github.com/d008/MAE224/blob/master/equations/lab1_1.png" width="100">  
</p>  

Note that the reason for the negative sign is due to the selection of the coordinate system; in this case, the positive z direction is up. This relationship allows us to relate pressure of the fluid at one position in a control volume to the pressure at another position.  This principle is why mmHg is a unit of pressure measurement: we can construct a device which can accurately measure pressure from a column of mercury.  Such a device is known as a barometer, and it looks like this:  

<p align="center">
<img src="http://2012books.lardbucket.org/books/principles-of-general-chemistry-v1.0/section_14/8cec964659fd2bb7ec4dc6c2c78eb4f9.jpg" width="400">  
</p>

Source: http://2012books.lardbucket.org/books/principles-of-general-chemistry-v1.0/s14-02-gas-pressure.html  


This device is used to measure atmospheric pressure through the hydrostatic principle.  Essentially, the weight of the mercury in the tube must balance the “weight” of the atmosphere, or the pressure.  Today, we will be constructing something similar called a manometer, which can be used to measure the difference between a pressurized region and the atmosphere.  This is often done via a U-tube (not YouTube) manometer, which looks like this:

<p align="center">
<img src="https://2.bp.blogspot.com/-TDRlZhhKwFk/U4ryRq532PI/AAAAAAAAAh4/AWs0TZNXncY/s1600/U-tubes.jpg" width="400">  
</p>

Source: https://2.bp.blogspot.com/-TDRlZhhKwFk/U4ryRq532PI/AAAAAAAAAh4/AWs0TZNXncY/s1600/U-tubes.jpg  

In the above image, Pa is atmospheric pressure and Pt is the input pressure. We can see that Pt is greater than Pa. Now, we can use the principle of hydrostatics to measure a pressure difference between two reservoirs.   The gravitational force is balanced by the pressure force and so by a simple force balance, the pressure can be deduced by knowing the column height.

## Tools and Materials
You have several tools and materials at your disposal to complete the lab. This includes but is not necessarily limited to:  
- Particle Photon w/ Breadboard + USB  
- MATLAB 
- Computer   
- Flexible Tubing  
- Large PVC Tube  
- Pressure Transducer  
- Electrical doodads of various types  
- Graduated Cylinders  
- Hand-pumping-ball  
- Fresh Princeton water 
- Ruler

## Build a manometer
The goal of this lab is to calibrate the pressure sensor given to you using the manometer and the Particle Photon. To do this, you will need to have control over the applied pressure while recording the data with your Photon. 
At this point, you should derive an expression relating the pressure to the column height. Follow these steps in your derivation:  

1.    In a manometer, if one end is open to the air, the pressure difference is the difference between the atmospheric pressure at the open end, P0, and the pressure established by the hand pump at the closed end, P1.  

2.    By drawing a free body diagram on an appropriate volume of water in the manometer (or you can use the differential equation you learned in class), write the expression that relates the difference in pressure to the liquid height and density.  

In order to build the manometer, connect the cylinders and tubing such that you can pressurize one side with the hand pump and observe the displacement. 
 
## Connect the pressure sensor to the Particle Photon  

Pressure sensors can measure pressure in a multitude of ways - the ones we have use the change in electrical resistivity of silicon due to strain (piezoresistive effect) to detect pressure.
You will use your Particle Photon to measure the voltage signal from the pressure sensor.
To connect the pressure sensor to the Particle Photon:  

1.	Plug the pressure sensor into your breadboard.  

2.	Look at the data sheet below for the pressure sensor and find out the connections for each pin of the sensor. If you would like more info on this sensor you can find the data sheet [here](https://github.com/d008/MAE224/blob/master/Lab%20Equipment%20and%20Etc/Honeywell%20HSC%20Pressure%20Sensors.pdf).

3.	Connect the pressure sensor pins to the corresponding pins on the Particle Photon (be careful not to switch the pins for +3.3 V and ground).  

<p align="center">
<img src="https://github.com/d008/MAE224/blob/master/Lab%20Equipment%20and%20Etc/HSCDLNN001PDAA3%20Lab%201%20P2%20Sensor.png" width="700">  
</p>

4. **Important** Your goal in this lab is to create your own calibration for the pressure sensor. You can compare your calibration to the one in the data sheet, but you must use the derivation found earlier to get the relationship between height and pressure.

## Test your setup with the fluid
By pressurizing the system, you are changing the manometer height, and you should be able to relate some measured height of the fluid column to the pressure it is applying to the transducer. By taking the appropriate data, you will be able to construct a calibration curve relating the pressure applied to the sensor to the voltage output.

1.	The calibration curve should give you a pressure if you give it a voltage (p(V)).    

2.    Decide how you want to measure the height; you can either use a ruler or the graduated cylinder markings.

3.    Look at how pressure changes in time (live) as you pressurize it. Explain this behavior (can you figure out a way to reduce unwanted behavior?).

4.    Using Matlab, and the `analogRead()` command, capture at least 10 data points and record the corresponding heights.

5.    Plot pressure versus the difference in heights between the water columns in Matlab.

6.	What kind of curve-fit makes the most sense?  

7.    Save your data to a text file using the Matlab command snippet below:

Add this code snippet to the end of your .m file to save data as a delimited text file.
Note: the use of the following code is not mandatory. Collect data in the way that suits you best.
```matlab
%Enter your folder name%
folder = 'C:\Users\your_username_here\Documents\';
%Enter a unique and descriptive filename%
fname = 'lab1_p2_hydrostatics.txt'; 
%Manually enter your recorded height for each pressure measurement%
height = 0.2;

if isfile(strcat(folder,fname))
else
hdr = {'Heights (m)','Pressure Transducer (V)'}; %Labels for the columns (check units)
fmt = '%s\t %s\r\n'; %Create a formatting string for the file header 
fid = fopen([folder fname],'w'); %Open the file to write the header
fprintf(fid,fmt,hdr{:}); %Write the header
fclose(fid);
end
%Append the actual data to your new file%
dlmwrite([folder fname],[height volts],'-append','delimiter','\t'); 
```
There is a lot going on here, but the functionality is relatively simple. We first create a cell array of strings for the header (so later we will know what data we saved). The next few lines write the header to the file, and the final call to `dlmwrite()` writes the actual data to a new line at the end of the file. Note that you will need to manually enter your height data into the `height` variable each time you collect a data set, and don't forget to change the folder location and filename as well!

_Remember_: You can get information on any function in Matlab by typing `help function_name` and hitting enter in the command window.
 
## Ain’t No Mountain High Enough...:
As you should have noticed by now, there appears to be a relationship between heights and pressures (ever considered why pressure sometimes is measured in millimeters of mercury or inches of water? ). Elevate one of the graduated cylinders, say on top of one of the tool boxes.  Is there a clever way to determine the height that you elevated the cylinder (aside from measuring it directly with a ruler)? What happens if you lift the flexible tubing connecting the graduated cylinders above the free surface of the water? Does the manometer still work? Why or why not?  
 
## Other questions for write-up:  


1.	Estimate the uncertainty in your data. What is the biggest source of error?  

2.	Does the calibration curve you found for the sensor match that in the manual? Why might it be different?  

3.	What is the shape of the calibration curve (can you show that this truly is the shape)?  
 
# Guidelines for the report

**Remember, you will be submitting a group report and an individual report. The group report will contain the abstract, introduction, experimental procedure, and results, and must be a maximum of 5 pages. The individual report will contain the discussion and conclusion, and should reference the results from the group section. This report must be a maximum of 2 pages.**

All lab manuals are to be emailed to mae224lab@gmail.com as a PDF. The group portion of the lab should have group member last names, group number, and lab number in the filename. For example: Novoselov_Meehan_Huang_Group51_Lab1.PDF

The individual portion should include your name, your group number, and your lab number. For example: Novoselov_Group51_Lab1.PDF

Your report is expected to include (remember, maximum 5 pages):

### Abstract (10%) 

- A short paragraph summarizing your work, including the task and the results. 
    
### Introduction (15%)

- Discuss the scientific concept of the lab.  
- Effectively present the objectives and purpose of the lab and any equation or concept you need. 
  
### Experimental Procedure (10%)  

- Provide some details about the experiment and methodology and why you chose your particular setup. 
- This is a great time to show a figure describing your setup. 
 
### Results (15%)

- Keep in mind the main goal of this lab, you are looking to create a calibration curve for your sensor.
- Provide plots and pictures to illustrate your results. You are free to use whatever plotting program you wish, but your TA's recommend using Matlab. 
- Make sure to label all axes.
- Use appropriate font sizes for the labels (it should match your report font size).
- Include legends if necessary.
- Make sure the data points are large enough to see clearly.
- Detailed findings.
 
### Discussion (35%)

-  Outline sources of error and perhaps answer any of the questions brought up in the lab manual.
 
### Conclusions (15%)  

- Summarize findings. 



