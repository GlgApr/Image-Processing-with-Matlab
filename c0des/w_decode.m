function W = w_decode(I, bitpos)
r = size(I, 1);
c = size(I, 2);
for i = 1 : r
    for j = 1 : c
        W(i,j) = bitget(I(i,j), bitpos);
    end
end
W = 256 * W;