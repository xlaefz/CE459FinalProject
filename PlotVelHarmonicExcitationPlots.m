function [ a ] = PlotVelHarmonicExcitationPlots( t_h, v_lsim_h, v_h1, v_h2, v_h3, v_h4, v_h5, v_h6 )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

mFigure6 = figure(6);
subplot(3,2,1);
plot(t_h,v_lsim_h,t_h,v_h1);
title('Velocity for Harmonic - Piecewise Constant Method vs lsim');
legend('MATLAB lsim','Piecewise Constant');
xlabel('Time');
ylabel('Velocity');
subplot(3,2,2);
plot(t_h,v_lsim_h,t_h,v_h2);
title('Velocity for Harmonic - Piecewise Linear Method vs lsim');
legend('MATLAB lsim','Piecewise Linear');
xlabel('Time');
ylabel('Velocity');
subplot(3,2,3);
plot(t_h,v_lsim_h,t_h,v_h3);
title('Velocity for Harmonic - Newmark vs lsim');
legend('MATLAB lsim','Newmark');
xlabel('Time');
ylabel('Velocity');
subplot(3,2,4);
plot(t_h,v_lsim_h,t_h,v_h4);
title('Velocity for Harmonic - Rk4 vs lsim');
legend('MATLAB lsim','Rk4');
xlabel('Time');
ylabel('Velocity');
subplot(3,2,5);
plot(t_h,v_lsim_h,t_h,v_h5);
title('Velocity for Harmonic - Wilson vs lsim');
legend('MATLAB lsim','Wilson');
xlabel('Time');
ylabel('Velocity');
subplot(3,2,6);
plot(t_h,v_lsim_h,t_h,v_h6);
title('Velocity for Harmonic - Central vs lsim');
legend('MATLAB lsim','Central');
xlabel('Time');
ylabel('Velocity');
set(mFigure6, 'Position', [0,0,800,800]);
a = 1;
end

