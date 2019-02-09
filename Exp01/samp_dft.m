function samp_dft(fsamp)

Fs = fsamp;

t= 0:1/Fs:0.01;


x = 10*cos(2*pi*1000*t) + 6*cos(2*pi*1000*2*t) + 2*cos(2*pi*4000*t);
subplot(2,2,1);
stem(t,x);
title('Sampled plot');


%DFT:

N = 64;
f =-Fs/2:(Fs)/(N-1):Fs/2;
y1 = fft(x,N);
y = abs(y1);
y_f=fftshift(y);
subplot(2,2,2);
stem(f,y_f);
title('N=64');
xlabel('f');
ylabel('X(f)');

N = 128;
f =-Fs/2:Fs/(N-1):Fs/2;
y1 = fft(x,N);
y = abs(y1);
y_f=fftshift(y);
subplot(2,2,3);
stem(f,y_f);
title('N=128');
xlabel('f');
ylabel('X(f)');

N = 256;
f =-Fs/2:Fs/(N-1):Fs/2;
y1 = fft(x,N);
y = abs(y1);
y_f=fftshift(y);
subplot(2,2,4);
stem(f,y_f);
title('N=256');
xlabel('f');
ylabel('X(f)');

end