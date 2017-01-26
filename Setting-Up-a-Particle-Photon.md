#Introduction

##Setting up your new Photon
This tutorial is to set up and initialize your Particle Photon unit. You will get the unit connected to the internet and your own lab group account. Then, a test program will be loaded on your unit to verify communication between the online account and the Particle Photon.

You can make a serial connection to the unit through the USB cable. The following steps will open up that connection to allow you to communicate with the unit. (The lab computers should have the drivers on them, and it will take a moment to install.  If there are issues, or you wish to do the update at home, the drivers can be found at https://s3.amazonaws.com/spark-website/Particle.zip).

1.	Start by saving (“save as” on the desktop) and unzip the CoolTerm program to the desktop (we did this for you! (Lucky you)): http://freeware.the-meiers.org/CoolTermWin.zip

2.	Plug your Particle Photon unit into the computer through the USB cable.  The large LED should flash green then breath cyan (Trust us, it happens).  This means it is connected to puwireless. If it does not make this color, contact Cody. He’ll know what to do.

3.	To communicate with the unit, you will need to open a serial port. Hold down the SETUP button until the light flashes blue. This means it is able to connect through the serial port. Open the CoolTerm folder on your desktop and start the program.

4.	Click on the “Options” button on the top of the program. In the popup window, click the “Re-Scan Serial Ports” button. The drop down window labeled “Port:” should have at least one selectable option. Select the port your unit is on (likely COM19 or something similar, you can find it in the device manager from control panel in windows. NEVER COM 1). Alternatively, you can use download and use particle-cli. Ask Cody about it if you are curious.

5.	Set the Baudrate to 9600, data bits to 8, parity to none, stop bits to 1. 

6.	Click ok, which will close the popup window.

7.	Click the “Connect” button at the top of the program.  You should see a connection timer begin at the bottom of the program.
**_If everything has worked up to now, you will be able to communicate with your unit through the serial terminal!_**

8.	Press the “i” key (i as in India) on your keyboard to obtain the Particle Photon ID. Write this down; you will connect your lab team’s Particle account to it so you can access the unit wirelessly. It should be a hex string that looks like: 42ff60063478505467883424. 

9.	Close the Connection to the computer and click the RESET button on your Particle Photon. Make sure Particle breathes cyan.
**_At this point, you will need to get an account set up to tie to the Particle Photon. This will allow your lab group to control your unit from anywhere when it’s connected online!_**

10.	Open up a browser and navigate to https://build.particle.io/build

11.	You will now need to create an account for your lab group.  Pick an unlucky group member to make a Particle account with their email of choice. Perhaps, more preferably, create a neutral email account to which all of you can access the credentials. This will allow you to access the code interface for modifying your Particle Photon.

12.	On the bottom left of the page, click the target looking button (3rd from the bottom) that’s called “Devices.” Then click the “Add New Device” button. Copy/paste in your core’s unit ID that you got from the terminal. (I hope you saved it!)

13.	Now you get to name your core. Make sure it’s an awesome name that will bring pride to your group (and fear to your enemies). NOTE--DO NOT HAVE ANY SPACES OR SPECIAL CHARACTERS--these cause much grief for your TAs.

14.	Congratulations, you now can control and edit your Particle Photon!
Now we will write a quick program. The first will blink the onboard LED of your Particle Photon. This is just to expose you to the language and options of the Particle Photon.

15.	Moving back to the Particle editing webpage, click on the “Code” button, which looks like: < >

16.	Create a new app, which you can name something like “Get_the_LED_out.” Be sure to hit enter. 

17.	Copy and paste the following code into the editing window: 
    ```c
    // Define the pins we're going to call pinMode on
    int led = D7;  // You'll need to wire an LED to this one to see it blink.
    
    // This routine runs only once upon reset
    void setup() {
        // Initialize D7 pin as output
        // It's important you do this here, inside the setup() function rather than outside it or in the loop function.
        pinMode(led, OUTPUT);
    }
    
    // Particle firmware interleaves background CPU activity associated with WiFi + Cloud activity with your code. 
    // Make sure none of your code delays or blocks for too long (like more than 5 seconds), or weird things can happen.
    void loop() {
        digitalWrite(led, HIGH);   // Turn ON the LED pins
        delay(1000);               // Wait for 1000mS = 1 second
        digitalWrite(led, LOW);    // Turn OFF the LED pins
        delay(1000);               // Wait for 1 second in off mode
    }
```
18.	On the upper left-hand side, click the check mark button to verify/compile the code. There should be a small note on the bottom of the screen that says, “Code verified! Great work.”

19.	Press the lightning bolt button on the top left of the page, which will then “flash” the code to your unit. You should see the LED start blinking magenta to signal that it is uploading. It will likely blink green afterwards to signal that it is re-connecting to the internet, so give it a moment to finish this cycle. If successful, the LED will go back to the slow cyan pulse.

20.	If you see the onboard LED (connected to pin D7), blinking blue, you WIN! 

21.	Go find a TA, preferably Cody, to verify that you completed this simple task.

# Programming the Photon via Matlab

During the course of the lab you will _**not**_ be programming the particle photon directly. Instead, your friendly neighborhood TAs have created a class file which works with Matlab to control the Photon via your web connection. For this to work, you must upload some code to your Particle Photon (which you should have just set up).

1.    Go back to the code window in your browser at https://build.particle.io/build (the one with the <> symbol) and click on "Create a New App". Delete all the pre-packaged code in the right-most window.

2.    In a second browser window/tab open the following link [Photon Lab Code](https://github.com/d008/MAE224/blob/master/Source%20Files/Particle/PhotonCode.ino)

3.    Now copy the entire block of code from the window in (2) to the code window in (1)

4.    Name your code something clever, like Lab_Code, then save and flash it to your Particle Photon.

5.    Now that your Photon is running its new code, you must also download the Matlab class file into your computer's Matlab directory. Typically the Matlab default directory is My Documents/Matlab (on PCs), so you can use that folder location for the following step or use a new folder and then adding it to the current Matlab path (using the Set Path command in the Matlab GUI).

6.    Download the Matlab class file here [Photon.m](https://github.com/d008/MAE224/blob/master/Source%20Files/MATLAB%20v1/Photon.m) to the folder location in step (5).

That's it! Now all you need is an open Matlab session, and have your Photon's name and access token ready. You can read and write data via your photon from anywhere using a single programming language. Cool right? The final step in setting up your Photon is to work through a short tutorial to blink an LED just as we did earlier. However, we will not program the Photon directly but instead address it via the Matlab class file.

1.    Open up Matlab and copy the following code into a new script file:

```matlab
     %Enter your photon name%
     name = 'myphoton';
     %Enter the unique access token for your photon%
     atoken = 'abc123';
     %Set the digital pin for the LED%
     dpin = 'D7';

    % Create a new Photon Object %
    g = Photon(name,atoken);
    % Display some info on your connected photon, Make Sure it is powered on!! %
    g.getConnectedDevices()

    % Check if device is connected %
    if g.getConnection
       
        g.digitalWrite(dpin,1); %Set digital pin hi
        pause(1)                %Wait 1 second
        g.digitalWrite(dpin,0); %Set digital pin low
        pause(1)

    end
```

Now run this code in the Matlab command window and you should see your particle photon LED blink once then turn off. Have your TA (preferably Cody) verify this behavior before completing this portion of the lab.



