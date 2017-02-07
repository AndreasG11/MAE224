Download the [Source](https://github.com/mkfu/MAE224/tree/master/Source%20Files) files.

These files provide a generic Particle Photon script that will enable you to access the pin modification functions from Matlab. You can then use the respective class files to create Photon objects to interact with the actual Photon.

Below are some examples of data taking. You will notice that instead of setting the `pinMode` in the Particle IDE, you are setting the `pinMode` in the data collection code. Note that when you want to change the mode of a pin that you have previously set, you need to tap the RESET button the physical Photon. Otherwise, all you need to do is

1.    Create a Photon object
2.    Set the pin to read or write
3.    Interact with the data


#MATLAB
For this example connect the A3 and A4 analog pins together. Also connect the D7 and D3 pins together.  We are going to use pins A3 and D3 to measure the outputs of A4 and D7, respectively.
<p align="center">
<img src="https://github.com/mkfu/MAE224/blob/master/images/example1circuit.png" width="300">  
</p>   

Paste the following Matlab code into a new script. Make sure that the folder containing Photon.m is contained within your file path.

Matlab code:

```matlab
%% Read Data Example
%Enter access token below. This can be found in the settings of your Particle Account
atoken = 'abc123'; %YOUR ACCESS TOKEN HERE

%Enter the core ID
core =  'class1'; %YOUR PHOTON ID OR NAME HERE

%Instantiates a new Photon object
g = Photon(core,atoken);
g.getConnectedDevices()

%% Create Empty arrays
N = 20;
data = zeros(1,N);
data2 = zeros(1,N);
time = zeros(1,N);


%Check if the device is connected
if g.getConnection
    %Iterate from 1 to 10. Increment the analog write from 0 -255. Alternate
    %the digital write between 1 and 0.  Connect A3 to A4 and D3 to D7.
    tic
    for i = 1:N
        i
        g.analogWrite('A4',(3.33/N)*i);
        g.digitalWrite('D7',mod(i,2));
        data(i)  = g.analogRead('A3');
        data2(i)  = g.digitalRead('D3')*3.3;
        time(i) = toc;
    end
end
%%  Plot that data
figure(1)
clf
plot(time,data,'b-o')
hold on
plot(time,data2,'r-s');
hold off
xlabel('Time(s)')
ylabel('Voltage')
legend('Analog','Digital','location','southeast')
```

If we replace the access token and name of the Photon correctly, we will get the following result.

![](https://github.com/mkfu/MAE224/blob/master/images/ex1result.png)

##Let's break down what the code means
The first three lines are the most important. We can instantiate a new Photon object that will have all of the information it needs to interact with our physical Photon. The two pieces of information that we need are the authorization token and the name of the Photon.
```matlab
atoken = 'abc123'; %YOUR ACCESS TOKEN HERE
core =  'class1'; %YOUR PHOTON ID OR NAME HERE

g = Photon(core,atoken);
```

Replace the strings in the above code with your Particle account authorization token and photon name.  Lastly, we will make a new object and pass those arguments via the constructor.

We can check that everything is working by trying a function call
```matlab
g.getConnectedDevices()
```
which will print out a list of all of the connected devices related to your account.  

Now we can write some Matlab code to preallocate some memory that we hope to fill. Let's make 3 arrays each 20 points long.
```matlab
N = 20;
data = zeros(1,N);
data2 = zeros(1,N);
time = zeros(1,N);
```
The next few lines do several things:
```matlab
if g.getConnection
    tic
    for i = 1:N
        i
        g.analogWrite('A4',(3.33/N)*i);
        g.digitalWrite('D7',mod(i,2));
        data(i)  = g.analogRead('A3');
        data2(i)  = g.digitalRead('D3')*3.3;
        time(i) = toc;
    end
end
```
Note: Matlab formats with tab indentation but actually denotes loops by bookending them with an initiator (`for`,`if`,`while`) and `end`.  First, we check to make sure that our specific Photon is connected to the internet with `if g.getConnection`. If the device is connected we start the time with `tic`. Next, we iterate over a `for` loop. Each iteration we will output a progressively larger voltage out of pin A4 and we will measure that voltage using pin A3. Additionally, the output from D3 will be a toggling HIGH and LOW signal which D3 will measure as 1 and 0, respectively. Note that because we are using pin D7, the output is actually connected to the onboard LED. You should see the LED turn on and off as the iterations progress. The input data will be recorded in the arrays `data` and `data2` and the time stamp at which you record the data will be kept in `time`.

Finally, we can plot all of the results with the following code, while using properly labeled axes and legends:
```matlab
figure(1)
clf
plot(time,data,'b-o')
hold on
plot(time,data2,'r-s');
hold off
xlabel('Time(s)')
ylabel('Voltage')
legend('Analog','Digital','location','southeast')
```

Once you have generated your Matlab plots, this example is complete.


#Python (Not Required)
Similarly, we can make very similar function calls in Python to read and write data. Paste the following text into a new Python script.

```python
    from Photon import *
    atoken = "abc123"                   #Change this to your access token
    name = "class1"                     #Change this to your photons name
    g = Photon(name,atoken)         
    g.getDevices()
    time.sleep(10)
    g.getFunctions()
    t = g.getVariables()
    print g.setFreq(500)
    print g.setInput('A0')
    print g.analogRead('A0')
```
