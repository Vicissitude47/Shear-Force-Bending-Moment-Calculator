function [string1,string2,V,BM] = display_unknowns_one_pin(F_distributed_load,L,L_i,L_f,D_1,F_1,A_1,D_2,F_2,A_2,D_3,F_3,A_3,F_Y,D_M_1,M_1,D_M_2,M_2,D_M_3,M_3,D_P,F_X,M)

string2 = '';

if M == 0
    % display of F_X
    string1 = 'The reaction force along x axis of the pin support is ';
    if F_X > 0
        string_F_X = num2str(F_X);
        string1 = char([string1,string_F_X,'kN.'],'The direction of the reaction force along x axis is to the right.');
    elseif F_X < 0;
        string_F_X = num2str(-F_X);
        string1 = char([string1,string_F_X,'kN.'],'The direction of the reaction force along x axis is to the left.');
    else
        string_F_X = num2str(F_X);
        string1 = char([string1,string_F_X,'kN.']);
    end
    
    % display of F_Y
    string2 = 'The reaction force along y axis of the pin support is ';
    if F_Y > 0
        string_F_Y = num2str(F_Y);
        string2 = char([string2,string_F_Y,'kN.'],'The direction of the reaction force along y axis is upward.');
    elseif F_Y < 0;
        string_F_Y = num2str(-F_Y);
        string2 = char([string2,string_F_Y,'kN.'],'The direction of the reaction force along y axis is downward.');
    else
        string_F_Y = num2str(F_Y);
        string2 = char([string2,string_F_Y,'kN.']);
    end
    
    % the function for shear force and bending moment
    [V,BM] = shear_bending_data_one_pin(F_distributed_load,L,L_i,L_f,D_1,F_1,A_1,D_2,F_2,A_2,D_3,F_3,A_3,F_Y,D_M_1,M_1,D_M_2,M_2,D_M_3,M_3,D_P);
    
else
    string1 = 'The beam is not in a state of equilibrium.';
    
end

end
