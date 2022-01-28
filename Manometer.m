clear all

% Enter your photon name
name = 'Photon Name';
% Enter the unique access token for your Photon
atoken = 'Access Token';
% Leave the port blank unless the wifi connection is too slow
port = 'NOPORT';
% Change it to the analog pin connected to the sensor output (A0 to A5)
read_pin = 'A5';      

vIn = 3.3;
pMax = 6894.76;
pMin = -6894.76;

g = Photon(name, atoken, port);

% Enter true if you are using a serial connection and false if you are using a cloud connection. If you having issues, just put false.
isUsingSerial = false;

if isUsingSerial
    g.disconnect;
end


Pressure_atmosphere = 101325; %Pa, or 14.696 psi

Run_No = 20;
Pressure = zeros(1,Run_No);
vOut = zeros(1,Run_No);

for i = 1:20
    v_Read = g.analogRead(read_pin);
    vOut(i) = v_Read;

    pressureApp = transferFunction(vIn, vOut(i), pMin, pMax);
    Pressure(i) = pressureApp;
end


% The measured data is saved in Pressure.    
disp('The measurement results are (unit: Pa):')

avgP = mean(Pressure)
%% OUR CODE

% This function will take in the input voltage, output voltage, minimum
% pressure, and maximum pressure and output the pressure difference
% detected.

function pressureDiff = transferFunction(vIn, vOut, pMin, pMax)
 
pressureDiff = pMin + (pMax-pMin)/0.8 * (vOut/vIn - 0.1);

end
