I = imread ('lena.jpg');
gray = rgb2gray(I);
BW1 = edge (gray, 'prewitt');
BW2 = edge (gray, 'sobel');
BW3 = edge (gray, 'roberts');
BW4 = edge (gray, 'log');
figure, imshow (I)
figure, imshow (BW1)
figure, imshow (BW2)
figure, imshow (BW3)
figure, imshow (BW4)