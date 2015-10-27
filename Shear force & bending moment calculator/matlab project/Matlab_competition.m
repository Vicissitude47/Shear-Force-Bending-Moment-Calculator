% this file is the upgraded one
% but we have upgraded this again
% so we changed some of the function in it
% so this file will not function

clear;clc;

%the menu
support_reaction_id = menu_support_reaction_id;

while support_reaction_id ~= 7
    %input the variable
    
    [L,A_1,F_1,D_1,A_2,F_2,D_2,A_3,F_3,D_3] = main_input;
    
    moment_id = menu_moment_id;
    [M_1,D_M_1] = moment_input(L,moment_id);
    
    moment_id = menu_moment_id;
    [M_2,D_M_2] = moment_input(L,moment_id);
    
    moment_id = menu_moment_id;
    [M_3,D_M_3] = moment_input(L,moment_id);
    
    distributed_load_direction = menu_distributed_load_direction;
    [L_i,L_f,w_i,w_f] = distributed_load_input(L);
    
    x_i = 0.001;
    d_distributed_load = L_i:x_i:L_f ;
    
    [F_r,M_r,F_distributed_load,w] = calculation_distributed_load(distributed_load_direction,x_i,d_distributed_load,w_i,w_f,L_i,L_f);
    
    switch support_reaction_id
        % for fixed support on the left
        case 1
            
            [F_X,F_Y,M] = calculation_fixed_support_left(F_1,A_1,D_1,M_1,F_2,A_2,D_2,M_2,F_3,A_3,D_3,M_3,M_r,F_r);
            
            shear_bending_data_fixed_support_left(F_distributed_load,L,L_i,L_f,D_1,F_1,A_1,D_2,F_2,A_2,D_3,F_3,A_3,F_Y,D_M_1,M_1,D_M_2,M_2,D_M_3,M_3,M);
            
        case 2
            %for fixed support on the right
            
            [F_X,F_Y,M] = calculation_fixed_support_right(L,F_1,A_1,D_1,M_1,F_2,A_2,D_2,M_2,F_3,A_3,D_3,M_3,M_r,F_r);
            
            shear_bending_data_fixed_support_right(F_distributed_load,L,L_i,L_f,D_1,F_1,A_1,D_2,F_2,A_2,D_3,F_3,A_3,F_Y,D_M_1,M_1,D_M_2,M_2,D_M_3,M_3,M);
            
        case 3
            %for one pin support
            
            [~,~,~,~] = calculation_one_pin_support(F_distributed_load,L,L_i,L_f,D_1,F_1,A_1,D_2,F_2,A_2,D_3,F_3,A_3,D_M_1,M_1,D_M_2,M_2,D_M_3,M_3,F_r,M_r);
            
        case 4
            %for one pin support and one roller support
            
            [~,~,~,~] = calculation_one_pin_one_roller(F_distributed_load,L,L_i,L_f,D_1,F_1,A_1,D_2,F_2,A_2,D_3,F_3,A_3,D_M_1,M_1,D_M_2,M_2,D_M_3,M_3,F_r,M_r);
            
        case 5
            %for one roller support
            
            [~,~,~,~] = calculation_one_roller (F_distributed_load,L,L_i,L_f,D_1,F_1,A_1,D_2,F_2,A_2,D_3,F_3,A_3,D_M_1,M_1,D_M_2,M_2,D_M_3,M_3,M_r,F_r);
            
        case 6
            %for two roller supports
            
            [~,~,~,~,~,~] = calculation_two_roller (F_distributed_load,L,L_i,L_f,D_1,F_1,A_1,D_2,F_2,A_2,D_3,F_3,A_3,D_M_1,M_1,D_M_2,M_2,D_M_3,M_3,F_r,M_r);
            
    end
    
    support_reaction_id = menu_support_reaction_id;
    
end

disp('God bless you!')


