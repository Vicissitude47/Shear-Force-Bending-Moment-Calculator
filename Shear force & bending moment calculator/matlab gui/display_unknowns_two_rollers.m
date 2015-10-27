function [string1,string2,V,BM] = display_unknowns_two_rollers(SUM_F_X,F_Matrix_developed,F_distributed_load,L,L_i,L_f,D_1,F_1,A_1,D_2,F_2,A_2,D_3,F_3,A_3,F_R_1,D_R_1,D_R_2,F_R_2,D_M_1,M_1,D_M_2,M_2,D_M_3,M_3)

% initializing 
string2 = '';
V = 0;
BM = 0;

if SUM_F_X ~= 0
    string1 = 'The beam is not in the state of equilibrium';
else
    if F_Matrix_developed(2,1)== 0 && F_Matrix_developed(2,2) == 0 && F_Matrix_developed(2,3) == 0
        string1 = 'The beam is in the state of equilibrium. However, the support reactions along y axis of pin and roller have infinitely many solutions.';
        
    elseif F_Matrix_developed(2,1)== 0 && F_Matrix_developed(2,2)== 0 && F_Matrix_developed(2,3) ~= 0
        string1 = 'The beam is not in the state of equilibrium';
        
    else
        
        string1 = 'The reaction force of the roller 1 along y axis is';
        if F_R_1 > 0
            string_F_R_1 = num2str(F_R_1);
            string1 = char([string1, string_F_R_1,'kN.'],'The direction of the reaction force of the roller 1 along y axis is upward.');
        elseif F_R_1 < 0;
            string_F_R_1 = num2str(-F_R_1);
            string1 = char([string1, string_F_R_1,'kN.'],'The direction of the reaction force of the roller 1 along y axis is downward.');
        else
            string_F_R_1 = num2str(F_R_1);
            string1 = char([string1, string_F_R_1,'kN.']);
        end
        
        string2 = 'The reaction force of the roller 2 along y axis is ';
        if F_R_2 > 0
            string_F_R_2 = num2str(F_R_2);
            string2 = char([string2, string_F_R_2,'kN.'],'The direction of the reaction force of the roller 2 along y axis is upward.');
        elseif F_R_2 < 0;
            string_F_R_2 = num2str(-F_R_2);
            string2 = char([string2, string_F_R_2,'kN.'],'The direction of the reaction force of the roller 2 along y axis is downward.');
        else
            string_F_R_2 = num2str(F_R_2);
            string2 = char([string2, string_F_R_2,'kN.']);
        end
        
        % THE BENDING MOMENT AND SHEAR FORCE DIAGRAM CODE IS HERE!
        [V,BM] = shear_bending_data_two_rollers(F_distributed_load,L,L_i,L_f,D_1,F_1,A_1,D_2,F_2,A_2,D_3,F_3,A_3,F_R_1,D_R_1,D_R_2,F_R_2,D_M_1,M_1,D_M_2,M_2,D_M_3,M_3);      
        
    end
end
end