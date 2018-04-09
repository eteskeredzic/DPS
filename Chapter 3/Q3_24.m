%% Write a MATLAB program to compute the N-point DFT of two length-N real
% sequences using a single N-point DFT and compare the result by computing directly the
% two N-point DFTs (see R3.13).
%% Prepare workspace
clc
clear all
close all

%%  Discrete time sequence of length N
N = 200;
n = 0:N-1;
g = cos(2*pi*n*0.125);
h = cos(2*pi*n*0.2);
x = g + 1i*h;
figure(1)
subplot(4,1,1)
stem(real(x));
title('Real part x in Time domain')
xlabel('Sample Number')
ylabel('Amplitude')

subplot(4,1,2)
stem(imag(x));
title('Imag part x in Time domain')
xlabel('Sample Number')
ylabel('Amplitude')

% L is the number of points in DFT L >= N
L  = 200;
% Calculate DFT
X_k = fft(x,L);
subplot(4,1,3)
stem(real(X_k));
title('Real part of DFT')
xlabel('Frequency index k')
ylabel('Amplitude')
subplot(4,1,4)
stem(imag(X_k));
title('Imag part of DFT')
xlabel('Frequency index k')
ylabel('Amplitude')

%% Calculate X*
X_k_conj = conj(X_k);
X_k_conj_mod = [X_k_conj(1) fliplr(X_k_conj(2:N))];
figure(2)
subplot(4,1,1)
stem(real(X_k_conj));
title('Real part of X*[k]')
xlabel('Frequency index k')
ylabel('Amplitude')
subplot(4,1,2)
stem(imag(X_k_conj));
title('Imag part of X*[k]')
xlabel('Frequency index k')
ylabel('Amplitude')
subplot(4,1,3)
stem(real(X_k_conj_mod));
title('Real part of X*[-k]')
xlabel('Frequency index k')
ylabel('Amplitude')
subplot(4,1,4)
stem(imag(X_k_conj_mod));
title('Imag part of X*[-k]')
xlabel('Frequency index k')
ylabel('Amplitude')

%% Calculate G_k and H_k with 3.13.
G_k = 0.5*(X_k + X_k_conj_mod);
H_k = (0.5/1i)*(X_k - X_k_conj_mod);

figure(3)
subplot(4,1,1)
stem(real(G_k));
title('Single point DFT - Real part of G[k]')
xlabel('Frequency index k')
ylabel('Amplitude')
subplot(4,1,2)
stem(imag(G_k));
title('Single point DFT - Imag part of G[k]')
xlabel('Frequency index k')
ylabel('Amplitude')
subplot(4,1,3)
stem(real(H_k));
title('Single point DFT - Real part of H[k]')
xlabel('Frequency index k')
ylabel('Amplitude')
subplot(4,1,4)
stem(imag(H_k));
title('Single point DFT - Imag part of H[k]')
xlabel('Frequency index k')
ylabel('Amplitude')

%% Calculate two point G_k and H_k with 3.13.
G_k2 = fft(g,L);
H_k2 = fft(h,L);

figure(4)
subplot(4,1,1)
stem(real(G_k2));
title('Two point DFT - Real part of G[k]')
xlabel('Frequency index k')
ylabel('Amplitude')
subplot(4,1,2)
stem(imag(G_k2));
title('Two point DFT - Imag part of G[k]')
xlabel('Frequency index k')
ylabel('Amplitude')
subplot(4,1,3)
stem(real(H_k2));
title('Two point DFT - Real part of H[k]')
xlabel('Frequency index k')
ylabel('Amplitude')
subplot(4,1,4)
stem(imag(H_k2));
title('Two point DFT - Imag part of H[k]')
xlabel('Frequency index k')
ylabel('Amplitude')

%% Calculate IDFT of two sequncec from single point DFT
g2 = ifft(G_k);
h2 = ifft(H_k);

figure(5)
subplot(4,1,1)
stem(n,g2);
title('Real part g2 in Time domain')
xlabel('Sample Number')
ylabel('Amplitude')

subplot(4,1,2)
stem(n,g2);
title('Imag part g2 in Time domain')
xlabel('Sample Number')

subplot(4,1,3)
stem(n,h2);
title('Real part h2 in Time domain')
xlabel('Sample Number')
ylabel('Amplitude')

subplot(4,1,4)
stem(n,h2);
title('Imag part h2 in Time domain')
xlabel('Sample Number')

%% Difference
gd = g - g2;
hd = h - h2;

figure(5)
subplot(4,1,1)
stem(n,gd);
title('Real part g2 in Time domain')
xlabel('Sample Number')
ylabel('Amplitude')

subplot(4,1,2)
stem(n,gd);
title('Imag part g2 in Time domain')
xlabel('Sample Number')

subplot(4,1,3)
stem(n,hd);
title('Real part h2 in Time domain')
xlabel('Sample Number')
ylabel('Amplitude')

subplot(4,1,4)
stem(n,hd);
title('Imag part h2 in Time domain')
xlabel('Sample Number')