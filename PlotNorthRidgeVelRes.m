%plot northridge velocity response
function [ a ] = PlotNorthRidgeVelRes( northridge_t, v_lsim_nor, v_nor_zoh, v_nor_foh, v_nor_newmark, v_nor_rk4, v_nor_wilson, v_nor_central )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
mFigure4 = figure(4);
subplot(3,2,1);
plot(northridge_t,v_lsim_nor,northridge_t,v_nor_zoh);
title('Northridge Velocity Plots- Piecewise Constant Method vs lsim');
legend('MATLAB lsim','Piecewise Constant');
xlabel('Time');
ylabel('Velocity');
subplot(3,2,2);
plot(northridge_t,v_lsim_nor,northridge_t,v_nor_foh);
title('Northridge Velocity Plots- Piecewise Linear Method vs lsim');
legend('MATLAB lsim','Piecewise Linear');
xlabel('Time');
ylabel('Velocity');
subplot(3,2,3);
plot(northridge_t,v_lsim_nor,northridge_t,v_nor_newmark);
title('Northridge Velocity Plots- Newmark vs lsim');
legend('MATLAB lsim','Newmark');
xlabel('Time');
ylabel('Velocity');
subplot(3,2,4);
plot(northridge_t,v_lsim_nor,northridge_t,v_nor_rk4);
title('Northridge Velocity Plots- Rk4 vs lsim');
legend('MATLAB lsim','Rk4');
xlabel('Time');
ylabel('Velocity');
subplot(3,2,5);
plot(northridge_t,v_lsim_nor,northridge_t,v_nor_wilson);
title('Northridge Velocity Plots- Wilson vs lsim');
legend('MATLAB lsim','Wilson');
xlabel('Time');
ylabel('Velocity');
subplot(3,2,6);
plot(northridge_t,v_lsim_nor,northridge_t,v_nor_central);
title('Northridge Velocity Plots- Central vs lsim');
legend('MATLAB lsim','Central');
xlabel('Time');
ylabel('Velocity');
set(mFigure4, 'Position', [0,0,800,800]);
a = 1;
end

