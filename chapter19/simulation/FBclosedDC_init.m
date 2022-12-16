clear all
close all
clc

% CPU_frequency = 90e6;
% PWM_frequency = 20e3;
% PWM_CounterPeriod = CPU_frequency/(2*PWM_frequency);

%% single-motor data
Vdc  = 10;
Vmax = 10;   % Vdc
imax = 10;   % A
wmax = 250;  % up to 300
%
fsw  = 30e3;      % PWM_frequency
Ra   = 0.5290;
La   = 8.6507e-4;
Kt   = 0.0232;
Ke   = Kt;
B    = 1.8026e-4/2;
J    = 3.559e-6*2;

%% cascade controller
Tsw  = 1/fsw;
Ts   = Tsw;         % discretization Ts
% Tsim = Tsw/400;
Tsim = Tsw/400;
% transfer function - fdt
s     = tf('s');
% current
Gc    = 1/(Ra+s*La);
tauGc = La/Ra;
TaGc  = 5*tauGc;
% speed
Gm    = 1/(B+s*J);
tauGm = J/B;
TaGm  = 5*tauGm;
% current controller
TaI   = TaGc/10;
wcI   = 5/TaI;
kpI   = wcI*La;
kiI   = wcI*Ra;
Rc    = kpI+kiI/s;
% speed controller
% wcW   = wcI/10;
wcW   = wcI/100;
TaW   = 5/wcW;
kpW   = wcW*J;
kiW   = wcW*B;
Rw    = kpW+kiW/s;
 
%% MRAS observer
Tsm = Ts*5;
% we could adjust the current controller parameters
% kpMR   = kpI/100;
% kiMR   = kiI*10;
kpMR   = kpI;
kiMR   = kiI;

%% encoder
Tss = Ts*75; % 400 Hz
Tw = Ts*5;
cpr = 2400;
minRPM = 1/(cpr*Tw)*60
minRAD = minRPM*pi/30



