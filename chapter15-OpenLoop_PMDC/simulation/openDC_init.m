clear all
close all
clc
% data
Vdc = 10;     % dc power supply
fsw = 20e3;   % PWM_frequency
Tsw = 1/fsw;
% sampling
Ts = Tsw;  
Tsim = Tsw/400;
% motor parameters
Ra  = 0.5290;
La  = 8.6507e-4;
Kt  = 0.0232;
B   = 1.8026e-4;
J   = 3.559e-6;