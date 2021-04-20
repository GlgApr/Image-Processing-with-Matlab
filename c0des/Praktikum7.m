function varargout = Praktikum7(varargin)
% PRAKTIKUM7 M-file for Praktikum7.fig
%      PRAKTIKUM7, by itself, creates a new PRAKTIKUM7 or raises the existing
%      singleton*.
%
%      H = PRAKTIKUM7 returns the handle to a new PRAKTIKUM7 or the handle to
%      the existing singleton*.
%
%      PRAKTIKUM7('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRAKTIKUM7.M with the given input arguments.
%
%      PRAKTIKUM7('Property','Value',...) creates a new PRAKTIKUM7 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Praktikum7_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Praktikum7_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Praktikum7

% Last Modified by GUIDE v2.5 26-Nov-2008 21:50:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Praktikum7_OpeningFcn, ...
                   'gui_OutputFcn',  @Praktikum7_OutputFcn, ...
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


% --- Executes just before Praktikum7 is made visible.
function Praktikum7_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Praktikum7 (see VARARGIN)

% Choose default command line output for Praktikum7
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Praktikum7 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Praktikum7_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open = guidata (gcbo);
[namafile,direktori] = uigetfile({'*.jpg;,*.bmp;*.tif'},'openimage');
I = imread (namafile);
set(open.figure1,'CurrentAxes',open.axes1);
set(imagesc(I)); colormap('gray');
set(open.axes1,'Userdata',I);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open = guidata(gcbo);
A = get(open.axes1,'Userdata');
T = rgb2gray(A);
Roberts = edge(T,'roberts');
set(open.figure1,'CurrentAxes',open.axes2);
set(imagesc(Roberts)); 
set(open.axes2,'Userdata',Roberts);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open = guidata(gcbo);
A = get(open.axes1,'Userdata');
T = rgb2gray(A);
Sobel= edge(T,'sobel');
set(open.figure1,'CurrentAxes',open.axes3);
set(imagesc(Sobel)); 
set(open.axes3,'Userdata',Sobel);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open = guidata(gcbo);
A = get(open.axes1,'Userdata');
T = rgb2gray(A);
Prewitt = edge(T,'prewitt');
set(open.figure1,'CurrentAxes',open.axes4);
set(imagesc(Prewitt)); 
set(open.axes4,'Userdata',Prewitt);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open = guidata(gcbo);
A = get(open.axes1,'Userdata');
T = rgb2gray(A);
Log= edge(T,'log');
set(open.figure1,'CurrentAxes',open.axes5);
set(imagesc(Log)); 
set(open.axes5,'Userdata',Log);
