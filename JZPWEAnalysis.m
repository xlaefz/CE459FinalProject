

% Jason Zheng
% CE 459 Project
% Piecewise_Constant_Excitation
clc; clear all; close all;
f = 1;
z = 0.04; % Damping ratio
m = 1;
w = 2*pi*f; % Natural frequency in rad/sec
x0 = 0; v0 = 0; % Initial conditions
k = m*w^2;

%import external files and given skeleton
load earthquakes.mat
mSSYLSIM_EL = ss([0 1;-w^2 -2*z*w],[0;-1],eye(2),[0;0]);
mYlSim_El = lsim( mSSYLSIM_EL, -elcentro_eq, elcentro_t,[x0;v0]);
d_lsim_el=mYlSim_El(:,1); v_lsim_el = mYlSim_El(:,2);
mYlsim_northridge = lsim( mSSYLSIM_EL, -northridge_eq, northridge_t,[x0;v0]);
mD_lsim_northridge=mYlsim_northridge(:,1); v_lsim_nor = mYlsim_northridge(:,2);

% Response to earthquakes using 6 methods
[d_el,v_el1] = zoh( w, z, elcentro_t, elcentro_eq, x0, v0 );
[d_nor1,v_nor1] = zoh( w, z, northridge_t, northridge_eq, x0, v0 );
relative_rms_displ_error_el_zoh = std(d_el-d_lsim_el)/std(d_lsim_el);
relative_rms_veloc_error_el_zoh = std(v_el1-v_lsim_el)/std(v_lsim_el);
relative_rms_displ_error_nor_zoh = std(d_nor1-mD_lsim_northridge)/std(mD_lsim_northridge);
relative_rms_veloc_error_nor_zoh = std(v_nor1-v_lsim_nor)/std(v_lsim_nor);

[d_el_centro_foh,v_el_centro_foh] = foh( w, z, elcentro_t, elcentro_eq, x0, v0 );
[d_northridge_foh,v_northridge_foh] = foh( w, z, northridge_t, northridge_eq, x0, v0 );
relative_rms_displ_error_el_centro_foh = std(d_el_centro_foh-d_lsim_el)/std(d_lsim_el);
relative_rms_veloc_error_el_centro_foh = std(v_el_centro_foh-v_lsim_el)/std(v_lsim_el);
relative_rms_displ_error_nor_foh = std(d_northridge_foh-mD_lsim_northridge)/std(mD_lsim_northridge);
relative_rms_veloc_error_nor_foh = std(v_northridge_foh-v_lsim_nor)/std(v_lsim_nor);

[d_el_newmark,v_el_newmark] = newmark( w, z, elcentro_t, elcentro_eq, x0, v0 );
[d_nor_newmark,v_nor_newmark] = newmark( w, z, northridge_t, northridge_eq, x0, v0 );
relative_rms_displ_error_el_newmark = std(d_el_newmark-d_lsim_el)/std(d_lsim_el);
relative_rms_veloc_error_el_newmark = std(v_el_newmark-v_lsim_el)/std(v_lsim_el);
relative_rms_displ_error_nor_newmark = std(d_nor_newmark-mD_lsim_northridge)/std(mD_lsim_northridge);
relative_rms_veloc_error_nor_newmark = std(v_nor_newmark-v_lsim_nor)/std(v_lsim_nor);

[d_el_rk4,v_el_rk4] = rk4( w, z, elcentro_t, elcentro_eq, x0, v0 );
[d_nor_rk4,v_nor_rk4] = rk4( w, z, northridge_t, northridge_eq, x0, v0 );
relative_rms_displ_error_el_rk4 = std(d_el_rk4-d_lsim_el)/std(d_lsim_el);
relative_rms_veloc_error_el_rk4 = std(v_el_rk4-v_lsim_el)/std(v_lsim_el);
relative_rms_displ_error_nor_rk4 = std(d_nor_rk4-mD_lsim_northridge)/std(mD_lsim_northridge);
relative_rms_veloc_error_nor_rk4 = std(v_nor_rk4-v_lsim_nor)/std(v_lsim_nor);

[d_el_wilson,v_el_wilson] = wilson( w, z, elcentro_t, elcentro_eq, x0, v0 );
[d_nor_wilson,v_nor_wilson] = wilson( w, z, northridge_t, northridge_eq, x0, v0 );
relative_rms_displ_error_el_wilson = std(d_el_wilson-d_lsim_el)/std(d_lsim_el);
relative_rms_veloc_error_el_wilson = std(v_el_wilson-v_lsim_el)/std(v_lsim_el);
relative_rms_displ_error_nor_wilson = std(d_nor_wilson-mD_lsim_northridge)/std(mD_lsim_northridge);
relative_rms_veloc_error_nor_wilson = std(v_nor_wilson-v_lsim_nor)/std(v_lsim_nor);

[d_el_central,v_el_central] = central( w, z, elcentro_t, elcentro_eq, x0, v0 );
[d_nor_central,v_nor_central] = central( w, z, northridge_t, northridge_eq, x0, v0 );
relative_rms_displ_error_el_central = std(d_el_central-d_lsim_el)/std(d_lsim_el);
relative_rms_veloc_error_el_central = std(v_el_central-v_lsim_el)/std(v_lsim_el);
relative_rms_displ_error_nor_central = std(d_nor_central-mD_lsim_northridge)/std(mD_lsim_northridge);
relative_rms_veloc_error_nor_central = std(v_nor_central-v_lsim_nor)/std(v_lsim_nor);

% Response to harmonic excitation
t_h = 0:0.01:8*pi;
f_h = sin(t_h);
ylsim_h = lsim( ss([0 1;-w^2 -2*z*w],[0;-1],eye(2),[0;0]), -f_h, t_h, [x0;v0]);
d_lsim_h=ylsim_h(:,1); v_lsim_h=ylsim_h(:,2);
[d_h_zoh,v_h_zoh] = zoh( w, z, t_h, f_h, x0, v0 );
relative_rms_displ_error_h1 = std(d_h_zoh-d_lsim_h)/std(d_lsim_h);

[d_h_foh,v_h_foh] = foh( w, z, t_h, f_h, x0, v0 );
relative_rms_displ_error_h2 = std(d_h_foh-d_lsim_h)/std(d_lsim_h);

[d_h_newmark,v_h_newmark] = newmark( w, z, t_h, f_h, x0, v0 );
relative_rms_displ_error_h3 = std(d_h_newmark-d_lsim_h)/std(d_lsim_h);

[d_h_rk4,v_h_rk4] = rk4( w, z, t_h, f_h, x0, v0 );
relative_rms_displ_error_h4 = std(d_h_rk4-d_lsim_h)/std(d_lsim_h);

[d_h_wilson,v_h_wilson] = wilson( w, z, t_h, f_h, x0, v0 );
relative_rms_displ_error_h5 = std(d_h_wilson-d_lsim_h)/std(d_lsim_h);

[d_h_central,v_h_central] = central( w, z, t_h, f_h, x0, v0 );
relative_rms_displ_error_h6 = std(d_h_central.'-d_lsim_h)/std(d_lsim_h);

% Plots of response to Elcentro Eq
%for displacement and velocity
mFigure1Plot = PlotFigure1(elcentro_t, d_lsim_el, d_el, d_el_centro_foh, d_el_newmark, d_el_rk4,d_el_wilson,d_el_central);
mFigure2Plot = PlotFigure2(elcentro_t, v_lsim_el, v_el1, v_el_centro_foh, v_el_newmark, v_el_rk4, v_el_wilson, v_el_central);

% Plots for response to Northridge Eq
%for displacement and velocity
mFigure3Plot = PlotNorthridgeRes(northridge_t, mD_lsim_northridge, d_nor1, d_northridge_foh, d_nor_newmark, d_nor_rk4, d_nor_wilson, d_nor_central);
mFigure4Plot = PlotNorthRidgeVelRes(northridge_t, v_lsim_nor, v_nor1, v_northridge_foh, v_nor_newmark, v_nor_rk4, v_nor_wilson, v_nor_central);

% Harmonic Excitation Plots
mHarmonicResponseFig = PlotHarmonicExcitationPlots(t_h, d_lsim_h, d_h_zoh, d_h_foh, d_h_newmark, d_h_rk4, d_h_wilson, d_h_central);
mHarmonicVelResponseFig = PlotVelHarmonicExcitationPlots(t_h, v_lsim_h, v_h_zoh, v_h_foh, v_h_newmark, v_h_rk4, v_h_wilson, v_h_central);

%zoh,foh,newmark,rk4,wilson,central
% Accuracy and stability test
%initializing everything to 0 
dt = [0.001, 0.01, 0.02, 0.05, 0.1, 0.2, 0.5, 1];
mLengthOfDT = length(dt);
t1 = 30/.001+1;
mZerosVecWithT1 = zeros(mLengthOfDT,t1);
mZerosVecWith1Col = zeros(mLengthOfDT, 1);
d_lsim_h1 = mZerosVecWithT1;
v_lsim_h1 = mZerosVecWithT1;
d_zoh = mZerosVecWithT1;
v_zoh = mZerosVecWithT1;
d_foh = mZerosVecWithT1;
v_foh = mZerosVecWithT1;
d_newmark = mZerosVecWithT1;
v_newmark = mZerosVecWithT1;
d_rk4 = mZerosVecWithT1;
v_rk4 = mZerosVecWithT1;
d_wilson = mZerosVecWithT1;
v_wilson = mZerosVecWithT1;
d_central = mZerosVecWithT1;
v_central = mZerosVecWithT1;
relative_rms_displ_error_zoh = mZerosVecWith1Col;
relative_rms_displ_error_foh = mZerosVecWith1Col;
relative_rms_displ_error_newmark = mZerosVecWith1Col;
relative_rms_displ_error_rk4 = mZerosVecWith1Col;
relative_rms_displ_error_wilson = mZerosVecWith1Col;
relative_rms_displ_error_central = mZerosVecWith1Col;
relative_rms_veloc_error_zoh = mZerosVecWith1Col;
relative_rms_veloc_error_foh = mZerosVecWith1Col;
relative_rms_veloc_error_newmark = mZerosVecWith1Col;
relative_rms_veloc_error_rk4 = mZerosVecWith1Col;
relative_rms_veloc_error_wilson = mZerosVecWith1Col;
relative_rms_veloc_error_central = mZerosVecWith1Col;
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
    [d_zoh(i,1:length(t)),v_zoh(i,1:length(t))] = zoh( w, z, t, f, x0, v0 );
    relative_rms_displ_error_zoh(i,1) = std(d_zoh(i,1:length(t))-x)/std(x);
    relative_rms_veloc_error_zoh(i,1) = std(v_zoh(i,1:length(t))-v)/std(v);
    [d_foh(i,1:length(t)),v_foh(i,1:length(t))] = foh( w, z, t, f, x0, v0 );
    relative_rms_displ_error_foh(i,1) = std(d_foh(i,1:length(t))-x)/std(x);
    relative_rms_veloc_error_foh(i,1) = std(v_foh(i,1:length(t))-v)/std(v);
    [d_newmark(i,1:length(t)),v_newmark(i,1:length(t))] = newmark( w, z, t, f, x0, v0 );
    relative_rms_displ_error_newmark(i,1) = std(d_newmark(i,1:length(t))-x)/std(x);
    relative_rms_veloc_error_newmark(i,1) = std(v_newmark(i,1:length(t))-v)/std(v);
    [d_rk4(i,1:length(t)),v_rk4(i,1:length(t))] = rk4( w, z, t, f, x0, v0 );
    relative_rms_displ_error_rk4(i,1) = std(d_rk4(i,1:length(t))-x)/std(x);
    relative_rms_veloc_error_rk4(i,1) = std(v_rk4(i,1:length(t))-v)/std(v);
    [d_wilson(i,1:length(t)),v_wilson(i,1:length(t))] = wilson( w, z, t, f, x0, v0 );
    relative_rms_displ_error_wilson(i,1) = std(d_wilson(i,1:length(t))-x)/std(x);
    relative_rms_veloc_error_wilson(i,1) = std(v_wilson(i,1:length(t))-v)/std(v);
    [d_central(i,1:length(t)),v_central(i,1:length(t))] = central( w, z, t, f, x0, v0 );
    relative_rms_displ_error_central(i,1) = std(d_central(i,1:length(t))-x)/std(x);
    relative_rms_veloc_error_central(i,1) = std(v_central(i,1:length(t))-v)/std(v);
end

% Create table of rms values for earthquakes
RMS_Displ_El=[relative_rms_displ_error_el_zoh;
                relative_rms_displ_error_el_centro_foh;
                relative_rms_displ_error_el_newmark;
                relative_rms_displ_error_el_rk4;
                relative_rms_displ_error_el_wilson;
                relative_rms_displ_error_el_central];
RMS_Vel_El=[relative_rms_veloc_error_el_zoh;
                relative_rms_veloc_error_el_centro_foh;
                relative_rms_veloc_error_el_newmark;
                relative_rms_veloc_error_el_rk4;
                relative_rms_veloc_error_el_wilson;
                relative_rms_veloc_error_el_central];
RMS_Displ_Nor=[relative_rms_displ_error_nor_zoh;
                relative_rms_displ_error_nor_foh;
                relative_rms_displ_error_nor_newmark;
                relative_rms_displ_error_nor_rk4;
                relative_rms_displ_error_nor_wilson;
                relative_rms_displ_error_nor_central];

RMS_Vel_Nor=[relative_rms_veloc_error_nor_zoh;
                relative_rms_veloc_error_nor_foh;
                relative_rms_veloc_error_nor_newmark;
                relative_rms_veloc_error_nor_rk4;
                relative_rms_veloc_error_nor_wilson;
                relative_rms_veloc_error_nor_central];
            
fileid = fopen('Relative_RMS_Disp_Veloc_6_Methods.txt','w');

for i = 1:6
   fprintf(fileid, '%f %f %f %f \n', RMS_Displ_El(i), RMS_Vel_El(i), RMS_Displ_Nor(i), RMS_Vel_Nor(i)); 
end
fclose(fileid);
            
% Create table of rms values for harmonic excitation with different time
% steps
Piecewise_Constant = [relative_rms_displ_error_zoh;relative_rms_veloc_error_zoh];
Piecewise_Linear = [relative_rms_displ_error_foh;relative_rms_veloc_error_foh];
Newmark = [relative_rms_displ_error_newmark;relative_rms_veloc_error_newmark];
Rk4 = [relative_rms_displ_error_rk4;relative_rms_veloc_error_rk4];
Wilson = [relative_rms_displ_error_wilson;relative_rms_veloc_error_wilson];
Central = [relative_rms_displ_error_central;relative_rms_veloc_error_central];
data = {'RMS_Displ_0.001';
        'RMS_Displ_0.01';
        'RMS_Displ_0.02';
        'RMS_Displ_0.05';
        'RMS_Displ_0.10';
        'RMS_Displ_0.20';
        'RMS_Displ_0.50';
        'RMS_Displ_1.00'
         'RMS_Vel_0.001';
         'RMS_Vel_0.01';
         'RMS_Vel_0.02';
         'RMS_Vel_0.05';
         'RMS_Vel_0.1';
         'RMS_Vel_0.2';
         'RMS_Vel_0.5';
         'RMS_Vl_1'
        };
            
mHarmonicFileId = fopen('Harmonic.txt','w');
m = size(Piecewise_Constant);
for i = 1:m
   fprintf(mHarmonicFileId, ' %f %f %f %f %f %f \n', Piecewise_Constant(i), Piecewise_Linear(i), Newmark(i), Rk4(i), Wilson(i), Central(i)); 
end
fclose(mHarmonicFileId);