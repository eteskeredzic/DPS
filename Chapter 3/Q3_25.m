% Write a MATLAB program to compute the 2N-point DFT of a length-2N real
% sequence using a single N-point DFT and compare the result by computing directly the
% 2N-point DFT (see R3.14)
%% Prepare workspace
clc
clear all
close all

%%  Discrete time sequence of length N
N = 20;
two_N = N*2;
n = 0:two_N-1;
v = cos(2*pi*n*0.125);
%v = [ones(two_N,1)];
%v = (-0.4.^n);
g = downsample(v,2);
h = downsample(v,2,1);

n2 = 0:2:two_N-1/2;
figure(1)
subplot(3,1,1)
stem(n,v);
title('v[n]')
xlabel('Sample Number')
ylabel('Amplitude')

subplot(3,1,2)
stem(n2,g);
title('g[n]')
xlabel('Sample Number')
ylabel('Amplitude')

subplot(3,1,3)
stem(n2,h);
title('h[n]')
xlabel('Sample Number')
ylabel('Amplitude')

%% Izracunati FFT sekvence g[n] i h[n]
G_k = fft(g);
H_k = fft(h);

% Izracunati FFT sekvence v[k]
V_k = [G_k G_k] + [H_k H_k].*(exp(-i*pi/N).^n);
 
%% Draw a figure
figure(1)
subplot(2,1,1)
stem(real(V_k));
title('Real part V_k in Freq domain')
xlabel('Sample Number')
ylabel('Amplitude')

subplot(2,1,2)
stem(imag(V_k));
title('Imag part V_k in Freq domain')
xlabel('Sample Number')
ylabel('Amplitude')


%% Compute V[k] directly
V_k_d = fft(v); 

% Draw a figure
figure(2)
subplot(2,1,1)
stem(real(V_k_d));
title('Real part V_k_d in Freq domain')
xlabel('Sample Number')
ylabel('Amplitude')

subplot(2,1,2)
stem(imag(V_k_d));
title('Imag part V_k_d in Freq domain')
xlabel('Sample Number')
ylabel('Amplitude')

%% Difference between Vk i V_k_d
diff = V_k - V_k_d;

figure(3)
subplot(2,1,1)
stem(real(diff));
title('Difference between V_k - V_k_d (real)')
xlabel('Sample Number')
ylabel('Amplitude')

subplot(2,1,2)
stem(imag(diff));
title('Difference between V_k - V_k_d (imag)')
xlabel('Sample Number')
ylabel('Amplitude')