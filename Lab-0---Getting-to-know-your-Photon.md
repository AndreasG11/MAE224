#Basics of Particle
This guide is geared towards students who have very little programming experience. Hopefully after last semester you are at least familiar with many of the pithy commands outlined in the second section. This is simply an outline of the code you will be using throughout lab one and in the following labs. Note Well: Do not forget to use semicolons and state the data type of all variables.


![](https://www-assets.particle.io/images/Photon-wo-Headers-WiFi-Module-sideview-resized_640x480.png)

##Photon Basics
Now that you have set up your Photon and can send it firmware over the internet, it is time to explore some additional functionality you will need for lab one.
Similar to last semester, you will be using a Particle Photon to take measurements and control your experiments. As some of you may have noticed in the tutorial for the LED blink, the functionality and programming is very similar to Arduino, with the exception that all programs are written to the cloud-based IDE. While data can still be written to the Serial connection, you have the additional flexibility and convenience of connecting and programming your Particle Photon from anywhere with an Internet connection. Additionally, you will be able to push commands and retrieve data from the Particle Photon server.

Given your experience with Photons (and the wealth of documentation available online), wiring and coding a simple data retrieval program should be doable. If not, feel free to consult your friendly neighborhood TAs. Assuming you followed the tutorial, you should be able to write firmware to your photon and blink and LED. Next stop, data retrieval.

## Writing a sketch to continuously read data

You will code a sketch to read data from the your Photon’s analog input pins and then upload it to the api.particle.io server. Note that all data is written in JSON (JavaScript Object Notation) and you will need to parse this when you process in the information in pithy or matlab. In this format, data is represented as objects containing key-value pairs. In our case, we get objects that look like:

{"A0":234,"A1":12,"A2":258,"A3":738,"A4":513,"A5":1010}

“A0” - “A5” are the 6 analog pins, and each value is written together with the corresponding pin. Each value is between 0 and 4095 - corresponding to the range 0 V to 3.3 V - as the Particle Photon data has 12 bit resolution (max value 4095). With nothing plugged in, the values will float around due to noise.

Simply import the json library into pithy or use the provided code in Matlab to do the parsing for you.

Now is also a good time to be familiar with the pin-outs of your Photon, we will be using many of these, including PWM control for the servos in the following labs.

![](https://community.particle.io/uploads/default/original/b/0/b034c15ddff602da98496b171cccc522aac9fcc8.png)

Your next task is to write a program that correctly uploads data measured by the Photon to the cloud, then this data will be read by a pithy code to the user (you!). Consult your lab TA for help, but hopefully when you combine the following outline with what you already know about the Photons and Python should be sufficient.

##Sample Particle Photon Code
Below is an example of code that will work for the first lab. 
```c
double voltage = 0;
char strTemp[20] = "Hello, World";
int avg = 1000;
int ptap1 = A0;

void setup()
{
Serial.begin(9600);
    Particle.variable("pressure", voltage);
    pinMode(ptap1, INPUT);
}

void loop()
{
voltage = 0;
  for(int n = 0;n<avg;n+=1)
  {
  voltage += analogRead(ptap1);
  }
  sprintf(strTemp,"%f",voltage);
  Serial.println(strTemp);
  voltage = ((voltage/avg)/4095)*3.3;
}
```

Let us break this program into smaller sections and dissect what each line does

###Instantiate Global Variables:
```c
double voltage = 0;
char strTemp[20] = "Hello, World";
int avg = 1000;
int ptap1 = A0;
```
In this program we name 4 variables: `voltage`, `strTemp`, `avg`, `ptap1`.  We make a variable `voltage` of type double which we will post to the cloud through the Particle server. `strTemp` is a string that we create in the event that we want to monitor the Serial output.  We also create an integer `avg` which will be the number of samples that we will average over. Finally, we specify the pin that we wish to monitor as `ptap1`.

###Setup:
```c
void setup()
{
  Serial.begin(9600);
    Particle.variable("pressure", voltage);
    pinMode(ptap1, INPUT);
}
```

The setup will run once and (as the name implies) initialize things that the program only wants to do once. We first write `Serial.begin(9600);`This initialized a serial output, but is unnecessary as we will be utilizing pithy for gathering our data.

The next line is very important. 
`Particle.variable("pressure", voltage);`
This line is responsible for posting the information from voltage to the cloud. We need only state this line once and it will tell the Particle Photon to post the voltage, which is a double to the cloud as the parameter called “`pressure`”.  Consequently every program outside the Particle Photon will only read the information as “`pressure`” and won’t know that it was ever called voltage.  The webpage with the information updates every loop of the Photon. Note that this line changes if you are using a Spark Core (the predecessor to the Photon).

We also need to initiate a pin to take data from using `pinMode(ptap1, INPUT);`. This sets the pin saved in `ptap1` (here, A0) as an analog input to read the pressure data from.

###Loop
```c
void loop()
{
 voltage = 0;
  for(int n = 0;n<avg;n+=1)
  {
  voltage += analogRead(ptap1);
  }
  sprintf(strTemp,"%f",voltage);
  Serial.println(strTemp);
  voltage = ((voltage/avg)/4095)*3.3;
}
```
This outer loop will cycle ad infinitum until you unplug the spark core.  We begin by reinitializing `voltage = 0;` at the start of each loop. We then sum together several consecutive analog voltage measurements with a for-loop given by:

```c
  for(int n = 0;n<avg;n+=1)
  {
  voltage += analogRead(ptap1);
  }
```

The first line sets a variable integer n which will run for as long as n is less than `avg` and will increment up by 1 after every loop iteration.  Inside the loop we will add the current value of A0 to the value reading `voltage += analogRead(ptap1);`. Note that the output of `analogRead(A0)` is a 12 bit value from 0-4095.  `voltage = ((voltage/avg)/4095)*3.3;` converts the voltage reading from a 12 bit voltage to a value on the scale from 0 - 3.3V.   We can the format a string using the following two lines and print them the serial output.

```c
sprintf(strTemp,"%f",voltage);
  Serial.println(strTemp);
```

#Python Code
Here's the part that should be more familiar. Last semester, you were provided with a Python script that reads a voltage, displays its current value and plots it over time. Now, you'll write that script yourselves as a refresher.

Each group will be assigned a unique group number and password, giving your group sole access to the Python code and output files you generate.

To access the pithy environment and write your script, open a browser and go to: http://mae-j209-server:80##/NEWFILENAME. Replace “##” with your group number. Your username will be “group##” and your password will be the one that we have given to you. NEWFILENAME can be anything you choose to name your coding environment.
Remember that only your lab group has access to the code you write. Do not give the password to anyone outside your group. 

Let us now consider the pithy code. 

```python
from pithy import *
from Photon import Photon
import time

ac = "YOURACCESSTOKENHERE"
name = “YOURPHOTONNAMEHERE”
g = Photon(name,ac)
filename = "files/foobar%i.txt" %int(time.time())


print g.getDevices()
print g.getFunctions()
print g.getVariables()
v= []
t= []

for i in range(1,20):
    data = g.fetch("pressure");
    v.append(data)
    t.append(i)
    plot(v)
    title("Sample Data")
    ylabel("psi")
    xlabel("Sample")
    showme(“pic”,kind = "")
    clf()
    time.sleep(1)
    f = open(filename, "a")
    f.write("%f\n" %data)
    f.close()
print "mean = %0.4f" %mean(v)
print "Std Dev = %0.8f" %std(v)
```

Wow that's a lot of code. To start we import several modules. The first line `from pithy import *` imports all of the normal python commands for our convenience. The next import relies on having the code from blackboard `from Photon import Photon` .  You need to make sure that there is a file called particle with the class called particle. This will allow us to use the class functions that we made. The import imports all of the standard time functions: `import time`

The next few lines are used to create a spark core object. We begin by making a string out of your access token.
ac = "YOURACCESSTOKENHERE"
 Create a string for the Photon name with
name = “YOURPHOTONNAMEHERE”
We next create a new particle object which takes two arguments: the name or id of the particle photon and the access token. This will give you full access to the particle class that we made.  It can be called like this `g = particle(name,ac)`. Note: replace your own photon’s access token and name.  2nd NOTE that the name is case sensitive and goes through http parsing which means that you need to enter it exactly as you would see it in a browser. The fetch function will help you see what you need to enter in the name spot. Next we create a file where we want to save our data. This creates file foobar.txt with the timestamp attached.
`filename = "files/foobar%i.txt" %int(time.time())`

The next few lines are samples of output from some of the functions:

```python
print g.getDevices()
print g.getFunctions()
print g.getVariables()
v= []
t = []
```

`getDevices()` print out the devices that are attached to your account, `getFunctions() `shows functions attached to your Photon with that particular name and `getVariables()`  shows the particular variables that you can fetch. The last two lines simply creates an empty array to fill with data.

Next we begin our for-loop in the following way with python
`for i in range(1,20):`

Note that in python we do not need curly braces{}, but need tab delineations. Thus everything inside the for loop must be indented.  To get the data and store the values we use the next two lines:

```python
    data = g.getResult("flow");
    v.append(data)
    t.append(i)
```
The first line retrieves the data from the variable named flow from the Particle cloud server and saves it to data. Notice how we do not need to say what the data type is! This is one nice part about python.  The second line appends the data to the array `v`, and the third appends a sample number to the array` t`. The following 5 lines plot the data using some pithy magic.  

```python
    plot(v)
    title("Sample Data")
    ylabel("psi")
    xlabel("Sample")
    showme(“pic”,kind = "")
    clf()
```

The first line creates a plot, and the following three lines create labels and titles for the axes. The last two lines allow pithy to show the plot and refresh at each iteration of the for loop.

The next line calls the time module in python and tells the code to pause for 1 second. Why in the world would we want to do this? Mostly there is an inherent delay in the rate at which the Photon updates the webpage. We slow the down the python script a tad to make sure that we do not grab the same data twice.

The next three lines are used to append the data to the text file that we created. 
*    `f = open(filename, "a")`  opens the text file that we named and puts it into append mode
*    `f.write("%f\n" %data)` writes the data to a line in the text file
*    `f.close() `we then close the file so we don’t leave it open

The last two lines just print the output with some string formatting.

```c
print "mean = %0.4f" %mean(v)
print "Std Dev = %0.8f" %std(v)
```

Using the above, you should now be familiar with:
Writing a script that reads a voltage (just one of the 6 pins is fine), plotting it over time, updating the plot periodically, and outputting the data to a txt file. Output files can be found at http://mae-j209-server:80##/files/
Hints:
1. See http://mae-j209-server:80##/python_basics for a refresher on Python and pithy
2. Take a look at the photon module that we created for you to learn how to interface with the Particle Photon.
3. Be sure to pause in your loop with time.sleep so you don’t crash the server
4. You can get information on any python function by putting the line help(functionName) in your script

