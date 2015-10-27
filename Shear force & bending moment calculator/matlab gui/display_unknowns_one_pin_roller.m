function [F_PY,F_R,string1,string2,string3,V,BM] = display_unknowns_one_pin_roller(F_PX,F_Matrix_developed,F_distributed_load,L,L_i,L_f,D_1,F_1,A_1,D_2,F_2,A_2,D_3,F_3,A_3,D_M_1,M_1,D_M_2,M_2,D_M_3,M_3,D_P,D_R)

F_PY = F_Matrix_developed (1,3);
F_R = F_Matrix_developed (2,3);

% initializing string
string2 = '';
string3 = '';
V = 0;
BM = 0;


if F_Matrix_developed(2,1)== 0 && F_Matrix_developed(2,2) == 0 && F_Matrix_developed(2,3)== 0
    string1 = 'The beam is in the state of equilibrium. However, the support reactions along y axis of pin and roller have infinitely many solutions.';
    
elseif F_Matrix_developed(2,1)== 0 && F_Matrix_developed(2,2) == 0 && F_Matrix_developed(2,3) ~= 0
    string1 = 'The beam is not in the state of equilibrium.';
    
else
    
    % display of F_PX
    string1 = 'The reaction force of pin along x axis is ';
    
    if F_PX > 0
        string_F_PX = num2str(F_PX);
        string1 = char([string1,string_F_PX,'kN.'],'The direction of the reaction force of pin along x axis is to the right.');
    elseif F_PX < 0;
        string_F_PX = num2str(-F_PX);
        string1 = char([string1,string_F_PX,'kN.'],'The direction of the reaction force of pin along x axis is to the left.');
    else
        string_F_PX = num2str(F_PX);
        string1 = char([string1,string_F_PX,'kN.']);
    end
        
    % display of F_P
    string2 = 'The reaction force of the pin along y axis is ';
    if F_PY > 0
        string_F_PY = num2str(F_PY);
        string2 = char([string2,string_F_PY,'kN.'],'The direction of the reaction force along y axis is upward.');
    elseif F_PY < 0
        string_F_PY = num2str(-F_PY);
        string2 = char([string2,string_F_PY,'kN.'],'The direction of the reaction force along y axis is downward.');
    else
        string_F_PY = num2str(F_PY);
        string2 = char([string2,string_F_PY,'kN.']);
    end
    
    string3 = 'The reaction force of the roller along y axis is ';
    if F_R > 0
        string_F_R = num2str(F_R);
        string3 = char([string3, string_F_R,'kN.'],'The direction of the reaction force of the roller along y axis is upward.');
    elseif F_R < 0;
        string_F_R = num2str(-F_R);
        string3 = char([string3, string_F_R,'kN.'],'The direction of the reaction force of the roller along y axis is downward.');
    else
        string_F_R = num2str(-F_R);
        string3 = char([string3, string_F_R,'kN.']);
    end
    
    % the function for shear force and bending moment diagram
    [V,BM] = shear_bending_data_one_pin_roller(F_distributed_load,L,L_i,L_f,D_1,F_1,A_1,D_2,F_2,A_2,D_3,F_3,A_3,D_M_1,M_1,D_M_2,M_2,D_M_3,M_3,F_PY,D_P,F_R,D_R); 
      
end
end
