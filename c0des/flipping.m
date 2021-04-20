I = imread('cameraman.tif');
[r c] = size(I);
J = repmat(0,r,c);
mirror = floor(c/2);
for x = 1 : r-1
for y = 1 : c-1
J(x,y) = I((2*mirror)-x, y);
end
end
figure, imshow(uint8(I));
figure, imshow(uint8(J));