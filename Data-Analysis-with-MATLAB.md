# MATLAB Basics
Data processing with Matlab is quite straightforward. You can find the installation directions from Princeton OIT [here](https://www.princeton.edu/software/licenses/software/matlab/). Allocate anywhere from 30 minutes to a few hours to complete the installation depending on your network connection, computer speed and technical prowess. For those of you running a flavor of Linux will have a bit more difficulty than your peers, and will experience some known bugs. These will not prohibit you from using Matlab, but they will make your life more interesting (e.g. problems w/ horizontal scrolling).  

Once everything is installed and all of the licenses have cleared, you can load Matlab and it will look something like this.  

![](https://github.com/mkfu/MAE224/blob/master/images/MATLAB_empty.PNG)

Much of this is quite straightforward. There are 4 distinct areas within the window, but you can customize the layout to suit your tastes and needs. Starting from the upperleft and moving clockwise, we have the

* _Current Folder_ - This displays the current working directory and the files/folders contained within. You can utilize and interact directly with *files* in the current working directory but not the folders. If you want to use a file located in an embedded folder you need to add it to the path or change the working directory to the child directory. You can tell if the folder is added to your path because it will be a normal text color, while directories not added will be transparent.
* _Editor_ - This is not typically loaded in the default window layout, but you can either click *New Script* from the *Home* banner at the top of the MATLAB window to create the window or add it manually from the *Layout* dropdown in the *Home* banner. Here you can write functions and scripts. 
* _Command Window_ - This is is where you can execute one-off commands and see all output from your commands.
* _Workspace_ - This is the space where all of the working memory is collected. You can click the different variables and see what is contained in each of them and interact with the cells much in the same way you would in excel.

#Useful commands
##Navigation and Environment
* _clc_ - clears the Command Window of text 
* _clear all_ - clears all variables and more from the Matlab memory. Use with *caution*
* _close all_ - close all
* _addPath(String directory)_ - adds a directory path to the working directory execution path
