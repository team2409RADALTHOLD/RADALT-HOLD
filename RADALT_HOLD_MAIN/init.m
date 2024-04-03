%-------------------------------------------------------------------------%
%-------------------------- RADALT HOLD PROJECT  -------------------------%
%------------------------------- TEAM 2409 -------------------------------%
%-------------------------------------------------------------------------%
clear all;
clc;

%--------------------------%
%--- SAMPLING PARAMETERS --%
%--------------------------%
IMU_sampling_rate = 0.02;
Ts = 0.02;
%--------------------------%

%--------------------------%
%-- ALTIMETER PARAMETERS --%
%--------------------------%
Alt_max = 0.50;  % in cm
Alt_min = 0;     % in cm
%--------------------------%

%--------------------------%
%-- ALTIMETER PARAMETERS --%
%--------------------------%
Voter_Upper_Bound = 1.15; % 115 percent
Voter_Lower_Bound = 0.85; % 85 percent 
%--------------------------%

%--------------------------%
%-- FILTERING PARAMETERS --%
%--------------------------%
%Filtering parameters should 
% be based on SNR calculations
%Passband frequency input
Passband_Lowpass = 50; %hz
%Stopband frequency input
Stopband_Lowpass = 100; %hz
%--------------------------%

%--------------------------%
%----- GPS PARAMETERS -----%
%--------------------------%
% GPS initializer flag
GPS_init = true;
% Initial GPS position vector 
lla0 = [0 0 0];
%--------------------------%

%--------------------------%
%----- OSM PARAMETERS -----%
%--------------------------%
ROLL = 1;
PITCH = 1;
YAW = 1;
ALTITUDE = 1;
% Mixing algo for front right motor 
M_fr = [ALTITUDE YAW PITCH ROLL];
% Mixing algo for front left motor
M_fl = [ALTITUDE -YAW PITCH -ROLL];
% Mixing algo for back right motor
M_Br = [ALTITUDE -YAW -PITCH ROLL];
% Mixing algo for back left motor
M_Bl = [ALTITUDE YAW -PITCH -ROLL];
%--------------------------%

%-------------------------------------------------------------------------%
%--------------------- TANSFER FUNCTION MODEL ----------------------------%
%-------------------------------------------------------------------------%
%TRANSFER FUNCTION FORMULA
%H(S) = Y(S)/X(S)
% Quadcopter Parameters
m = 3.16162954;     % mass (kg), updated to the total mass
g = 9.81;           % gravity (m/s^2)
Ix = 0.05;          % estimated moment of inertia around X-axis (kg.m^2)
Iy = 0.05;          % estimated moment of inertia around Y-axis (kg.m^2)
Iz = 0.1;           % estimated moment of inertia around Z-axis (kg.m^2)
l = 0.24765;        % distance from the center to the motor (m)
b = 3.30e-7;        % thrust factor (N.s^2)
d = 2.97e-9;        % drag factor (N.m.s^2)

% Transfer Function for Roll
num_roll = [l*b];
den_roll = [Ix, 0, 0];
roll_tf = tf(num_roll, den_roll)

% Transfer Function for Pitch
num_pitch = [l*b];
den_pitch = [Iy, 0, 0];
pitch_tf = tf(num_pitch, den_pitch)

% Transfer Function for Yaw
num_yaw = [d];
den_yaw = [Iz, 0, 0];
yaw_tf = tf(num_yaw, den_yaw)

% Transfer Function for Altitude
num_alt = [b];
den_alt = [m, 0, -m*g];
altitude_tf = tf(num_alt, den_alt)
%-------------------------------------------------------------------------%
