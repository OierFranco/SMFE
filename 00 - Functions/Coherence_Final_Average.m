%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Optimal cutting condition selection for high quality receptance         
% measurements by Sweep Milling Force Excitation
% 
% Authors: Oier Franco, Xavier Beudaert, Alex Iglesias, Zoltan Dombovari,
%          Kaan Erkorkmaz, Jokin Munoa. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [Coherence_Final_mean] = Coherence_Final_Average(Entrada)

[L,W]= size(Entrada);

if W == 3
    
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
    
end 