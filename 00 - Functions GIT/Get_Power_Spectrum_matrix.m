%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Optimal cutting condition selection for high quality receptance         
% measurements by Sweep Milling Force Excitation
% 
% Authors: Oier Franco, Xavier Beudaert, Alex Iglesias, Zoltan Dombovari,
%          Kaan Erkorkmaz, Jokin Munoa. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Spectrum_matrix] = Get_Power_Spectrum_matrix (Sliced_data,Overlap,Delta_Freq_FRF_Hz,Fs_Hz)
% Function to compute the cross and auto-power spectrum for each cutting
% test.
% Output:
%   Spectrum_matrix: [Gxfx Gyfx Gzfx Gfxfx Gfyfx Gfzfx Gxx Gyy Gzz Gfyfy Gfzfz Freq]

nfft = Fs_Hz/Delta_Freq_FRF_Hz;

% Acceleration signals
    % Cross Complex value   
    [Gxfx,FreqGraf]  = cpsd(Sliced_data(:,1),Sliced_data(:,4),hann(nfft),Overlap,nfft,Fs_Hz);
    [Gyfx,~]         = cpsd(Sliced_data(:,2),Sliced_data(:,4),hann(nfft),Overlap,nfft,Fs_Hz);
    [Gzfx,~]         = cpsd(Sliced_data(:,3),Sliced_data(:,4),hann(nfft),Overlap,nfft,Fs_Hz);
    [Gxfy,~]         = cpsd(Sliced_data(:,1),Sliced_data(:,5),hann(nfft),Overlap,nfft,Fs_Hz);
    [Gyfy,~]         = cpsd(Sliced_data(:,2),Sliced_data(:,5),hann(nfft),Overlap,nfft,Fs_Hz);
    [Gzfy,~]         = cpsd(Sliced_data(:,3),Sliced_data(:,5),hann(nfft),Overlap,nfft,Fs_Hz);
    [Gxfz,~]         = cpsd(Sliced_data(:,1),Sliced_data(:,6),hann(nfft),Overlap,nfft,Fs_Hz);
    [Gyfz,~]         = cpsd(Sliced_data(:,2),Sliced_data(:,6),hann(nfft),Overlap,nfft,Fs_Hz);
    [Gzfz,~]         = cpsd(Sliced_data(:,3),Sliced_data(:,6),hann(nfft),Overlap,nfft,Fs_Hz);

% Force signals
    % Complex value 
    [Gfxfx,~]        = cpsd(Sliced_data(:,4),Sliced_data(:,4),hann(nfft),Overlap,nfft,Fs_Hz);
    [Gfyfx,~]        = cpsd(Sliced_data(:,5),Sliced_data(:,4),hann(nfft),Overlap,nfft,Fs_Hz);
    [Gfzfx,~]        = cpsd(Sliced_data(:,6),Sliced_data(:,4),hann(nfft),Overlap,nfft,Fs_Hz);

% Direct power spectrums
% Complex value 
    [Gxx,~]        = cpsd(Sliced_data(:,1),Sliced_data(:,1),hann(nfft),Overlap,nfft,Fs_Hz);
    [Gyy,~]        = cpsd(Sliced_data(:,2),Sliced_data(:,2),hann(nfft),Overlap,nfft,Fs_Hz);
    [Gzz,~]        = cpsd(Sliced_data(:,3),Sliced_data(:,3),hann(nfft),Overlap,nfft,Fs_Hz);
% Complex value 
    [Gfyfy,~]      = cpsd(Sliced_data(:,5),Sliced_data(:,5),hann(nfft),Overlap,nfft,Fs_Hz);
    [Gfzfz,~]      = cpsd(Sliced_data(:,6),Sliced_data(:,6),hann(nfft),Overlap,nfft,Fs_Hz);


Spectrum_matrix = [Gxfx Gyfx Gzfx Gfxfx Gfyfx Gfzfx Gxx Gyy Gzz Gfyfy Gfzfz FreqGraf];

end 