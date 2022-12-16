clear all
close all
clc
% processor Frequency
CPU_frequency      = 90e6; %(Hz)
% PWM Settings
PWM_frequency      = 20e3; %(Hz)
PWM_CounterPeriod = CPU_frequency/PWM_frequency/2; %(PWM timer counts)
% data
Vdc = 10;             % dc power supply
fsw = PWM_frequency;
Tsw = 1/fsw; 
% discretization Ts         
Ts = Tsw;  
Tsim = Tsw/400;
% motor parameters
Ra  = 0.5290;
La  = 8.6507e-4;
Kt  = 0.0232;
B   = 1.8026e-4;
J   = 3.559e-6;

% limit
Vmax = 10;  % Vdc


