In this lab course you will be dealing with both analog and digital signals, it is important that you know the distinction between the two. **Signals** in general are time varying quantities which give us some sort of information. Electronic signals can come in the form of current or voltage values (the two are related via Ohms law: V = IR, for some resistance, R). 

## Analog Vs. Digital Signals

The Particle Photons can read and write both analog and digital voltages (A and D pins, respectively), in the lab you will be required to write voltages that control an experiment and then read voltages put out by various sensors. Some of these sensors/motors will require you to read/write an analog signal. An analog signal is one that can vary in both time and amplitude. This frequency variation can be very fast (in the Gigahertz or higher range), set to a pre-determined amount, or simply 0 (i.e. Direct Current or D.C. signals). As an example of an analog voltage with which you use every day: the Alternating Current (A.C.) in power lines is regulated to 60 Hz. here in the United States with a peak-to-peak value between 110 and 120 VAC. The signal itself is simply a sine wave which has two phases. During the dawn of electronics, all signals were analog, and all early circuitry involved reading, processing, and displaying analog signals. Most modern electronics are completely digital, but we still encounter and use analog signals every day. As an example, the DC power supply in the lab is an analog output device. In this case, the output does not vary in time but can be adjusted in magnitude. 

In the simplest sense, a digital signal can only have two values, ON or OFF. For most digital devices (i.e. USB mice, keyboards, Serial devices, Ethernet, etc., etc.) ON or binary 1 is represented by a 3.3 or 5 Volt signal, and OFF or binary 0 is simply referenced to ground or 0 V. There are many digital communication protocols you may have heard of (I2C, USB, RS-232 and many, many more) which define how these 1's and 0's must be formatted between devices so that they can communicate. In the lab we will be using a mix of both digital and analog signals. However, the Photon is a digital device so it cannot directly output Analog signals. To get around this we use what is known as Pulse Width Modulation (PWM) to re-create an analog signal from a digital one. An example of this is shown below:

![](https://github.com/d008/MAE224/blob/master/images/PWMwaves.png)
Source: [http://www.siriusmicro.com/chrp3/pwm-c.html](http://www.siriusmicro.com/chrp3/pwm-c.html)

The digital output is shown in black. Notice how for each signal, the amount of time the signal is turned off varies, this is known as changing the duty cycle. The result is that the time-averaged value is changed. We are able to output voltages in-between the fully-on and fully-off (digital) capabilities of the photon. This assumes, of course, that we are able to switch the pins on and off relatively quickly so that over a reasonable time frame the average is what we want. It turns out digital devices are very good at switching on and off quickly (you might have suspected this since you can stream movies digitally and that is a lot of data!), so this is not a problem. 

PWM itself is very powerful, in fact you can also use it to re-create time-varying analog signals. All we need is to be able to control the duty cycle as a function of time. We will not be doing this with the particle photon during the lab, but it is possible with the right programming. 

##PWM Example
Here you will be outputting a PWM signal with your Particle Photon and reading it with both the oscilloscope and the Photon itself. 


