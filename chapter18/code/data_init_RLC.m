clear all
close all
clc

% processor Frequency
CPU_frequency      = 90e6; %(Hz)
% PWM Settings
PWM_frequency      = 10e3; %(Hz)
PWM_CounterPeriod = CPU_frequency/PWM_frequency/2; %(PWM timer counts)

% data
Vdc  = 15;
imax = 2;
fsw  = PWM_frequency;
Tsw  = 1/fsw;
Ts   = Tsw;         % discretization Ts
Tsim = Tsw/400;
% load data
Ro   = 6.8; 
L    = 860e-6;  
% L    = 4*860e-6; 
Rl   = 0.15;   
C    = 100e-6; 
Rc   = 66e-3;   % from ESR-f @10kHz;
% C    = 10e-6;
% Rc   = 495e-3; % from ESR-f @10kHz;
    
% voltage controller
% s    = tf('s');  % laplace
% G    = Vdc*(Ro*Rc)/(L*(Ro+Rc))*(s+1/(C*Rc))/(s^2+s*((C*(Ro*(Rl+Rc)+Rc*Rl)+L)/(L*C*(Ro+Rc)))+(Ro+Rl)/(L*C*(Ro+Rc)));

wz   = 1/(C*Rc);
wo   = sqrt((Ro+Rl)/(L*C*(Ro+Rc)));
eps  = 1/(2*wo)*(C*(Ro*(Rl+Rc)+Rc*Rl)+L)/(L*C*(Ro+Rc));
tauG = 1/wo;
TaG  = 5*tauG;

% controller pidtool()
% w = 500 (rad/s) phi = 90°
% -> TaF = ... s
% % kp = 0.004266;
% % ki = 34;
kp = 0.0047;
ki = 33.35;

% % % faster
% % % 1400 - 90
% kp = 0.0133;
% ki = 79.68;

% ADC characteristic
% g_adc = 33/4095;    % theo
g_adcI = 3.67/424;    % exp
g_adcV = 1/4096*49;




