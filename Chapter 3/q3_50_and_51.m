%% Q3.50
L = input('Zeljeni broj uzoraka: ');
num = [2 5 9 5 3];
den = [5 45 2 1 1];
[g t] = impz(num,den,L);
stem(t,g);
%% Q3.51
clf;
num = [2 5 9 5 3];
den = [5 45 2 1 1];
% partial fraction expansion
[r p k] = residuez(num,den);
disp(r);
disp(p);