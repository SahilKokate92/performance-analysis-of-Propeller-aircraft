% Drag polar ploting for different AR for conceptual design
% SAHILKOKATE
clc
clear
close all

%%
AR = 6:2:12;
CD0 = 0.02;
e = 0.85;
k = 1./(pi*AR*e);
CL = -1.5:0.1:1.5;
for i = 1:length(AR)
    k(i) = 1./(pi*AR(i)*e);
    CD(i,:) = CD0 + k(i) * CL.^2;
    CL_opt(i,:) = sqrt(CD0./k(i));  % optimim lift coeff.
    CD_opt(i,:) = CD0 + k(i) *CL_opt(i).^2;
    LD(i,:) = 1/(2 * sqrt(CD0 *k(i)));
end


figure
plot(CD,CL,LineWidth=1.1)
title('DRAG POLAR WITH DIFFERENT ASPECT RATIO')
xlabel('coeff of Drag')
ylabel('coeff of Lift')
legend('AR = 6','AR = 8','AR = 10','AR = 12')
grid on
xline(0,'--')
yline(0,'--')
xline(CD0,'r--')
text(0.005,-0.15,'CD0')

%% Choice of AR curve

A = menu('Select the AR value','6','8','10','12');

    if A == 1
        k_new = 1./(pi*AR(1)*e);
        CD_new = CD0+k_new * CL.^2;

        figure
        plot(CD_new,CL,'k-',LineWidth=1.4)
        title('DRAG POLAR WITH ASPECT RATIO = 6')
        xlabel('coeff of Drag')
        ylabel('coeff of Lift')
        legend('AR = 6')
        grid on
        xline(0,'--')
        yline(0,'--')
        xline(CD0,'r--')
        text(0.005,-0.15,'CD0')
    end

    if A == 2
        k_new = 1./(pi*AR(2)*e);
        CD_new = CD0 + k_new * CL.^2;
        figure
        plot(CD_new,CL,'k-',LineWidth=1.4)
        title('DRAG POLAR WITH ASPECT RATIO = 8')
        xlabel('coeff of Drag')
        ylabel('coeff of Lift')
        legend('AR = 8')
        grid on
        xline(0,'--')
        yline(0,'--')
        xline(CD0,'r--')
        text(0.005,-0.15,'CD0')
    end

    if A == 3
        k_new = 1./(pi*AR(3)*e);
        CD_new = CD0 + k_new * CL.^2;
        figure
        plot(CD_new,CL,'k-',LineWidth=1.4)
        title('DRAG POLAR WITH ASPECT RATIO = 10')
        xlabel('coeff of Drag')
        ylabel('coeff of Lift')
        legend('AR = 10')
        grid on
        xline(0,'--')
        yline(0,'--')
        xline(CD0,'r--')
        text(0.005,-0.15,'CD0')
    end

    if A == 4
        k_new = 1./(pi*AR(4)*e);
        CD_new = CD0 + k_new * CL.^2;
        figure
        plot(CD_new,CL,'k-',LineWidth=1.4)
        title('DRAG POLAR WITH ASPECT RATIO = 12')
        xlabel('coeff of Drag')
        ylabel('coeff of Lift')
        legend('AR = 12')
        grid on
        xline(0,'--')
        yline(0,'--')
        xline(CD0,'r--')
        text(0.005,-0.15,'CD0')
    end

fprintf('CL Optimum for AR=6 is  : %f\n',CL_opt(1))
fprintf('CL Optimum for AR=8 is  : %f\n',CL_opt(2))
fprintf('CL Optimum for AR=10 is : %f\n',CL_opt(3))
fprintf('CL Optimum for AR=12 is : %f\n',CL_opt(4))
fprintf('------------------------------------\n')
fprintf('max(L/D) for AR = 6 is  : %f\n',LD(1))
fprintf('max(L/D) for AR = 8 is  : %f\n',LD(2))
fprintf('max(L/D) for AR = 10 is  : %f\n',LD(3))
fprintf('max(L/D) for AR = 12 is  : %f\n',LD(4))