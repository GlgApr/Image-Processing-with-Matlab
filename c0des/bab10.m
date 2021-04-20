function varargout = bab10(varargin)
% BAB10 MATLAB code for bab10.fig
%      BAB10, by itself, creates a new BAB10 or raises the existing
%      singleton*.
%
%      H = BAB10 returns the handle to a new BAB10 or the handle to
%      the existing singleton*.
%
%      BAB10('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BAB10.M with the given input arguments.
%
%      BAB10('Property','Value',...) creates a new BAB10 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before bab10_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to bab10_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help bab10

% Last Modified by GUIDE v2.5 16-Dec-2018 07:58:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @bab10_OpeningFcn, ...
                   'gui_OutputFcn',  @bab10_OutputFcn, ...
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


% --- Executes just before bab10 is made visible.
function bab10_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to bab10 (see VARARGIN)

% Choose default command line output for bab10
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes bab10 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = bab10_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in open.
function open_Callback(hObject, eventdata, handles)
open=guidata(gcbo);
[namafile,direktori]=uigetfile({'*.jpg;*.bmp;*.tif'},'OpenImage');
I=imread(namafile);
set(open.figure1,'CurrentAxes',open.axes1);
set(imagesc(I));colormap('gray');
set(open.axes1,'Userdata',I);

% hObject    handle to open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in histogram.
function histogram_Callback(hObject, eventdata, handles)
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

% hObject    handle to histogram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
