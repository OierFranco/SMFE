% Get SMFE

% Sirve para comprobar que solo cambiando el Ae, puede tener diferentes
% calidades de FRF. 

clc
clear all 
addpath('00 - Functions GIT');
addpath('01 - Data Git');

Delta_Freq_FRF_Hz    = 0.25;    % 0.25 Frequency discretization for power spectrum computations
Overlap              = 14000;   % Number of points between overlaps for power spectrum computation

% Diferentes señales que tenemos:
Signal_nmbr = 2;    % 1: 1138 Ae = 12 Esta es la buena de 12 mm
                    % 2: 1213 Ae = 72 Esta es la buena de 72 mm 
                    
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


%% Sensor noise:

if 0
    % Caracteristicas del ruido del accelerometro
    % Se genera 3 veces por lo del randn, para no tener exactmanete el
    % mismo.
    % X
    s_x = 0.1597;
    Signal_accel1_X = s_x*randn(length(Sliced_data_cen_1),1);
    Signal_accel2_X = s_x*randn(length(Sliced_data_cen_1),1);
    Signal_accel3_X = s_x*randn(length(Sliced_data_cen_1),1);
    % Y
    s_y = 0.1175;
    Signal_accel1_Y = s_y*randn(length(Sliced_data_cen_1),1);
    Signal_accel2_Y = s_y*randn(length(Sliced_data_cen_1),1);
    Signal_accel3_Y = s_y*randn(length(Sliced_data_cen_1),1); 
    % Z
    s_z = 0.0139;
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
    
end
% Vamos a sacar las temporales:
figure()
% Down-milling
subplot(2,3,1)
plot(Sliced_data_conc_1(:,7),Sliced_data_conc_1(:,1),'DisplayName','Accel. X'); % Accel X
hold on
plot(Sliced_data_conc_1(:,7),Sliced_data_conc_1(:,2),'DisplayName','Accel. Y'); % Accel Y
plot(Sliced_data_conc_1(:,7),Sliced_data_conc_1(:,3),'DisplayName','Accel. Z'); % Accel Z
title('Down-Milling')
subplot(2,3,4)
plot(Sliced_data_conc_1(:,7),Sliced_data_conc_1(:,4),'DisplayName','Force X'); % Force X
hold on
plot(Sliced_data_conc_1(:,7),Sliced_data_conc_1(:,5),'DisplayName','Force Y'); % Force Y
plot(Sliced_data_conc_1(:,7),Sliced_data_conc_1(:,6),'DisplayName','Force Z'); % Force Z
% Up-milling; 
subplot(2,3,2)
plot(Sliced_data_op_1(:,7),Sliced_data_op_1(:,1),'DisplayName','Accel. X'); % Accel X
hold on
plot(Sliced_data_op_1(:,7),Sliced_data_op_1(:,2),'DisplayName','Accel. Y'); % Accel Y
plot(Sliced_data_op_1(:,7),Sliced_data_op_1(:,3),'DisplayName','Accel. Z'); % Accel Z
title('Up-Milling')
subplot(2,3,5)
plot(Sliced_data_op_1(:,7),Sliced_data_op_1(:,4),'DisplayName','Force X'); % Force X
hold on
plot(Sliced_data_op_1(:,7),Sliced_data_op_1(:,5),'DisplayName','Force Y'); % Force Y
plot(Sliced_data_op_1(:,7),Sliced_data_op_1(:,6),'DisplayName','Force Z'); % Force Z
% Central-Milling
subplot(2,3,3)
plot(Sliced_data_cen_1(:,7),Sliced_data_cen_1(:,1),'DisplayName','Accel. X'); % Accel X
hold on
plot(Sliced_data_cen_1(:,7),Sliced_data_cen_1(:,2),'DisplayName','Accel. Y'); % Accel Y
plot(Sliced_data_cen_1(:,7),Sliced_data_cen_1(:,3),'DisplayName','Accel. Z'); % Accel Z
title('Central-Milling')
subplot(2,3,6)
plot(Sliced_data_cen_1(:,7),Sliced_data_cen_1(:,4),'DisplayName','Force X'); % Force X
hold on
plot(Sliced_data_cen_1(:,7),Sliced_data_cen_1(:,5),'DisplayName','Force Y'); % Force Y
plot(Sliced_data_cen_1(:,7),Sliced_data_cen_1(:,6),'DisplayName','Force Z'); % Force Z

%% To frequency


[Spectrum_matrix_1_conc]  = Get_Power_Spectrum_matrix (Sliced_data_conc_1,Overlap,Delta_Freq_FRF_Hz,Fs_Hz);
[Spectrum_matrix_1_op]    = Get_Power_Spectrum_matrix (Sliced_data_op_1,Overlap,Delta_Freq_FRF_Hz,Fs_Hz);
[Spectrum_matrix_1_cen]   = Get_Power_Spectrum_matrix (Sliced_data_cen_1,Overlap,Delta_Freq_FRF_Hz,Fs_Hz);

%% Get FRF

Spectrum_matrix_all.Test_1 = Spectrum_matrix_1_conc;
Spectrum_matrix_all.Test_2 = Spectrum_matrix_1_op;
Spectrum_matrix_all.Test_3 = Spectrum_matrix_1_cen;
FreqGraf                   = Spectrum_matrix_1_conc(:,12);

[FRF_matrix_1,Condition_matrix_1,Rank_matrix_1]= Get_FRF (Spectrum_matrix_all,FreqGraf);

% Get the mean
Enter = [FRF_matrix_1]; % This can be enlarged as Enter = [FRF_matrix_1,FRF_matrix_2,FRF_matrix_7];     
[FRF_mean_dis,FRF_max_dis,FRF_min_dis]  = FRF_Average_dis (Enter,FreqGraf,0);

[Coherence] = Get_Coherence (Sliced_data_conc_1,Sliced_data_op_1,Sliced_data_cen_1,Overlap,Delta_Freq_FRF_Hz,Fs_Hz,0);

%%

FRF_Plot (FRF_mean_dis,FRF_max_dis,FRF_min_dis,Coherence,FreqGraf);


return
%% Final plot
fin_f = 200; ini_f = 0;
Color = '';
figure(9)
subplot(4,2,1);hold on;box on; grid on
plot(FreqGraf',abs(FRF_mean_dis.FRFxx),Color,'Linewidth',2);xlim([ini_f fin_f])
title('XX');ylabel('Mag. (m/N)');xlabel('Freq. (Hz)')
subplot(4,2,2);hold on;box on; grid on
plot(FreqGraf',abs(FRF_mean_dis.FRFxy),Color,'Linewidth',2);xlim([ini_f fin_f])
title('XY');ylabel('Mag. (m/N)');xlabel('Freq. (Hz)')
subplot(4,2,3);hold on;box on; grid on
plot(FreqGraf',unwrap(angle((FRF_mean_dis.FRFxx)))*180/pi,Color,'Linewidth',2);xlim([ini_f fin_f])
subplot(4,2,4);hold on;box on; grid on
plot(FreqGraf',unwrap(angle(FRF_mean_dis.FRFxy))*180/pi,Color,'Linewidth',2);xlim([ini_f fin_f])
subplot(4,2,5);hold on;box on; grid on
plot(FreqGraf',abs(FRF_mean_dis.FRFyx),Color,'Linewidth',2);xlim([ini_f fin_f])
title('YX');ylabel('Mag. (m/N)');xlabel('Freq. (Hz)')
subplot(4,2,6);hold on;box on; grid on
plot(FreqGraf',abs(FRF_mean_dis.FRFyy),Color,'Linewidth',2);xlim([ini_f fin_f])
title('YY');ylabel('Mag. (m/N)');xlabel('Freq. (Hz)')
subplot(4,2,7);hold on;box on; grid on
plot(FreqGraf',unwrap(angle(FRF_mean_dis.FRFyx))*180/pi,Color,'Linewidth',2);xlim([ini_f fin_f])
subplot(4,2,8);hold on;box on; grid on
plot(FreqGraf',unwrap(angle(FRF_mean_dis.FRFyy))*180/pi,Color,'Linewidth',2);xlim([ini_f fin_f])
return





