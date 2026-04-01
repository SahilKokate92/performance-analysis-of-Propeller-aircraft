% PERFORMANCE PLOTS
% SAHILKOKATE
clc
clear
close all

% user inputs
h = input('Altitude from MSL: '); 
AR = input('Aspect Ratio : ');
b = input('Wing Span in m : ');
W = input('Weight of Aircraft in N : ');
etaP = input('Propeller efficiency : ');
P = input('Engine Power in Watt : ');

[T,a,Pr,rho] = atmosisa(h);
S = b^2/AR;
e = 0.85;
k = 1/(pi*AR*e);
V = linspace(5,60,200);
CD0 = 0.02;
CL = 0.55;

% drag vs velocity

parasiteD = 0.5*rho*V.^2*S*CD0;
inducedD = (2*W^2*k) ./(rho*S*V.^2);
totalD = parasiteD + inducedD;
figure
hold on
grid on
plot(V,parasiteD,LineWidth=1.5)
plot(V,inducedD,LineWidth=1.5)
plot(V,totalD,LineWidth=1.5)
title('DRAG VS VELOCITY')
xlabel('Velocity')
ylabel('Drag')
legend('Parasite Drag','Induced Drag','Total Drag')
text(15,60,'The intersection point gives the Minimum Drag velocity')
hold off
% finding the minimum drag velocty
[~, idx] = min(totalD);
V_md = V(idx);
disp(['Minimum Drag Velocity = ', num2str(V_md), ' m/s'])

% Power required : cruise flight
Preq = totalD.*V;
P_zerolift = 0.5*rho*V.^3*S*CD0;
P_induced = (2*k*W^2)./(rho*S.*V);
figure
hold on
plot(V,Preq,LineWidth=1.5)
plot(V,P_zerolift,LineWidth=1.5)
plot(V,P_induced,LineWidth=1.5)
title('POWER REQUIRED VS VELOCITY')
xlabel('Velocity')
ylabel('Power')
legend('Power required','Zero lift power','induced power')
grid on 

%finding the minimum power velocity
[~,idx2] = min(Preq);
V_mp = V(idx2);
disp(['Minimum Power Velocity = ', num2str(V_mp), ' m/s'])

% power available and ROC for propeller aircraft
Pavl = etaP * P * ones(size(V));
ROC = (Pavl - Preq) ./ W;
figure
hold on
plot(V,Preq,'LineWidth',1.5)
plot(V,Pavl,'LineWidth',1.5)
xlabel('Velocity (m/s)')
ylabel('Power (W)')
title('Power vs Velocity')
legend('P required','P available')
grid on


% thrust avilabe for propellar aircraft

CLmax = 1.5;
Vs = sqrt((2*W)/(rho*S*CLmax));
Vs_ = linspace(Vs,50,200);
Tavl = etaP*Pavl./Vs_;

figure
plot(V,totalD,'LineWidth',1.5)
hold on
plot(V,Tavl,'LineWidth',1.5)
xlabel('Velocity (m/s)')
ylabel('Thrust (N)')
title('Thrust vs Velocity')
legend('T required','T available')
grid on


figure
plot(V,ROC,'LineWidth',1.5)
xlabel('Velocity (m/s)')
ylabel('Rate of Climb (m/s)')
title('ROC vs Velocity')
grid on