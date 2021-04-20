function J = rotasi(I,T)

m = size(I,1);

n	= size(I,2);

if rem(m,2) == 0,	Xp = floor((m+1)/2)+1;
 


else

Xp = floor((m+1)/2);

end

if rem(n,2) == 0,

Yp = floor((n+1)/2)+1;

else

Yp = floor((n+1)/2);

end

X = zeros(m,n); Y = zeros(m,n);
for x = 1 : m,	X(x,1:n) = x;

end

for y = 1 : n,	Y(1:m,y) = y;

end

Xa = round(Xp + (X - Xp)*cosd(T) - (Y - Yp)*sind(T));
Ya = round(Yp + (X - Xp)*sind(T)	+ (Y - Yp)*cosd(T));
r = size(min(Xa(:)) : max(Xa(:)),2);
c = size(min(Ya(:)) : max(Ya(:)),2);

xs = round(abs(r-m)/2);
ys = round(abs(c-n)/2);
J = zeros(r,c);
for x = 1 : m
for y = 1 : n
J(Xa(x,y)+xs,Ya(x,y)+ys) = I(x,y);
end
end
 

