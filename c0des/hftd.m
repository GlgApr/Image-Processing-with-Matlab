function varargout = hftd(varargin)
% HFTD MATLAB code for hftd.fig
%      HFTD, by itself, creates a new HFTD or raises the existing
%      singleton*.
%
%      H = HFTD returns the handle to a new HFTD or the handle to
%      the existing singleton*.
%
%      HFTD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HFTD.M with the given input arguments.
%
%      HFTD('Property','Value',...) creates a new HFTD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before hftd_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to hftd_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help hftd

% Last Modified by GUIDE v2.5 12-Oct-2017 14:13:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @hftd_OpeningFcn, ...
                   'gui_OutputFcn',  @hftd_OutputFcn, ...
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


% --- Executes just before hftd is made visible.
function hftd_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to hftd (see VARARGIN)

% Choose default command line output for hftd
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes hftd wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = hftd_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
open=guidata(gcbo); 
[namafile,direktori]=uigetfile({'*.jpg;*.bmp;*.tif'},'OpenImage');

I=imread(namafile); 
set(open.figure1,'CurrentAxes',open.axes1); 
set(imagesc(I));colormap('gray');
set(open.axes1,'Userdata',I);


% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
open=guidata(gcbo); 
[namafile,direktori]=uigetfile({'*.jpg;*.bmp;*.tif'},'OpenImage');

I=imread(namafile); 
set(open.figure1,'CurrentAxes',open.axes2); 
set(imagesc(I));colormap('gray');
set(open.axes2,'Userdata',I);
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
open=guidata(gcbo); 
   A = get(open.axes1,'Userdata');
   B = get(open.axes2,'Userdata');
   [r1 c1] = size(A);
   [r2 c2] = size(B);
      if (r1 == r2) && (c1 == c2)
for x = 1 : r1
for y = 1 : c1
C(x,y) = A(x,y) + B(x,y);
end
end
end
   C = clipping(C);
   set(open.figure1,'CurrentAxes',open.axes3); 
   set(imagesc(C));colormap('gray'); 
   set(open.axes3,'Userdata',C);

% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
           open=guidata(gcbo); 
   A = get(open.axes1,'Userdata');
   B = get(open.axes2,'Userdata');
       	   [r1 c1] = size(A);
   [r2 c2] = size(B);
   if (r1 == r2) && (c1 == c2)
   for x = 1 : r1
   for y = 1 : c1
   	C(x,y) = A(x,y) - B(x,y);
end
end
   end
   C = clipping(C);
   set(open.figure1,'CurrentAxes',open.axes3); 
   set(imagesc(C));colormap('gray'); 
   set(open.axes3,'Userdata',C);

% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
    open=guidata(gcbo); 
   A = get(open.axes1,'Userdata');
   B = get(open.axes2,'Userdata');

[r1 c1]	= size(A);
 [r2 c2] = size(B);
 for x = 1 : r1
for y = 1 : c1

C(x,y) = and(A(x,y),B(x,y));
end
end
   set(open.figure1,'CurrentAxes',open.axes3); 
   set(imagesc(C));colormap('gray'); 
   set(open.axes3,'Userdata',C);
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
 open=guidata(gcbo); 
   A = get(open.axes1,'Userdata');
   B = get(open.axes2,'Userdata');

[r1 c1]	= size(A);
 [r2 c2] = size(B);
 for x = 1 : r1
for y = 1 : c1

C(x,y) = or(A(x,y),B(x,y));
end
end
   set(open.figure1,'CurrentAxes',open.axes3); 
   set(imagesc(C));colormap('gray'); 
   set(open.axes3,'Userdata',C);
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
open=guidata(gcbo); 
   A = get(open.axes1,'Userdata');
   B = get(open.axes2,'Userdata');

[r1 c1]	= size(A);
 [r2 c2] = size(B);
 for x = 1 : r1
for y = 1 : c1

C(x,y) = xor(A(x,y),B(x,y));
end
end
   set(open.figure1,'CurrentAxes',open.axes3); 
   set(imagesc(C));colormap('gray'); 
   set(open.axes3,'Userdata',C);
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
open=guidata(gcbo); 
   A = get(open.axes1,'Userdata');
   B = get(open.axes2,'Userdata');
   [r1 c1] = size(A);
   [r2 c2] = size(B);
   		if (r1 == r2) && (c1 == c2)
   		for x = 1 : r1
   		for y = 1 : c1
   			C(x,y) = A(x,y) * 2;
end
        end
        end
  	   C = clipping(C);
   set(open.figure1,'CurrentAxes',open.axes3); 
   set(imagesc(C));colormap('gray'); 
   set(open.axes3,'Userdata',C);

% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
open=guidata(gcbo); 
   A = get(open.axes1,'Userdata');
   B = get(open.axes2,'Userdata');
   [r1 c1] = size(A);
   [r2 c2] = size(B);
   if (r1 == r2) && (c1 == c2)
for x = 1 : r1
for y = 1 : c1
C(x,y) = A(x,y)./10;
end
end
   end
   C = clipping(C);
   set(open.figure1,'CurrentAxes',open.axes3); 
   set(imagesc(C));colormap('gray'); 
   set(open.axes3,'Userdata',C);

% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
open=guidata(gcbo);
I = imread('cameraman.tif');
hpf =[-1 -1 -1;
    -1 9 -1; 
    -1 -1 -1];
[r c] = size(I);
[m n] = size(hpf);
h = rot90(hpf, 2);

center = floor((size(h)+1)/2);
left = center(2) - 1;
right = n - center(2);
top = center(1) - 1;
bottom = m - center(1);

Rep = zeros(r + top + bottom, c + left + right);
for x = 1 + top : r + top
for y = 1 + left : c + left
Rep(x,y) = I(x - top, y - left);
end
end
B = zeros(r , c);
for x = 1 : r
for y = 1	: c
for i = 1 : m
for j = 1 : n
q = x - 1;
w = y -1;
B(x, y) = B(x, y) + (Rep(i + q, j + w) * h(i, j));
end
end
end
end
set(open.figure1,'CurrentAxes',open.axes3); 
   set(imagesc(B));colormap('gray'); 
   set(open.axes3,'Userdata',B);

% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
