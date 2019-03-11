function varargout = proj_gui(varargin)
% PROJ_GUI MATLAB code for proj_gui.fig
%      PROJ_GUI, by itself, creates a new PROJ_GUI or raises the existing
%      singleton*.
%
%      H = PROJ_GUI returns the handle to a new PROJ_GUI or the handle to
%      the existing singleton*.
%
%      PROJ_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJ_GUI.M with the given input arguments.
%
%      PROJ_GUI('Property','Value',...) creates a new PROJ_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before proj_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to proj_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help proj_gui

% Last Modified by GUIDE v2.5 26-Feb-2019 12:36:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @proj_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @proj_gui_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before proj_gui is made visible.
function proj_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to proj_gui (see VARARGIN)

% Choose default command line output for proj_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes proj_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = proj_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function matrix_Callback(hObject, eventdata, handles)
% hObject    handle to matrix (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of matrix as text
%        str2double(get(hObject,'String')) returns contents of matrix as a double


% --- Executes during object creation, after setting all properties.
function matrix_CreateFcn(hObject, eventdata, handles)
% hObject    handle to matrix (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on selection change in operation.
function operation_Callback(hObject, eventdata, handles)
% hObject    handle to operation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns operation contents as cell array
%        contents{get(hObject,'Value')} returns selected item from operation


% --- Executes during object creation, after setting all properties.
function operation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to operation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in OK.
function OK_Callback(hObject, eventdata, handles)
% hObject    handle to OK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.result_b.String='';
handles.result_a.String='';
handles.result_b_title.String='';
handles.result_a_title.String='';
matrix=str2num(get(handles.matrix,'string'));
b=str2num(get(handles.b,'string'));
option = get(handles.operation,'Value');
switch option
    case 1  %for all matrix
        [mi ma] = get_extremum(matrix);
        mi = num2str(mi);
        ma = num2str(ma);
        handles.result_a_title.String='min/max ';
        handles.result_a.String=['minimum=',mi, '   maximum=', ma ];
    case {2,3}    %min and max
        switch option
            case 2  %only for rows
                mi = get_lines_min(matrix);
                ma = get_lines_max(matrix);
                type = '	row ';
                handles.result_a_title.String='min/max in a row ';
            case 3  %only for columns
                mi = get_columns_min(matrix);
                ma = get_columns_max(matrix);
                type = 'column';
                handles.result_a_title.String='min/max in a column ';
        end
        str='';
        for i=1:size(mi,2)
            str=[str type num2str(i) ':' '  minimum= ' num2str(mi(i)) '     maximum= ' num2str(ma(i)) '.        '];
        end
        handles.result_a.String=str;
    case 4  %for all matrix
            [s, mea, med] = get_matrice_smm(matrix);
            handles.result_a_title.String='sum, mean and median of matrix';
            handles.result_a.String=['sum= ',num2str(s), '    mean= ', num2str(mea), '     median=', num2str(med) ];
    case {5,6}    %mean, sum and median
        switch option
            case 5  %only for rows
                [s, mea, med] = get_lines_smm(matrix);
                type = '	row ';
                handles.result_a_title.String='sum, mean and median of row';
            case 6  %only for columns
                [s, mea, med] = get_columns_smm(matrix);
                handles.result_a_title.String='sum, mean and median column';
                type = 'column';
        end

        str='';
        for i=1:size(s,2)
            str=[str type num2str(i) ':' '  sum= ' num2str(s(i)) '     mean= ' num2str(mea(i)) '  median= ' num2str(med(i)) '.        '];
        end
        handles.result_a.String=str;
    case {7,8,9,10,11,16,17,18}  %all square matrix operations
        try
            switch option
                case 7  %det
                    matrix_det = num2str(det(matrix));
                    handles.result_a_title.String='Determinant= ';
                    handles.result_a.String=matrix_det;
                case 8  %trace
                    tr = num2str(trace(matrix));
                    handles.result_a_title.String='Trace= ';
                    handles.result_a.String=tr;
                case 9  %char-poly
                    syms x;
                    cp = charpoly(matrix,x);
                    handles.result_a_title.String='Matrix Characteristic Polynomial:';
                    handles.result_a.String=string(cp);
                case 10 %Eigenvalues
                    e = eig(matrix);
                     str='';
                    for i=1:size(e,1)
                     	str=[str 'lambda ' num2str(i) ' = ' num2str(e(i)) '.        '];
                    end
                    handles.result_a_title.String='Eigenvalues:';
                    handles.result_a.String=str;
                case 11 %diagonalizable
                    [V,D] = eig(matrix);
                    if length(eig(matrix)) ~= length(unique(eig(matrix)))   %check if invertible (if there any same eigenvalues)
                         handles.result_a.String='The matrix isnt diagonalizable ';
                    else
                        handles.result_a_title.String='V=';
                        handles.result_a.String=num2str(V);
                        handles.result_b_title.String='D=';
                        handles.result_b.String=num2str(D);
                    end
                 case 16
                    symMatrix=0.5*(matrix+matrix');
                    antisymMatrix=0.5*(matrix-matrix'); 
                    handles.result_a_title.String='Symmetric= ';
                    handles.result_a.String=num2str(symMatrix);
                    handles.result_b_title.String='AntiSymmetric = ';
                    handles.result_b.String=num2str(antisymMatrix);
                case 17
                    matrix_symmetrical(matrix);
                    handles.result_a_title.String='Approximation to symmetric matrix:';
                    handles.result_a.String=num2str(matrix_symmetrical(matrix));
                case 18
                    pow_matrix = matrix^b;
                    handles.result_a_title.String='(matrix)^b = ';
                    handles.result_a.String=num2str(pow_matrix);
                    
            end
        catch   %there is an error!
            if size(matrix,1)~=size(matrix,2)   %matrix isnt a square matrix error
                handles.result_a.String='The matrix must be square matrix.';
            else %any other error
                handles.result_a.String='ERROR!';
            end
        end
    case 12  %row reduction
        try
            B=num2str(row_reduction(matrix));
            handles.result_a_title.String='gaussian elimunation';
            handles.result_a.String=B;
        catch
            handles.result_a.String='There must be more rows then columns.';
        end
    case 13
         handles.result_a_title.String ='solution of linear equations is'; 
        try
            system = [matrix b];
            system = row_reduction(system);
            [m,n] = size(system);
            if system(m,1:n-1)==0
                if system(m,n)==0
                    handles.result_a.String='there are infinity solutions';
                else
                    handles.result_a.String='there is no solution.';
                end
            else
                x = les_solve(system);
%                 handles.result_a_title.String='x=';
                handles.result_a.String=num2str(x);
            end
           
        catch
              
           handles.result_a.String='ERROR!';
        end
    case 14
        handles.result_a_title.String='Matrix Condition Number:';
        if(det(matrix)>10^-15)
            handles.result_a.String=num2str(cond(matrix));
        else
            handles.result_a.String= 'The matrix in non invertable';
        end
    case 15
        handles.result_a_title.String='Matrix PseudoInverse:';
        handles.result_a.String= num2str(pinv(matrix));
end      


function result_a_Callback(hObject, eventdata, handles)
% hObject    handle to result_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result_a as text
%        str2double(get(hObject,'String')) returns contents of result_a as a double


% --- Executes during object creation, after setting all properties.
function result_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function b_Callback(hObject, eventdata, handles)
% hObject    handle to b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of b as text
%        str2double(get(hObject,'String')) returns contents of b as a double


% --- Executes on key press with focus on b and none of its controls.
function b_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to b (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)



function result_b_Callback(hObject, eventdata, handles)
% hObject    handle to result_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result_b as text
%        str2double(get(hObject,'String')) returns contents of result_b as a double


% --- Executes during object creation, after setting all properties.
function result_b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function result_a_title_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result_a_title (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
