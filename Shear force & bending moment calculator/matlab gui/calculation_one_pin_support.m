function [F_X,F_Y,M] = calculation_one_pin_support(D_1,F_1,A_1,D_2,F_2,A_2,D_3,F_3,A_3,M_1,M_2,M_3,F_r,M_r,D_P)

% calculate F_X & F_Y & M
F_X = 0 - (F_1*cosd(A_1)+F_2*cosd(A_2)+F_3*cosd(A_3));
F_Y = 0 - (F_1*sind(A_1)+F_2*sind(A_2)+F_3*sind(A_3)+F_r);
M = M_1+M_2+M_3+M_r+F_1*sind(A_1)*D_1+F_2*sind(A_2)*D_2+F_3*sind(A_3)*D_3+F_Y*D_P;

end

