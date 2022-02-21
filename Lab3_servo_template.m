% Moving the servo, seeing how many mm/tick the servo moves, and finding
% the zero point (at what tick number does the servo nearly hit the wind
% tunnel floor)

% this is based heavily on the example 3: Servo in the github


%Enter the Photon ID
photon =  'Photon5'; %YOUR PHOTON ID OR NAME HERE
%Enter access token below. This can be found in the settings of your Particle Account
atoken = 'a92f9bb38c45cf0cdd8c695a87e8260f01a4a07c'; %YOUR ACCESS TOKEN HERE


%Instantiates a new Photon object
g = Photon(photon,atoken);
g.getConnectedDevices()

%% Move a servo

%Attach a servo to D0
g.attachServo('D0');

%Check if the device is connected
if g.getConnection()
%Fully extend servo:
    curpos = g.move(100); % Maximum is 115, not recommended to set it to this value 
    pause(10); %Wait 10 seconds
    disp(['Servo sent to position: ' num2str(curpos)])
    pause(5); %Wait 5 seconds
%Retract Servo:
    curpos = g.move(75); % Minimum is 60, not recommended to set it to this value 
    pause(10);
    disp(['Servo sent to position: ' num2str(curpos)])
    pause(10);
end


% using above, measure the distance moved and divide by 25 to get the slope= mm/tick

% slope = 


%Detach the servo
g.detachServo()

%% find zero point (change values until nearly touching the wall)

movetick=80 % CHANGE THIS UNTIL YOUR PITOT TUBE NEARLY TOUCHES THE BOTTOM OF
% THE WIND TUNNEL

g.attachServo('D0');
if g.getConnection()
    curpos = g.move(movetick); % Maximum is 180, not recommended to set it to this value 
    pause(5); %Wait 10 seconds
    disp(['Servo sent to position: ' num2str(curpos)])
    pause(1); %Wait 5 seconds
end

%zero_point_tick = XX % record the zero point, do NOT increase the movetick
% past the zero point while in the wind tunnel, or you may break the pitot
% tube!!

%Detach the servo
g.detachServo()


