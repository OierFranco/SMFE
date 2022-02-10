%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Optimal cutting condition selection for high quality receptance         
% measurements by Sweep Milling Force Excitation
% 
% Authors: Oier Franco, Xavier Beudaert, Alex Iglesias, Zoltan Dombovari,
%          Kaan Erkorkmaz, Jokin Munoa. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [] = FRF_Plot(FRF_mean_dis,FRF_max_dis,FRF_min_dis,Coherence,FreqGraf)
% Plots the magnitude and phase plots of the computed 9 FRFs  
    % New frequency vector for resampling
    freq_new = 20:0.25:80;
    FRF_mean_dis.FRFxx = interp1(FreqGraf,FRF_mean_dis.FRFxx,freq_new);
    FRF_mean_dis.FRFxy = interp1(FreqGraf,FRF_mean_dis.FRFxy,freq_new);
    FRF_mean_dis.FRFxz = interp1(FreqGraf,FRF_mean_dis.FRFxz,freq_new);
    FRF_mean_dis.FRFyx = interp1(FreqGraf,FRF_mean_dis.FRFyx,freq_new);
    FRF_mean_dis.FRFyy = interp1(FreqGraf,FRF_mean_dis.FRFyy,freq_new);
    FRF_mean_dis.FRFyz = interp1(FreqGraf,FRF_mean_dis.FRFyz,freq_new);
    FRF_mean_dis.FRFzx = interp1(FreqGraf,FRF_mean_dis.FRFzx,freq_new);
    FRF_mean_dis.FRFzy = interp1(FreqGraf,FRF_mean_dis.FRFzy,freq_new);
    FRF_mean_dis.FRFzz = interp1(FreqGraf,FRF_mean_dis.FRFzz,freq_new);

    Coherence.Coh_x_fx = interp1(FreqGraf,Coherence.Coh_x_fx_mean,freq_new);
    Coherence.Coh_y_fx = interp1(FreqGraf,Coherence.Coh_y_fx_mean,freq_new);
    Coherence.Coh_z_fx = interp1(FreqGraf,Coherence.Coh_z_fx_mean,freq_new);
    Coherence.Coh_x_fy = interp1(FreqGraf,Coherence.Coh_x_fy_mean,freq_new);
    Coherence.Coh_y_fy = interp1(FreqGraf,Coherence.Coh_y_fy_mean,freq_new);
    Coherence.Coh_z_fy = interp1(FreqGraf,Coherence.Coh_z_fy_mean,freq_new);
    Coherence.Coh_x_fz = interp1(FreqGraf,Coherence.Coh_x_fz_mean,freq_new);
    Coherence.Coh_y_fz = interp1(FreqGraf,Coherence.Coh_y_fz_mean,freq_new);
    Coherence.Coh_z_fz = interp1(FreqGraf,Coherence.Coh_z_fz_mean,freq_new);

    FreqGraf = freq_new;

    fin_f = 80;
    lim_y = 0.6e-6;
    Color = '';
    figure(100)
    subplot(3,3,1);hold on;box on; grid on
    plot(FreqGraf',abs(FRF_mean_dis.FRFxx),Color,'Linewidth',2);xlim([freq_new(1) freq_new(end)]);ylim([0 lim_y])
    title('XX');ylabel('Mag. (m/N)');xlabel('Freq. (Hz)')
    subplot(3,3,2);hold on;box on; grid on
    plot(FreqGraf',abs(FRF_mean_dis.FRFxy),Color,'Linewidth',2);xlim([freq_new(1) freq_new(end)]);ylim([0 lim_y])
    title('XY');ylabel('Mag. (m/N)');xlabel('Freq. (Hz)')
    subplot(3,3,3);hold on;box on; grid on
    plot(FreqGraf',abs(FRF_mean_dis.FRFxz),Color,'Linewidth',2);xlim([freq_new(1) freq_new(end)]);ylim([0 lim_y])
    title('XZ');ylabel('Mag. (m/N)');xlabel('Freq. (Hz)')
    subplot(3,3,4);hold on;box on; grid on
    plot(FreqGraf',abs(FRF_mean_dis.FRFyx),Color,'Linewidth',2);xlim([freq_new(1) freq_new(end)]);ylim([0 lim_y])
    title('YX');ylabel('Mag. (m/N)');xlabel('Freq. (Hz)')
    subplot(3,3,5);hold on;box on; grid on
    plot(FreqGraf',abs(FRF_mean_dis.FRFyy),Color,'Linewidth',2);xlim([freq_new(1) freq_new(end)]);ylim([0 lim_y])
    title('YY');ylabel('Mag. (m/N)');xlabel('Freq. (Hz)')
    subplot(3,3,6);hold on;box on; grid on
    plot(FreqGraf',abs(FRF_mean_dis.FRFyz),Color,'Linewidth',2);xlim([freq_new(1) freq_new(end)]);ylim([0 lim_y])
    title('YZ');ylabel('Mag. (m/N)');xlabel('Freq. (Hz)')
    subplot(3,3,7);hold on;box on; grid on
    plot(FreqGraf',abs(FRF_mean_dis.FRFzx),Color,'Linewidth',2);xlim([freq_new(1) freq_new(end)]);ylim([0 lim_y])
    title('ZX');ylabel('Mag. (m/N)');xlabel('Freq. (Hz)')
    subplot(3,3,8);hold on;box on; grid on
    plot(FreqGraf',abs(FRF_mean_dis.FRFzy),Color,'Linewidth',2);xlim([freq_new(1) freq_new(end)]);ylim([0 lim_y])
    title('ZY');ylabel('Mag. (m/N)');xlabel('Freq. (Hz)')
    subplot(3,3,9);hold on;box on; grid on
    plot(FreqGraf',abs(FRF_mean_dis.FRFzz),Color,'Linewidth',2);xlim([freq_new(1) freq_new(end)]);ylim([0 lim_y])
    title('ZZ');ylabel('Mag. (m/N)');xlabel('Freq. (Hz)')
    
    % Phases   
    figure()
    subplot(3,3,1);hold on;box on; grid on
    plot(FreqGraf',angle(FRF_mean_dis.FRFxx)*180/pi,Color,'Linewidth',2);xlim([freq_new(1) freq_new(end)])
    title('XX');ylabel('Phs. (deg)');xlabel('Freq. (Hz)')
    subplot(3,3,2);hold on;box on; grid on
    plot(FreqGraf',angle(FRF_mean_dis.FRFxy)*180/pi,Color,'Linewidth',2);xlim([freq_new(1) freq_new(end)])
    title('XY');ylabel('Phs. (deg)');xlabel('Freq. (Hz)')
    subplot(3,3,3);hold on;box on; grid on
    plot(FreqGraf',angle(FRF_mean_dis.FRFxz)*180/pi,Color,'Linewidth',2);xlim([freq_new(1) freq_new(end)])
    title('XZ');ylabel('Phs. (deg)');xlabel('Freq. (Hz)')
    subplot(3,3,4);hold on;box on; grid on
    plot(FreqGraf',angle(FRF_mean_dis.FRFyx)*180/pi,Color,'Linewidth',2);xlim([freq_new(1) freq_new(end)])
    title('YX');ylabel('Phs. (deg)');xlabel('Freq. (Hz)')
    subplot(3,3,5);hold on;box on; grid on
    plot(FreqGraf',angle(FRF_mean_dis.FRFyy)*180/pi,Color,'Linewidth',2);xlim([freq_new(1) freq_new(end)])
    title('YY');ylabel('Phs. (deg)');xlabel('Freq. (Hz)')
    subplot(3,3,6);hold on;box on; grid on
    plot(FreqGraf',angle(FRF_mean_dis.FRFyz)*180/pi,Color,'Linewidth',2);xlim([freq_new(1) freq_new(end)])
    title('YZ');ylabel('Phs. (deg)');xlabel('Freq. (Hz)')
    subplot(3,3,7);hold on;box on; grid on
    plot(FreqGraf',angle(FRF_mean_dis.FRFzx)*180/pi,Color,'Linewidth',2);xlim([freq_new(1) freq_new(end)])
    title('ZX');ylabel('Phs. (deg)');xlabel('Freq. (Hz)')
    subplot(3,3,8);hold on;box on; grid on
    plot(FreqGraf',angle(FRF_mean_dis.FRFzy)*180/pi,Color,'Linewidth',2);xlim([freq_new(1) freq_new(end)])
    title('ZY');ylabel('Phs. (deg)');xlabel('Freq. (Hz)')
    subplot(3,3,9);hold on;box on; grid on
    plot(FreqGraf',angle(FRF_mean_dis.FRFzz)*180/pi,Color,'Linewidth',2);xlim([freq_new(1) freq_new(end)])
    title('ZZ');ylabel('Phs. (deg)');xlabel('Freq. (Hz)')
 
    % Coherence
    figure(101)
    subplot(3,3,1);hold on;box on; grid on
    plot(FreqGraf',Coherence.Coh_x_fx,'Linewidth',2);xlim([freq_new(1) freq_new(end)]);ylim([0 1.3])
    title('XX');ylabel('Coh');xlabel('Freq. (Hz)')
    subplot(3,3,2);hold on;box on; grid on
    plot(FreqGraf',Coherence.Coh_x_fy,'Linewidth',2);xlim([freq_new(1) freq_new(end)]);ylim([0 1.3])
    title('XY');ylabel('Coh');xlabel('Freq. (Hz)')
    subplot(3,3,3);hold on;box on; grid on
    plot(FreqGraf',Coherence.Coh_x_fz,'Linewidth',2);xlim([freq_new(1) freq_new(end)]);ylim([0 1.3])
    title('XZ');ylabel('Coh');xlabel('Freq. (Hz)')
    subplot(3,3,4);hold on;box on; grid on
    plot(FreqGraf',Coherence.Coh_y_fx,'Linewidth',2);xlim([freq_new(1) freq_new(end)]);ylim([0 1.3])
    title('YX');ylabel('Coh');xlabel('Freq. (Hz)')
    subplot(3,3,5);hold on;box on; grid on
    plot(FreqGraf',Coherence.Coh_y_fy,'Linewidth',2);xlim([freq_new(1) freq_new(end)]);ylim([0 1.3])
    title('YY');ylabel('Coh');xlabel('Freq. (Hz)')
    subplot(3,3,6);hold on;box on; grid on
    plot(FreqGraf',Coherence.Coh_y_fz,'Linewidth',2);xlim([freq_new(1) freq_new(end)]);ylim([0 1.3])
    title('YZ');ylabel('Coh');xlabel('Freq. (Hz)')
    subplot(3,3,7);hold on;box on; grid on
    plot(FreqGraf',Coherence.Coh_z_fx,'Linewidth',2);xlim([freq_new(1) freq_new(end)]);ylim([0 1.3])
    title('ZX');ylabel('Coh');xlabel('Freq. (Hz)')
    subplot(3,3,8);hold on;box on; grid on
    plot(FreqGraf',Coherence.Coh_z_fy,'Linewidth',2);xlim([freq_new(1) freq_new(end)]);ylim([0 1.3])
    title('ZY');ylabel('Coh');xlabel('Freq. (Hz)')
    subplot(3,3,9);hold on;box on; grid on
    plot(FreqGraf',Coherence.Coh_z_fz,'Linewidth',2);xlim([freq_new(1) freq_new(end)]);ylim([0 1.3])
    title('ZZ');ylabel('Coh');xlabel('Freq. (Hz)')

end 