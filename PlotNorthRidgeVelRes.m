function [ a ] = PlotNorthRidgeVelRes( northridge_t, v_lsim_nor, v_nor1, v_nor2, v_nor3, v_nor4, v_nor5, v_nor6 )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
mFigure4 = figure(4);
subplot(3,2,1);
plot(northridge_t,v_lsim_nor,northridge_t,v_nor1);
title('Velocity for Northridge - Piecewise Constant Method vs lsim');
legend('MATLAB lsim','Piecewise Constant');
xlabel('Time');
ylabel('Velocity');
subplot(3,2,2);
plot(northridge_t,v_lsim_nor,northridge_t,v_nor2);
title('Velocity for Northridge - Piecewise Linear Method vs lsim');
legend('MATLAB lsim','Piecewise Linear');
xlabel('Time');
ylabel('Velocity');
subplot(3,2,3);
plot(northridge_t,v_lsim_nor,northridge_t,v_nor3);
title('Velocity for Northridge - Newmark vs lsim');
legend('MATLAB lsim','Newmark');
xlabel('Time');
ylabel('Velocity');
subplot(3,2,4);
plot(northridge_t,v_lsim_nor,northridge_t,v_nor4);
title('Velocity for Northridge - Rk4 vs lsim');
legend('MATLAB lsim','Rk4');
xlabel('Time');
ylabel('Velocity');
subplot(3,2,5);
plot(northridge_t,v_lsim_nor,northridge_t,v_nor5);
title('Velocity for Northridge - Wilson vs lsim');
legend('MATLAB lsim','Wilson');
xlabel('Time');
ylabel('Velocity');
subplot(3,2,6);
plot(northridge_t,v_lsim_nor,northridge_t,v_nor6);
title('Velocity for Northridge - Central vs lsim');
legend('MATLAB lsim','Central');
xlabel('Time');
ylabel('Velocity');
set(mFigure4, 'Position', [0,0,800,800]);
a = 1;
end

