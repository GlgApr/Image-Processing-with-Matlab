function varargout = Kuis2(varargin)
% KUIS2 MATLAB code for Kuis2.fig
%      KUIS2, by itself, creates a new KUIS2 or raises the existing
%      singleton*.
%
%      H = KUIS2 returns the handle to a new KUIS2 or the handle to
%      the existing singleton*.
%
%      KUIS2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in KUIS2.M with the given input arguments.
%
%      KUIS2('Property','Value',...) creates a new KUIS2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Kuis2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Kuis2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Kuis2

% Last Modified by GUIDE v2.5 10-Mar-2019 23:13:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Kuis2_OpeningFcn, ...
                   'gui_OutputFcn',  @Kuis2_OutputFcn, ...
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


% --- Executes just before Kuis2 is made visible.
function Kuis2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Kuis2 (see VARARGIN)

% Choose default command line output for Kuis2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Kuis2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Kuis2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
open = guidata (gcbo);
[namafile,direktori] = uigetfile({'*.jpg;*.png;*.bmp;*.tif'},'openimage');
I = imread (namafile);
set(open.figure1,'CurrentAxes',open.axes1);
set(imagesc(I)); 
colormap ('gray');
set(open.axes1,'Userdata',I);
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
open = guidata(gcbo);
J = get(open.axes1,'Userdata');
K = graythresh(J);
L = rgb2gray (J);
set(open.figure1,'CurrentAxes',open.axes2);
set(imagesc(L));
set(open.axes2,'Userdata',L);
set(handles.text3,'string',K); 
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
open = guidata(gcbo);
J = get(open.axes2,'Userdata');
K = im2bw (J);
set(open.figure1,'CurrentAxes',open.axes2);
set(imagesc(K));
set(open.axes2,'Userdata',K);
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
open = guidata(gcbo);
J = get(open.axes1,'Userdata');
R = rgb2gray(J);
X=get(handles.edit1,'string')
X1 = X/255;
X2 = im2bw(R,X1);
set(open.figure1,'CurrentAxes',open.axes2);
set(imagesc(X2));
set(open.axes2,'Userdata',X2); 
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
