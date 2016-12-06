function [ a ] = PlotNorthridgeRes( northridge_t, mD_lsim_northridge, d_nor1, d_nor2, d_nor3, d_nor4, d_nor5, d_nor6 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
mFigure3 = figure(3);
subplot(3,2,1);
plot(northridge_t,mD_lsim_northridge,northridge_t,d_nor1);
title('Displacement for Northridge - Piecewise Constant Method vs lsim');
legend('MATLAB lsim','Piecewise Constant');
xlabel('Time');
ylabel('Displacement');
subplot(3,2,2);
plot(northridge_t,mD_lsim_northridge,northridge_t,d_nor2);
title('Displacement for Northridge - Piecewise Linear Method vs lsim');
legend('MATLAB lsim','Piecewise Linear');
xlabel('Time');
ylabel('Displacement');
subplot(3,2,3);
plot(northridge_t,mD_lsim_northridge,northridge_t,d_nor3);
title('Displacement for Northridge - Newmark vs lsim');
legend('MATLAB lsim','Newmark');
xlabel('Time');
ylabel('Displacement');
subplot(3,2,4);
plot(northridge_t,mD_lsim_northridge,northridge_t,d_nor4);
title('Displacement for Northridge - Rk4 vs lsim');
legend('MATLAB lsim','Rk4');
xlabel('Time');
ylabel('Displacement');
subplot(3,2,5);
plot(northridge_t,mD_lsim_northridge,northridge_t,d_nor5);
title('Displacement for Northridge - Wilson vs lsim');
legend('MATLAB lsim','Wilson');
xlabel('Time');
ylabel('Displacement');
subplot(3,2,6);
plot(northridge_t,mD_lsim_northridge,northridge_t,d_nor6);
title('Displacement for Northridge - Central vs lsim');
legend('MATLAB lsim','Central');
xlabel('Time');
ylabel('Displacement');
set(mFigure3, 'Position', [0,0,800,800]);
a = 1;
end

