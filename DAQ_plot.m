clear; clc; close all;

% Add data storage folder to path
addpath('logs_car')
name = 'schott to home.mat';
filename = strcat('logs_car/',name);
load(filename)

%% Plots
fig = figure('position',[300 200 1300 900]);
% Plot acceleration
ax_acc = subplot(4,3,[1 4]);
plot(time,acc(:,1),'k')
hold on; grid on;
plot(time,acc(:,2),'r')
plot(time,acc(:,3),'b')
xlabel('Time [s]')
ylabel('Acceleration [m/s^2]')
xlim([0 t_end]);
legend('a_x','a_y','a_z','orientation','horizontal','location','southoutside')
title('Acceleration')

% Plot angular velocity
ax_angvel = subplot(4,3,[2 5]);
plot(time,angvel(:,1),'k')
hold on; grid on;
plot(time,angvel(:,2),'r')
plot(time,angvel(:,3),'b')
xlabel('Time [s]')
ylabel('Angular Velocity [rad/s]')
xlim([0 t_end]);
legend('\omega_x','\omega_y','\omega_z','orientation','horizontal','location','southoutside')
title('Angular Velocity')

% Plot Orientation
ax_orient = subplot(4,3,[3 6]);
plot(time,orient(:,1),'k')
hold on; grid on;
plot(time,orient(:,2),'r')
plot(time,orient(:,3),'b')
xlabel('Time [s]')
ylabel('Orientation [degrees]')
xlim([0 t_end]);
legend('Azimuth','Pitch','Roll','orientation','horizontal','location','southoutside')
title('Orientation')

% Plot Latitude and Longitude
ax_lat = subplot(4,3,7);
plot(time,lat,'r')
grid on;
ylabel('Latitude [degrees]')
xlim([0 t_end]);
title('Latitude')
ax_lon = subplot(4,3,10);
plot(time,lon,'b')
grid on;
xlabel('Time [s]')
ylabel('Longitude [degrees]')
xlim([0 t_end]);
title('Longitude')

% Plot speed
ax_spd = subplot(4,3,[8 11]);
plot(time,speed,'k')
grid on;
xlabel('Time [s]')
ylabel('Speed [m/s]')
xlim([0 t_end]);
title('Speed')

% Plot Altitude
ax_alt = subplot(4,3,[9 12]);
plot(time,alt,'k')
grid on;
xlabel('Time [s]')
ylabel('Altitude [m]')
xlim([0 t_end]);
title('Altitude')


linkaxes([ax_acc, ax_angvel, ax_orient, ax_lat, ax_lon, ax_spd, ax_alt],'x');

sgtitle(gcf,name)




