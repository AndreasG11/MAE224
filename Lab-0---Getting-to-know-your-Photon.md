#Lab 0
This guide is geared towards students who have very little programming experience. Hopefully after last semester you are at least familiar with many of the pithy commands outlined in the second section. This is simply an outline of the code you will be using throughout lab one and in the following labs. Note Well: Do not forget to use semicolons and state the data type of all variables.


![](https://www-assets.particle.io/images/Photon-wo-Headers-WiFi-Module-sideview-resized_640x480.png)

##Photon Basics
Now that you have set up your Photon and can send it firmware over the internet, it is time to explore some additional functionality you will need for lab one.
Similar to last semester, you will be using a Particle Photon to take measurements and control your experiments. As some of you may have noticed in the tutorial for the LED blink, the functionality and programming is very similar to Arduino, with the exception that all programs are written to the cloud-based IDE. While data can still be written to the Serial connection, you have the additional flexibility and convenience of connecting and programming your Particle Photon from anywhere with an Internet connection. Additionally, you will be able to push commands and retrieve data from the Particle Photon server.

Given your experience with Photons (and the wealth of documentation available online), wiring and coding a simple data retrieval program should be doable. If not, feel free to consult your friendly neighborhood TAs. Assuming you followed the tutorial, you should be able to write firmware to your photon and blink and LED. Next stop, data retrieval.

## Writing a sketch to continuously read data

You will code a sketch to read data from the your Photon’s analog input pins and then upload it to the api.particle.io server. Note that all data is written in JSON (JavaScript Object Notation) and you will need to parse this when you process in the information in pithy or matlab. In this format, data is represented as objects containing key-value pairs. In our case, we get objects that look like:
