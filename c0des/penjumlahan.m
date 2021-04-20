function varargout = penjumlahan(varargin)
% PENJUMLAHAN MATLAB code for penjumlahan.fig
%      PENJUMLAHAN, by itself, creates a new PENJUMLAHAN or raises the existing
%      singleton*.
%
%      H = PENJUMLAHAN returns the handle to a new PENJUMLAHAN or the handle to
%      the existing singleton*.
%
%      PENJUMLAHAN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PENJUMLAHAN.M with the given input arguments.
%
%      PENJUMLAHAN('Property','Value',...) creates a new PENJUMLAHAN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before penjumlahan_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to penjumlahan_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help penjumlahan

% Last Modified by GUIDE v2.5 29-Oct-2018 23:39:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @penjumlahan_OpeningFcn, ...
                   'gui_OutputFcn',  @penjumlahan_OutputFcn, ...
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


% --- Executes just before penjumlahan is made visible.
function penjumlahan_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to penjumlahan (see VARARGIN)

% Choose default command line output for penjumlahan
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes penjumlahan wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = penjumlahan_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
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
   %C = clipping(C);
   set(open.figure1,'CurrentAxes',open.axes3); 
   set(imagesc(C));colormap('gray'); 
   set(open.axes3,'Userdata',C);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
open=guidata(gcbo); 
[namafile,direktori]=uigetfile({'*.jpg;*.bmp;*.tif'},'OpenImage');
I=imread(namafile);
set(open.figure1,'CurrentAxes',open.axes1);
set(imagesc(I));colormap('gray');
set(open.axes1,'Userdata',I);
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
open=guidata(gcbo); 
[namafile,direktori]=uigetfile({'*.jpg;*.bmp;*.tif'},'OpenImage');
a=imread(namafile);
set(open.figure1,'CurrentAxes',open.axes2);
set(imagesc(a));colormap('gray');
set(open.axes2,'Userdata',a);
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in tambah.
function tambah_Callback(hObject, eventdata, handles)
open = guidata (gcbo);
A = get(open.axes1,'Userdata');
B = get(open.axes2,'Userdata');
[r1 c1] = size (A);
[r2 c2] = size (B);
if (r1 == r2) && (c1 == c2)
    for x = 1 : r1
    for y = 1 : c1
        C(x,y) = A (x,y) + B (x,y);
    end
    end
end
 
C = clipping(C);
set(open.figure1,'CurrentAxes',open.axes3);
set(imagesc(C));colormap ('gray');
set(open.axes3,'Userdata',C);



% hObject    handle to tambah (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in kurang.
function kurang_Callback(hObject, eventdata, handles)
open = guidata (gcbo);
A = get(open.axes1,'Userdata');
B = get(open.axes2,'Userdata');
[r1 c1] = size (A);
[r2 c2] = size (B);
if (r1 == r2) && (c1 == c2)
    for x = 1 : r1
    for y = 1 : c1
        C(x,y) = A (x,y) - B (x,y);
    end
    end
end
 
C = clipping(C);
set(open.figure1,'CurrentAxes',open.axes4);
set(imagesc(C));colormap ('gray');
set(open.axes3,'Userdata',C);

% hObject    handle to kurang (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in kali.
function kali_Callback(hObject, eventdata, handles)
open = guidata (gcbo);
A = get(open.axes1,'Userdata');
B = get(open.axes2,'Userdata');
[r1 c1] = size (A);
[r2 c2] = size (B);
if (r1 == r2) && (c1 == c2)
    for x = 1 : r1
    for y = 1 : c1
        C(x,y) = A (x,y) * 2;
    end
    end
end
 
C = clipping(C);
set(open.figure1,'CurrentAxes',open.axes5);
set(imagesc(C));colormap ('gray');
set(open.axes3,'Userdata',C);

% hObject    handle to kali (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Bagi.
function Bagi_Callback(hObject, eventdata, handles)
open = guidata (gcbo);
A = get(open.axes1,'Userdata');
B = get(open.axes2,'Userdata');
[r1 c1] = size (A);
[r2 c2] = size (B);
if (r1 == r2) && (c1 == c2)
    for x = 1 : r1
    for y = 1 : c1
        C(x,y) = A (x,y) /2;
    end
    end
end
 
C = clipping(C);
set(open.figure1,'CurrentAxes',open.axes6);
set(imagesc(C));colormap ('gray');
set(open.axes3,'Userdata',C);


% hObject    handle to Bagi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
