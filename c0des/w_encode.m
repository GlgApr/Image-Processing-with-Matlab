function I = w_encode(cover, message, bitpos)
message = round(message/256);
r = size(cover, 1);
c = size(cover, 2);
I = cover;
for i = 1 : r
    for j = 1 : c
        I(i,j) = bitset(I(i,j), bitpos, message(i,j));
    end
end
