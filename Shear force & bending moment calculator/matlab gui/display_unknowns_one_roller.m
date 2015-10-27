function [string1,V,BM] = display_unknowns_one_roller(F_Y,F_distributed_load,L,L_i,L_f,D_1,F_1,A_1,D_2,F_2,A_2,D_3,F_3,A_3,D_M_1,M_1,D_M_2,M_2,D_M_3,M_3,D_R)

 
        
        % THE CODE FOR SHEAR FORCE AND BENDING MOMENT DIAGRAM IS HERE!
       [V,BM] = shear_bending_data_one_roller(F_distributed_load,L,L_i,L_f,D_1,F_1,A_1,D_2,F_2,A_2,D_3,F_3,A_3,D_M_1,M_1,D_M_2,M_2,D_M_3,M_3,F_Y,D_R);
        

end
