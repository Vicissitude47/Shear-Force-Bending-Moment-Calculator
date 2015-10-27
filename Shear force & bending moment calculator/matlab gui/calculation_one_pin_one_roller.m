function [F_PX,F_Matrix_developed,string1,string2,string3,V,BM] = calculation_one_pin_one_roller(F_distributed_load,L,L_i,L_f,D_1,F_1,A_1,D_2,F_2,A_2,D_3,F_3,A_3,D_M_1,M_1,D_M_2,M_2,D_M_3,M_3,F_r,M_r,D_P,D_R)

% calculate F_X & F_Y & M
F_PX = 0 - (F_1*cosd(A_1)+F_2*cosd(A_2)+F_3*cosd(A_3));

% the challenging part: three situations(no solution, unique
% solution and infinitely many solutions) of solution of F_P and F_R

Z_1 = -(F_1*sind(A_1)+F_2*sind(A_2)+F_3*sind(A_3)+F_r);
Z_2 = -(M_1+M_2+M_3+M_r+F_1*sind(A_1)*D_1+F_2*sind(A_2)*D_2+F_3*sind(A_3)*D_3);

F_Matrix = [1, 1, Z_1; D_P, D_R, Z_2];

F_Matrix_developed = rref(F_Matrix) ;

[~,~,string1,string2,string3,V,BM] = display_unknowns_one_pin_roller(F_PX,F_Matrix_developed,F_distributed_load,L,L_i,L_f,D_1,F_1,A_1,D_2,F_2,A_2,D_3,F_3,A_3,D_M_1,M_1,D_M_2,M_2,D_M_3,M_3,D_P,D_R);

end
