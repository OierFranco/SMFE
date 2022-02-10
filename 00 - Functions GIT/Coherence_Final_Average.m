function [Coherence_Final_mean] = Coherence_Final_Average(Entrada)
% Partiendo de la coherencia media de los 3 tipos de corte hechos en cada
% test, hay que calcula la media de la coherencia al igual que con las
% amplitudes 

[L,W]= size(Entrada);

if W == 3 % For W = 3, three measurements, 3D case
    
    for k = 1:3 
        Coherence_Final_mean.Coh_x_fx_mean(:,k) = (Entrada(1).Coh_x_fx(:,k) + Entrada(2).Coh_x_fx(:,k) + Entrada(3).Coh_x_fx(:,k))/W; % X, FX
        Coherence_Final_mean.Coh_y_fx_mean(:,k) = (Entrada(1).Coh_y_fx(:,k) + Entrada(2).Coh_y_fx(:,k) + Entrada(3).Coh_y_fx(:,k))/W; % Y, FX
        Coherence_Final_mean.Coh_z_fx_mean(:,k) = (Entrada(1).Coh_z_fx(:,k) + Entrada(2).Coh_z_fx(:,k) + Entrada(3).Coh_z_fx(:,k))/W; % Z, FX

        Coherence_Final_mean.Coh_x_fy_mean(:,k) = (Entrada(1).Coh_x_fy(:,k) + Entrada(2).Coh_x_fy(:,k) + Entrada(3).Coh_x_fy(:,k))/W; % X, FY
        Coherence_Final_mean.Coh_y_fy_mean(:,k) = (Entrada(1).Coh_y_fy(:,k) + Entrada(2).Coh_y_fy(:,k) + Entrada(3).Coh_y_fy(:,k))/W; % Y, FY
        Coherence_Final_mean.Coh_z_fy_mean(:,k) = (Entrada(1).Coh_z_fy(:,k) + Entrada(2).Coh_z_fy(:,k) + Entrada(3).Coh_z_fy(:,k))/W; % Z, FY

        Coherence_Final_mean.Coh_x_fz_mean(:,k) = (Entrada(1).Coh_x_fz(:,k) + Entrada(2).Coh_x_fz(:,k) + Entrada(3).Coh_x_fz(:,k))/W; % X, FZ
        Coherence_Final_mean.Coh_y_fz_mean(:,k) = (Entrada(1).Coh_y_fz(:,k) + Entrada(2).Coh_y_fz(:,k) + Entrada(3).Coh_y_fz(:,k))/W; % Y, FZ
        Coherence_Final_mean.Coh_z_fz_mean(:,k) = (Entrada(1).Coh_z_fz(:,k) + Entrada(2).Coh_z_fz(:,k) + Entrada(3).Coh_z_fz(:,k))/W; % Z, FZ
    end 
elseif W == 2 % W = 2, two measurements
    
    for k = 1:3 
        Coherence_Final_mean.Coh_x_fx_mean(:,k) = (Entrada(1).Coh_x_fx(:,k) + Entrada(2).Coh_x_fx(:,k))/W; % X, FX
        Coherence_Final_mean.Coh_y_fx_mean(:,k) = (Entrada(1).Coh_y_fx(:,k) + Entrada(2).Coh_y_fx(:,k))/W; % Y, FX
        Coherence_Final_mean.Coh_z_fx_mean(:,k) = (Entrada(1).Coh_z_fx(:,k) + Entrada(2).Coh_z_fx(:,k))/W; % Z, FX

        Coherence_Final_mean.Coh_x_fy_mean(:,k) = (Entrada(1).Coh_x_fy(:,k) + Entrada(2).Coh_x_fy(:,k))/W; % X, FY
        Coherence_Final_mean.Coh_y_fy_mean(:,k) = (Entrada(1).Coh_y_fy(:,k) + Entrada(2).Coh_y_fy(:,k))/W; % Y, FY
        Coherence_Final_mean.Coh_z_fy_mean(:,k) = (Entrada(1).Coh_z_fy(:,k) + Entrada(2).Coh_z_fy(:,k))/W; % Z, FY

        Coherence_Final_mean.Coh_x_fz_mean(:,k) = (Entrada(1).Coh_x_fz(:,k) + Entrada(2).Coh_x_fz(:,k))/W; % X, FZ
        Coherence_Final_mean.Coh_y_fz_mean(:,k) = (Entrada(1).Coh_y_fz(:,k) + Entrada(2).Coh_y_fz(:,k))/W; % Y, FZ
        Coherence_Final_mean.Coh_z_fz_mean(:,k) = (Entrada(1).Coh_z_fz(:,k) + Entrada(2).Coh_z_fz(:,k))/W; % Z, FZ
 
    end 
else
    display('Incorrect number of tests, at least 2 are required')
end 
    
    
% Coh_x_fx_mean(:,1) = (Entrada(1).Coh_x_fx(:,1) + Entrada(2).Coh_x_fx(:,1) + Entrada(3).Coh_x_fx(:,1))/3; 
% Coh_x_fx_mean(:,2) = (Entrada(1).Coh_x_fx(:,2) + Entrada(2).Coh_x_fx(:,2) + Entrada(3).Coh_x_fx(:,2))/3; 
% Coh_x_fx_mean(:,3) = (Entrada(1).Coh_x_fx(:,3) + Entrada(2).Coh_x_fx(:,3) + Entrada(3).Coh_x_fx(:,3))/3; 

% Coh_y_fx_mean_op_1 = (EntradaCoh(1).Coh_y_fx(:,1) + EntradaCoh(2).Coh_y_fx(:,1) + EntradaCoh(3).Coh_y_fx(:,1))/3; 
% Coh_y_fx_mean_op_2 = (EntradaCoh(1).Coh_y_fx(:,2) + EntradaCoh(2).Coh_y_fx(:,2) + EntradaCoh(3).Coh_y_fx(:,2))/3; 
% Coh_y_fx_mean_op_3 = (EntradaCoh(1).Coh_y_fx(:,3) + EntradaCoh(2).Coh_y_fx(:,3) + EntradaCoh(3).Coh_y_fx(:,3))/3; 
% 
% Coh_z_fx_mean_op_1 = (EntradaCoh(1).Coh_z_fx(:,1) + EntradaCoh(2).Coh_z_fx(:,1) + EntradaCoh(3).Coh_z_fx(:,1))/3; 
% Coh_z_fx_mean_op_2 = (EntradaCoh(1).Coh_z_fx(:,2) + EntradaCoh(2).Coh_z_fx(:,2) + EntradaCoh(3).Coh_z_fx(:,2))/3; 
% Coh_z_fx_mean_op_3 = (EntradaCoh(1).Coh_z_fx(:,3) + EntradaCoh(2).Coh_z_fx(:,3) + EntradaCoh(3).Coh_z_fx(:,3))/3; 

% Coh_x_fy_mean_op_1 = (EntradaCoh(1).Coh_x_fy(:,1) + EntradaCoh(2).Coh_x_fy(:,1) + EntradaCoh(3).Coh_x_fy(:,1))/3; 
% Coh_x_fy_mean_op_2 = (EntradaCoh(1).Coh_x_fy(:,2) + EntradaCoh(2).Coh_x_fy(:,2) + EntradaCoh(3).Coh_x_fy(:,2))/3; 
% Coh_x_fy_mean_op_3 = (EntradaCoh(1).Coh_x_fy(:,3) + EntradaCoh(2).Coh_x_fy(:,3) + EntradaCoh(3).Coh_x_fy(:,3))/3; 
% 
% Coh_y_fy_mean_op_1 = (EntradaCoh(1).Coh_y_fy(:,1) + EntradaCoh(2).Coh_y_fy(:,1) + EntradaCoh(3).Coh_y_fy(:,1))/3; 
% Coh_y_fy_mean_op_2 = (EntradaCoh(1).Coh_y_fy(:,2) + EntradaCoh(2).Coh_y_fy(:,2) + EntradaCoh(3).Coh_y_fy(:,2))/3; 
% Coh_y_fy_mean_op_3 = (EntradaCoh(1).Coh_y_fy(:,3) + EntradaCoh(2).Coh_y_fy(:,3) + EntradaCoh(3).Coh_y_fy(:,3))/3; 
% 
% Coh_z_fy_mean_op_1 = (EntradaCoh(1).Coh_z_fy(:,1) + EntradaCoh(2).Coh_z_fy(:,1) + EntradaCoh(3).Coh_z_fy(:,1))/3; 
% Coh_z_fy_mean_op_2 = (EntradaCoh(1).Coh_z_fy(:,2) + EntradaCoh(2).Coh_z_fy(:,2) + EntradaCoh(3).Coh_z_fy(:,2))/3; 
% Coh_z_fy_mean_op_3 = (EntradaCoh(1).Coh_z_fy(:,3) + EntradaCoh(2).Coh_z_fy(:,3) + EntradaCoh(3).Coh_z_fy(:,3))/3; 
% 
% Coh_x_fz_mean_op_1 = (EntradaCoh(1).Coh_x_fz(:,1) + EntradaCoh(2).Coh_x_fz(:,1) + EntradaCoh(3).Coh_x_fz(:,1))/3; 
% Coh_x_fz_mean_op_2 = (EntradaCoh(1).Coh_x_fz(:,2) + EntradaCoh(2).Coh_x_fz(:,2) + EntradaCoh(3).Coh_x_fz(:,2))/3; 
% Coh_x_fz_mean_op_3 = (EntradaCoh(1).Coh_x_fz(:,3) + EntradaCoh(2).Coh_x_fz(:,3) + EntradaCoh(3).Coh_x_fz(:,3))/3; 
% 
% Coh_y_fz_mean_op_1 = (EntradaCoh(1).Coh_y_fz(:,1) + EntradaCoh(2).Coh_y_fz(:,1) + EntradaCoh(3).Coh_y_fz(:,1))/3; 
% Coh_y_fz_mean_op_2 = (EntradaCoh(1).Coh_y_fz(:,2) + EntradaCoh(2).Coh_y_fz(:,2) + EntradaCoh(3).Coh_y_fz(:,2))/3; 
% Coh_y_fz_mean_op_3 = (EntradaCoh(1).Coh_y_fz(:,3) + EntradaCoh(2).Coh_y_fz(:,3) + EntradaCoh(3).Coh_y_fz(:,3))/3; 
% 
% Coh_z_fz_mean_op_1 = (EntradaCoh(1).Coh_z_fz(:,1) + EntradaCoh(2).Coh_z_fz(:,1) + EntradaCoh(3).Coh_z_fz(:,1))/3; 
% Coh_z_fz_mean_op_2 = (EntradaCoh(1).Coh_z_fz(:,2) + EntradaCoh(2).Coh_z_fz(:,2) + EntradaCoh(3).Coh_z_fz(:,2))/3; 
% Coh_z_fz_mean_op_3 = (EntradaCoh(1).Coh_z_fz(:,3) + EntradaCoh(2).Coh_z_fz(:,3) + EntradaCoh(3).Coh_z_fz(:,3))/3; 




% 
% 
% 
% [L,W]= size(Entrada);
% Signal_num = W/9;
% Coherence_Final_mean = zeros(L,9);
% if Signal_num == 2
%     for k = 1:L % Loop over frequencies
% 
%         for m = 1:9 % Number of tests
%             Coherence_Final_mean(k,m) = (Entrada(k,m)+Entrada(k,m+9))/2;
%         end 
% 
%     end 
% elseif  Signal_num == 3
%     
%     for k = 1:L % Loop over frequencies
% 
%         for m = 1:9 % Number of tests
%             Coherence_Final_mean(k,m) = (Entrada(k,m)+Entrada(k,m+9)+Entrada(k,m+18))/3;
%         end 
%     end 
% else
%         for k = 1:L % Loop over frequencies
% 
%             for m = 1:9 % Number of tests
%                 Coherence_Final_mean(k,m) = (Entrada(k,m)+Entrada(k,m+9)+Entrada(k,m+18)+Entrada(k,m+27))/4;
%             end 
%         end 
%     
% end 
% Coherence_Final_mean = Coherence;
end 