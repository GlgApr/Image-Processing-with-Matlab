function Decompressed = RLE_Decode (rle,r,c)
Decompressed = zeros (r,c);
index = 1;
kali = 0;
for x = 1 : r
    for y = 1 : c
        kali = kali + 1;
        if kali == rle (1, index+1)
            Decompressed (x,y) = rle (1,index);
            index = index + 2;
            kali = 0;
        else
            Decompressed (x,y) = rle (1, index);
        end
    end
end