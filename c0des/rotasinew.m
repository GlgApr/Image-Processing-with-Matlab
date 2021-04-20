I = imread('cameraman.tif');
theta = 17;
galang = imrotate(I,theta);
figure, imshow(galang);