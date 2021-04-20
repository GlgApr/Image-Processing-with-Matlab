function varargout = Praktikum10(varargin)
% PRAKTIKUM10 M-file for Praktikum10.fig
%      PRAKTIKUM10, by itself, creates a new PRAKTIKUM10 or raises the existing
%      singleton*.
%
%      H = PRAKTIKUM10 returns the handle to a new PRAKTIKUM10 or the handle to
%      the existing singleton*.
%
%      PRAKTIKUM10('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRAKTIKUM10.M with the given input arguments.
%
%      PRAKTIKUM10('Property','Value',...) creates a new PRAKTIKUM10 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Praktikum10_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Praktikum10_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Praktikum10

% Last Modified by GUIDE v2.5 13-Dec-2008 22:34:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Praktikum10_OpeningFcn, ...
                   'gui_OutputFcn',  @Praktikum10_OutputFcn, ...
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


% --- Executes just before Praktikum10 is made visible.
function Praktikum10_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Praktikum10 (see VARARGIN)

% Choose default command line output for Praktikum10
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Praktikum10 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Praktikum10_OutputFcn(hObject, eventdata, handles) 
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
open=guidata(gcbo); 
[namafile,direktori]=uigetfile({'*.jpg;*.bmp;*.tif'}, 'OpenImage'); 
I=imread(namafile); 
set(open.figure1,'CurrentAxes',open.axes1); 
set(imagesc(I));colormap('gray'); 
set(open.axes1,'Userdata',I); 


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open=guidata(gcbo);
a = get(open.axes1,'Userdata');
[r c]=size(a);
data = reshape(a,r*c,1);
angka = unique(data);
[r1 c1] = size(angka);
jml_angka = histc(data,angka);
total = r*c
for x=1:r1
    B(x,1)=jml_angka(x,1)/total
end
set(open.figure1,'CurrentAxes',open.axes2);
imhist(B);
set(open.axes2,'Userdata',bar(B));


