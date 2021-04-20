function varargout = geometri(varargin)
% GEOMETRI MATLAB code for geometri.fig
%      GEOMETRI, by itself, creates a new GEOMETRI or raises the existing
%      singleton*.
%
%      H = GEOMETRI returns the handle to a new GEOMETRI or the handle to
%      the existing singleton*.
%
%      GEOMETRI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GEOMETRI.M with the given input arguments.
%
%      GEOMETRI('Property','Value',...) creates a new GEOMETRI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before geometri_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to geometri_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help geometri

% Last Modified by GUIDE v2.5 05-Nov-2018 22:46:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @geometri_OpeningFcn, ...
                   'gui_OutputFcn',  @geometri_OutputFcn, ...
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


% --- Executes just before geometri is made visible.
function geometri_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to geometri (see VARARGIN)

% Choose default command line output for geometri
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes geometri wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = geometri_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in open.
function open_Callback(hObject, eventdata, handles)
open = guidata (gcbo);
[namafile,direktori] = uigetfile (('*.jpg;,*.bmp;*.tif'),'openimage');
I = imread (namafile);
set (open.figure1,'CurrentAxes',open.axes1);
set (imagesc(I));
set (open.axes1,'Userdata',I);

% hObject    handle to open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in translasi.
function translasi_Callback(hObject, eventdata, handles)
open = guidata (gcbo);
Tx = 30;
Ty = 90;
A = get (open.axes1,'Userdata');
[r c] = size (A);
for x = 1 : r
    for y = 1 : c
        B(x+Tx, y+Ty) = A(x,y);
    end
end
 
set (open.figure1,'CurrentAxes',open.axes2);
set (imagesc(B));colormap('gray');
set (open.axes2,'Userdata',B);

% hObject    handle to translasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in cropping.
function cropping_Callback(hObject, eventdata, handles)
open = guidata(gcbo);
A = get(open.axes1,'Userdata');
B = imcrop(A,[100 100 200 200]);
set(open.figure1,'CurrentAxes',open.axes3);
set(imagesc(B));colormap('gray');
set(open.axes3,'Userdata',B);
% hObject    handle to cropping (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in flipping.
function flipping_Callback(hObject, eventdata, handles)
open = guidata(gcbo);
A = get(open.axes1,'Userdata');
[r c] = size (A);
yc = floor (c/2);
for x = 1 : r
    for y = 1 : c
       J(x,y) = A(x, (2*yc-y+1) );
    end
end
 
set(open.figure1,'CurrentAxes',open.axes4);
set(imagesc(J));colormap('gray');
set(open.axes4,'Userdata',J);

% hObject    handle to flipping (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in rotasi.
function rotasi_Callback(hObject, eventdata, handles)
open = guidata(gcbo);
A = get(open.axes1,'Userdata');
theta = 30;
distorted = imrotate (A,theta);
 
set(open.figure1,'CurrentAxes',open.axes5);
set(imagesc(distorted));colormap('gray');
set(open.axes5,'Userdata',distorted);

% hObject    handle to rotasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in scalling.
function scalling_Callback(hObject, eventdata, handles)
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
set(imagesc(J));colormap('gray');
set(open.axes6,'Userdata',J);

% hObject    handle to scalling (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
