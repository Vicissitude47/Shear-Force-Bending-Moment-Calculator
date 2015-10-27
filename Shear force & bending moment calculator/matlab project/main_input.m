function [L,A_1,F_1,D_1,A_2,F_2,D_2,A_3,F_3,D_3]= main_input

L = input ('the length of the beam: ');
while L <= 0
    disp('the length of the beam cannot be less than or equal to zero');
    L = input ('Please input a positive value for the length of the beam: ');
end

A_1 = input('Angle_1 For Force_1: ');

F_1 = input('Magnitude Of Force_1: ');
while F_1 < 0
    disp ('The magnitude of Force_1 cannot be negative');
    F_1 = input ('Please input the magnitude of Force_1 which is positive: ');
end

D_1 = input ('Location Of Force_1: ');
while D_1 > L || D_1 < 0
    disp ('Location of Force_1 cannot be longer than the length of the beam or be negative');
    D_1 = input ('Please input the location of force_1 which is shorter than the length of the beam and is positive: ');
end

A_2 = input('Angle_2 For Force_2: ');

F_2 = input('Magnitude Of Force_2: ');
while F_2 < 0
    disp ('The magnitude of Force_2 cannot be negative');
    F_2 = input ('Please input the magnitude of Force_2 which is positive: ');
end

D_2 = input ('Location Of Force_2: ');
while D_2 > L || D_2 < 0
    disp ('Location of Force_2 cannot be longer than the length of the beam or be negative');
    D_2 = input ('Please input the location of force_2 which is shorter than the length of the beam and is positive: ');
end

A_3 = input('Angle_3 For Force_3: ');

F_3 = input('Magnitude Of Force_3: ');
while F_3 < 0
    disp ('The magnitude of Force_3 cannot be negative');
    F_3 = input ('Please input the magnitude of Force_3 which is positive: ');
end

D_3 = input ('Location Of Force_3: ');
while D_3 > L || D_3 < 0
    disp ('Location of Force_3 cannot be longer than the length of the beam or be negative');
    D_3 = input ('Please input the location of force_3 which is shorter than the length of the beam and is positive: ');
end

end