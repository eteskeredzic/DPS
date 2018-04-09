%% Prepare workspace
clc
clear all
close all
%%  Discrete time sequence of length N
N = 200;
n = 0:N-1;
xR = sin(2*pi*n*0.125);
xI = sin(2*pi*n*0.2);
x = xR + 1i*xI;
figure(1)
subplot(4,1,1)
stem(n,xR);
title('Real part xR in Time domain')
xlabel('Sample Number')
ylabel('Amplitude')

subplot(4,1,2)
stem(n,xI);
title('Imag part xI in Time domain')
xlabel('Sample Number')
ylabel('Amplitude')

%% L is the number of points in DFT L >= N
L  = 200;
% Calculate DFT
%y = fft(x);
y = fft(x,L);
subplot(4,1,3)
stem(real(y));
title('Real part of DFT')
xlabel('Frequency index k')
ylabel('Amplitude')
subplot(4,1,4)
stem(imag(y));
title('Imag part of DFT')
xlabel('Frequency index k')
ylabel('Amplitude')

%% Calculate IDFT

iy = ifft(y,L);
figure(2)
subplot(2,1,1)
stem(real(iy(1:N)));
title('Discrete signal in Time domain')
xlabel('Sample Number')
ylabel('Amplitude')
subplot(2,1,2)
stem(imag(iy(1:N)));
title('Discrete signal in Time domain')
xlabel('Sample Number')
ylabel('Amplitude')

%% Difference between original and IDFT
xa = [x zeros(1,length(y)-length(x))];
d = xa - iy;
figure(3)
subplot(2,1,1)
stem(real(d));
title('Difference between original and IDFT in Time domain')
xlabel('Sample Number')
ylabel('Amplitude')
subplot(2,1,2)
stem(imag(d));
title('Difference between original and IDFT in Time domain')
xlabel('Sample Number')
ylabel('Amplitude')