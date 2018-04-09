clf;
num = [2 5 9 5 3];
den = [5 45 2 1 1];
zplane(num,den);
[z p k] = tf2zpk(num,den);
disp('Nule:');
disp(z);
disp('Polovi:');
disp(p);
sos = zp2sos(z,p,k);
disp('Sos:');
disp(sos);
%% Q 3.49
z = [0.3 2.5 -0.2+1i*0.4 -0.2-1i*0.4];
p = [0.5 -0.75 0.6+1i*0.7 0.6-1i*0.7];
k = 3.9;
[num,den] = zp2tf(z',p',k);
disp(num);
disp(den);
