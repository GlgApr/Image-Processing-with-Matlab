function varargout = kuis6(varargin)
% KUIS6 MATLAB code for kuis6.fig
%      KUIS6, by itself, creates a new KUIS6 or raises the existing
%      singleton*.
%
%      H = KUIS6 returns the handle to a new KUIS6 or the handle to
%      the existing singleton*.
%
%      KUIS6('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in KUIS6.M with the given input arguments.
%
%      KUIS6('Property','Value',...) creates a new KUIS6 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before kuis6_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to kuis6_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help kuis6

% Last Modified by GUIDE v2.5 13-May-2019 10:29:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @kuis6_OpeningFcn, ...
                   'gui_OutputFcn',  @kuis6_OutputFcn, ...
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


% --- Executes just before kuis6 is made visible.
function kuis6_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to kuis6 (see VARARGIN)

% Choose default command line output for kuis6
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes kuis6 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = kuis6_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
open=guidata(gcbo);
gambar=uigetfile({'*.jpg;*.bmp;*.png'},'openimage');
I=imread(gambar);
set(open.figure1,'CurrentAxes',open.axes1);
set(imagesc(I));
set(open.axes1,'Userdata',I);


% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
open=guidata(gcbo);
a = get(open.axes1,'Userdata');
b = rgb2gray(a);
lvl = graythresh(b);
c = im2bw(b,lvl);
e = bwarea(c);
set(open.figure1,'CurrentAxes',open.axes2);
set(imagesc(c));
colormap('gray');
set(open.axes2,'Userdata',c);
set(handles.edit3,'string',(e));  
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
open=guidata(gcbo);
a = get(open.axes1,'Userdata');
b = rgb2gray(a);
lvl = graythresh(b);
c = im2bw(b,lvl);
e = bwperim(c);
perim = sum(sqrt(sum(e,2)));
set(open.figure1,'CurrentAxes',open.axes2);
set(imagesc(e));
colormap('gray');
set(open.axes2,'Userdata',e);
set(handles.edit2,'string',(perim));  

% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
open=guidata(gcbo);
a = get(open.axes1,'Userdata');
b = rgb2gray(a);
lvl = graythresh(b);
c = im2bw(b,lvl);
e = bwperim(c);
set(open.figure1,'CurrentAxes',open.axes2);
set(imagesc(e));
colormap('gray');
set(open.axes2,'Userdata',e);
perim = sum(sqrt(sum(e,2)));
z=('Tergolong Kecil');
z1=('Tergolong Sedang');
z2=('Tergolong Besar');
if perim >= 550 && perim <= 750
    set(handles.edit1,'string',(z)); 
elseif perim >= 750 && perim <= 850
    set(handles.edit1,'string',(z1)); 
else perim >= 850 && perim <= 1500
    set(handles.edit1,'string',(z2)); 

end
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
