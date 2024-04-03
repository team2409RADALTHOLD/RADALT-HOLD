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

