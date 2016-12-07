%plot harmonic 
function [ a ] = PlotHarmonicExcitationPlots( t_h, d_lsim_h, d_h_zoh, d_h_foh, d_h_newmark, d_h_rk4, d_h_wilson, d_h_central )
mFigure5 = figure(5);
subplot(3,2,1);
plot(t_h,d_lsim_h,t_h,d_h_zoh);
title('Harmonic Graph For Displacement - Piecewise Constant Method vs lsim');
legend('MATLAB lsim','Piecewise Constant');
xlabel('Time');
ylabel('Displacement');
subplot(3,2,2);
plot(t_h,d_lsim_h,t_h,d_h_foh);
title('Harmonic Graph For Displacement - Piecewise Linear Method vs lsim');
legend('MATLAB lsim','Piecewise Constant');
xlabel('Time');
ylabel('Displacement');
subplot(3,2,3);
plot(t_h,d_lsim_h,t_h,d_h_newmark);
title('Harmonic Graph For Displacement - Newmark vs lsim');
legend('MATLAB lsim','Newmark');
xlabel('Time');
ylabel('Displacement');
subplot(3,2,4);
plot(t_h,d_lsim_h,t_h,d_h_rk4);
title('Harmonic Graph For Displacement - Rk4 vs lsim');
legend('MATLAB lsim','Rk4');
xlabel('Time');
ylabel('Displacement');
subplot(3,2,5);
plot(t_h,d_lsim_h,t_h,d_h_wilson);
title('Harmonic Graph For Displacement - Wilson vs lsim');
legend('MATLAB lsim','Wilson');
xlabel('Time');
ylabel('Displacement');
subplot(3,2,6);
plot(t_h,d_lsim_h,t_h,d_h_central);
title('Harmonic Graph For Displacement - Central vs lsim');
legend('MATLAB lsim','Central');
xlabel('Time');
ylabel('Displacement');
set(mFigure5, 'Position', [0,0,800,800]);
a = 1;
end

