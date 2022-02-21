% need to define dists before running this script!

datafile='Data_x1_flowV20.mat';
load(datafile);


figure

plot(dists,vels_mes)
xlabel('approx dist (mm)')
ylabel('Velocity (m/s)')
figure

plot(vels_mes,dists)
ylabel('approx dist (mm)')
xlabel('Velocity (m/s)')