%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Optimal cutting condition selection for high quality receptance         
% measurements by Sweep Milling Force Excitation
% 
% Authors: Oier Franco, Xavier Beudaert, Alex Iglesias, Zoltan Dombovari,
%          Kaan Erkorkmaz, Jokin Munoa. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [FRF_matrix,Condition_matrix,Rank_matrix] = Get_FRF (Spectrum_matrix_all,FreqGraf)
% Compute the Frequency Response function by matrix operation

if length(fieldnames(Spectrum_matrix_all)) == 3
    
Test_1 = Spectrum_matrix_all.Test_1;
Test_2 = Spectrum_matrix_all.Test_2;
Test_3 = Spectrum_matrix_all.Test_3;

    for k = 1:length(FreqGraf)

        MatrixGFFx = [Test_1(k,4),Test_1(k,5),Test_1(k,6);
                      Test_2(k,4),Test_2(k,5),Test_2(k,6);
                      Test_3(k,4),Test_3(k,5),Test_3(k,6)];

        MatrixGXFx = [Test_1(k,1),Test_1(k,2),Test_1(k,3);
                      Test_2(k,1),Test_2(k,2),Test_2(k,3);
                      Test_3(k,1),Test_3(k,2),Test_3(k,3)];

        FRFxx_Sol  = MatrixGFFx\MatrixGXFx;

        FRFxx(1,k)= FRFxx_Sol(1,1);
        FRFxy(1,k)= FRFxx_Sol(2,1);
        FRFxz(1,k)= FRFxx_Sol(3,1);
        FRFyx(1,k)= FRFxx_Sol(1,2);
        FRFyy(1,k)= FRFxx_Sol(2,2);                        
        FRFyz(1,k)= FRFxx_Sol(3,2);
        FRFzx(1,k)= FRFxx_Sol(1,3);
        FRFzy(1,k)= FRFxx_Sol(2,3);
        FRFzz(1,k)= FRFxx_Sol(3,3);
        % Condition number
        Condition(1,k) = cond(FRFxx_Sol);
        % Rank
        RankNum(1,k)   = rank(FRFxx_Sol);


    end

FRF_matrix.FRFxx = FRFxx;
FRF_matrix.FRFxy = FRFxy;
FRF_matrix.FRFxz = FRFxz;

FRF_matrix.FRFyx = FRFyx;
FRF_matrix.FRFyy = FRFyy;
FRF_matrix.FRFyz = FRFyz;

FRF_matrix.FRFzx = FRFzx;
FRF_matrix.FRFzy = FRFzy;
FRF_matrix.FRFzz = FRFzz;

Condition_matrix = Condition;
Rank_matrix      = RankNum;


elseif length(fieldnames(Spectrum_matrix_all)) == 2
    
    Test_1 = Spectrum_matrix_all.Test_1;
    Test_2 = Spectrum_matrix_all.Test_2;
    
    for k = 1:length(FreqGraf)
    
        MatrixGFFx = [Test_1(k,4),Test_1(k,5);
                      Test_2(k,4),Test_2(k,5)];
                  
        MatrixGXFx = [Test_1(k,1),Test_1(k,2);
                      Test_2(k,1),Test_2(k,2)];
                  
        FRFxx_Sol  = MatrixGFFx\MatrixGXFx;
        
        FRFxx(1,k)= FRFxx_Sol(1,1);
        FRFxy(1,k)= FRFxx_Sol(2,1);
        FRFyx(1,k)= FRFxx_Sol(1,2);
        FRFyy(1,k)= FRFxx_Sol(2,2);
        
        % Condition number
        Condition(1,k) = cond(FRFxx_Sol);
        % Rank
        RankNum(1,k)   = rank(FRFxx_Sol);
        
    end 
    
    FRF_matrix.FRFxx = FRFxx;
    FRF_matrix.FRFxy = FRFxy;
    FRF_matrix.FRFxz = NaN(1,length(FreqGraf));

    FRF_matrix.FRFyx = FRFyx;
    FRF_matrix.FRFyy = FRFyy;
    FRF_matrix.FRFyz = NaN(1,length(FreqGraf));

    FRF_matrix.FRFzx = NaN(1,length(FreqGraf));
    FRF_matrix.FRFzy = NaN(1,length(FreqGraf));
    FRF_matrix.FRFzz = NaN(1,length(FreqGraf));

    Condition_matrix = Condition;
    Rank_matrix      = RankNum;       
        
end 


end 