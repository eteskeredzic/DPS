% Program P3_6B
% Time Reversal Property of DTFT
clf;
w = -pi:2*pi/255:pi; % freqency vector for evaluating DTFT
% original ramp sequence
% note: num is nonzero for 0 <= n <= 3.
num = [1 2 3 4];
L = length(num)-1;
h1 = freqz(num, 1, w); % DTFT of original ramp sequence
h2 = freqz(fliplr(num), 1, w);
h3 = exp(w*L*1i).*h2;
% plot the magnitude spectrum of the original ramp sequence
subplot(2,2,1)
plot(w/pi,abs(h1));grid
title('Magnitude Spectrum of Original Sequence','FontSize',8)
xlabel('\omega /\pi');
ylabel('Amplitude');
% plot the magnitude spectrum of the time reversed ramp sequence
subplot(2,2,2)
plot(w/pi,abs(h3));grid
title('Magnitude Spectrum of Time-Reversed Sequence','FontSize',8)
xlabel('\omega /\pi');
ylabel('Amplitude');
% plot the phase spectrum of the original ramp sequence
subplot(2,2,3)
plot(w/pi,angle(h1));grid
title('Phase Spectrum of Original Sequence','FontSize',8)
xlabel('\omega /\pi');
ylabel('Phase in radians');
% plot the phase spectrum of the time reversed ramp sequence
subplot(2,2,4)
plot(w/pi,angle(h3));grid
title('Phase Spectrum of Time-Reversed Sequence','FontSize',8)
xlabel('\omega /\pi');
ylabel('Phase in radians');