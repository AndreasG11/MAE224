#Lab 0
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
In this program we name 4 variables: `voltage`, _strTemp_, _avg_, ptap1.  We make a variable voltage of type double which we will post to the cloud through the Particle server. strTemp is a string that we create in the event that we want to monitor the Serial output.  We also create an integer avg which will be the number of samples that we will average over. Finally, we specify the pin that we wish to monitor as ptap1.
__
