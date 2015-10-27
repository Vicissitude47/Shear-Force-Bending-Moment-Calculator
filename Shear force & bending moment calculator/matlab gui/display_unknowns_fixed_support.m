function [string1,string2,string3] = display_unknowns_fixed_support(F_X,F_Y,M)

% display of F_X
string1 = 'The reaction force along x axis of the fixed support is ';
string2 = 'The reaction force along y axis of the fixed support is ';
string3 = 'The reaction moment of the fixed support is ';

if F_X > 0
    string_F_X = num2str(F_X);
    string1 = char([string1,string_F_X,'kN.'], 'The direction of the reaction force along x axis is to the right.');
elseif F_X < 0;
    string_F_X = num2str(-F_X);
    string1 = char([string1,string_F_X,'kN.'], 'The direction of the reaction force along x axis is to the left.');
else
    string_F_X = num2str(F_X);
    string1 = char([string1,string_F_X,'kN.']);
end

% display of F_Y
if F_Y > 0
    string_F_Y = num2str(F_Y);
    string2 = char([string2,string_F_Y,'kN.'],'The direction of the reaction force along y axis is upward.');
elseif F_Y < 0;
    string_F_Y = num2str(-F_Y);
    string2 = char([string2,string_F_Y,'kN.'],'The direction of the reaction force along y axis is downward.');
else
    string_F_Y = num2str(F_Y);
    string2 = char([string2,string_F_Y,'kN.']);
end

% display of M
if M > 0
    string_M =  num2str(M);
    string3 = char([string3,string_M,'kN*m.'],'The direction of moment is counterclockwise.');
elseif M < 0;
    string_M = num2str(M);
    string3 = char([string3,string_M,'kN*m.'],'. The direction of moment is clockwise.');
else
    string_M =  num2str(M) ;
    string3 = char([string3,string_M,'kN*m.']);
end
end