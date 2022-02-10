%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Optimal cutting condition selection for high quality receptance         
% measurements by Sweep Milling Force Excitation
% 
% Authors: Oier Franco, Xavier Beudaert, Alex Iglesias, Zoltan Dombovari,
%          Kaan Erkorkmaz, Jokin Munoa. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% After recording the time domain data, the .mat data must be loaded
function [Data] = Get_dspace_data (filename,Side_selection)

% Import the .mat file and get the data

    [Measurement]           = import_measurement (filename,1);

% Get the variables
% % TCP Accel
    Accel_TCP_X             = Measurement.Signals(6,:)';
    Accel_TCP_Y             = Measurement.Signals(7,:)';
    Accel_TCP_Z             = Measurement.Signals(8,:)';
% % Tool Accel  
    Accel_WP_X              = Measurement.Signals(9,:)';
    Accel_WP_Y              = Measurement.Signals(10,:)';
    Accel_WP_Z              = Measurement.Signals(11,:)';
% % Forces
    Kislter_X               = Measurement.Signals(2,:)';
    Kislter_Y               = Measurement.Signals(3,:)';
    Kislter_Z               = Measurement.Signals(4,:)';
%   
    Time                    = Measurement.Time';

    % After loading time-domain data, requested information is completed   
if strcmp (Side_selection, 'Tool')    
    Data = [Accel_TCP_X, Accel_TCP_Y,Accel_TCP_Z,Kislter_X,Kislter_Y,Kislter_Z,Time];      
else
    Data = [Accel_WP_X,Accel_WP_Y,Accel_WP_Z,Kislter_X,Kislter_Y,Kislter_Z,Time];
end

end 