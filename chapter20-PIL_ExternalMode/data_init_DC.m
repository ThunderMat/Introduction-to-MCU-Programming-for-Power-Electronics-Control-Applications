clear all
close all
clc

% motor data
Vdc  = 10;
imax = 5;
Ra   = 0.5290;
La   = 8.6507e-4;
Kt   = 0.0232;
B    = 1.8026e-4;
J    = 3.559e-6;
% sampling
fsw  = 20e3;   
Tsw  = 1/fsw;
Ts   = Tsw;
Tsim = Ts/100;
% CPU_frequency = 90e6;
% PWM_frequency = fsw;
% PWM_CounterPeriod = CPU_frequency/(2*PWM_frequency);

% current controller
tauGc = La/Ra;
TaGc  = 5*tauGc;
TaI   = TaGc/10;
wcI   = 5/TaI;
kpI   = wcI*La;
kiI   = wcI*Ra;
% speed controller
tauGm = J/B;
TaGm  = 5*tauGm;
wcW   = wcI/10;
kpW   = wcW*J;
kiW   = wcW*B;
 
% setpref('MathWorks_Embedded_IDE_Link_PIL_Preferences','COMPort','COM10');
% setpref('MathWorks_Embedded_IDE_Link_PIL_Preferences','BaudRate',115200);
% setpref('MathWorks_Embedded_IDE_Link_PIL_Preferences','enableserial',true);




