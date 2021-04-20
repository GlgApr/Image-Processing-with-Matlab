function varargout = Praktikum6(varargin)
% PRAKTIKUM6 M-file for Praktikum6.fig
%      PRAKTIKUM6, by itself, creates a new PRAKTIKUM6 or raises the existing
%      singleton*.
%
%      H = PRAKTIKUM6 returns the handle to a new PRAKTIKUM6 or the handle to
%      the existing singleton*.
%
%      PRAKTIKUM6('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRAKTIKUM6.M with the given input arguments.
%
%      PRAKTIKUM6('Property','Value',...) creates a new PRAKTIKUM6 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Praktikum6_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Praktikum6_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Praktikum6

% Last Modified by GUIDE v2.5 19-Nov-2008 23:47:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Praktikum6_OpeningFcn, ...
                   'gui_OutputFcn',  @Praktikum6_OutputFcn, ...
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


% --- Executes just before Praktikum6 is made visible.
function Praktikum6_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Praktikum6 (see VARARGIN)

% Choose default command line output for Praktikum6
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Praktikum6 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Praktikum6_OutputFcn(hObject, eventdata, handles) 
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
I = imnoise(I,'salt & pepper',0.05);
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
set(imagesc(uint8(B)));colormap('gray');
set(open.axes2,'Userdata',uint8(B));



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open = guidata(gcbo);
A = get(open.axes1,'Userdata');
T = rgb2gray(A);
T = imnoise(T, 'salt & pepper',0.01);
[r c] = size(T);
Rep = zeros (r + 2, c + 2);
for x = 2 : r + 1
    for y = 2 : c + 1
        Rep(x,y) = T (x-1,y-1);
    end
end
Rep;
B = zeros (r,c);
for x = 1 : r
    for y = 1 : c
        for i = 1 : 3
            for j = 1 : 3
                q = x - 1;
                w = y - 1;
                array((i-1)* 3 + j) = Rep(i + q, j + w);
            end
        end
        B(x,y) = median(array(:));
    end
end
set(open.figure1,'CurrentAxes',open.axes3);
set(imagesc(B)); colormap('gray');
set(open.axes3,'Userdata',B);


