function [SUM_F_X,F_Matrix_developed,F_R_1,F_R_2,string1,string2,V,BM] = calculation_two_roller (F_distributed_load,L,L_i,L_f,D_1,F_1,A_1,D_2,F_2,A_2,D_3,F_3,A_3,D_M_1,M_1,D_M_2,M_2,D_M_3,M_3,F_r,M_r,D_R_1,D_R_2)

SUM_F_X = F_1*cosd(A_1)+F_2*cosd(A_2)+F_3*cosd(A_3);
Z_1 = -(F_1*sind(A_1)+F_2*sind(A_2)+F_3*sind(A_3)+F_r);
Z_2 = -(M_1+M_2+M_3+M_r+F_1*sind(A_1)*D_1+F_2*sind(A_2)*D_2+F_3*sind(A_3)*D_3);

F_Matrix = [1, 1, Z_1 ; D_R_1, D_R_2, Z_2];
F_Matrix_developed = rref(F_Matrix);

F_R_1 = F_Matrix_developed (1,3);
F_R_2 = F_Matrix_developed (2,3);

[string1,string2,V,BM] = display_unknowns_two_rollers(SUM_F_X,F_Matrix_developed,F_distributed_load,L,L_i,L_f,D_1,F_1,A_1,D_2,F_2,A_2,D_3,F_3,A_3,F_R_1,D_R_1,D_R_2,F_R_2,D_M_1,M_1,D_M_2,M_2,D_M_3,M_3);

end