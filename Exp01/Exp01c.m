%Exp01c

Fs = 20000; %sampling frequency 20KHz
f = 1000; %square wave frequency 1KHz

t= 0:1/Fs:0.001;


x = 0.5*square(2*pi*f*t,50);
subplot(2,1,1);
stem(t,x);
title('Sampled plot');
axis([0 0.001 -1 1]);

%DFT:

N = 128;
f =-Fs/2:Fs/(N-1):Fs/2;
y1 = fft(x,N);
y = abs(y1);
%plot(y)
y_f=fftshift(y);
subplot(2,1,2);
stem(f,y_f);
title('N=256');
xlabel('f');
ylabel('X(f)');