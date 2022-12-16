clear all
close all
clc
% processor Frequency
CPU_frequency      = 90e6; %(Hz)
% PWM Settings
PWM_frequency      = 30e3; %(Hz)
PWM_Counter_Period = CPU_frequency/PWM_frequency/2; %(PWM timer counts)
% PWM_Counter_Period = CPU_frequency/(2*PWM_frequency);
PWM_CounterPeriod = PWM_Counter_Period; % avoid name mismatch (implementation)

% motor data
Vdc  = 10;
Vmax = 10;  % Vdc
imax = 10; 
fsw  = PWM_frequency;
% discretization Ts
Ts  = 1/fsw;    

Ra   = 0.5290;
La   = 8.6507e-4;
Kt   = 0.0232;
B    = 1.8026e-4/2;
J    = 3.559e-6*2;

% controller
% transfer function - fdt
% s     = tf('s');
% current120000
% Gc    = 1/(Ra+s*La);
tauGc = La/Ra;
TaGc  = 5*tauGc;
% speed
% Gm    = 1/(B+s*J);
tauGm = J/B;
TaGm  = 5*tauGm;
% current controller
% TaI   = TaGc/20;
TaI   = TaGc/10;
wcI   = 5/TaI;
kpI   = wcI*La;
kiI   = wcI*Ra;
% Rc    = kpI+kiI/s;
% speed controller
wcW   = wcI/100;
kpW   = wcW*J;
kiW   = wcW*B;
% Rw    = kpW+kiW/s;

% encoder
Tw = Ts*5;
cpr = 2400;
minRPM = 1/(cpr*Tw)*60
minRAD = minRPM*pi/30

% ADC characteristic
% g_adc = 3.67/424;    % exp
g_adc = (530e-3)/62;   % exp




