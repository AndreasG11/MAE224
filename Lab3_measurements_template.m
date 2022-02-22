%Enter the Photon ID
photon =  'Photon5'; %YOUR PHOTON ID OR NAME HERE
%Enter access token below. This can be found in the settings of your Particle Account
atoken = 'a92f9bb38c45cf0cdd8c695a87e8260f01a4a07c'; %YOUR ACCESS TOKEN HERE


%Instantiates a new Photon object
g = Photon(photon,atoken);
g.getConnectedDevices()


%% measure pressures
% Change it to the analog pin connected to the sensor output (A0 to A5)
read_pin = 'A0';   % or whichever pin the pressure transducer is connected to

vIn = 3.3;
pMax = 248.84;
pMin = -248.84;

% arrays to store the std and mean of the measurements at each of the
% different heights
pres_meas = zeros(1,10);
pres_std = zeros(1,10);
vels_mes = zeros(1,10);
V_mes = zeros(1,10); % store mean voltages here
V_std = zeros(1,10);% store standar deviation of the voltages here

rho = 1.225; % kg/m^3

% use these to hold the 20 measurments at each position that we will then
% average
vOut = zeros(1,20);
Pressure=zeros(1,20);

% PUT START TICK AND END TICK
% START TICK IS THE ZERO POINT
% END TICK IS SOMEWHERE IN THE FREE STREAM, roughly ~80
% define slope using what you found during calibration (should be ~1mm/tick)

slope = XXX

start_tick=XXX % put zero point you found
end_tick=80
range = floor(linspace(end_tick,start_tick, 10));
range = flip(range) % flip so we start at the zero point and then work from the wall to the freestream
dists = 0 + slope*(-range + start_tick)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
g.attachServo('D0');
if g.getConnection()

% here, you want to use a for loop to change the servo position through the
% range we just defined
% inside this for loop, at each servo position, we want to take 20
% measurements of the pressure voltage signal (like in Lab 1 Manometer.m),
% average them, and also take the std dev of the voltage signal and
% the calculated pressure

%something like:
% for position=range
%   set servo to the position
%   wait for the servo to move there and for the pressure to stabilize
%   measure the voltage 20 times (see Manometer.m for example of this, it is another for loop!)
%   use the transferFunction to convert voltage to pressure (check that the
%   function is using the correct calibration curve for our pressure
%   sensor!)
%   take average of the data and store it in an array
% end
    
    
end
%Detach the servo
g.detachServo()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% These are just to name the files that your data are saved to
x_tunnel_loc = 1 % location along the wind tunnel, there will be 2 you take measurements at
v_flow_tunnel = 1 % the wind speed for this current measurement

% convert the pressure measured into velocity using Bernoulli Equation

vels_mes = XXX % this will be some expression that involves pressure and constants

% save data
% as matlab variables
fname=sprintf('Data_x%d_flowV%f.mat',x_tunnel_loc,v_flow_tunnel);
save(fname,'V_mes','V_std','pres_meas','pres_std','vels_mes','dists')

% or as a text file

fileID = fopen(sprintf('Data_x%d_flowV%f.txt',x_tunnel_loc,v_flow_tunnel),'w');
fprintf(fileID,'V_avg(V)\tV_std(V)\tP_avg(V)\tP_std(V)\tvel_avg(m/s)\tpitot_height\n');
for i = 1:length(V_mes)
  fprintf(fileID,'%f\t%f\t%f\t%f\t%f\n', V_mes(i),V_std(i),pres_meas(i),pres_std(i),vels_mes(i),dists(i));
end
fclose(fileID);


% convert voltage measured into pressure
function pressureDiff = transferFunction(vIn, vOut, pMin, pMax)
 
pressureDiff = pMin + (pMax-pMin)/0.8 * (vOut/vIn - 0.1);

end