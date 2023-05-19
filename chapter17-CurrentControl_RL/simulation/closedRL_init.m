clear all
close all
clc
% processor Frequency
CPU_frequency      = 90e6; %(Hz)
% PWM Settings
PWM_frequency      = 10e3; %(Hz)
PWM_Counter_Period = CPU_frequency/PWM_frequency/2; %(PWM timer counts)
% PWM_Counter_Period = CPU_frequency/(2*PWM_frequency);

% data
Vdc = 15;
fsw = PWM_frequency;
Tsw = 1/fsw;
Ts  = Tsw;         % discretization Ts
Tsim = Tsw/400;
% load data
Ro  = 6.8; 
L   = 860e-6;  
Rl  = 0.15;   
Req = Rl + Ro;

% current controller
s    = tf('s');  % laplcae
G    = 1/(Req+s*L);
tauG = L/Req;
TaG  = 5*tauG;
% -> we slow down the dynamics to get more visible results
wc   = 3000;   % 500
TaF  = 5/wc; 
kp   = wc*L;
ki   = wc*Req;
Rc   = kp+ki/s;
