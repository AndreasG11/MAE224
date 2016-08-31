#MATLAB
Paste the following Matlab code into a new script. Make sure that the folder containing Photon.m is contained within your file path.

Matlab code:

```matlab
    %% Read Data Example
    %Enter access token below. This can be found in the settings of your Particle Account
    atoken = 'abc123'; #YOUR ACCESS TOKEN HERE

    %Enter the core ID
    core =  'class1'; #YOUR PHOTON ID OR NAME HERE

    %Instantiates a new Photon object
    g = Photon(core,atoken);
    g.getConnectedDevices()

    %% Create Empty arrays
    N = 25;
    data = zeros(1,N);
    data2 = zeros(1,N);
    time = zeros(1,N);

    g.setFreq(500);
    tic

    g.analogWrite('A4',0);
    g.attachServo('A5');
    pause(1)
    for i = 1:N
        i;
        g.analogWrite('A4',10*i);
        g.digitalWrite('D4',mod(i,2));
        data(i)  = g.analogRead('A3')/4095*3.3
        data2(i)  = g.digitalRead('D3')
        time(i) = toc;
    end

    plot(time,data)
```

#Python
Paste the following text into a new Python script.

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
