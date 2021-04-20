Tx = 20;
Ty = 50;
A = imread ('cameraman.tif');
[brs kol] = size (A);
for x = 1 : brs
    for y = 1 : kol
        B (x+Tx, y+Ty) = A(x,y);
    end
end
figure, imshow (uint8(A));
figure, imshow (uint8(B));