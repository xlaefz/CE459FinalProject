f = 1;
z = 0.04; % Damping ratio
m = 1;
w = 2*pi*f; % Natural frequency in rad/sec
x0 = 0; v0 = 0; % Initial conditions
k = m*w^2;

%import external files
load earthquakes.mat

% Response to earthquakes using MATLAB functions
mSSYLSIM_EL = ss([0 1;-w^2 -2*z*w],[0;-1],eye(2),[0;0]);
mYlSim_El = lsim( mSSYLSIM_EL, -elcentro_eq, elcentro_t,[x0;v0]);
d_lsim_el=mYlSim_El(:,1); v_lsim_el = mYlSim_El(:,2);
mYlsim_northridge = lsim( mSSYLSIM_EL, -northridge_eq, northridge_t,[x0;v0]);
mD_lsim_northridge=mYlsim_northridge(:,1); v_lsim_nor = mYlsim_northridge(:,2);

% Response to earthquakes using 6 methods
[d_el1,v_el1] = zoh( w, z, elcentro_t, elcentro_eq, x0, v0 );
[d_nor1,v_nor1] = zoh( w, z, northridge_t, northridge_eq, x0, v0 );
relative_rms_displ_error_el1 = std(d_el1-d_lsim_el)/std(d_lsim_el);
relative_rms_veloc_error_el1 = std(v_el1-v_lsim_el)/std(v_lsim_el);
relative_rms_displ_error_nor1 = std(d_nor1-mD_lsim_northridge)/std(mD_lsim_northridge);
relative_rms_veloc_error_nor1 = std(v_nor1-v_lsim_nor)/std(v_lsim_nor);

[d_el2,v_el2] = foh( w, z, elcentro_t, elcentro_eq, x0, v0 );
[d_nor2,v_nor2] = foh( w, z, northridge_t, northridge_eq, x0, v0 );
relative_rms_displ_error_el2 = std(d_el2-d_lsim_el)/std(d_lsim_el);
relative_rms_veloc_error_el2 = std(v_el2-v_lsim_el)/std(v_lsim_el);
relative_rms_displ_error_nor2 = std(d_nor2-mD_lsim_northridge)/std(mD_lsim_northridge);
relative_rms_veloc_error_nor2 = std(v_nor2-v_lsim_nor)/std(v_lsim_nor);

[d_el3,v_el3] = newmark( w, z, elcentro_t, elcentro_eq, x0, v0 );
[d_nor3,v_nor3] = newmark( w, z, northridge_t, northridge_eq, x0, v0 );
relative_rms_displ_error_el3 = std(d_el3-d_lsim_el)/std(d_lsim_el);
relative_rms_veloc_error_el3 = std(v_el3-v_lsim_el)/std(v_lsim_el);
relative_rms_displ_error_nor3 = std(d_nor3-mD_lsim_northridge)/std(mD_lsim_northridge);
relative_rms_veloc_error_nor3 = std(v_nor3-v_lsim_nor)/std(v_lsim_nor);

[d_el4,v_el4] = rk4( w, z, elcentro_t, elcentro_eq, x0, v0 );
[d_nor4,v_nor4] = rk4( w, z, northridge_t, northridge_eq, x0, v0 );
relative_rms_displ_error_el4 = std(d_el4-d_lsim_el)/std(d_lsim_el);
relative_rms_veloc_error_el4 = std(v_el4-v_lsim_el)/std(v_lsim_el);
relative_rms_displ_error_nor4 = std(d_nor4-mD_lsim_northridge)/std(mD_lsim_northridge);
relative_rms_veloc_error_nor4 = std(v_nor4-v_lsim_nor)/std(v_lsim_nor);

[d_el5,v_el5] = wilson( w, z, elcentro_t, elcentro_eq, x0, v0 );
[d_nor5,v_nor5] = wilson( w, z, northridge_t, northridge_eq, x0, v0 );
relative_rms_displ_error_el5 = std(d_el5-d_lsim_el)/std(d_lsim_el);
relative_rms_veloc_error_el5 = std(v_el5-v_lsim_el)/std(v_lsim_el);
relative_rms_displ_error_nor5 = std(d_nor5-mD_lsim_northridge)/std(mD_lsim_northridge);
relative_rms_veloc_error_nor5 = std(v_nor5-v_lsim_nor)/std(v_lsim_nor);

[d_el6,v_el6] = central( w, z, elcentro_t, elcentro_eq, x0, v0 );
[d_nor6,v_nor6] = central( w, z, northridge_t, northridge_eq, x0, v0 );
relative_rms_displ_error_el6 = std(d_el6-d_lsim_el)/std(d_lsim_el);
relative_rms_veloc_error_el6 = std(v_el6-v_lsim_el)/std(v_lsim_el);
relative_rms_displ_error_nor6 = std(d_nor6-mD_lsim_northridge)/std(mD_lsim_northridge);
relative_rms_veloc_error_nor6 = std(v_nor6-v_lsim_nor)/std(v_lsim_nor);

% Response to harmonic excitation
t_h = 0:0.01:8*pi;
f_h = sin(t_h);
ylsim_h = lsim( ss([0 1;-w^2 -2*z*w],[0;-1],eye(2),[0;0]), -f_h, t_h, [x0;v0]);
d_lsim_h=ylsim_h(:,1); v_lsim_h=ylsim_h(:,2);
[d_h1,v_h1] = zoh( w, z, t_h, f_h, x0, v0 );
relative_rms_displ_error_h1 = std(d_h1-d_lsim_h)/std(d_lsim_h);

[d_h2,v_h2] = foh( w, z, t_h, f_h, x0, v0 );
relative_rms_displ_error_h2 = std(d_h2-d_lsim_h)/std(d_lsim_h);

[d_h3,v_h3] = newmark( w, z, t_h, f_h, x0, v0 );
relative_rms_displ_error_h3 = std(d_h3-d_lsim_h)/std(d_lsim_h);

[d_h4,v_h4] = rk4( w, z, t_h, f_h, x0, v0 );
relative_rms_displ_error_h4 = std(d_h4-d_lsim_h)/std(d_lsim_h);

[d_h5,v_h5] = wilson( w, z, t_h, f_h, x0, v0 );
relative_rms_displ_error_h5 = std(d_h5-d_lsim_h)/std(d_lsim_h);

[d_h6,v_h6] = central( w, z, t_h, f_h, x0, v0 );
relative_rms_displ_error_h6 = std(d_h6.'-d_lsim_h)/std(d_lsim_h);

% Accuracy and stability test
%initializing everything to 0 
dt = [0.001, 0.01, 0.02, 0.05, 0.1, 0.2, 0.5, 1];
mLengthOfDT = length(dt);
t1 = 30/.001+1;
mZerosVecWithT1 = zeros(mLengthOfDT,t1);
mZerosVecWith1Col = zeros(mLengthOfDT, 1);
d_lsim_h1 = mZerosVecWithT1;
v_lsim_h1 = mZerosVecWithT1;
d1 = mZerosVecWithT1;
v1 = mZerosVecWithT1;
d2 = mZerosVecWithT1;
v2 = mZerosVecWithT1;
d3 = mZerosVecWithT1;
v3 = mZerosVecWithT1;
d4 = mZerosVecWithT1;
v4 = mZerosVecWithT1;
d5 = mZerosVecWithT1;
v5 = mZerosVecWithT1;
d6 = mZerosVecWithT1;
v6 = mZerosVecWithT1;
relative_rms_displ_error1 = mZerosVecWith1Col;
relative_rms_displ_error2 = mZerosVecWith1Col;
relative_rms_displ_error3 = mZerosVecWith1Col;
relative_rms_displ_error4 = mZerosVecWith1Col;
relative_rms_displ_error5 = mZerosVecWith1Col;
relative_rms_displ_error6 = mZerosVecWith1Col;
relative_rms_veloc_error1 = mZerosVecWith1Col;
relative_rms_veloc_error2 = mZerosVecWith1Col;
relative_rms_veloc_error3 = mZerosVecWith1Col;
relative_rms_veloc_error4 = mZerosVecWith1Col;
relative_rms_veloc_error5 = mZerosVecWith1Col;
relative_rms_veloc_error6 = mZerosVecWith1Col;
x = mZerosVecWithT1;
v = mZerosVecWithT1;

 % This is for me to compare to the exact solution
for i=1:mLengthOfDT
    wf = w;
    t = 0:dt(i):30;
    f = sin(wf*t);
    F = 1;
    x = -F/(2*k*z)*cos(wf*t);
    v = F*w/(2*k*z)*sin(wf*t);
    [d1(i,1:length(t)),v1(i,1:length(t))] = zoh( w, z, t, f, x0, v0 );
    relative_rms_displ_error1(i,1) = std(d1(i,1:length(t))-x)/std(x);
    relative_rms_veloc_error1(i,1) = std(v1(i,1:length(t))-v)/std(v);
    [d2(i,1:length(t)),v2(i,1:length(t))] = foh( w, z, t, f, x0, v0 );
    relative_rms_displ_error2(i,1) = std(d2(i,1:length(t))-x)/std(x);
    relative_rms_veloc_error2(i,1) = std(v2(i,1:length(t))-v)/std(v);
    [d3(i,1:length(t)),v3(i,1:length(t))] = newmark( w, z, t, f, x0, v0 );
    relative_rms_displ_error3(i,1) = std(d3(i,1:length(t))-x)/std(x);
    relative_rms_veloc_error3(i,1) = std(v3(i,1:length(t))-v)/std(v);
    [d4(i,1:length(t)),v4(i,1:length(t))] = rk4( w, z, t, f, x0, v0 );
    relative_rms_displ_error4(i,1) = std(d4(i,1:length(t))-x)/std(x);
    relative_rms_veloc_error4(i,1) = std(v4(i,1:length(t))-v)/std(v);
    [d5(i,1:length(t)),v5(i,1:length(t))] = wilson( w, z, t, f, x0, v0 );
    relative_rms_displ_error5(i,1) = std(d5(i,1:length(t))-x)/std(x);
    relative_rms_veloc_error5(i,1) = std(v5(i,1:length(t))-v)/std(v);
    [d6(i,1:length(t)),v6(i,1:length(t))] = central( w, z, t, f, x0, v0 );
    relative_rms_displ_error6(i,1) = std(d6(i,1:length(t))-x)/std(x);
    relative_rms_veloc_error6(i,1) = std(v6(i,1:length(t))-v)/std(v);
end

% Plots of response to Elcentro Eq
%for displacement
mFigure1Plot = PlotFigure1(elcentro_t, d_lsim_el, d_el1, d_el2, d_el3, d_el4,d_el5,d_el6);
%for velocity
mFigure2Plot = PlotFigure2(elcentro_t, v_lsim_el, v_el1, v_el2, v_el3, v_el4, v_el5, v_el6);

% Plots for response to Northridge Eq
%for distance
mFigure3Plot = PlotNorthridgeRes(northridge_t, mD_lsim_northridge, d_nor1, d_nor2, d_nor3, d_nor4, d_nor5, d_nor6);
%for velocity
mFigure4Plot = PlotNorthRidgeVelRes(northridge_t, v_lsim_nor, v_nor1, v_nor2, v_nor3, v_nor4, v_nor5, v_nor6);

% Harmonic Excitation Plots
mHarmonicResponseFig = PlotHarmonicExcitationPlots(t_h, d_lsim_h, d_h1, d_h2, d_h3, d_h4, d_h5, d_h6);

mHarmonicVelResponseFig = PlotVelHarmonicExcitationPlots(t_h, v_lsim_h, v_h1, v_h2, v_h3, v_h4, v_h5, v_h6);
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

% Create table of rms values for earthquakes
RMS_Displ_El=[relative_rms_displ_error_el1;
                relative_rms_displ_error_el2;
                relative_rms_displ_error_el3;
                relative_rms_displ_error_el4;
                relative_rms_displ_error_el5;
                relative_rms_displ_error_el6];
RMS_Vel_El=[relative_rms_veloc_error_el1;
                relative_rms_veloc_error_el2;
                relative_rms_veloc_error_el3;
                relative_rms_veloc_error_el4;
                relative_rms_veloc_error_el5;
                relative_rms_veloc_error_el6];
RMS_Displ_Nor=[relative_rms_displ_error_nor1;
                relative_rms_displ_error_nor2;
                relative_rms_displ_error_nor3;
                relative_rms_displ_error_nor4;
                relative_rms_displ_error_nor5;
                relative_rms_displ_error_nor6];

RMS_Vel_Nor=[relative_rms_veloc_error_nor1;
                relative_rms_veloc_error_nor2;
                relative_rms_veloc_error_nor3;
                relative_rms_veloc_error_nor4;
                relative_rms_veloc_error_nor5;
                relative_rms_veloc_error_nor6];
Methods = {'Piecewise Constant';
            'Piecewise Linear';
            'Newmark';
            'Rk4';
            'Wilson';
            'Central'};

mTable1 = table(RMS_Displ_El,RMS_Vel_El,RMS_Displ_Nor,RMS_Vel_Nor,'RowNames',Methods);

% Create table of rms values for harmonic excitation with different time
% steps
Piecewise_Constant = [relative_rms_displ_error1;relative_rms_veloc_error1];
Piecewise_Linear = [relative_rms_displ_error2;relative_rms_veloc_error2];
Newmark = [relative_rms_displ_error3;relative_rms_veloc_error3];
Rk4 = [relative_rms_displ_error4;relative_rms_veloc_error4];
Wilson = [relative_rms_displ_error5;relative_rms_veloc_error5];
Central = [relative_rms_displ_error6;relative_rms_veloc_error6];
RMS_values = {'RMS_Displ_0.001';
                'RMS_Displ_0.01';
                'RMS_Displ_0.02';
                'RMS_Displ_0.05';
                'RMS_Displ_0.1';
                'RMS_Displ_0.2';
                'RMS_Displ_0.5';
                'RMS_Displ_1';
                'RMS_Vel_0.001';
                'RMS_Vel_0.01';
                'RMS_Vel_0.02';
                'RMS_Vel_0.05';
                'RMS_Vel_0.1';
                'RMS_Vel_0.2';
                'RMS_Vel_0.5';
                'RMS_Vl_1'};
mTable2 = table(Piecewise_Constant,Piecewise_Linear,Newmark,Rk4,Wilson,Central,'RowNames',RMS_values);
