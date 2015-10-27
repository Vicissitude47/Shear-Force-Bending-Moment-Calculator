function [V,BM] = shear_bending_data_one_roller(F_distributed_load,L,L_i,L_f,D_1,F_1,A_1,D_2,F_2,A_2,D_3,F_3,A_3,D_M_1,M_1,D_M_2,M_2,D_M_3,M_3,F_Y,D_R)
% loads into big matrix

% create a matrix for beam_base
x_i = 0.001;
d_beam = 0:x_i:L ;
beam_base = d_beam;
beam_base(2,:) = 0;
d_distributed_load = L_i:x_i:L_f ;

% point load 1 into big matrix
F_pointload1 = [D_1 ; F_1*sind(A_1)];
F_pointload1 = [zeros(2,((D_1 -0)/x_i)) F_pointload1  zeros(2,((L - D_1)/x_i))];
F_pointload1(1,:)= 0;

% point load 2 into big matrix
F_pointload2 = [D_2 ; F_2*sind(A_2)];
F_pointload2 = [zeros(2,((D_2 -0)/x_i)) F_pointload2  zeros(2,((L - D_2)/x_i))];
F_pointload2(1,:)= 0;

% point load 3 into big matrix
F_pointload3 = [D_3 ; F_3*sind(A_3)];
F_pointload3 = [zeros(2,((D_3 -0)/x_i)) F_pointload3  zeros(2,((L - D_3)/x_i))];
F_pointload3(1,:)= 0;

% distributed load into big matrix

F_distributed_load(2,:) = d_distributed_load ;
F_distributed_load = flipud(F_distributed_load);

F_distributed_load = [zeros(2,((L_i-0)/x_i))  F_distributed_load  zeros(2,((L - L_f)/x_i))];

F_distributed_load(1,:)= 0 ;

% support reaction into big matrix
F_roller = [D_R ; F_Y];
F_roller = [zeros(2,((D_R -0)/x_i)) F_roller  zeros(2,((L - D_R)/x_i))];
F_roller(1,:)= 0;

% calculate final load
F_load = F_distributed_load + F_pointload1 + F_pointload2 + F_pointload3 + F_roller + beam_base;

% calculate shear force
V = F_load;
V(2,:) = cumsum(V(2,:));

% bending moment diagram

% moment due to F_load into a big matrix
F_load(2,:) = F_load(2,:) .* F_load(1,:);
F_load(1,:) = 0;

% moment due to shear force into a big matirx
M_V = V ;
M_V(2,:) = M_V(2,:) .* M_V(1,:);
M_V(1,:) = 0;

% point moments into big matrix
M1 = [D_M_1 ; M_1];
M1 = [zeros(2,((D_M_1 -0)/x_i)) M1  zeros(2,((L - D_M_1)/x_i))];
M1(1,:)= 0;

M2 = [D_M_2 ; M_2];
M2 = [zeros(2,((D_M_2 -0)/x_i)) M2  zeros(2,((L - D_M_2)/x_i))];
M2(1,:)= 0;

M3 = [D_M_3 ; M_3];
M3 = [zeros(2,((D_M_3 -0)/x_i)) M3  zeros(2,((L - D_M_3)/x_i))];
M3(1,:)= 0;


% calculate the bending moment
BM = - M1 - M2 - M3 - F_load + beam_base;

BM(2,:) = cumsum(BM(2,:));

BM = BM + M_V;

% plot
shear_bending_plot (V,BM)
end