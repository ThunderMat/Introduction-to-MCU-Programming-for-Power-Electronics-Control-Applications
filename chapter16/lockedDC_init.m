clear all
clc

% PWM
CPU_frequency = 90e6; 
PWM_frequency = 20e3; 
PWM_CounterPeriod = CPU_frequency/PWM_frequency/2;
fsw = PWM_frequency;

%sampling / step-size
Tsw = 1/fsw;
Ts = Tsw;
%Ts = 100e-6;

% ADC
% g_adc = 33/4095;    % theo
g_adc = 3.67/424;    % exp

