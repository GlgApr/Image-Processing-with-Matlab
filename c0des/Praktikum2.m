function varargout = Praktikum2(varargin)
% PRAKTIKUM2 M-file for Praktikum2.fig
%      PRAKTIKUM2, by itself, creates a new PRAKTIKUM2 or raises the existing
%      singleton*.
%
%      H = PRAKTIKUM2 returns the handle to a new PRAKTIKUM2 or the handle to
%      the existing singleton*.
%
%      PRAKTIKUM2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRAKTIKUM2.M with the given input arguments.
%
%      PRAKTIKUM2('Property','Value',...) creates a new PRAKTIKUM2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Praktikum2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Praktikum2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Praktikum2

% Last Modified by GUIDE v2.5 19-Nov-2008 22:19:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Praktikum2_OpeningFcn, ...
                   'gui_OutputFcn',  @Praktikum2_OutputFcn, ...
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


% --- Executes just before Praktikum2 is made visible.
function Praktikum2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Praktikum2 (see VARARGIN)

% Choose default command line output for Praktikum2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Praktikum2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Praktikum2_OutputFcn(hObject, eventdata, handles) 
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
set(imagesc(I));colormap('gray');
set(open.axes1,'Userdata',I);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open = guidata(gcbo);
J = get(open.axes1,'Userdata');
K = rgb2gray(J);
set(open.figure1,'CurrentAxes',open.axes2);
set(imagesc(K));
set(open.axes2,'Userdata',K);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open = guidata(gcbo);
P = get(open.axes1,'Userdata');
Q = rgb2gray(P);
T = graythresh (Q);
R = im2bw (Q,T);
set(open.figure1,'CurrentAxes',open.axes3);
set(imagesc(R));
set(open.axes2,'Userdata',R);



