clear all;
clc;
rle = [ 1 3 7 1 1 1 3 1 4 2 6 1 1 1 2 2 7 3 5 3 6 1 4 2 2 3 5 2 2 3 1 1 2 1 3 3 0 2];
r = 6;
c = 6;
Decompressed = RLE_Decode(rle, r, c)