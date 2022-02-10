%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Optimal cutting condition selection for high quality receptance         
% measurements by Sweep Milling Force Excitation
% 
% Authors: Oier Franco, Xavier Beudaert, Alex Iglesias, Zoltan Dombovari,
%          Kaan Erkorkmaz, Jokin Munoa. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Sliced_data] = Get_cutting_data_Dspace (Data,Test_time_duration_s,Fs_Hz,CheckPlot,Operation,Side_selection)

% This function allows to get the experimental cutting test for
% acceleration (channels 1 2 3), and cutting forces (channels 4 5 6).
% Once it is loaded, the data is sliced to get the actual cutting data.

% Required inputs:
%   filename: Name of the test to load. .mat type file
%   Test_time_duration_s: Cutting test duration to compute the final part
%       of the test
%   Fs_Hz: Sampling frequency (Hz)
%   CheckPlot: Boolean to plot the raw and sliced data 
%   signal:    Channel_4_Data; % Signal selection to compute the index

% Outputs: 
%   Sliced data matrix (:,7): X Y Z accel + X Y Z forces + Time

%% 2 - Slice the data to get the cutting test data.
% Caution, select a signal where the start of the cutting test is
% presented....
if strcmp(Operation,'Conc')  
    signal = Data(:,4);     
elseif strcmp(Operation,'Op')
    signal = Data(:,5);   
else 
    signal = Data(:,4);  
end 
display('Modify the trigger to 300N or 600N  @Get_cutting_data_Dspace function')
resp_upper_threshold    = 300;                      % Force trigger (N)
resp_lower_threshold    = -resp_upper_threshold;    % Lower threshold value
buffer_time             = 0.05*1;                   % Time right before the identified threshold (s)  
sampling_time           = 1/Fs_Hz;                  % Sampling time (s)
signal_duration         = Test_time_duration_s;     % Cutting test time duration

% Compute the data range
[start_indices, end_indices, seg_count] = findFRFSegmentIndices(signal, resp_upper_threshold, resp_lower_threshold, buffer_time, sampling_time, signal_duration);

% Axis orientation correction

if strcmp (Side_selection, 'Tool')  
    %% TOOL 
    % Construct the output data
    X_accel = +Data((start_indices(1):end_indices(1)),1);
    Y_accel = +Data((start_indices(1):end_indices(1)),2);
    Z_accel = -Data((start_indices(1):end_indices(1)),3);
    % display('X channel 5, Y channel 4'); Acción-reacción
    X_force = +Data((start_indices(1):end_indices(1)),5);
    Y_force = +Data((start_indices(1):end_indices(1)),4);
    Z_force = +Data((start_indices(1):end_indices(1)),6);
else 
    %% WP 
    % Construct the output data
    X_accel = -Data((start_indices(1):end_indices(1)),1);
    Y_accel = +Data((start_indices(1):end_indices(1)),2);
    Z_accel = +Data((start_indices(1):end_indices(1)),3);
    % display('X channel 5, Y channel 4'); Acción-reacción
    X_force = +Data((start_indices(1):end_indices(1)),5);
    Y_force = +Data((start_indices(1):end_indices(1)),4);
    Z_force = +Data((start_indices(1):end_indices(1)),6);
end 

% Generate the result:
Time_s_sliced  = Data((start_indices(1):end_indices(1)),7);
Sliced_data = [X_accel,Y_accel,Z_accel,X_force,Y_force,Z_force,Time_s_sliced];

if CheckPlot
    
    figure();hold on;box on;grid on;
    subplot(2,1,1);hold on;
    plot(Data(:,7),Data(:,1));
    plot(Data(:,7),Data(:,2));
    plot(Data(:,7),Data(:,3));
    plot(Sliced_data(:,7),Sliced_data(:,1),'--');
    plot(Sliced_data(:,7),Sliced_data(:,2),'--');
    plot(Sliced_data(:,7),Sliced_data(:,3),'--');
    ylabel('Amplitude (m/s^2)');
    subplot(2,1,2);hold on;
    plot(Data(:,7),Data(:,4));
    plot(Data(:,7),Data(:,5));
    plot(Data(:,7),Data(:,6));
    plot(Sliced_data(:,7),Sliced_data(:,4),'--');
    plot(Sliced_data(:,7),Sliced_data(:,5),'--');
    plot(Sliced_data(:,7),Sliced_data(:,6),'--');
    ylabel('Amplitude (N)')
    xlabel('Time (s)')
    
end 

end 