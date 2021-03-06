function varargout = Praktikum4(varargin)
% PRAKTIKUM4 M-file for Praktikum4.fig
%      PRAKTIKUM4, by itself, creates a new PRAKTIKUM4 or raises the existing
%      singleton*.
%
%      H = PRAKTIKUM4 returns the handle to a new PRAKTIKUM4 or the handle to
%      the existing singleton*.
%
%      PRAKTIKUM4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRAKTIKUM4.M with the given input arguments.
%
%      PRAKTIKUM4('Property','Value',...) creates a new PRAKTIKUM4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Praktikum4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Praktikum4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Praktikum4

% Last Modified by GUIDE v2.5 19-Nov-2008 23:20:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Praktikum4_OpeningFcn, ...
                   'gui_OutputFcn',  @Praktikum4_OutputFcn, ...
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


% --- Executes just before Praktikum4 is made visible.
function Praktikum4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Praktikum4 (see VARARGIN)

% Choose default command line output for Praktikum4
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Praktikum4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Praktikum4_OutputFcn(hObject, eventdata, handles) 
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
set(imagesc(I));
set(open.axes1,'Userdata',I);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open = guidata(gcbo);
Tx = 30;
Ty = 60;
A = get(open.axes1,'Userdata');
[r c] = size (A);
for x = 1 : r
    for y = 1 : c
        B(x+Tx, y+Ty) = A(x,y);
    end
end
 
set(open.figure1,'CurrentAxes',open.axes2);
set(imagesc(B));colormap('gray');
set(open.axes2,'Userdata',B);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open = guidata(gcbo);
A = get(open.axes1,'Userdata');
C = imcrop(A,[20 20 100 100]);
 
set(open.figure1,'CurrentAxes',open.axes3);
set(imagesc(C));colormap('gray');
set(open.axes3,'Userdata',C);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open = guidata(gcbo);
A = get(open.axes1,'Userdata');
[r c] = size (A);
yc = floor (c/2);
for x = 1 : r
    for y = 1 : c
       % J(x,y) = A((2*xc)-x+1 , y);
       J(x,y) = A(x, (2*yc)-y+1 );
    end
end
 
set(open.figure1,'CurrentAxes',open.axes4);
set(imagesc(J));colormap('gray');
set(open.axes4,'Userdata',J);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open = guidata(gcbo);
A = get(open.axes1,'Userdata');
theta = 30;
distorted = imrotate (A,theta);
 
set(open.figure1,'CurrentAxes',open.axes5);
set(imagesc(distorted));colormap('gray');
set(open.axes5,'Userdata',distorted);

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open = guidata(gcbo);
A = get(open.axes1,'Userdata');
ShX = 2;
ShY = 1;
m = size (A,1);
n = size (A,2);
r = m * ShX;
c = n * ShY;
for x = 1 : m
    for y = 1 : n
        J((x-1)* ShX+1 : x*ShX, (y-1)*ShY+1 : y *ShY) = A(x,y);
    end
end
 
set(open.figure1,'CurrentAxes',open.axes6);
%set(imagesc(J));colormap('gray');
imshow(J);
set(open.axes6,'Userdata',J);

