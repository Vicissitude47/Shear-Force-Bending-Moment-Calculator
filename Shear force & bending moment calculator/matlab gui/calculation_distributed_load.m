function [F_r,M_r,F_distributed_load,w] = calculation_distributed_load(x_i,d_distributed_load,w_i,w_f,L_i,L_f)

if w_i <= w_f
    w = (w_f - w_i)/(L_f - L_i)*d_distributed_load + w_i - (w_f - w_i)/(L_f - L_i)*L_i ;
    F_distributed_load = w * x_i ;
    F_r = sum(F_distributed_load) ;
    
    M_r = (L_i+1/2*(L_f-L_i))*w_i*(L_f-L_i)+(L_i+2/3*(L_f-L_i))*1/2*(w_f-w_i)*(L_f-L_i);
else
    w = (w_f - w_i)/(L_f - L_i)*d_distributed_load + w_i - (w_f - w_i)/(L_f - L_i)*L_i ;
    F_distributed_load = w * x_i ;
    F_r = sum(F_distributed_load) ;
    
    M_r = (L_i+1/2*(L_f-L_i))*w_f*(L_f-L_i)+(L_i+1/3*(L_f-L_i))*1/2*(w_i-w_f)*(L_f-L_i);
end


end