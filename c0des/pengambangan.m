F = imread ('cameraman.tif');
[r c] = size (F);
T = 128;
for x = 1 : r
    for y = 1 : c
        if F (x,y) >=T
            G (x,y) = 255;
        else
            G (x,y) = 0;
        end
    end
end
figure, imshow (F);
figure, imshow (G);