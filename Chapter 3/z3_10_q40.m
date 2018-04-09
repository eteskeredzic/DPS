%  Q3_40
% linearna konvolucija preko DFT
x1 = [1 2 2 4 5];
x2 = [2 3 0 2 1];
x1e = [x1 zeros(1,length(x2)-1)]; % dodaj zero-padding
x2e = [x2 zeros(1,length(x1)-1)];
x1dft = fft(x1e); %% izracunaj DFT
x2dft = fft(x2e);
% ako se sada uzme proizvod ova dva DFTa, to ce biti linearna konvolucija
% u vremenskom domenu (jer smo dodali padding) - valjda 
yl = real(ifft(x1dft.*x2dft));
disp('Linearna konvolucija preko DFT: ');
disp(round(yl));
disp('Klasicni postupak: '); 
disp(conv(x1,x2));