function [Coherence] = Get_Coherence (Sliced_data_op_1,Sliced_data_op_2,Sliced_data_op_3,Overlap,Delta_Freq_FRF_Hz,Fs_Hz,CheckPlot)
% Function to compute the direct and cross coherences

nfft                            = Fs_Hz/Delta_Freq_FRF_Hz;
% Response X axis excitation
% X, Fx
 in                             = [Sliced_data_op_1(:,4),Sliced_data_op_2(:,4),Sliced_data_op_3(:,4)]; % Measured X Forces N
 out                            = [Sliced_data_op_1(:,1),Sliced_data_op_2(:,1),Sliced_data_op_3(:,1)]; % Measured X acceleration m/s^2
 [Coherence.Coh_x_fx,FreqGraf]  = mscohere(in,out,hann(nfft),Overlap,nfft,Fs_Hz);
% Y, FX
 out                            = [Sliced_data_op_1(:,2),Sliced_data_op_2(:,2),Sliced_data_op_3(:,2)]; % Measured Y acceleration m/s^2
 [Coherence.Coh_y_fx,~]         = mscohere(in,out,hann(nfft),Overlap,nfft,Fs_Hz);
% Z, FX
 out                            = [Sliced_data_op_1(:,3),Sliced_data_op_2(:,3),Sliced_data_op_3(:,3)]; % Measured Z acceleration m/s^2
 [Coherence.Coh_z_fx, ~]        = mscohere(in,out,hann(nfft),Overlap,nfft,Fs_Hz);
% Response Y axis excitation
% X, Fy
 in                             = [Sliced_data_op_1(:,5),Sliced_data_op_2(:,5),Sliced_data_op_3(:,5)];
 out                            = [Sliced_data_op_1(:,1),Sliced_data_op_2(:,1),Sliced_data_op_3(:,1)];
 [Coherence.Coh_x_fy, ~]        = mscohere(in,out,hann(nfft),Overlap,nfft,Fs_Hz);
% Y, Fy
 out                            = [Sliced_data_op_1(:,2),Sliced_data_op_2(:,2),Sliced_data_op_3(:,2)];
 [Coherence.Coh_y_fy, ~]        = mscohere(in,out,hann(nfft),Overlap,nfft,Fs_Hz);
% Z, Fy
 out                            = [Sliced_data_op_1(:,3),Sliced_data_op_2(:,3),Sliced_data_op_3(:,3)];
 [Coherence.Coh_z_fy, ~]        = mscohere(in,out,hann(nfft),Overlap,nfft,Fs_Hz);
% Response Z axis excitation
% X, Fz
 in                             = [Sliced_data_op_1(:,6),Sliced_data_op_2(:,6),Sliced_data_op_3(:,6)];
 out                            = [Sliced_data_op_1(:,1),Sliced_data_op_2(:,1),Sliced_data_op_3(:,1)];
 [Coherence.Coh_x_fz, ~]        = mscohere(in,out,hann(nfft),Overlap,nfft,Fs_Hz);
% Y, Fz
 out                            = [Sliced_data_op_1(:,2),Sliced_data_op_2(:,2),Sliced_data_op_3(:,2)];
 [Coherence.Coh_y_fz, ~]        = mscohere(in,out,hann(nfft),Overlap,nfft,Fs_Hz);
% Z, Fz
 out                            = [Sliced_data_op_1(:,3),Sliced_data_op_2(:,3),Sliced_data_op_3(:,3)];
 [Coherence.Coh_z_fz, ~]        = mscohere(in,out,hann(nfft),Overlap,nfft,Fs_Hz); 
 
 if CheckPlot
     
     ini = 0;
     fin = 150;

     figure
     subplot(3,3,1)
     plot(FreqGraf,Coherence.Coh_x_fx(:,1),'DisplayName', 'Op1'); xlim([ini, fin]);title('x/fx');ylim([0 1.1]); grid on
     hold on
     plot(FreqGraf,Coherence.Coh_x_fx(:,2),'DisplayName', 'Op2'); xlim([ini, fin]);title('x/fx');ylim([0 1.1]); grid on
     plot(FreqGraf,Coherence.Coh_x_fx(:,3),'DisplayName', 'Op3'); xlim([ini, fin]);title('x/fx');ylim([0 1.1]); grid on
     subplot(3,3,2)
     plot(FreqGraf,Coherence.Coh_x_fy,'DisplayName', ''); xlim([ini, fin]);title('x/fy');ylim([0 1.1]); grid on
     subplot(3,3,3)
     plot(FreqGraf,Coherence.Coh_x_fz,'DisplayName', ''); xlim([ini, fin]);title('x/fz');ylim([0 1.1]); grid on
     subplot(3,3,4)
     plot(FreqGraf,Coherence.Coh_y_fx); xlim([ini, fin]);title('y/fx');ylim([0 1.1]); grid on
     subplot(3,3,5)
     plot(FreqGraf,Coherence.Coh_y_fy); xlim([ini, fin]);title('y/fy');ylim([0 1.1]); grid on
     subplot(3,3,6)
     plot(FreqGraf,Coherence.Coh_y_fz); xlim([ini, fin]);title('y/fz');ylim([0 1.1]); grid on
     subplot(3,3,7)
     plot(FreqGraf,Coherence.Coh_z_fx); xlim([ini, fin]);title('z/fx');ylim([0 1.1]); grid on
     subplot(3,3,8)
     plot(FreqGraf,Coherence.Coh_z_fy); xlim([ini, fin]);title('z/fy');ylim([0 1.1]); grid on
     subplot(3,3,9)
     plot(FreqGraf,Coherence.Coh_z_fz); xlim([ini, fin]);title('z/fz');ylim([0 1.1]); grid on

 end 
 
 
end 
 
 
 
 
 
 
 
 
 
 
 
 
 


