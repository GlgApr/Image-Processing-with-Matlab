A = double (imread('afwa.jpg'));
B = double (imread('des.jpg'));
[r1 c1] = size (A);
[r2 c2] = size (B);
if (r1 ==r2) && (c1 == c2)
    for x = 1 : r1
        for y = 1 : c1
            C (x,y) = A(x,y)-B(x,y);
        end
    end
end
C = clipping (C);
figure, imshow (uint8(A));
figure, imshow (uint8(B));
figure, imshow (uint8(C));