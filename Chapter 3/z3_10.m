% Program P3_10
% Linear Convolution via Circular Convolution
g1 = [1 2 3 4 5];g2 = [2 2 0 1 1];
g1e = [g1 zeros(1,length(g2)-1)];
g2e = [g2 zeros(1,length(g1)-1)];
ylin = circonv(g1e, g2e);
disp('Linear convolution via circular convolution = ');disp(ylin);
y = conv(g1, g2);
disp('Direct linear convolution = ');disp(y)


function y = circshift1(x,M)
% Develops a sequence y obtained by
% circularly shifting a finite-length
% sequence x by M samples
if abs(M) > length(x)
M = rem(M,length(x));
end
if M < 0
M = M + length(x);
end

y = [x(M+1:length(x)) x(1:M)];
end

function y = circonv(x1,x2)
L1 = length(x1); L2 = length(x2);
if L1 ~= L2, error('Sequences of unequal lengths'), end
y = zeros(1,L1);
x2tr = [x2(1) x2(L2:-1:2)];
for k = 1:L1
sh = circshift1(x2tr,1-k);
h = x1.*sh;
y(k) = sum(h);
end
end