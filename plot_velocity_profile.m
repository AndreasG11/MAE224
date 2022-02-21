
datafile='Data_x1_flowV20.mat';
load(datafile);

dists = 0 + (-range + 117)

figure

plot(dists,vels_mes)
xlabel('approx dist (mm)')
ylabel('Velocity (m/s)')
figure

plot(vels_mes,dists)
ylabel('approx dist (mm)')
xlabel('Velocity (m/s)')