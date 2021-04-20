function varargout = tugas6(varargin)
% TUGAS6 MATLAB code for tugas6.fig
%      TUGAS6, by itself, creates a new TUGAS6 or raises the existing
%      singleton*.
%
%      H = TUGAS6 returns the handle to a new TUGAS6 or the handle to
%      the existing singleton*.
%
%      TUGAS6('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TUGAS6.M with the given input arguments.
%
%      TUGAS6('Property','Value',...) creates a new TUGAS6 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tugas6_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tugas6_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tugas6

% Last Modified by GUIDE v2.5 17-Dec-2018 02:25:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tugas6_OpeningFcn, ...
                   'gui_OutputFcn',  @tugas6_OutputFcn, ...
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


% --- Executes just before tugas6 is made visible.
function tugas6_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tugas6 (see VARARGIN)

% Choose default command line output for tugas6
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes tugas6 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tugas6_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
open = guidata (gcbo);
[namafile,direktori] = uigetfile({'*.jpg;,*.bmp;*.tif'},'openimage');
I = imread (namafile);
set(open.figure1,'CurrentAxes',open.axes1);
set(imagesc(I)); 
set(open.axes1,'Userdata',I);

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
open = guidata(gcbo);
A = get(open.axes1,'Userdata');
T = rgb2gray(A)
K = [-1 -1 -1; -1 9 -1;-1 -1 -1]
[r c] = size(T);
[m n] = size(K);
center = floor((size(K) + 1)/2);
left = center(2) - 1;
right = n - center(2);
top = center(1) - 1;
bottom = m - center(1);
Rep = zeros(r + top + bottom, c + left + right);
for x = 1 + top : r + top
    for y = 1 + left : c + left
        Rep(x,y) = T(x - top, y - left);
    end
end
B = zeros(r,c);
for x = 1 : r
    for y = 1 : c
        for i = 1 : m
            for j = 1 : n              
                q = x -1;
                w = y -1;
                B(x,y) = B(x,y) + (Rep(i + q, j + w) * K(i,j));
            end
        end
    end
end
set(open.figure1,'CurrentAxes',open.axes2);
set(imagesc(B));
set(open.axes2,'Userdata',B);

% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
open = guidata(gcbo);
A = get(open.axes1,'Userdata');
T = rgb2gray(A);
[r c] = size (T);
T = 128;
for x = 1 : r
    for y = 1 : c
        if T (x,y) >= T;
           B (x,y) = 255;
        else
            B (x,y) = 0;
        end
    end
end
set(open.figure1,'CurrentAxes',open.axes3);
set(imagesc(B));colormap('gray');
set(open.axes3,'Userdata',B);

% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
