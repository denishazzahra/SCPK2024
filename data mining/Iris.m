function varargout = Iris(varargin)
% IRIS MATLAB code for Iris.fig
%      IRIS, by itself, creates a new IRIS or raises the existing
%      singleton*.
%
%      H = IRIS returns the handle to a new IRIS or the handle to
%      the existing singleton*.
%
%      IRIS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IRIS.M with the given input arguments.
%
%      IRIS('Property','Value',...) creates a new IRIS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Iris_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Iris_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Iris

% Last Modified by GUIDE v2.5 15-Mar-2023 14:51:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Iris_OpeningFcn, ...
                   'gui_OutputFcn',  @Iris_OutputFcn, ...
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


% --- Executes just before Iris is made visible.
function Iris_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Iris (see VARARGIN)

% Choose default command line output for Iris
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Iris wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Iris_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in show.
function show_Callback(hObject, eventdata, handles)
% hObject    handle to show (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
opts=detectImportOptions('Iris.csv');
opts.SelectedVariableNames=(2:5);
alldata=readmatrix('Iris.csv',opts);
set(handles.iristable,'data',alldata);


% --- Executes on button press in classify.
function classify_Callback(hObject, eventdata, handles)
% hObject    handle to classify (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sl=str2double(get(handles.sepallength,'string'));
sw=str2double(get(handles.sepalwidth,'string'));
pl=str2double(get(handles.petallength,'string'));
pw=str2double(get(handles.petalwidth,'string'));
k=str2double(get(handles.k,'string'));
sample=[sl sw pl pw]; %yg br dimasukin
opts=detectImportOptions('Iris.csv');
opts.SelectedVariableNames=(2:5);
training=readmatrix('Iris.csv',opts); %data yg udh ada
opts.SelectedVariableNames=(6);
group=readmatrix('Iris.csv',opts); %class yg udh ada
class=fitcknn(training, group, 'NumNeighbors',k);
result=predict(class,sample);
set(handles.result,'string',result);


function sepallength_Callback(hObject, eventdata, handles)
% hObject    handle to sepallength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sepallength as text
%        str2double(get(hObject,'String')) returns contents of sepallength as a double


% --- Executes during object creation, after setting all properties.
function sepallength_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sepallength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sepalwidth_Callback(hObject, eventdata, handles)
% hObject    handle to sepalwidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sepalwidth as text
%        str2double(get(hObject,'String')) returns contents of sepalwidth as a double


% --- Executes during object creation, after setting all properties.
function sepalwidth_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sepalwidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function petallength_Callback(hObject, eventdata, handles)
% hObject    handle to petallength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of petallength as text
%        str2double(get(hObject,'String')) returns contents of petallength as a double


% --- Executes during object creation, after setting all properties.
function petallength_CreateFcn(hObject, eventdata, handles)
% hObject    handle to petallength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function petalwidth_Callback(hObject, eventdata, handles)
% hObject    handle to petalwidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of petalwidth as text
%        str2double(get(hObject,'String')) returns contents of petalwidth as a double


% --- Executes during object creation, after setting all properties.
function petalwidth_CreateFcn(hObject, eventdata, handles)
% hObject    handle to petalwidth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function result_Callback(hObject, eventdata, handles)
% hObject    handle to result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result as text
%        str2double(get(hObject,'String')) returns contents of result as a double


% --- Executes during object creation, after setting all properties.
function result_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function k_Callback(hObject, eventdata, handles)
% hObject    handle to k (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of k as text
%        str2double(get(hObject,'String')) returns contents of k as a double


% --- Executes during object creation, after setting all properties.
function k_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
