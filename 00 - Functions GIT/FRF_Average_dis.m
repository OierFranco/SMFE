%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Optimal cutting condition selection for high quality receptance         
% measurements by Sweep Milling Force Excitation
% 
% Authors: Oier Franco, Xavier Beudaert, Alex Iglesias, Zoltan Dombovari,
%          Kaan Erkorkmaz, Jokin Munoa. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [FRF_mean,FRF_max,FRF_min] = FRF_Average_dis(Entrada,FreqGraf,CheckPlot)
% Compute frequency domain averaged value
 FreqGraf = FreqGraf';   
    for m = 1: numel(Entrada)
        
        FRFxx_temp(m,:) = Entrada(m).FRFxx./(2*1i.*pi*FreqGraf)./(2*1i.*pi*FreqGraf);
        FRFxy_temp(m,:) = Entrada(m).FRFxy./(2*1i.*pi*FreqGraf)./(2*1i.*pi*FreqGraf);
        FRFxz_temp(m,:) = Entrada(m).FRFxz./(2*1i.*pi*FreqGraf)./(2*1i.*pi*FreqGraf);
        FRFyx_temp(m,:) = Entrada(m).FRFyx./(2*1i.*pi*FreqGraf)./(2*1i.*pi*FreqGraf);
        FRFyy_temp(m,:) = Entrada(m).FRFyy./(2*1i.*pi*FreqGraf)./(2*1i.*pi*FreqGraf);
        FRFyz_temp(m,:) = Entrada(m).FRFyz./(2*1i.*pi*FreqGraf)./(2*1i.*pi*FreqGraf);
        FRFzx_temp(m,:) = Entrada(m).FRFzx./(2*1i.*pi*FreqGraf)./(2*1i.*pi*FreqGraf);
        FRFzy_temp(m,:) = Entrada(m).FRFzy./(2*1i.*pi*FreqGraf)./(2*1i.*pi*FreqGraf);
        FRFzz_temp(m,:) = Entrada(m).FRFzz./(2*1i.*pi*FreqGraf)./(2*1i.*pi*FreqGraf);
        
    end
     if CheckPlot
            
            figure(1)
            % X
            ax(1)=subplot(6,3,1);hold on;grid on;box on;
            plot(FreqGraf,abs(FRFxx_temp),'--');hold on;
            title('FRF XX')
            ax(2)=subplot(6,3,4);hold on;grid on;box on;
            plot(FreqGraf,angle(FRFxx_temp)*180/pi,'--');hold on;
            ax(3)=subplot(6,3,2);hold on;grid on;box on;
            plot(FreqGraf,abs(FRFxy_temp),'--');hold on;
            title('FRF XY')
            ax(4)=subplot(6,3,5);hold on;grid on;box on;
            plot(FreqGraf,angle(FRFxy_temp)*180/pi,'--');hold on;
            ax(5)=subplot(6,3,3);hold on;grid on;box on;
            plot(FreqGraf,abs(FRFxz_temp),'--');hold on;
            title('FRF XZ')
            ax(6)=subplot(6,3,6);hold on;grid on;box on;
            plot(FreqGraf,angle(FRFxz_temp)*180/pi,'--');hold on;
            % Y     
            ax(7)=subplot(6,3,7);hold on;grid on;box on;
            plot(FreqGraf,abs(FRFyx_temp),'--');hold on;
            title('FRF YX')
            ax(8)=subplot(6,3,10);hold on;grid on;box on;
            plot(FreqGraf,angle(FRFyx_temp)*180/pi,'--');hold on;
            ax(9)=subplot(6,3,8);hold on;grid on;box on;
            plot(FreqGraf,abs(FRFyy_temp),'--');hold on;
            title('FRF YY')
            ax(10)=subplot(6,3,11);hold on;grid on;box on;
            plot(FreqGraf,angle(FRFyy_temp)*180/pi,'--');hold on;
            ax(11)=subplot(6,3,9);hold on;grid on;box on;
            plot(FreqGraf,abs(FRFyz_temp),'--');hold on;
            title('FRF YZ')
            ax(12)=subplot(6,3,12);hold on;grid on;box on;
            plot(FreqGraf,angle(FRFyz_temp)*180/pi,'--');hold on;
            % Z     
            ax(13)=subplot(6,3,13);hold on;grid on;box on;
            plot(FreqGraf,abs(FRFzx_temp),'--');hold on;
            title('FRF ZX')
            ax(14)=subplot(6,3,16);hold on;grid on;box on;
            plot(FreqGraf,angle(FRFzx_temp)*180/pi,'--');hold on;
            ax(15)=subplot(6,3,14);hold on;grid on;box on;
            plot(FreqGraf,abs(FRFzy_temp),'--');hold on;
            title('FRF ZY')
            ax(16)=subplot(6,3,17);hold on;grid on;box on;
            plot(FreqGraf,angle(FRFzy_temp)*180/pi,'--');hold on;
            ax(17)=subplot(6,3,15);hold on;grid on;box on;
            plot(FreqGraf,abs(FRFzz_temp),'--');hold on;
            title('FRF ZZ')
            ax(18)=subplot(6,3,18);hold on;grid on;box on;
            plot(FreqGraf,angle(FRFzz_temp)*180/pi,'--');hold on;
            linkaxes(ax, 'x')
            xlim([10,200])      
     end 
    % Frequency iteration to get mean value    
    for l = 1:length(FRFxx_temp)
        % Mean computation
        FRFxx_mean(1,l) =  mean(FRFxx_temp(:,l));
        FRFxy_mean(1,l) =  mean(FRFxy_temp(:,l));
        FRFxz_mean(1,l) =  mean(FRFxz_temp(:,l));
        FRFyx_mean(1,l) =  mean(FRFyx_temp(:,l));
        FRFyy_mean(1,l) =  mean(FRFyy_temp(:,l));
        FRFyz_mean(1,l) =  mean(FRFyz_temp(:,l));
        FRFzx_mean(1,l) =  mean(FRFzx_temp(:,l));
        FRFzy_mean(1,l) =  mean(FRFzy_temp(:,l));
        FRFzz_mean(1,l) =  mean(FRFzz_temp(:,l));
        % Max and Min for confidence interval computation
        % Max
        FRFxx_max(1,l) =  max(FRFxx_temp(:,l));
        FRFxy_max(1,l) =  max(FRFxy_temp(:,l));
        FRFxz_max(1,l) =  max(FRFxz_temp(:,l));
        FRFyx_max(1,l) =  max(FRFyx_temp(:,l));
        FRFyy_max(1,l) =  max(FRFyy_temp(:,l));
        FRFyz_max(1,l) =  max(FRFyz_temp(:,l));
        FRFzx_max(1,l) =  max(FRFzx_temp(:,l));
        FRFzy_max(1,l) =  max(FRFzy_temp(:,l));
        FRFzz_max(1,l) =  max(FRFzz_temp(:,l));
        % Min
        FRFxx_min(1,l) =  min(FRFxx_temp(:,l));
        FRFxy_min(1,l) =  min(FRFxy_temp(:,l));
        FRFxz_min(1,l) =  min(FRFxz_temp(:,l));
        FRFyx_min(1,l) =  min(FRFyx_temp(:,l));
        FRFyy_min(1,l) =  min(FRFyy_temp(:,l));
        FRFyz_min(1,l) =  min(FRFyz_temp(:,l));
        FRFzx_min(1,l) =  min(FRFzx_temp(:,l));
        FRFzy_min(1,l) =  min(FRFzy_temp(:,l));
        FRFzz_min(1,l) =  min(FRFzz_temp(:,l));
        
    end
    
    % Mean values
    FRF_mean.FRFxx = FRFxx_mean; FRF_mean.FRFxy = FRFxy_mean; FRF_mean.FRFxz = FRFxz_mean;
    FRF_mean.FRFyx = FRFyx_mean; FRF_mean.FRFyy = FRFyy_mean; FRF_mean.FRFyz = FRFyz_mean;
    FRF_mean.FRFzx = FRFzx_mean; FRF_mean.FRFzy = FRFzy_mean; FRF_mean.FRFzz = FRFzz_mean;
    % Max values
    FRF_max.FRFxx = FRFxx_max;   FRF_max.FRFxy = FRFxy_max;   FRF_max.FRFxz = FRFxz_max;
    FRF_max.FRFyx = FRFyx_max;   FRF_max.FRFyy = FRFyy_max;   FRF_max.FRFyz = FRFyz_max;
    FRF_max.FRFzx = FRFzx_max;   FRF_max.FRFzy = FRFzy_max;   FRF_max.FRFzz = FRFzz_max;
    % Min values
    FRF_min.FRFxx = FRFxx_min;   FRF_min.FRFxy = FRFxy_min;   FRF_min.FRFxz = FRFxz_min;
    FRF_min.FRFyx = FRFyx_min;   FRF_min.FRFyy = FRFyy_min;   FRF_min.FRFyz = FRFyz_min;
    FRF_min.FRFzx = FRFzx_min;   FRF_min.FRFzy = FRFzy_min;   FRF_min.FRFzz = FRFzz_min;

    if CheckPlot
            
            figure(1)
            % X
            ax(1)=subplot(6,3,1);hold on;grid on;box on;
            plot(FreqGraf,abs(FRF_mean.FRFxx),'-')
            ax(2)=subplot(6,3,4);hold on;grid on;box on;
            plot(FreqGraf,angle(FRF_mean.FRFxx)*180/pi,'-')
            ax(3)=subplot(6,3,2);hold on;grid on;box on;
            plot(FreqGraf,abs(FRF_mean.FRFxy),'-')
            ax(4)=subplot(6,3,5);hold on;grid on;box on;
            plot(FreqGraf,angle(FRF_mean.FRFxy)*180/pi,'-')
            ax(5)=subplot(6,3,3);hold on;grid on;box on;
            plot(FreqGraf,abs(FRF_mean.FRFxz),'-')
            ax(6)=subplot(6,3,6);hold on;grid on;box on;
            plot(FreqGraf,angle(FRF_mean.FRFxz)*180/pi,'-')
            % Y     
            ax(7)=subplot(6,3,7);hold on;grid on;box on;
            plot(FreqGraf,abs(FRF_mean.FRFyx),'-')
            ax(8)=subplot(6,3,10);hold on;grid on;box on;
            plot(FreqGraf,angle(FRF_mean.FRFyx)*180/pi,'-')
            ax(9)=subplot(6,3,8);hold on;grid on;box on;
            plot(FreqGraf,abs(FRF_mean.FRFyy),'-')
            ax(10)=subplot(6,3,11);hold on;grid on;box on;
            plot(FreqGraf,angle(FRF_mean.FRFyy)*180/pi,'-')
            ax(11)=subplot(6,3,9);hold on;grid on;box on;
            plot(FreqGraf,abs(FRF_mean.FRFyz),'-')
            ax(12)=subplot(6,3,12);hold on;grid on;box on;
            plot(FreqGraf,angle(FRF_mean.FRFyz)*180/pi,'-')
            % Z     
            ax(13)=subplot(6,3,13);hold on;grid on;box on;
            plot(FreqGraf,abs(FRF_mean.FRFzx),'-')
            ax(14)=subplot(6,3,16);hold on;grid on;box on;
            plot(FreqGraf,angle(FRF_mean.FRFzx)*180/pi,'-')
            ax(15)=subplot(6,3,14);hold on;grid on;box on;
            plot(FreqGraf,abs(FRF_mean.FRFzy),'-')
            ax(16)=subplot(6,3,17);hold on;grid on;box on;
            plot(FreqGraf,angle(FRF_mean.FRFzy)*180/pi,'-')
            ax(17)=subplot(6,3,15);hold on;grid on;box on;
            plot(FreqGraf,abs(FRF_mean.FRFzz),'-')
            ax(18)=subplot(6,3,18);hold on;grid on;box on;
            plot(FreqGraf,angle(FRF_mean.FRFzz)*180/pi,'-')
            linkaxes(ax, 'x')
            xlim([10,200])
     end 
        
end
