I = imread ('cameraman.tif');
C = imcrop(I,[150 50 30 100])
figure, imshow (C)
figure, imshow (I)