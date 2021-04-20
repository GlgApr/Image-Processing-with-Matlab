function varargout = josswes(varargin)
% JOSSWES MATLAB code for josswes.fig
%      JOSSWES, by itself, creates a new JOSSWES or raises the existing
%      singleton*.
%
%      H = JOSSWES returns the handle to a new JOSSWES or the handle to
%      the existing singleton*.
%
%      JOSSWES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in JOSSWES.M with the given input arguments.
%
%      JOSSWES('Property','Value',...) creates a new JOSSWES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before josswes_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to josswes_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help josswes

% Last Modified by GUIDE v2.5 23-Oct-2017 16:14:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @josswes_OpeningFcn, ...
                   'gui_OutputFcn',  @josswes_OutputFcn, ...
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


% --- Executes just before josswes is made visible.
function josswes_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to josswes (see VARARGIN)

% Choose default command line output for josswes
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes josswes wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = josswes_OutputFcn(hObject, eventdata, handles) 
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
set(imagesc(I));
colormap('gray');
set(open.axes1,'Userdata',I);

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
open=guidata(gcbo);
I=get(open.axes1,'Userdata');
[r c] = size(I);
for x = 1 : r for y = 1 : c
J(x,y) = 255 - I(x,y);
    end
end
set(open.figure1,'CurrentAxes',open.axes2);
set(imagesc(J));colormap('gray');
set(open.axes2,'Userdata',J);
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
