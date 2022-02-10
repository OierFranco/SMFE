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
% - Measured time domain data
% Outputs:
% - Extracted FRF from time domain data
% - Coherence functions

clc
clear all
addpath('00 - Functions GIT');
addpath('02 - Data ap = 1mm Experimental');

Delta_Freq_FRF_Hz           = 0.25;                         % Frequency discretization for power spectrum computations
Overlap                     = 32000;                        % Number of points between overlaps for power spectrum computation
fundamental_sampling_time   = 0.0001;                       % Sampling time (s)
Fs_Hz                       = 1/fundamental_sampling_time;  % Sampling frequency (Hz)
Test_time_duration_s        = 67;                           % Cutting test time duration (s)

Side_selection              = 'Tool';  % Side selection for FRF computation, 'Tool' or 'WP'

%% 1 - Get time domain data

% Test operation # 1 out of 3: Down-milling
    % Cutting test#1
        filename = 'Down_Set_3_1_mm';
        CheckPlot = 1;
        [Data] = Get_dspace_data (filename,Side_selection); 
        [Sliced_data_conc_1] = Get_cutting_data_Dspace (Data,Test_time_duration_s,Fs_Hz,CheckPlot,'Conc',Side_selection);
    % Cutting test#2
        filename = 'Down_Set_4_1_mm';
        CheckPlot = 0;
        [Data] = Get_dspace_data (filename,Side_selection); 
        [Sliced_data_conc_2] = Get_cutting_data_Dspace (Data,Test_time_duration_s,Fs_Hz,CheckPlot,'Conc',Side_selection);
% *************************************************************************
% Test operation # 2 out of 3: Up-milling
    % Cutting test#1
        filename = 'Up_Set_3_1_mm';
        CheckPlot = 0;
        [Data] = Get_dspace_data (filename,Side_selection); 
        [Sliced_data_op_1] = Get_cutting_data_Dspace (Data,Test_time_duration_s,Fs_Hz,CheckPlot,'Op',Side_selection);
    % Cutting test#2
        filename = 'Up_Set_4_1_mm';
        CheckPlot = 0;
        [Data] = Get_dspace_data (filename,Side_selection); 
        [Sliced_data_op_2] = Get_cutting_data_Dspace (Data,Test_time_duration_s,Fs_Hz,CheckPlot,'Op',Side_selection);
% *************************************************************************
% Test operation # 3 out of 3: Central-milling
    % Cutting test#1
        filename = 'Central_Set_3_1_mm';
        CheckPlot = 0;
        [Data] = Get_dspace_data (filename,Side_selection); 
        [Sliced_data_full_1] = Get_cutting_data_Dspace (Data,Test_time_duration_s,Fs_Hz,CheckPlot,'Full',Side_selection);
    % Cutting test#2
        filename = 'Central_Set_4_1_mm';
        CheckPlot = 0;
        [Data] = Get_dspace_data (filename,Side_selection); 
        [Sliced_data_full_2] = Get_cutting_data_Dspace (Data,Test_time_duration_s,Fs_Hz,CheckPlot,'Full',Side_selection);

%% 2 - From time domain to frequency
% Cutting test #1
    [Spectrum_matrix_1_conc] = Get_Power_Spectrum_matrix (Sliced_data_conc_1,Overlap,Delta_Freq_FRF_Hz,Fs_Hz);
    [Spectrum_matrix_1_op]   = Get_Power_Spectrum_matrix (Sliced_data_op_1,Overlap,Delta_Freq_FRF_Hz,Fs_Hz);
    [Spectrum_matrix_1_full] = Get_Power_Spectrum_matrix (Sliced_data_full_1,Overlap,Delta_Freq_FRF_Hz,Fs_Hz);
% Cutting test #2:
    [Spectrum_matrix_2_conc] = Get_Power_Spectrum_matrix (Sliced_data_conc_2,Overlap,Delta_Freq_FRF_Hz,Fs_Hz);
    [Spectrum_matrix_2_op]   = Get_Power_Spectrum_matrix (Sliced_data_op_2,Overlap,Delta_Freq_FRF_Hz,Fs_Hz);
    [Spectrum_matrix_2_full] = Get_Power_Spectrum_matrix (Sliced_data_full_2,Overlap,Delta_Freq_FRF_Hz,Fs_Hz);
%% 3 - Get FRF and coherence
% Solver #1
    Spectrum_matrix_all.Test_1 = Spectrum_matrix_1_conc;
    Spectrum_matrix_all.Test_2 = Spectrum_matrix_1_op;
    Spectrum_matrix_all.Test_3 = Spectrum_matrix_1_full;
    FreqGraf                   = Spectrum_matrix_1_conc(:,12);
    [FRF_matrix_1,Condition_matrix_1,Rank_matrix_1]= Get_FRF (Spectrum_matrix_all,FreqGraf);  
% Solver #2
    Spectrum_matrix_all.Test_1 = Spectrum_matrix_2_conc;
    Spectrum_matrix_all.Test_2 = Spectrum_matrix_2_op;
    Spectrum_matrix_all.Test_3 = Spectrum_matrix_2_full;
    [FRF_matrix_2,Condition_matrix_2,Rank_matrix_2]= Get_FRF (Spectrum_matrix_all,FreqGraf); 
    
% Get the mean, max and min FRF
Avg_entry                               = [FRF_matrix_1,FRF_matrix_2]; % This can be enlarged as Enter = [FRF_matrix_1,FRF_matrix_2,FRF_matrix_7];  
CheckPlot                               = 0;
[FRF_mean_dis,FRF_max_dis,FRF_min_dis]  = FRF_Average_dis (Avg_entry,FreqGraf,CheckPlot);

% Coherence
[Coherence]  = Get_Coherence (Sliced_data_conc_1,Sliced_data_op_1,Sliced_data_full_1,Overlap,Delta_Freq_FRF_Hz,Fs_Hz,CheckPlot);
[Coherence2] = Get_Coherence (Sliced_data_conc_2,Sliced_data_op_2,Sliced_data_full_2,Overlap,Delta_Freq_FRF_Hz,Fs_Hz,CheckPlot);

Coh_entry = [Coherence, Coherence2];
[Coherence_Final_mean] = Coherence_Final_Average(Coh_entry);

%% 4 - Plot results

FRF_Plot (FRF_mean_dis,FRF_max_dis,FRF_min_dis,Coherence_Final_mean,FreqGraf);
