function rle = RLE_Encode (I)
[row, col] = size (I);
rle (1) = 1;
rle (2) = 0;
idk = 1;
for x = 1 : row
    for y = 1 : col
        currpixel = I(x,y);
        if currpixel == rle(idk)
        rle (idk + 1) = rle (idk + 1) + 1;
        else
            idk = idk + 2
            rle (idk) = currpixel;
            rle (idk+1)=1;
        end
    end
end