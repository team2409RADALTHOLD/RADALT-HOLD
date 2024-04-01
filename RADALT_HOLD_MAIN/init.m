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

