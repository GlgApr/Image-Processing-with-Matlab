function varargout = DETEKSI(varargin)
% DETEKSI MATLAB code for DETEKSI.fig
%      DETEKSI, by itself, creates a new DETEKSI or raises the existing
%      singleton*.
%
%      H = DETEKSI returns the handle to a new DETEKSI or the handle to
%      the existing singleton*.
%
%      DETEKSI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DETEKSI.M with the given input arguments.
%
%      DETEKSI('Property','Value',...) creates a new DETEKSI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DETEKSI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DETEKSI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DETEKSI

% Last Modified by GUIDE v2.5 12-Oct-2017 21:17:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DETEKSI_OpeningFcn, ...
                   'gui_OutputFcn',  @DETEKSI_OutputFcn, ...
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


% --- Executes just before DETEKSI is made visible.
function DETEKSI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DETEKSI (see VARARGIN)

% Choose default command line output for DETEKSI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DETEKSI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DETEKSI_OutputFcn(hObject, eventdata, handles) 
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
I=get(open.axes1,'Userdata'); 
%gray=rgb2gray(I);
BW=edge(I,'sobel');
set(open.figure1,'CurrentAxes',open.axes2);
set(imshow(BW));
set(open.axes2,'Userdata',BW);


% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
open=guidata(gcbo); 
I=get(open.axes1,'Userdata');
%gray=rgb2gray(I); 
BW=edge(I,'roberts');
set(open.figure1,'CurrentAxes',open.axes2);

set(imshow(BW));
set(open.axes2,'Userdata',BW);


% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
open=guidata(gcbo);
I=get(open.axes1,'Userdata');
%gray=rgb2gray(I);
BW=edge(I,'canny');
set(open.figure1,'CurrentAxes',open.axes2);
set(imshow(BW));
set(open.axes2,'Userdata',BW);


% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
open=guidata(gcbo); 
I=get(open.axes1,'Userdata');
%gray=rgb2gray(I);
BW=edge(I,'prewitt');
set(open.figure1,'CurrentAxes',open.axes2);
set(imshow(BW));
set(open.axes2,'Userdata',BW);

% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
open=guidata(gcbo);
I=get(open.axes1,'Userdata'); 
%gray=rgb2gray(I);
BW=edge(I,'log');
set(open.figure1,'CurrentAxes',open.axes2);
set(imshow(BW));
set(open.axes2,'Userdata',BW);


% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
