%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Optimal cutting condition selection for high quality receptance         
% measurements by Sweep Milling Force Excitation
% 
% Authors: Oier Franco, Xavier Beudaert, Alex Iglesias, Zoltan Dombovari,
%          Kaan Erkorkmaz, Jokin Munoa. 
% 
% Shared code for obtaining the results shown in Section 3.2 Simulation of
% the Sweep Milling Force Excitation.
%
% Inputs:
% - Paths of required functions
% - Simulated time domain data
% Outputs:
% - Extracted FRF from time domain data
% - Coherence functions
%
% This specific code is used as an example, by selecting the Signal_nmbr to
%  1 or 2, the effect of tool radial engagement on the extracted FRF can be
% observed.  

clc
clear all 
addpath('00 - Functions');
addpath('01 - Data Sim');

Delta_Freq_FRF_Hz    = 0.25;    % Frequency discretization for power spectrum computations
Overlap              = 14000;   % Number of points between overlaps for power spectrum computation

% Already computed time domain signal with different tool radial engagement 
Signal_nmbr = 1;    % 1: Ae = 12mm
                    % 2: Ae = 72mm 

%% 1 - Get time domain data

if Signal_nmbr == 1     % 1: 1138 Ae = 12
                           
    Sliced_data_op_1   = load('Test_up_1138');
    Sliced_data_op_1   = Sliced_data_op_1.Test_up;
    Sliced_data_conc_1 = load('Test_down_1138');
    Sliced_data_conc_1 = Sliced_data_conc_1.Test_down;
    Sliced_data_cen_1  = load('Test_central_1138');
    Sliced_data_cen_1  = Sliced_data_cen_1.Test_central;   
    
elseif Signal_nmbr == 2 % 2: 1213 Ae = 72 
    
    Sliced_data_op_1   = load('Test_up_1213');
    Sliced_data_op_1   = Sliced_data_op_1.Test_up;
    Sliced_data_conc_1 = load('Test_down_1213');
    Sliced_data_conc_1 = Sliced_data_conc_1.Test_down;
    Sliced_data_cen_1  = load('Test_central_1213');
    Sliced_data_cen_1  = Sliced_data_cen_1.Test_central;       

end 
    
Fs_Hz = 1/(Sliced_data_conc_1(2,7)-Sliced_data_conc_1(1,7));

%% 2 - Add sensor noise (optional)
% The accelerometer noise is generated and added to the previously obtained
% time domain data.

if 0
    % X
    s_x = 0.01597;
    Signal_accel1_X = s_x*randn(length(Sliced_data_cen_1),1);
    Signal_accel2_X = s_x*randn(length(Sliced_data_cen_1),1);
    Signal_accel3_X = s_x*randn(length(Sliced_data_cen_1),1);
    % Y
    s_y = 0.01175;
    Signal_accel1_Y = s_y*randn(length(Sliced_data_cen_1),1);
    Signal_accel2_Y = s_y*randn(length(Sliced_data_cen_1),1);
    Signal_accel3_Y = s_y*randn(length(Sliced_data_cen_1),1); 
    % Z
    s_z = 0.00139;
    Signal_accel1_Z = s_z*randn(length(Sliced_data_cen_1),1);
    Signal_accel2_Z = s_z*randn(length(Sliced_data_cen_1),1);
    Signal_accel3_Z = s_z*randn(length(Sliced_data_cen_1),1); 
          
    Sliced_data_conc_1(:,1) = Sliced_data_conc_1(:,1)+Signal_accel1_X(:,1);
    Sliced_data_conc_1(:,2) = Sliced_data_conc_1(:,2)+Signal_accel1_Y(:,1);
    Sliced_data_conc_1(:,3) = Sliced_data_conc_1(:,3)+Signal_accel1_Z(:,1);

    Sliced_data_op_1(:,1)   = Sliced_data_op_1(:,1)+Signal_accel2_X(:,1);
    Sliced_data_op_1(:,2)   = Sliced_data_op_1(:,2)+Signal_accel2_Y(:,1);
    Sliced_data_op_1(:,3)   = Sliced_data_op_1(:,3)+Signal_accel2_Z(:,1);

    Sliced_data_cen_1(:,1)  = Sliced_data_cen_1(:,1)+Signal_accel3_X(:,1);
    Sliced_data_cen_1(:,2)  = Sliced_data_cen_1(:,2)+Signal_accel3_Y(:,1);
    Sliced_data_cen_1(:,3)  = Sliced_data_cen_1(:,3)+Signal_accel3_Z(:,1);
    
    figure(8)
    subplot(3,2,1)
    plot(Sliced_data_conc_1(:,7),Signal_accel1_X); xlabel('Time (s)'); ylabel('Acceleration X (m/s^2)');
    xlim([Sliced_data_conc_1(1,7), Sliced_data_conc_1(end,7)]); ylim([-0.1, 0.1]); grid on
    subplot(3,2,2)
    histogram(Signal_accel1_X);xlabel('Acceleration X (m/s^2)'); ylabel('Number of samples'); xlim([-0.1, 0.1])
    subplot(3,2,3)
    plot(Sliced_data_conc_1(:,7),Signal_accel1_Y); xlabel('Time (s)'); ylabel('Acceleration Y (m/s^2)');
    xlim([Sliced_data_conc_1(1,7), Sliced_data_conc_1(end,7)]); ylim([-0.1, 0.1]); grid on
    subplot(3,2,4)
    histogram(Signal_accel1_Y);xlabel('Acceleration Y (m/s^2)'); ylabel('Number of samples'); xlim([-0.1, 0.1])
    subplot(3,2,5)
    plot(Sliced_data_conc_1(:,7),Signal_accel1_Z); xlabel('Time (s)'); ylabel('Acceleration Z (m/s^2)');
    xlim([Sliced_data_conc_1(1,7), Sliced_data_conc_1(end,7)]); ylim([-0.1, 0.1]); grid on
    subplot(3,2,6)
    histogram(Signal_accel1_Z);xlabel('Acceleration Z (m/s^2)'); ylabel('Number of samples'); xlim([-0.05, 0.05])
end
% Plot time domain data, Figure 9. 
    figure(9)
    % Down-milling
    subplot(3,2,1)
    plot(Sliced_data_conc_1(:,7),Sliced_data_conc_1(:,1),'','DisplayName','Accel. X');
    hold on
    plot(Sliced_data_conc_1(:,7),Sliced_data_conc_1(:,2),'','DisplayName','Accel. Y');
    plot(Sliced_data_conc_1(:,7),Sliced_data_conc_1(:,3),'','DisplayName','Accel. Z');
    title('Down-Milling')
    xlabel('Time (s)');xlim([0 65]);ylim([-10,10]);ylabel('Acceleration (m/s^2)')
    subplot(3,2,2)
    plot(Sliced_data_conc_1(:,7),Sliced_data_conc_1(:,4),'DisplayName','Force X');
    hold on
    plot(Sliced_data_conc_1(:,7),Sliced_data_conc_1(:,5),'DisplayName','Force Y');
    plot(Sliced_data_conc_1(:,7),Sliced_data_conc_1(:,6),'DisplayName','Force Z');
    title('Down-Milling')
    xlabel('Time (s)');xlim([0 65]);ylim([-1000,1000]);ylabel('Cutting forces (N)')
    % Up-milling; 
    subplot(3,2,3)
    plot(Sliced_data_op_1(:,7),Sliced_data_op_1(:,1),'DisplayName','Accel. X');
    hold on
    plot(Sliced_data_op_1(:,7),Sliced_data_op_1(:,2),'DisplayName','Accel. Y');
    plot(Sliced_data_op_1(:,7),Sliced_data_op_1(:,3),'DisplayName','Accel. Z');
    title('Up-Milling')
    xlabel('Time (s)');xlim([0 65]);ylim([-10,10]);ylabel('Acceleration (m/s^2)')
    subplot(3,2,4)
    plot(Sliced_data_op_1(:,7),Sliced_data_op_1(:,4),'DisplayName','Force X');
    hold on
    plot(Sliced_data_op_1(:,7),Sliced_data_op_1(:,5),'DisplayName','Force Y');
    plot(Sliced_data_op_1(:,7),Sliced_data_op_1(:,6),'DisplayName','Force Z');
    title('Up-Milling')
    xlabel('Time (s)');xlim([0 65]);ylim([-1000,1000]);ylabel('Cutting forces (N)')
    % Central-Milling
    subplot(3,2,5)
    plot(Sliced_data_cen_1(:,7),Sliced_data_cen_1(:,1),'DisplayName','Accel. X');
    hold on
    plot(Sliced_data_cen_1(:,7),Sliced_data_cen_1(:,2),'DisplayName','Accel. Y');
    plot(Sliced_data_cen_1(:,7),Sliced_data_cen_1(:,3),'DisplayName','Accel. Z');
    title('Central-Milling')
    xlabel('Time (s)');xlim([0 65]);ylim([-10,10]);ylabel('Acceleration (m/s^2)')
    subplot(3,2,6)
    plot(Sliced_data_cen_1(:,7),Sliced_data_cen_1(:,4),'DisplayName','Force X');
    hold on
    plot(Sliced_data_cen_1(:,7),Sliced_data_cen_1(:,5),'DisplayName','Force Y');
    plot(Sliced_data_cen_1(:,7),Sliced_data_cen_1(:,6),'DisplayName','Force Z');
    title('Central-Milling')
    xlabel('Time (s)');xlim([0 65]);ylim([-1000,1000]);ylabel('Cutting forces (N)')

%% 3 - From time domain to frequency

[Spectrum_matrix_1_conc]  = Get_Power_Spectrum_matrix (Sliced_data_conc_1,Overlap,Delta_Freq_FRF_Hz,Fs_Hz);
[Spectrum_matrix_1_op]    = Get_Power_Spectrum_matrix (Sliced_data_op_1,Overlap,Delta_Freq_FRF_Hz,Fs_Hz);
[Spectrum_matrix_1_cen]   = Get_Power_Spectrum_matrix (Sliced_data_cen_1,Overlap,Delta_Freq_FRF_Hz,Fs_Hz);

%% 4 - Get FRF and coherence

Spectrum_matrix_all.Test_1 = Spectrum_matrix_1_conc;
Spectrum_matrix_all.Test_2 = Spectrum_matrix_1_op;
Spectrum_matrix_all.Test_3 = Spectrum_matrix_1_cen;
FreqGraf                   = Spectrum_matrix_1_conc(:,12);

[FRF_matrix_1,Condition_matrix_1,Rank_matrix_1] = Get_FRF (Spectrum_matrix_all,FreqGraf);

% Get the mean, max and min FRF
Avg_entry = [FRF_matrix_1]; % This can be enlarged as Enter = [FRF_matrix_1,FRF_matrix_2,FRF_matrix_7];  
CheckPlot = 0;
[FRF_mean_dis,FRF_max_dis,FRF_min_dis]  = FRF_Average_dis (Avg_entry,FreqGraf,CheckPlot);

% Coherence
[Coherence]     = Get_Coherence (Sliced_data_conc_1,Sliced_data_op_1,Sliced_data_cen_1,Overlap,Delta_Freq_FRF_Hz,Fs_Hz,CheckPlot);
Coh_entry       = [Coherence,Coherence];
[Coherence_Final_mean] = Coherence_Final_Average(Coh_entry);

%% 5 - Plot results

FRF_Plot (FRF_mean_dis,FRF_max_dis,FRF_min_dis,Coherence_Final_mean,FreqGraf);
