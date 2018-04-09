
% Program P3_7
% Illustration of Circular Shift of a Sequence
clf;
M = 6;
a = [0 1 2 3 4 5 6 7 8 9];
b = circshift1(a,M);
L = length(a)-1;
n = 0:L;
subplot(2,1,1);
stem(n,a);axis([0,L,min(a),max(a)]);
title('Original Sequence');
subplot(2,1,2);
stem(n,b);axis([0,L,min(a),max(a)]);
title(['Sequence Obtained by Circularly Shifting by ',num2str(M),'Samples']);


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


