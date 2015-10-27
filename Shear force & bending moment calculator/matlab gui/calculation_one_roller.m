function [sum_of_F_X,F_Y,sum_of_M] = calculation_one_roller (D_1,F_1,A_1,D_2,F_2,A_2,D_3,F_3,A_3,M_1,M_2,M_3,M_r,F_r,D_R)

% calculate F_X & F_Y & M
sum_of_F_X = F_1*cosd(A_1)+F_2*cosd(A_2)+F_3*cosd(A_3);
F_Y = 0 - (F_1*sind(A_1)+F_2*sind(A_2)+F_3*sind(A_3)+F_r);
sum_of_M = M_1+M_2+M_3+M_r+F_1*sind(A_1)*D_1+F_2*sind(A_2)*D_2+F_3*sind(A_3)*D_3+F_Y*D_R;

end