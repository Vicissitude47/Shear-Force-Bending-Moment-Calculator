
clear;clc;

%the menu
support_reaction_id = menu('Choose the support reaction that fit your problem', 'fixed support on the left', 'fixed support on the right',...
    'one pin support', 'one pin support and one roller support','one roller support','two roller supports');

%input the variable

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


switch support_reaction_id
    % for fixed support on the left
    case 1
        % choose the direction of moment
        moment_id = menu('Choose the moment direction','counterclockwise moment','clockwise moment');
        
        M_1 = input('Magnitude of Moment_1: ');
        while M_1 < 0
            dips('The magnitude of the moment_1 has to be positive');
            M_1 = input('Please input the magnitude of the moment_1 which is positive: ');
        end
        D_M_1 = input('Please input the position of the moment_1: ');
        
        switch moment_id
            case 1
                % for counterclockwise moment
                
            case 2
                % for clockwise moment
                M_1 = - M_1;
                
        end
        
        
        moment_id = menu('Choose the moment direction','counterclockwise moment','clockwise moment');
        
        M_2 = input('Magnitude of Moment_2: ');
        while M_2 < 0
            dips('The magnitude of the moment_2 has to be positive');
            M_2 = input('Please input the magnitude of the moment_2 which is positive: ');
        end
        D_M_2 = input('Please input the position of the moment_2: ');
        
        switch moment_id
            case 1
                % for counterclockwise moment
                
            case 2
                % for clockwise moment
                M_2 = - M_2;
                
        end
        
        moment_id = menu('Choose the moment direction','counterclockwise moment','clockwise moment');
        M_3 = input('Magnitude of Moment_3: ');
        while M_3 < 0
            dips('The magnitude of the moment_3 has to be positive');
            M_3 = input('Please input the magnitude of the moment_3 which is positive: ');
        end
        D_M_3 = input('Please input the position of the moment_3: ');
        
        switch moment_id
            case 1
                % for counterclockwise moment
                
            case 2
                % for clockwise moment
                M_3 = - M_3;
                
        end
        
        
        
        distributed_load_direction = menu('Choose the distributed load direction','downward','upward');
        
        L_i = input ('please input the start location: ') ;
        L_f = input ('please input the end location: ') ;
        
        while L_i >= L_f || L_i < 0 || L_f < 0 || L_f > L
            disp ('the start point must before the end point');
            disp ('both the start point and the end point should not be negative and should not be longer than the beam length');
            L_i = input ('please input the start location: ') ;
            L_f = input ('please input the end location: ') ;
        end
        
        w_i = input ('please input the start magnitude: ') ;
        w_f = input ('please input the end magnitude: ');
        x_i = 0.001;
        d_distributed_load = L_i:x_i:L_f ;
        
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
        
        switch distributed_load_direction
            case 1
                F_r = - F_r;
                F_distributed_load = - w * x_i ;
                M_r = - M_r;
            case 2
                
        end
        
        
        % calculate F_X & F_Y & M
        F_X = 0 - (F_1*cosd(A_1)+F_2*cosd(A_2)+F_3*cosd(A_3));
        F_Y = 0 - (F_1*sind(A_1)+F_2*sind(A_2)+F_3*sind(A_3)+F_r);
        M = 0 - (M_1+M_2+M_3+M_r+F_1*sind(A_1)*D_1+F_2*sind(A_2)*D_2+F_3*sind(A_3)*D_3);
        
        
        % display of F_X
        disp('The reaction force along x axis of the fixed support is');
        if F_X > 0
            disp(F_X);
            disp('the direction of the reaction force along x axis is to the right');
        elseif F_X < 0;
            F_X = - F_X;
            disp(F_X);
            disp('the direction of the reaction force along x axis is to the left');
        else
            disp(F_X);
        end
        
        % display of F_Y
        disp('The reaction force along y axis of the fixed support is ');
        if F_Y > 0
            disp(F_Y);
            disp('the direction of the reaction force along y axis is upward');
        elseif F_Y < 0;
            F_Y1 = - F_Y;
            disp(F_Y1);
            disp('the direction of the reaction force along y axis is downward');
        else
            disp(F_Y);
        end
        
        % display of M
        disp('The reaction moment of the fixed support is ');
        if M > 0
            disp(M);
            disp('the direction of moment is counterclockwise');
        elseif M < 0;
            Mm = - M;
            disp(Mm);
            disp('the direction of moment is clockwise');
        else
            disp(M);
        end
        
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
        F_fixleft = [0 ; F_Y];
        F_fixleft = [zeros(2,((0 -0)/x_i)) F_fixleft  zeros(2,((L - 0)/x_i))];
        F_fixleft(1,:)= 0;
        
        % calculate final load
        F_load = F_distributed_load + F_pointload1 + F_pointload2 + F_pointload3 + F_fixleft + beam_base;
        
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
        
        M = [0 ; M];
        M = [zeros(2,((0 -0)/x_i)) M  zeros(2,((L)/x_i))];
        M(1,:)= 0;
        
        % calculate the bending moment
        BM = -M - M1 - M2 - M3 - F_load + beam_base;
        
        BM(2,:) = cumsum(BM(2,:));
        
        BM = BM + M_V;
        
        % plot the shear force diagram and the bending moment diagram
        
        subplot(1,2,1);
        plot (V(1,:),V(2,:));
        title('Shear Force Diagram');
        xlabel('distance x (m)');
        ylabel('Shear force V (kN)') ;
        
        subplot(1,2,2);
        plot (BM(1,:),BM(2,:));
        title('Bending Moment Diagram');
        xlabel('distance x (m)');
        ylabel('Bending Moment M (kN*m)') ;
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
    case 2
        %for fixed support on the right
        
        moment_id = menu('Choose the moment direction','counterclockwise moment','clockwise moment');
        
        M_1 = input('Magnitude of Moment_1: ');
        while M_1 < 0
            dips('The magnitude of the moment_1 has to be positive');
            M_1 = input('Please input the magnitude of the moment_1 which is positive: ');
        end
        D_M_1 = input('Please input the position of the moment_1: ');
        switch moment_id
            case 1
                % for counterclockwise moment
                
            case 2
                % for clockwise moment
                M_1 = - M_1;
                
        end
        
        
        moment_id = menu('Choose the moment direction','counterclockwise moment','clockwise moment');
        
        M_2 = input('Magnitude of Moment_2: ');
        while M_2 < 0
            dips('The magnitude of the moment_2 has to be positive');
            M_2 = input('Please input the magnitude of the moment_2 which is positive: ');
        end
        D_M_2 = input('Please input the position of the moment_2: ');
        switch moment_id
            case 1
                % for counterclockwise moment
                
            case 2
                % for clockwise moment
                M_2 = - M_2;
                
        end
        
        moment_id = menu('Choose the moment direction','counterclockwise moment','clockwise moment');
        M_3 = input('Magnitude of Moment_3: ');
        while M_3 < 0
            dips('The magnitude of the moment_3 has to be positive');
            M_3 = input('Please input the magnitude of the moment_3 which is positive: ');
        end
        D_M_3 = input('Please input the position of the moment_3: ');
        switch moment_id
            case 1
                % for counterclockwise moment
                
            case 2
                % for clockwise moment
                M_3 = - M_3;
                
        end
        
        
        
        distributed_load_direction = menu('Choose the distributed load direction','downward','upward');
        
        L_i = input ('please input the start location: ') ;
        L_f = input ('please input the end location: ') ;
        
        while L_i >= L_f || L_i < 0 || L_f < 0 || L_f > L
            disp ('the start point must before the end point');
            disp ('both the start point and the end point should not be negative and should not be longer than the beam length');
            L_i = input ('please input the start location: ') ;
            L_f = input ('please input the end location: ') ;
        end
        
        w_i = input ('please input the start magnitude: ') ;
        w_f = input ('please input the end magnitude: ');
        x_i = 0.001;
        d_distributed_load = L_i:x_i:L_f ;
        
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
        
        switch distributed_load_direction
            case 1
                F_r = - F_r;
                F_distributed_load = - w * x_i ;
                M_r = - M_r;
            case 2
                
        end
        
        
        % calculate F_X & F_Y & M
        F_X = 0 - (F_1*cosd(A_1)+F_2*cosd(A_2)+F_3*cosd(A_3));
        F_Y = 0 - (F_1*sind(A_1)+F_2*sind(A_2)+F_3*sind(A_3)+F_r);
        M = 0 - (M_1+M_2+M_3+M_r+F_1*sind(A_1)*D_1+F_2*sind(A_2)*D_2+F_3*sind(A_3)*D_3+F_Y*L);
        
        
        % display of F_X
        disp('The reaction force along x axis of the fixed support is');
        if F_X > 0
            disp(F_X);
            disp('the direction of the reaction force along x axis is to the right');
        elseif F_X < 0;
            F_X = - F_X;
            disp(F_X);
            disp('the direction of the reaction force along x axis is to the left');
        else
            disp(F_X);
        end
        
        % display of F_Y
        disp('The reaction force along y axis of the fixed support is ');
        if F_Y > 0
            disp(F_Y);
            disp('the direction of the reaction force along y axis is upward');
        elseif F_Y < 0;
            F_Y1 = - F_Y;
            disp(F_Y1);
            disp('the direction of the reaction force along y axis is downward');
        else
            disp(F_Y);
        end
        
        % display of M
        disp('The reaction moment of the fixed support is ');
        if M > 0
            disp(M);
            disp('the direction of moment is counterclockwise');
        elseif M < 0;
            Mm = - M;
            disp(Mm);
            disp('the direction of moment is clockwise');
        else
            disp(M);
        end
        
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
        F_fixright = [L ; F_Y];
        F_fixright = [zeros(2,((L -0)/x_i)) F_fixright  zeros(2,((L - L)/x_i))];
        F_fixright(1,:)= 0;
        
        % calculate final load
        F_load = F_distributed_load + F_pointload1 + F_pointload2 + F_pointload3 + F_fixright + beam_base;
        
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
        
        M = [L ; M];
        M = [zeros(2,((L -0)/x_i)) M  zeros(2,((L-L)/x_i))];
        M(1,:)= 0;
        
        % calculate the bending moment
        BM = -M - M1 - M2 - M3 - F_load + beam_base;
        
        BM(2,:) = cumsum(BM(2,:));
        
        BM = BM + M_V;
        
        % plot the shear force diagram and the bending moment diagram
        
        subplot(1,2,1);
        plot (V(1,:),V(2,:));
        title('Shear Force Diagram');
        xlabel('distance x (m)');
        ylabel('Shear force V (kN)') ;
        
        subplot(1,2,2);
        plot (BM(1,:),BM(2,:));
        title('Bending Moment Diagram');
        xlabel('distance x (m)');
        ylabel('Bending Moment M (kN*m)') ;
        
        
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
    case 3
        %for one pin support
        moment_id = menu('Choose the moment direction','counterclockwise moment','clockwise moment');
        
        M_1 = input('Magnitude of Moment_1: ');
        while M_1 < 0
            dips('The magnitude of the moment_1 has to be positive');
            M_1 = input('Please input the magnitude of the moment_1 which is positive: ');
        end
        D_M_1 = input('Please input the position of the moment_1: ');
        switch moment_id
            case 1
                % for counterclockwise moment
                
                
            case 2
                % for clockwise moment
                M_1 = - M_1;
                
        end
        
        
        moment_id = menu('Choose the moment direction','counterclockwise moment','clockwise moment');
        
        M_2 = input('Magnitude of Moment_2: ');
        while M_2 < 0
            dips('The magnitude of the moment_2 has to be positive');
            M_2 = input('Please input the magnitude of the moment_2 which is positive: ');
        end
        D_M_2 = input('Please input the position of the moment_2: ');
        switch moment_id
            case 1
                % for counterclockwise moment
                
            case 2
                % for clockwise moment
                M_2 = - M_2;
                
        end
        
        moment_id = menu('Choose the moment direction','counterclockwise moment','clockwise moment');
        M_3 = input('Magnitude of Moment_3: ');
        while M_3 < 0
            dips('The magnitude of the moment_3 has to be positive');
            M_3 = input('Please input the magnitude of the moment_3 which is positive: ');
        end
        D_M_3 = input('Please input the position of the moment_3: ');
        
        switch moment_id
            case 1
                % for counterclockwise moment
                
            case 2
                % for clockwise moment
                M_3 = - M_3;
                
        end
        
        
        
        distributed_load_direction = menu('Choose the distributed load direction','downward','upward');
        
        L_i = input ('please input the start location: ') ;
        L_f = input ('please input the end location: ') ;
        
        while L_i >= L_f || L_i < 0 || L_f < 0 || L_f > L
            disp ('the start point must before the end point');
            disp ('both the start point and the end point should not be negative and should not be longer than the beam length');
            L_i = input ('please input the start location: ') ;
            L_f = input ('please input the end location: ') ;
        end
        
        w_i = input ('please input the start magnitude: ') ;
        w_f = input ('please input the end magnitude: ');
        x_i = 0.001;
        d_distributed_load = L_i:x_i:L_f ;
        
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
        
        switch distributed_load_direction
            case 1
                F_r = - F_r;
                F_distributed_load = - w * x_i ;
                M_r = - M_r;
            case 2
                
        end
        
        D_P = input('please input the location of the pin support: ');
        
        % calculate F_X & F_Y & M
        F_X = 0 - (F_1*cosd(A_1)+F_2*cosd(A_2)+F_3*cosd(A_3));
        F_Y = 0 - (F_1*sind(A_1)+F_2*sind(A_2)+F_3*sind(A_3)+F_r);
        M = M_1+M_2+M_3+M_r+F_1*sind(A_1)*D_1+F_2*sind(A_2)*D_2+F_3*sind(A_3)*D_3+F_Y*D_P;
        
        if M == 0
            % display of F_X
            disp('The reaction force along x axis of the pin support is');
            if F_X > 0
                disp(F_X);
                disp('the direction of the reaction force along x axis is to the right');
            elseif F_X < 0;
                F_X = - F_X;
                disp(F_X);
                disp('the direction of the reaction force along x axis is to the left');
            else
                disp(F_X);
            end
            
            % display of F_Y
            disp('The reaction force along y axis of the pin support is ');
            if F_Y > 0
                disp(F_Y);
                disp('the direction of the reaction force along y axis is upward');
            elseif F_Y < 0;
                F_Y1 = - F_Y;
                disp(F_Y1);
                disp('the direction of the reaction force along y axis is downward');
            else
                disp(F_Y);
            end
            
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
            F_pin = [D_P ; F_Y];
            F_pin = [zeros(2,((D_P -0)/x_i)) F_pin  zeros(2,((L - D_P)/x_i))];
            F_pin(1,:)= 0;
            
            % calculate final load
            F_load = F_distributed_load + F_pointload1 + F_pointload2 + F_pointload3 + F_pin + beam_base;
            
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
            
            % plot the shear force diagram and the bending moment diagram
            
            subplot(1,2,1);
            plot (V(1,:),V(2,:));
            title('Shear Force Diagram');
            xlabel('distance x (m)');
            ylabel('Shear force V (kN)') ;
            
            subplot(1,2,2);
            plot (BM(1,:),BM(2,:));
            title('Bending Moment Diagram');
            xlabel('distance x (m)');
            ylabel('Bending Moment M (kN*m)') ;
            
            
        else
            disp('The beam is not in a state of equilibrium.');
            
        end
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
    case 4
        %for one pin support and one roller support
        moment_id = menu('Choose the moment direction','counterclockwise moment','clockwise moment');
        
        M_1 = input('Magnitude of Moment_1: ');
        while M_1 < 0
            dips('The magnitude of the moment_1 has to be positive');
            M_1 = input('Please input the magnitude of the moment_1 which is positive: ');
        end
        D_M_1 = input('Please input the position of the moment_1: ');
        
        switch moment_id
            case 1
                % for counterclockwise moment
                
                
            case 2
                % for clockwise moment
                M_1 = - M_1;
                
        end
        
        
        moment_id = menu('Choose the moment direction','counterclockwise moment','clockwise moment');
        
        M_2 = input('Magnitude of Moment_2: ');
        while M_2 < 0
            dips('The magnitude of the moment_2 has to be positive');
            M_2 = input('Please input the magnitude of the moment_2 which is positive: ');
        end
        D_M_2 = input('Please input the position of the moment_2: ');
        
        switch moment_id
            case 1
                % for counterclockwise moment
                
            case 2
                % for clockwise moment
                M_2 = - M_2;
                
        end
        
        moment_id = menu('Choose the moment direction','counterclockwise moment','clockwise moment');
        M_3 = input('Magnitude of Moment_3: ');
        while M_3 < 0
            dips('The magnitude of the moment_3 has to be positive');
            M_3 = input('Please input the magnitude of the moment_3 which is positive: ');
        end
        D_M_3 = input('Please input the position of the moment_3: ');
        
        switch moment_id
            case 1
                % for counterclockwise moment
                
            case 2
                % for clockwise moment
                M_3 = - M_3;
                
        end
        
        
        
        distributed_load_direction = menu('Choose the distributed load direction','downward','upward');
        
        L_i = input ('please input the start location: ') ;
        L_f = input ('please input the end location: ') ;
        
        while L_i >= L_f || L_i < 0 || L_f < 0 || L_f > L
            disp ('the start point must before the end point');
            disp ('both the start point and the end point should not be negative and should not be longer than the beam length');
            L_i = input ('please input the start location: ') ;
            L_f = input ('please input the end location: ') ;
        end
        
        w_i = input ('please input the start magnitude: ') ;
        w_f = input ('please input the end magnitude: ');
        x_i = 0.001;
        d_distributed_load = L_i:x_i:L_f ;
        
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
        
        switch distributed_load_direction
            case 1
                F_r = - F_r;
                F_distributed_load = - w * x_i ;
                M_r = - M_r;
            case 2
                
        end
        
        D_P = input('please input the location of the pin support: ');
        D_R = input('please input the location of the roller support: ');
        
        % calculate F_X & F_Y & M
        F_PX = 0 - (F_1*cosd(A_1)+F_2*cosd(A_2)+F_3*cosd(A_3));
        
        % the challenging part: three situations(no solution, unique
        % solution and infinitely many solutions) of solution of F_P and F_R
        
        Z_1 = -(F_1*sind(A_1)+F_2*sind(A_2)+F_3*sind(A_3)+F_r);
        Z_2 = -(M_1+M_2+M_3+M_r+F_1*sind(A_1)*D_1+F_2*sind(A_2)*D_2+F_3*sind(A_3)*D_3);
        
        F_Matrix = [1, 1, Z_1; D_P, D_R, Z_2];
        
        F_Matrix_developed = rref(F_Matrix) ;
        if F_Matrix_developed(2,1)== 0 && F_Matrix_developed(2,2) == 0 && F_Matrix_developed(2,3)== 0
            disp('The beam is in the state of equilibrium. However, the support reactions along y axis of pin and roller have infinitely many solutions.');
            
        elseif F_Matrix_developed(2,1)== 0 && F_Matrix_developed(2,2) == 0 && F_Matrix_developed(2,3) ~= 0
            disp('The beam is not in the state of equilibrium');
            
        else
            
            % display of F_PX
            disp('The reaction force of pin along x axis is');
            
            if F_PX > 0
                disp(F_PX);
                disp('the direction of the reaction force of pin along x axis is to the right');
            elseif F_PX < 0;
                F_PX = - F_PX;
                disp(F_PX);
                disp('the direction of the reaction force of pin along x axis is to the left');
            else
                disp(F_PX);
            end
            
            F_PY = F_Matrix_developed (1,3);
            F_R = F_Matrix_developed (2,3);
            
            % display of F_P
            disp('The reaction force of the pin along y axis is ');
            if F_PY > 0
                disp(F_PY);
                disp('the direction of the reaction force along y axis is upward');
            elseif F_PY < 0;
                F_PY1 = - F_PY;
                disp(F_PY1);
                disp('the direction of the reaction force along y axis is downward');
            else
                disp(F_PY);
            end
            
            disp('The reaction force of the roller along y axis is ');
            if F_R > 0
                disp(F_R);
                disp('the direction of the reaction force of the roller along y axis is upward');
            elseif F_R < 0;
                F_R1 = - F_R;
                disp(F_R1);
                disp('the direction of the reaction force of the roller along y axis is downward');
            else
                disp(F_R);
            end
            
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
            F_pin = [D_P ; F_PY];
            F_pin = [zeros(2,((D_P -0)/x_i)) F_pin  zeros(2,((L - D_P)/x_i))];
            F_pin(1,:)= 0;
            
            F_roller = [D_R ; F_R];
            F_roller = [zeros(2,((D_R -0)/x_i)) F_roller  zeros(2,((L - D_R)/x_i))];
            F_roller(1,:)= 0;
            
            % calculate final load
            F_load = F_distributed_load + F_pointload1 + F_pointload2 + F_pointload3 + F_pin + F_roller + beam_base;
            
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
            
            % plot the shear force diagram and the bending moment diagram
            
            subplot(1,2,1);
            plot (V(1,:),V(2,:));
            title('Shear Force Diagram');
            xlabel('distance x (m)');
            ylabel('Shear force V (kN)') ;
            
            subplot(1,2,2);
            plot (BM(1,:),BM(2,:));
            title('Bending Moment Diagram');
            xlabel('distance x (m)');
            ylabel('Bending Moment M (kN*m)') ;
            
        end
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
    case 5
        %for one roller support
        moment_id = menu('Choose the moment direction','counterclockwise moment','clockwise moment');
        
        M_1 = input('Magnitude of Moment_1: ');
        while M_1 < 0
            dips('The magnitude of the moment_1 has to be positive');
            M_1 = input('Please input the magnitude of the moment_1 which is positive: ');
        end
        D_M_1 = input('Please input the position of the moment_1: ');
        switch moment_id
            case 1
                % for counterclockwise moment
                
            case 2
                % for clockwise moment
                M_1 = - M_1;
                
        end
        
        
        moment_id = menu('Choose the moment direction','counterclockwise moment','clockwise moment');
        
        M_2 = input('Magnitude of Moment_2: ');
        while M_2 < 0
            dips('The magnitude of the moment_2 has to be positive');
            M_2 = input('Please input the magnitude of the moment_2 which is positive: ');
        end
        D_M_2 = input('Please input the position of the moment_2: ');
        switch moment_id
            case 1
                % for counterclockwise moment
                
            case 2
                % for clockwise moment
                M_2 = - M_2;
                
        end
        
        moment_id = menu('Choose the moment direction','counterclockwise moment','clockwise moment');
        M_3 = input('Magnitude of Moment_3: ');
        while M_3 < 0
            dips('The magnitude of the moment_3 has to be positive');
            M_3 = input('Please input the magnitude of the moment_3 which is positive: ');
        end
        D_M_3 = input('Please input the position of the moment_3: ');
        switch moment_id
            case 1
                % for counterclockwise moment
                
            case 2
                % for clockwise moment
                M_3 = - M_3;
                
        end
        
        
        
        distributed_load_direction = menu('Choose the distributed load direction','downward','upward');
        
        L_i = input ('please input the start location: ') ;
        L_f = input ('please input the end location: ') ;
        
        while L_i >= L_f || L_i < 0 || L_f < 0 || L_f > L
            disp ('the start point must before the end point');
            disp ('both the start point and the end point should not be negative and should not be longer than the beam length');
            L_i = input ('please input the start location: ') ;
            L_f = input ('please input the end location: ') ;
        end
        
        w_i = input ('please input the start magnitude: ') ;
        w_f = input ('please input the end magnitude: ');
        
        x_i = 0.001;
        d_distributed_load = L_i:x_i:L_f ;
        
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
        
        switch distributed_load_direction
            case 1
                F_r = - F_r;
                F_distributed_load = - w * x_i ;
                M_r = - M_r;
            case 2
                
        end
        
        D_R = input('please input the location of the roller support: ');
        
        
        % calculate F_X & F_Y & M
        sum_of_F_X = F_1*cosd(A_1)+F_2*cosd(A_2)+F_3*cosd(A_3);
        F_Y = 0 - (F_1*sind(A_1)+F_2*sind(A_2)+F_3*sind(A_3)+F_r);
        sum_of_M = M_1+M_2+M_3+M_r+F_1*sind(A_1)*D_1+F_2*sind(A_2)*D_2+F_3*sind(A_3)*D_3+F_Y*D_R;
        
        if sum_of_F_X ~= 0
            disp('The beam is not in the state of equilibrium');
        else
            if sum_of_M ~= 0
                disp('The beam is not in the state of equilibrium');
            else
                % formal display of F_Y
                disp('The reaction force of the roller along y axis is ');
                if F_Y > 0
                    disp(F_Y);
                    disp('the direction of the reaction force of the roller along y axis is upward');
                elseif F_Y < 0;
                    F_Y1 = - F_Y;
                    disp(F_Y1);
                    disp('the direction of the reaction force of the roller along y axis is downward');
                else
                    disp(F_Y);
                end
                
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
                
                % plot the shear force diagram and the bending moment diagram
                
                subplot(1,2,1);
                plot (V(1,:),V(2,:));
                title('Shear Force Diagram');
                xlabel('distance x (m)');
                ylabel('Shear force V (kN)') ;
                
                subplot(1,2,2);
                plot (BM(1,:),BM(2,:));
                title('Bending Moment Diagram');
                xlabel('distance x (m)');
                ylabel('Bending Moment M (kN*m)') ;
                
            end
        end
        
        
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
    case 6
        %for two roller supports
        moment_id = menu('Choose the moment direction','counterclockwise moment','clockwise moment');
        
        M_1 = input('Magnitude of Moment_1: ');
        while M_1 < 0
            dips('The magnitude of the moment_1 has to be positive');
            M_1 = input('Please input the magnitude of the moment_1 which is positive: ');
        end
        D_M_1 = input('Please input the position of the moment_1: ');
        switch moment_id
            case 1
                % for counterclockwise moment
                
            case 2
                % for clockwise moment
                M_1 = - M_1;
                
        end
        
        
        moment_id = menu('Choose the moment direction','counterclockwise moment','clockwise moment');
        
        M_2 = input('Magnitude of Moment_2: ');
        while M_2 < 0
            dips('The magnitude of the moment_2 has to be positive');
            M_2 = input('Please input the magnitude of the moment_2 which is positive: ');
        end
        D_M_2 = input('Please input the position of the moment_2: ');
        switch moment_id
            case 1
                % for counterclockwise moment
                
            case 2
                % for clockwise moment
                M_2 = - M_2;
                
        end
        
        moment_id = menu('Choose the moment direction','counterclockwise moment','clockwise moment');
        M_3 = input('Magnitude of Moment_3: ');
        while M_3 < 0
            dips('The magnitude of the moment_3 has to be positive');
            M_3 = input('Please input the magnitude of the moment_3 which is positive: ');
        end
        D_M_3 = input('Please input the position of the moment_3: ');
        switch moment_id
            case 1
                % for counterclockwise moment
                
            case 2
                % for clockwise moment
                M_3 = - M_3;
                
        end
        
        
        
        distributed_load_direction = menu('Choose the distributed load direction','downward','upward');
        
        L_i = input ('please input the start location: ') ;
        L_f = input ('please input the end location: ') ;
        
        while L_i >= L_f || L_i < 0 || L_f < 0 || L_f > L
            disp ('the start point must before the end point');
            disp ('both the start point and the end point should not be negative and should not be longer than the beam length');
            L_i = input ('please input the start location: ') ;
            L_f = input ('please input the end location: ') ;
        end
        
        w_i = input ('please input the start magnitude: ') ;
        w_f = input ('please input the end magnitude: ');
        
        x_i = 0.001;
        d_distributed_load = L_i:x_i:L_f ;
        
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
        
        switch distributed_load_direction
            case 1
                F_r = - F_r;
                F_distributed_load = - w * x_i ;
                M_r = - M_r;
            case 2
                
        end
        
        D_R_1 = input('please input the location of the roller 1: ');
        D_R_2 = input('please input the location of the roller 2: ');
        
        % calculate F_X & F_Y & M
        SUM_F_X = F_1*cosd(A_1)+F_2*cosd(A_2)+F_3*cosd(A_3);
        Z_1 = -(F_1*sind(A_1)+F_2*sind(A_2)+F_3*sind(A_3)+F_r);
        Z_2 = -(M_1+M_2+M_3+M_r+F_1*sind(A_1)*D_1+F_2*sind(A_2)*D_2+F_3*sind(A_3)*D_3);
        
        F_Matrix = [1, 1, Z_1 ; D_R_1, D_R_2, Z_2];
        F_Matrix_developed = rref(F_Matrix);
        
        if SUM_F_X ~= 0
            disp ('The beam is not in the state of equilibrium');
        else
            if F_Matrix_developed(2,1)== 0 && F_Matrix_developed(2,2) == 0 && F_Matrix_developed(2,3) == 0
                disp('The beam is in the state of equilibrium. However, the support reactions along y axis of pin and roller have infinitely many solutions.');
                
            elseif F_Matrix_developed(2,1)== 0 && F_Matrix_developed(2,2)== 0 && F_Matrix_developed(2,3) ~= 0
                disp('The beam is not in the state of equilibrium');
                
            else
                
                F_R_1 = F_Matrix_developed (1,3);
                F_R_2 = F_Matrix_developed (2,3);
                
                % formal display of F_R_1
                disp('The reaction force of the roller 1 along y axis is ');
                if F_R_1 > 0
                    disp(F_R_1);
                    disp('the direction of the reaction force of the roller 1 along y axis is upward');
                elseif F_R_1 < 0;
                    F_R_1_1 = - F_R_1;
                    disp(F_R_1_1);
                    disp('the direction of the reaction force of the roller 1 along y axis is downward');
                else
                    disp(F_R_1);
                end
                
                % the formal display of F_R_2
                disp('The reaction force of the roller 2 along y axis is ');
                if F_R_2 > 0
                    disp(F_R_2);
                    disp('the direction of the reaction force of the roller 2 along y axis is upward');
                elseif F_R_2 < 0;
                    F_R_2_1 = - F_R_2;
                    disp(F_R_2_1);
                    disp('the direction of the reaction force of the roller 2 along y axis is downward');
                else
                    disp(F_R_2);
                end
                
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
                F_roller_1 = [D_R_1 ; F_R_1];
                F_roller_1 = [zeros(2,((D_R_1 -0)/x_i)) F_roller_1  zeros(2,((L - D_R_1)/x_i))];
                F_roller_1(1,:)= 0;
                
                F_roller_2 = [D_R_2 ; F_R_2];
                F_roller_2 = [zeros(2,((D_R_2 -0)/x_i)) F_roller_2  zeros(2,((L - D_R_2)/x_i))];
                F_roller_2(1,:)= 0;
                
                % calculate final load
                F_load = F_distributed_load + F_pointload1 + F_pointload2 + F_pointload3 + F_roller_1 + F_roller_2 + beam_base;
                
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
                
                % plot the shear force diagram and the bending moment diagram
                
                subplot(1,2,1);
                plot (V(1,:),V(2,:));
                title('Shear Force Diagram');
                xlabel('distance x (m)');
                ylabel('Shear force V (kN)') ;
                
                subplot(1,2,2);
                plot (BM(1,:),BM(2,:));
                title('Bending Moment Diagram');
                xlabel('distance x (m)');
                ylabel('Bending Moment M (kN*m)') ;
                
            end
        end
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
