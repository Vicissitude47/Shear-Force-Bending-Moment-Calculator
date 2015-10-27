function [L_i,L_f,w_i,w_f] = distributed_load_input(L)

L_i = input ('Please input the start location of distributed load: ') ;
L_f = input ('Please input the end location of distributed load: ') ;

while L_i >= L_f || L_i < 0 || L_f < 0 || L_f > L
    disp ('The start point must before the end point');
    disp ('Both the start point and the end point should not be negative and should not be longer than the beam length');
    L_i = input ('Please input the start location of distributed load: ') ;
    L_f = input ('Please input the end location of distributed load: ') ;
end

w_i = input ('Please input the start magnitude of distributed load: ') ;

while w_i < 0 
    disp('The start magnitude of distributed load must be positive');
    w_i = input ('Please input the start magnitude of distributed load: ') ;
end
w_f = input ('Please input the end magnitude of the distributied load: ');
while w_f < 0 
    disp('The end magnitude of distributed load must be positive');
    w_f = input ('Please input the end magnitude of distributed load: ') ;
end
end
