clear; clc; close all;

% Add data storage folder to path
addpath('logs_car')

% Enable Sensors
m=mobiledev       % declare an object for mobile device
m.AccelerationSensorEnabled = 1;
m.AngularVelocitySensorEnabled = 1;
m.OrientationSensorEnabled=1;
m.PositionSensorEnabled = 1;

% Set sample rate (in Hz) and recording duration (in seconds)
m.SampleRate = 100;
t_end = 420
n = t_end*m.SampleRate;

% Start logging
m.logging = 1;
pause(2)            % pause so that at least one value is recorded

% initialize logging
time = zeros(n,1);
acc = zeros(n,3);
angvel = zeros(n,3);
orient = zeros(n,3);
lat = zeros(n,1);
lon = zeros(n,1);
speed = zeros(n,1);
alt = zeros(n,1);

% START RECORDING (TIMER)
disp('entered measurement loop')
timerval = tic;
for i = 1:n
    timer_measurement = tic;        % Store time required to log the data by device
    
    time(i,:) = toc(timerval);      % current time instant
    acc(i,:) = m.Acceleration;
    angvel(i,:) = m.AngularVelocity;
    orient(i,:) = m.Orientation;
    lat(i,:) = m.Latitude;
    lon(i,:) = m.Longitude;
    speed(i,:) = m.Speed;
    alt(i,:) = m.Altitude;
    if time(i)>=t_end
        break
    end
    
    pause(1/m.SampleRate - toc(timer_measurement))      % adjust for data measurement time from timer_measurement
end

elapsedtime=toc(timerval);
num_measurements = i;

% Remove unnecessary array entries (to account for processing time)
time = time(1:num_measurements,:);
acc = acc(1:num_measurements,:);
angvel = angvel(1:num_measurements,:);
orient = orient(1:num_measurements,:);
lat = lat(1:num_measurements,:);
lon = lon(1:num_measurements,:);
speed = speed(1:num_measurements,:);
alt = alt(1:num_measurements,:);

m.logging=0;

save('logs_car/schott to home.mat');



