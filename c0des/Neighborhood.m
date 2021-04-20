clear ;
clc;
A = imread ('eight.tif');
A = imnoise (A, 'salt & pepper', 0.01);
k = ones (3)/9;
[ r c ] = size (A);
[ m n ] = size (k);
center = floor ((size (k) + 1)/2);
left = center (2) - 1;
right = n - center (2);
top = center (1) - 1;
bottom = m - center (1);
Rep = zeros (r + top + bottom, c + left + right);
for x = 1 + top : r + top
    for y = 1 + left : c + left
        Rep (x,y) = A (x - top, y - left);
    end
end
B = zeros (r, c)
for x = 1 : r
    for y = 1 : c
        for i = 1 : m
            for j = 1 : n
                q = x - 1;
                w = y - 1;
                B (x,y) = B (x,y) + (Rep(i + q, j + w) * k (i,j));
            end
        end
    end
end
figure, imshow (A);
figure, imshow (uint8(B));