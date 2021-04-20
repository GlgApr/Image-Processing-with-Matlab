a = double (imread('cameraman.tif'));
b = double (imread('rice.png'));
wa = 0.5;
wb = 0.5;
[r1 c1] = size (a);
[r2 c2] = size (b);
if (r1 ==r2) && (c1 == c2)
    for x = 1 : r1
        for y = 1 : c1
            c (x,y) = a(x,y)*wa+b(x,y)*wb;
        end
    end
end
c = clipping (c);
figure, imshow (uint8(a));
figure, imshow (uint8(b));
figure, imshow (uint8(c));