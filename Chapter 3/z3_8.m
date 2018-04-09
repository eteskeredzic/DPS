% Program P3_8
% Circular Time-Shifting Property of DFT
clf;
x = [0 2 4 6 8 10 12 14 16];
N = length(x)-1; 
n = 0:N;
y = circshift1(x,5);
XF = fft(x);
YF = fft(y);
subplot(2,2,1)
stem(n,abs(XF)); grid
title('Magnitude of DFT of Original Sequence');
subplot(2,2,2)
stem(n,abs(YF)); grid
title('Magnitude of DFT of Circularly Shifted Sequence');
subplot(2,2,3)
stem(n,angle(XF)); grid
title('Phase of DFT of Original Sequence');
subplot(2,2,4)
stem(n,angle(YF)); grid
title('Phase of DFT of Circularly Shifted Sequence');

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

function y = circonv1(x1,x2)
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