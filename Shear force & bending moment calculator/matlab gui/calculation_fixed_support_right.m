function [F_X,F_Y,M,string1,string2,string3] = calculation_fixed_support_right(L,F_1,A_1,D_1,M_1,F_2,A_2,D_2,M_2,F_3,A_3,D_3,M_3,M_r,F_r)

% calculate F_X & F_Y & M
F_X = 0 - (F_1*cosd(A_1)+F_2*cosd(A_2)+F_3*cosd(A_3));
F_Y = 0 - (F_1*sind(A_1)+F_2*sind(A_2)+F_3*sind(A_3)+F_r);
M = 0 - (M_1+M_2+M_3+M_r+F_1*sind(A_1)*D_1+F_2*sind(A_2)*D_2+F_3*sind(A_3)*D_3+F_Y*L);

[string1,string2,string3] = display_unknowns_fixed_support (F_X,F_Y,M);

end
