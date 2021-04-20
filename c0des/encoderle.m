clear all;
clc;
I = [ 1 1 1 7 7 3;
    4 4 6 1 2 2;
    7 7 7 5 5 5;
    6 4 4 2 2 2;
    5 5 2 2 2 1;
    2 3 3 3 0 0];
rle = RLE_Encode (I)