function [M,D_M] = moment_input(L,moment_id)
M = input('Magnitude of Moment_1: ');
while M < 0
    disp('The magnitude of the moment_1 has to be positive');
    M = input('Please input the magnitude of the moment_1 which is positive: ');
end
D_M = input('Please input the position of the moment_1: ');
while D_M > L || D_M < 0
    disp ('Location of Moment cannot be longer than the length of the beam or be negative');
    D_M = input ('Please input the location of moment which is shorter than the length of the beam and is positive: ');
end
switch moment_id
    case 1
        % for counterclockwise moment
        
    case 2
        % for clockwise moment
        M = - M;        
end
end
