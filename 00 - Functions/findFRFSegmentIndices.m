%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Optimal cutting condition selection for high quality receptance         
% measurements by Sweep Milling Force Excitation
% 
% Authors: Oier Franco, Xavier Beudaert, Alex Iglesias, Zoltan Dombovari,
%          Kaan Erkorkmaz, Jokin Munoa. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [start_indices, end_indices, seg_count] = findFRFSegmentIndices(signal, resp_upper_threshold, resp_lower_threshold, buffer_time, sampling_time, signal_duration) 
% This program allows to find the start and end index of each signal. Also,
% the number of sections are numbered.
% 
% Inputs:
%   signal: the signal to analize
%   resp_upper_threshold: upper value to trigger the signal
%   resp_lower_threshold: lower value to tirgger the signal
%   buffer_time: the amount of time to take into account before the trigger
%       value
%   sampling_time: sampling time of the signal
%   signal_duration: time duration of the signal
%
% Outputs:
%   start_index: start index value of the signal
%   end_index: end index value of the signal
%   seg_count: the amount of sections numbered
%%
% Preallocation of parameters:
    cur_index = 1;
    seg_count = 0;
    
% Loop over the signal to find the beginning and end of segments

    while cur_index < length(signal)
        % if the signal value is above or below the threshold, it means
        % that the signal is starting to generate
        if (signal(cur_index) > resp_upper_threshold || signal(cur_index) < resp_lower_threshold)
            % buffer size for region before chirp signal and after
            buffer_samples = round(buffer_time / sampling_time);
            % calculating starting index and ending index
            start_index = cur_index - buffer_samples;
            end_index = min(cur_index + round(signal_duration / sampling_time) + buffer_samples*2 , length(signal));
            if seg_count == 0
                start_indices = start_index;
                end_indices = end_index;
            else
                start_indices = [start_indices; start_index];
                end_indices = [end_indices; end_index];
            end
            % change index to the end of the segment
            cur_index = end_index + 1;
            % increment number of segments and look for next segment
            seg_count = seg_count + 1;
        else 
            cur_index = cur_index + 1;
        end
    end

end