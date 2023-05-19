clear all
close all
clc

% processor Frequency
CPU_frequency      = 90e6; %(Hz)
% PWM Settings
PWM_frequency      = 10e3; %(Hz)
PWM_Counter_Period = CPU_frequency/PWM_frequency/2; %(PWM timer counts)

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
Rl   = 0.15;   
C    = 100e-6; 
Rc   = 66e-3;   %60m-150m Ohm;
%     C2    = 10e-6;
%     Rc2   = 470e-3; 
    
% voltage controller
% controller pidtool()
% s  = tf('s');  
% G  = Vdc*(Ro*Rc)/(L*(Ro+Rc))*(s+1/(C*Rc))/(s^2+s*((C*(Ro*(Rl+Rc)+Rc*Rl)+L)/(L*C*(Ro+Rc)))+(Ro+Rl)/(L*C*(Ro+Rc)));
% pidtool(Gp)
% w = 555 (rad/s) phi = 90°  -> TaF = 9ms
kp = 0.0047;
ki = 33.35;
% % % faster
% % % 1400 - 90
% kp = 0.0133;
% ki = 79.68;

% %% fdt analysis
% s    = tf('s');  % laplace
% Gp   = Vdc*(Ro*Rc)/(L*(Ro+Rc))*(s+1/(C*Rc))/(s^2+s*((C*(Ro*(Rl+Rc)+Rc*Rl)+L)/(L*C*(Ro+Rc)))+(Ro+Rl)/(L*C*(Ro+Rc)));
% wz   = 1/(C*Rc);
% wo   = sqrt((Ro+Rl)/(L*C*(Ro+Rc)));
% eps  = 1/(2*wo)*(C*(Ro*(Rl+Rc)+Rc*Rl)+L)/(L*C*(Ro+Rc));
% wg   = 1.33e4; % from bode plot
% tauG = 1/wg;
% TaG  = 5*tauG;
% TaF  = 9e-3;
% R    = kp+ki/s;
% Lop  = R*Gp;
% Fcl  = Lop/(1+Lop);
%
% figure
% bode(Gp)
% hold all
% bode(Lop)





