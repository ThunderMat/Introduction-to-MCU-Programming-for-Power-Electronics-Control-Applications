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

% motor data (100W)
Vdc   = 10;   % V
Vmax  = 10;   % Vdc
imax  = 10;   % A
wmax  = 250;  % up to 300
maxBr = 0.05; % 0.02-> ib = 0.8A
fsw   = PWM_frequency;
% discretization Ts
Tsw  = 1/fsw;
Ts= Tsw;
%
RaM = 0.578;
LaM = 0.92e-3;
Kt  = 0.0245;   % KtM = KtB  or 0.0232
Ke  = Kt;
J   = 1.1922e-5;
B   = 0.00042/2;

% controller
% transfer function - fdt
% s     = tf('s');
% current
% Gc    = 1/(RaM+s*LaM);
tauGc = LaM/RaM;
TaGc  = 5*tauGc;
% speed
% Gm    = 1/(B+s*J);
tauGm = J/B;
TaGm  = 5*tauGm;
% current controller
TaI   = TaGc/10;
wcI   = 5/TaI;
kpI   = wcI*LaM;
kiI   = wcI*RaM;
% Rc    = kpI+kiI/s;
% speed controller
wcW   = wcI/100;
TaW   = 5/wcW;
kpW   = wcW*J;
kiW   = wcW*B;
% Rw    = kpW+kiW/s;

% MRAS tuning
% we could adjust the current controller parameters
% kpMR   = kpI/100;
% kiMR   = kiI*4;
kpMR   = kpI;
kiMR   = kiI;
Tsm = Ts*5;

% encoder
Tw = Ts*5;
cpr = 2400;
minRPM = 1/(cpr*Tw)*60
minRAD = minRPM*pi/30

% ADC characteristic
% g_adcA = 3.67/424;    % exp
g_adcA = 4.65/550;    % exp
g_adcB = 4.65/450;    % exp




