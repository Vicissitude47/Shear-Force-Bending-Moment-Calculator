function varargout = button(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @button_OpeningFcn, ...
    'gui_OutputFcn',  @button_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

% opening function
function button_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);

% create function
function load_direction_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function momentdirection1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function momentdirection2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function momentdirection3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function axes1_CreateFcn(hObject, eventdata, handles)

function uitable4_CreateFcn(hObject, eventdata, handles)



% output function
function varargout = button_OutputFcn(hObject, eventdata, handles)

varargout{1} = handles.output;


% call back
function length_L_Callback(hObject, eventdata, handles)
handles = guidata(hObject);

while 1
    
    prompt = {'Enter the length of the beam L (m)'};
    title = 'Length dialog box';
    numlines = 1;
    defaults = {''};
    options.Resize = 'on';
    options.WindowStyle = 'normal';
    options.Interpreter = 'none';
    inputvalues = inputdlg(prompt,title,numlines,defaults,options);
    
    if isempty(inputvalues)
        break;
    else
        handles.L = str2double(inputvalues{1});
    end
    
    if handles.L >0
        break;
    else
        errordlg('The length of the beam cannot be less than or equal to zero. Please input a positive value for the length of the beam', 'input error');
    end
end
guidata(hObject,handles);

function Situation_Callback(hObject, eventdata, handles)
handles = guidata(hObject);

if isfield (handles,'L') == 0
    errordlg('Please input Length of the beam first.')
else
    handles.support_reaction_id = menu_support_reaction_id;
    % input specical location
    switch handles.support_reaction_id
        
        case 1
            % for fixed support on the left/right
            handles.fixed_support = menu('Choose the situation for fixed support','Fixed support on the left','Fixed support on the right');
            switch handles.fixed_support
                case 1
                    % fixed support on the left
                case 2
                    % fixed support on the right
            end
            
        case 2
            %for one pin support
            prompt = {'Enter the location of the pin (m)'};
            title = 'Pin dialog box';
            numlines = 1;
            defaults = {'0'};
            options.Resize = 'on';
            options.WindowStyle = 'normal';
            options.Interpreter = 'none';
            while 1
                inputvalues = inputdlg(prompt,title,numlines,defaults,options);
                
                if isempty(inputvalues)
                    break;
                else
                    % get location of pin
                    handles.D_P = str2double(inputvalues{1});
                    if handles.D_P > handles.L || handles.D_P < 0 || isnan(handles.D_P)
                        errordlg('Location of pin cannot be longer than the length of the beam or be negative or empty(NaN). Please input the location of pin which is shorter than the length of the beam and is positive or zero.','input error');
                    else
                        break;
                    end
                end
            end
        case 3
            %for one pin support and one roller support
            prompt = {'Enter the location of the pin (m)','Enter the location of the roller (m)'};
            title = 'Pin and Roller dialog box';
            numlines = 1;
            defaults = {'0','0'};
            options.Resize = 'on';
            options.WindowStyle = 'normal';
            options.Interpreter = 'none';
            while 1
                inputvalues = inputdlg(prompt,title,numlines,defaults,options);
                
                if isempty(inputvalues)
                    break;
                else
                    % get location of pin and roller
                    handles.D_P = str2double(inputvalues{1});
                    handles.D_R = str2double(inputvalues{2});
                    if handles.D_P > handles.L || handles.D_P < 0 || isnan(handles.D_P)
                        errordlg('Location of pin cannot be longer than the length of the beam or be negative or empty(NaN). Please input the location of pin which is shorter than the length of the beam and is positive or zero.','input error');
                    elseif handles.D_R > handles.L || handles.D_R < 0 || isnan(handles.D_R)
                        errordlg('Location of roller cannot be longer than the length of the beam or be negative or empty(NaN). Please input the location of roller which is shorter than the length of the beam and is positive or zero.','input error');
                    elseif handles.D_P == handles.D_R
                        errordlg('Location of pin and location of roller cannot be same. Please input them again.','input error')
                    else
                        break;
                    end
                end
            end
            
        case 4
            %for one roller support
            prompt = {'Enter the location of the roller (m)'};
            title = 'Roller dialog box';
            numlines = 1;
            defaults = {'0'};
            options.Resize = 'on';
            options.WindowStyle = 'normal';
            options.Interpreter = 'none';
            while 1
                inputvalues = inputdlg(prompt,title,numlines,defaults,options);
                
                if isempty(inputvalues)
                    break;
                else
                    % get location of roller
                    handles.D_R = str2double(inputvalues{1});
                    if handles.D_R > handles.L || handles.D_R < 0 || isnan(handles.D_R)
                        errordlg('Location of roller cannot be longer than the length of the beam or be negative or empty(NaN). Please input the location of roller which is shorter than the length of the beam and is positive or zero.','input error');
                    else
                        break;
                    end
                end
            end
            
        case 5
            %for two roller supports
            prompt = {'Enter the location of the roller 1 (m)','Enter the location of the roller 2 (m)'};
            title = 'Rollers dialog box';
            numlines = 1;
            defaults = {'0','0'};
            options.Resize = 'on';
            options.WindowStyle = 'normal';
            options.Interpreter = 'none';
            while 1
                inputvalues = inputdlg(prompt,title,numlines,defaults,options);
                
                if isempty(inputvalues)
                    break;
                else
                    % get location of rollers
                    handles.D_R_1 = str2double(inputvalues{1});
                    handles.D_R_2 = str2double(inputvalues{2});
                    if handles.D_R_1 > handles.L || handles.D_R_1 < 0 || isnan(handles.D_R_1)
                        errordlg('Location of roller 1 cannot be longer than the length of the beam or be negative or empty(NaN). Please input the location of roller 1 which is shorter than the length of the beam and is positive or zero.','input error');
                    elseif handles.D_R_2 > handles.L || handles.D_R_2 < 0 || isnan(handles.D_R_2)
                        errordlg('Location of roller 2 cannot be longer than the length of the beam or be negative or empty(NaN). Please input the location of roller 2 which is shorter than the length of the beam and is positive or zero.','input error');
                    elseif handles.D_R_1 == handles.D_R_2
                        errordlg('Locations of rollers cannot be same. Please input them again.','input error')
                    else
                        break;
                    end
                end
            end
    end
end
guidata(hObject,handles);


function force_f_Callback(hObject, eventdata, handles)
handles = guidata(hObject);

% check L
if isfield (handles,'L') == 0
    errordlg('Please input Length of the beam first.')
else
    
    % inputdlg
    prompt = {'Enter the magnitude of the force 1 (kN)','Enter the angle of the force 1 measured from x axis (degree)','Enter the location of the force 1 (m)','Enter the magnitude of the force 2 (kN)','Enter the angle of the force 2 measured from x axis (degree)','Enter the location of the force 2 (m)','Enter the magnitude of the force 3 (kN)','Enter the angle of the force 3 (degree)','Enter the location of the force 3 (m)'};
    title = 'Point Force dialog box';
    numlines = 1;
    defaults = {'0','0','0','0','0','0','0','0','0'};
    options.Resize = 'on';
    options.WindowStyle = 'normal';
    options.Interpreter = 'none';
    
    while 1
        inputvalues = inputdlg(prompt,title,numlines,defaults,options);
        
        if isempty(inputvalues)
            break;
        else
            % get angle
            handles.A_1 = str2double(inputvalues{2});
            handles.A_2 = str2double(inputvalues{5});
            handles.A_3 = str2double(inputvalues{8});
            
            % get location
            handles.D_1 = str2double(inputvalues{3});
            handles.D_2 = str2double(inputvalues{6});
            handles.D_3 = str2double(inputvalues{9});
            
            % get force
            handles.F_1 = str2double(inputvalues{1});
            handles.F_2 = str2double(inputvalues{4});
            handles.F_3 = str2double(inputvalues{7});
            
            % angle check
            if isnan(handles.A_1)
                errordlg('Angle 1 can not be empty(NaN). Please input Angle 1 again','input error');
            elseif isnan(handles.A_2)
                errordlg('Angle 2 can not be empty(NaN). Please input Angle 2 again','input error');
            elseif isnan(handles.A_3)
                errordlg('Angle 3 can not be empty(NaN). Please input Angle 3 again','input error');
                % location check
            elseif handles.D_1 > handles.L || handles.D_1 < 0 || isnan(handles.D_1)
                errordlg('Location of Force 1 cannot be longer than the length of the beam or be negative or empty(NaN). Please input the location of force 1 which is shorter than the length of the beam and is positive or zero.','input error');
            elseif handles.D_2 > handles.L || handles.D_2 < 0 || isnan(handles.D_2)
                errordlg('Location of Force 1 cannot be longer than the length of the beam or be negative or empty(NaN). Please input the location of force 1 which is shorter than the length of the beam and is positive or zero.','input error');
            elseif handles.D_3 > handles.L || handles.D_3 < 0 || isnan(handles.D_3)
                errordlg('Location of Force 1 cannot be longer than the length of the beam or be negative or empty(NaN). Please input the location of force 1 which is shorter than the length of the beam and is positive or zero.','input error');
                % force check
            elseif handles.F_1 < 0 || isnan(handles.F_1)
                errordlg('The magnitude of Force 1 cannot be negative or empty(NaN). Please input the magnitude of Force 1 which is positive or zero.','input error');
            elseif handles.F_2 < 0 || isnan(handles.F_2)
                errordlg('The magnitude of Force 2 cannot be negative. Please input the magnitude of Force 2 which is positive or zero.','input error');
            elseif handles.F_3 < 0 || isnan(handles.F_3)
                errordlg('The magnitude of Force 3 cannot be negative. Please input the magnitude of Force 3 which is positive or zero.','input error');
            else
                break;
            end
        end
    end
end
guidata(hObject,handles);

function momentdirection1_Callback(hObject, eventdata, handles)
handles = guidata(hObject);

contents = cellstr(get(hObject,'String'));
momentdirection1 = contents{get(hObject,'Value')};
if strcmp(momentdirection1, 'Counterclockwise')
    handles.momentdirection_1 = 1;
else
    handles.momentdirection_1 = -1;
end

guidata(hObject,handles);

function momentdirection2_Callback(hObject, eventdata, handles)
handles = guidata(hObject);

contents = cellstr(get(hObject,'String'));
momentdirection2 = contents{get(hObject,'Value')};
if strcmp(momentdirection2, 'Counterclockwise')
    handles.momentdirection_2 = 1;
else
    handles.momentdirection_2 = -1;
end

guidata(hObject,handles);

function momentdirection3_Callback(hObject, eventdata, handles)
handles = guidata(hObject);

contents = cellstr(get(hObject,'String'));
momentdirection3 = contents{get(hObject,'Value')};
if strcmp(momentdirection3, 'Counterclockwise')
    handles.momentdirection_3 = 1;
else
    handles.momentdirection_3 = -1;
end

guidata(hObject,handles);

function Moment_Callback(hObject, eventdata, handles)

handles = guidata(hObject);

% check L
if isfield (handles,'L') == 0
    errordlg('Please input Length of the beam first.')
else
    
    % inputdlg
    prompt = {'Enter the magnitude of the moment 1 (kN*m)','Enter the location of the moment 1 (m)','Enter the magnitude of the moment 2 (kN*m)','Enter the location of the moment 2 (m)','Enter the magnitude of the moment 3 (kN*m)','Enter the location of the moment 3 (m)'};
    title = 'Point Moment dialog box';
    numlines = 1;
    defaults = {'0','0','0','0','0','0'};
    options.Resize = 'on';
    options.WindowStyle = 'normal';
    options.Interpreter = 'none';
    
    while 1
        inputvalues = inputdlg(prompt,title,numlines,defaults,options);
        
        if isempty(inputvalues)
            break;
        elseif isfield(handles,'momentdirection_1') == 0
            errordlg('Please select the direction of the moment 1.')
            break;
        elseif isfield(handles,'momentdirection_2') == 0
            errordlg('Please select the direction of the moment 2.')
            break;
        elseif isfield(handles,'momentdirection_3') == 0
            errordlg('Please select the direction of the moment 3.')
            break;
        else
            
            % get location
            handles.D_M_1 = str2double(inputvalues{2});
            handles.D_M_2 = str2double(inputvalues{4});
            handles.D_M_3 = str2double(inputvalues{6});
            
            % get Moment
            handles.M_1 = str2double(inputvalues{1});
            handles.M_2 = str2double(inputvalues{3});
            handles.M_3 = str2double(inputvalues{5});
            
            % LOCATION CHECK
            if handles.D_M_1 > handles.L || handles.D_M_1 < 0 || isnan(handles.D_M_1)
                errordlg('Location of Moment 1 cannot be longer than the length of the beam or be negative or empty(NaN). Please input the location of Moment 1 which is shorter than the length of the beam and is positive or zero.','input error');
            elseif handles.D_M_2 > handles.L || handles.D_M_2 < 0 || isnan(handles.D_M_2)
                errordlg('Location of Moment 2 cannot be longer than the length of the beam or be negative or empty(NaN). Please input the location of Moment 2 which is shorter than the length of the beam and is positive or zero.','input error');
            elseif handles.D_M_3 > handles.L || handles.D_M_3 < 0 || isnan(handles.D_M_3)
                errordlg('Location of Moment 3 cannot be longer than the length of the beam or be negative or empty(NaN). Please input the location of Moment 3 which is shorter than the length of the beam and is positive or zero.','input error');
                % Moment CHECK
            elseif handles.M_1 < 0 || isnan(handles.M_1)
                errordlg('The magnitude of Moment 1 cannot be negative or empty(NaN). Please input the magnitude of Moment 1 which is positive or zero.','input error');
            elseif handles.M_2 < 0 || isnan(handles.M_2)
                errordlg('The magnitude of Moment 2 cannot be negative or empty(NaN). Please input the magnitude of Moment 2 which is positive or zero.','input error');
            elseif handles.M_3 < 0 || isnan(handles.M_3)
                errordlg('The magnitude of Moment 3 cannot be negative or empty(NaN). Please input the magnitude of Moment 3 which is positive or zero.','input error');
            else
                
                handles.M_1 = handles.momentdirection_1 * handles.M_1;
                handles.M_2 = handles.momentdirection_2 * handles.M_2;
                handles.M_3 = handles.momentdirection_3 * handles.M_3;
                
                break;
            end
        end
    end
end
guidata(hObject,handles);


function load_direction_Callback(hObject, eventdata, handles)

handles = guidata(hObject);

contents = cellstr(get(hObject,'String'));
load_direction = contents{get(hObject,'Value')};
if strcmp(load_direction, 'Upward loading')
    handles.direction = 1;
else
    handles.direction = -1;
end

guidata(hObject,handles);


function Distributed_load_Callback(hObject, eventdata, handles)
handles = guidata(hObject);

% check L
if isfield (handles,'L') == 0
    errordlg('Please input Length of the beam first.')
elseif isfield(handles,'direction') == 0
    errordlg('Please select the direction of the distributed load.')
else
    
    % inputdlg
    prompt = {'Enter the start location of distributed load (m)','Enter the end location of distributed load (m)','Enter the start magnitude of distributed load (kN/m)','Enter the end magnitude of distributed load (kN/m)'};
    title = 'Distributed Load dialog box';
    numlines = 1;
    defaults = {'0',num2str(handles.L),'0','0'};
    options.Resize = 'on';
    options.WindowStyle = 'normal';
    options.Interpreter = 'none';
    
    while 1
        inputvalues = inputdlg(prompt,title,numlines,defaults,options);
        
        if isempty(inputvalues)
            break;
        else
            
            % get location
            handles.L_i = str2double(inputvalues{1});
            handles.L_f = str2double(inputvalues{2});
            
            % get loading
            handles.w_i = str2double(inputvalues{3});
            handles.w_f = str2double(inputvalues{4});
            
            % location check
            if handles.L_i > handles.L || handles.L_i < 0 || isnan(handles.L_i)
                errordlg('The start location of distributed load cannot be longer than the length of the beam or be negative or empty(NaN). Please input the start location of distributed load.','input error');
            elseif handles.L_f > handles.L || handles.L_f < 0 || isnan(handles.L_f)
                errordlg('The end location of distributed load cannot be longer than the length of the beam or be negative or empty(NaN). Please input the end location of distributed load.','input error');
            elseif handles.L_i >= handles.L_f
                errordlg('The start location of the distributed load must less than the end location of the distributed load.','input error');
                % loading check
            elseif handles.w_i < 0 || isnan(handles.w_i)
                errordlg('The start magnitude of distributed load must not be negative or empty(NaN). Please input a positive (or zero) start magnitude of distributed load','input error');
            elseif handles.w_f < 0 || isnan(handles.w_f)
                errordlg('The end magnitude of distributed load must not be negative or empty(NaN). Please input a positive (or zero) end magnitude of distributed load','input error');
            else
                
                % calculate distributed load
                
                handles.x_i = 0.001;
                handles.d_distributed_load = handles.L_i:handles.x_i:handles.L_f ;
                
                [handles.F_r,handles.M_r,handles.F_distributed_load,handles.w] = calculation_distributed_load(handles.x_i,handles.d_distributed_load,handles.w_i,handles.w_f,handles.L_i,handles.L_f);
                
                handles.F_r = handles.direction * handles.F_r;
                handles.F_distributed_load = handles.direction * handles.w * handles.x_i ;
                handles.M_r = handles.direction * handles.M_r;
                
                break;
            end
        end
    end
end
guidata(hObject,handles);


function solve_button_Callback(hObject, eventdata, handles)
handles = guidata(hObject);

if isfield (handles,'L') == 0 || isfield (handles,'F_1') == 0 || isfield (handles,'F_2') == 0 || isfield (handles,'F_3') == 0 || isfield (handles,'A_1') == 0 || isfield (handles,'A_2') == 0 || isfield (handles,'A_3') == 0 || isfield (handles,'D_1') == 0 || isfield (handles,'D_2') == 0 || isfield (handles,'D_3') == 0 || isfield (handles,'M_1') == 0 || isfield (handles,'M_2') == 0 || isfield (handles,'M_3') == 0 || isfield (handles,'D_M_1') == 0 || isfield (handles,'D_M_2') == 0 || isfield (handles,'D_M_3') == 0 || isfield (handles,'L_i') == 0 || isfield (handles,'L_f') == 0 || isfield (handles,'M_r') == 0 || isfield (handles,'F_r') == 0
    errordlg('You have not input enough variables. Please input enough variables.')
else
    switch handles.support_reaction_id
        case 1
            % for fixed support on the left/right
            
            switch handles.fixed_support
                case 1
                    
                    % Fixed support on the left
                    [handles.F_X,handles.F_Y,handles.M,string1,string2,string3] = calculation_fixed_support_left(handles.F_1,handles.A_1,handles.D_1,handles.M_1,handles.F_2,handles.A_2,handles.D_2,handles.M_2,handles.F_3,handles.A_3,handles.D_3,handles.M_3,handles.M_r,handles.F_r);
                    
                    % display (unknowns) text in GUI
                    colwidth = 80;
                    pos = [300 37 10 20];
                    ht = uicontrol('Style','Text','Position',pos);
                    string = {string1,string2,string3};
                    outstring = textwrap(ht,string,colwidth);
                    set(ht,'Units','characters')
                    newpos = get(ht,'Position');
                    newpos(3) = colwidth;
                    newpos(4) = length(outstring)+1 ;
                    set(ht,'String',outstring,'Position',newpos)
                    
                    % shear force and bending moment calculation and plot
                    [handles.V,handles.BM] = shear_bending_data_fixed_support_left(handles.F_distributed_load,handles.L,handles.L_i,handles.L_f,handles.D_1,handles.F_1,handles.A_1,handles.D_2,handles.F_2,handles.A_2,handles.D_3,handles.F_3,handles.A_3,handles.F_Y,handles.D_M_1,handles.M_1,handles.D_M_2,handles.M_2,handles.D_M_3,handles.M_3,handles.M);
                    
                case 2
                    % Fixed support on the right
                    [handles.F_X,handles.F_Y,handles.M,string1,string2,string3] = calculation_fixed_support_right(handles.L,handles.F_1,handles.A_1,handles.D_1,handles.M_1,handles.F_2,handles.A_2,handles.D_2,handles.M_2,handles.F_3,handles.A_3,handles.D_3,handles.M_3,handles.M_r,handles.F_r);
                    
                    % display (unknowns) text in GUI
                    colwidth = 80;
                    pos = [300 37 10 20];
                    ht = uicontrol('Style','Text','Position',pos);
                    string = {string1,string2,string3};
                    outstring = textwrap(ht,string,colwidth);
                    set(ht,'Units','characters')
                    newpos = get(ht,'Position');
                    newpos(3) = colwidth;
                    newpos(4) = length(outstring)+1 ;
                    set(ht,'String',outstring,'Position',newpos)
                    
                    % shear force and bending moment calculation and plot
                    [handles.V,handles.BM] = shear_bending_data_fixed_support_right(handles.F_distributed_load,handles.L,handles.L_i,handles.L_f,handles.D_1,handles.F_1,handles.A_1,handles.D_2,handles.F_2,handles.A_2,handles.D_3,handles.F_3,handles.A_3,handles.F_Y,handles.D_M_1,handles.M_1,handles.D_M_2,handles.M_2,handles.D_M_3,handles.M_3,handles.M);
            end
            
        case 2
            % check D_P
            if isfield (handles,'D_P') == 0
                errordlg('You have not input value for the location of the pin. Please input the location of the pin')
            else
                
                % for one pin support
                [F_X,handles.F_Y,M] = calculation_one_pin_support(handles.D_1,handles.F_1,handles.A_1,handles.D_2,handles.F_2,handles.A_2,handles.D_3,handles.F_3,handles.A_3,handles.M_1,handles.M_2,handles.M_3,handles.F_r,handles.M_r,handles.D_P);
                
                if M ~= 0
                    
                    string1 = 'The beam is not in a state of equilibrium.';
                    
                else
                    % display of F_X
                    string1 = 'The reaction force along x axis of the pin support is ';
                    if F_X > 0
                        string_F_X = num2str(F_X);
                        string1 = char([string1,string_F_X,'.'],'The direction of the reaction force along x axis is to the right. ');
                    elseif F_X < 0;
                        string_F_X = num2str(-F_X);
                        string1 = char([string1,string_F_X,'.'],'The direction of the reaction force along x axis is to the left.');
                    else
                        string_F_X = num2str(F_X);
                        string1 = char([string1,string_F_X,'.']);
                    end
                    
                    % display of F_Y
                    string2 = 'The reaction force along y axis of the pin support is ';
                    if handles.F_Y > 0
                        string_F_Y = num2str(handles.F_Y);
                        string2 = char([string2,string_F_Y,'.'],'The direction of the reaction force along y axis is upward.');
                    elseif handles.F_Y < 0;
                        string_F_Y = num2str(-handles.F_Y);
                        string2 = char([string2,string_F_Y,'.'],'The direction of the reaction force along y axis is downward.');
                    else
                        string_F_Y = num2str(handles.F_Y);
                        string2 = char([string2,string_F_Y,'.']);
                    end
                    
                    string1 = char(string1, string2);
                    
                    % the function for shear force and bending moment
                    [handles.V,handles.BM] = shear_bending_data_one_pin(handles.F_distributed_load,handles.L,handles.L_i,handles.L_f,handles.D_1,handles.F_1,handles.A_1,handles.D_2,handles.F_2,handles.A_2,handles.D_3,handles.F_3,handles.A_3,handles.F_Y,handles.D_M_1,handles.M_1,handles.D_M_2,handles.M_2,handles.D_M_3,handles.M_3,handles.D_P);
                end
                
                % display (unknowns) text in GUI
                colwidth = 80;
                pos = [300 37 10 20];
                ht = uicontrol('Style','Text','Position',pos);
                string = {string1};
                outstring = textwrap(ht,string,colwidth);
                set(ht,'Units','characters')
                newpos = get(ht,'Position');
                newpos(3) = colwidth;
                newpos(4) = length(outstring)+1 ;
                set(ht,'String',outstring,'Position',newpos)
            end
            
        case 3
            % check D_P and D_R
            if isfield (handles,'D_P') == 0 || isfield (handles,'D_R') == 0
                errordlg('You have not input value for the location of the pin or roller. Please input the location of the pin and the roller')
            else
                
                % for one pin support and one roller support
                [~,~,string1,string2,string3,handles.V,handles.BM] = calculation_one_pin_one_roller(handles.F_distributed_load,handles.L,handles.L_i,handles.L_f,handles.D_1,handles.F_1,handles.A_1,handles.D_2,handles.F_2,handles.A_2,handles.D_3,handles.F_3,handles.A_3,handles.D_M_1,handles.M_1,handles.D_M_2,handles.M_2,handles.D_M_3,handles.M_3,handles.F_r,handles.M_r,handles.D_P,handles.D_R);
                
                % display (unknowns) text in GUI
                colwidth = 80;
                pos = [300 37 10 20];
                ht = uicontrol('Style','Text','Position',pos);
                string = {string1,string2,string3};
                outstring = textwrap(ht,string,colwidth);
                set(ht,'Units','characters')
                newpos = get(ht,'Position');
                newpos(3) = colwidth;
                newpos(4) = length(outstring)+1 ;
                set(ht,'String',outstring,'Position',newpos)
                
            end
            
        case 4
            % check D_R
            if isfield (handles,'D_R') == 0
                errordlg('You have not input value for the location of the roller. Please input the location of the roller')
            else
                % calculation for one roller support
                [sum_of_F_X,F_Y,sum_of_M] = calculation_one_roller (handles.D_1,handles.F_1,handles.A_1,handles.D_2,handles.F_2,handles.A_2,handles.D_3,handles.F_3,handles.A_3,handles.M_1,handles.M_2,handles.M_3,handles.M_r,handles.F_r,handles.D_R);
                
                % string determination
                if sum_of_F_X ~= 0
                    string1 = 'The beam is not in the state of equilibrium.';
                else
                    if sum_of_M ~= 0
                        string1 = 'The beam is not in the state of equilibrium.';
                    else
                        string1 = 'The reaction force of the roller along y axis is ';
                        
                        if F_Y > 0
                            string_F_Y = num2sr(F_Y);
                            string1 = char([string1,string_F_Y,'.'],'The direction of the reaction force of the roller along y axis is upward');
                        elseif F_Y < 0;
                            string_F_Y = num2str(-F_Y);
                            string1 = char([string1,string_F_Y,'.'],'The direction of the reaction force of the roller along y axis is downward');
                        else
                            string_F_Y = num2str(F_Y);
                            string1 = char([string1,string_F_Y,'.']);
                        end
                        
                        % plotting shear bending diagram
                        [handles.V,handles.BM] = shear_bending_data_one_pin(handles.F_distributed_load,handles.L,handles.L_i,handles.L_f,handles.D_1,handles.F_1,handles.A_1,handles.D_2,handles.F_2,handles.A_2,handles.D_3,handles.F_3,handles.A_3,hadnles.F_Y,handles.D_M_1,handles.M_1,handles.D_M_2,handles.M_2,handles.D_M_3,handles.M_3,handles.D_P);
                        
                    end
                end
                
                % display (unknowns) text in GUI
                colwidth = 80;
                pos = [300 37 10 20];
                ht = uicontrol('Style','Text','Position',pos);
                string = {string1};
                outstring = textwrap(ht,string,colwidth);
                set(ht,'Units','characters')
                newpos = get(ht,'Position');
                newpos(3) = colwidth;
                newpos(4) = length(outstring)+1 ;
                set(ht,'String',outstring,'Position',newpos)
                
            end
            
        case 5
            % check D_R_1 and D_R_2
            if isfield (handles,'D_R_1') == 0 || isfield (handles,'D_R_2') == 0
                errordlg('You have not input value for the location of the roller 1 or roller 2. Please input the location of the roller 1 and the roller 2')
            else
                
                %for two roller supports
                [~,~,~,~,string1,string2,handles.V,handles.BM] = calculation_two_roller (handles.F_distributed_load,handles.L,handles.L_i,handles.L_f,handles.D_1,handles.F_1,handles.A_1,handles.D_2,handles.F_2,handles.A_2,handles.D_3,handles.F_3,handles.A_3,handles.D_M_1,handles.M_1,handles.D_M_2,handles.M_2,handles.D_M_3,handles.M_3,handles.F_r,handles.M_r,handles.D_R_1,handles.D_R_2);
                
                % display (unknowns) text in GUI
                colwidth = 80;
                pos = [300 37 10 20];
                ht = uicontrol('Style','Text','Position',pos);
                string = {string1,string2};
                outstring = textwrap(ht,string,colwidth);
                set(ht,'Units','characters')
                newpos = get(ht,'Position');
                newpos(3) = colwidth;
                newpos(4) = length(outstring)+1 ;
                set(ht,'String',outstring,'Position',newpos)
                
            end
    end
end

guidata(hObject,handles);


function shade_Callback(hObject, eventdata, handles)
handles = guidata(hObject);

shade = get(hObject,'Value');
if isfield (handles,'V') == 0 || isfield (handles,'BM') == 0
    errordlg('push the solve button first.')
else
    if shade == 1
        subplot(1,2,1);
        shade_on(handles.V)
        subplot(1,2,2);
        shade_on(handles.BM)
    else
        % shade off
        shear_bending_plot (handles.V,handles.BM)
    end
end
guidata(hObject,handles);


function exit_program_Callback(hObject, eventdata, handles)
disp('god bless you!')
close all

function Readme_Callback(hObject, eventdata, handles)
fid = fopen('readme.txt');
str = textscan(fid, '%s', 'Delimiter','\n'); str = str{1};
fclose(fid);
f=figure;
hPan = uipanel(f,'Units','normalized');
uicontrol(hPan, 'Style','listbox', ...
'HorizontalAlignment','left', ...
'Units','normalized', 'Position',[0 0 1 1], ...
'String',str);