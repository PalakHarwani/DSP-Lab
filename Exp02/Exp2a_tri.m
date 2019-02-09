clc
clear all
close all

t = 0: 1 : 1000;

x = 2* cos(0.1*pi*t) + 3*cos(0.8*pi*t);
noise = 2*randn(1,length(x));
x_noise = x + noise;
subplot(4,2,1);
plot(t,x);
title('original signal');


x1 = fftshift(abs(fft(x,1024)));
f = -1/2:1/1023:1/2;
subplot(4,2,2);
plot(f,x1);
title('FFT of original signal');

subplot(4,2,3);
plot(t,x_noise);
title('original signal with noise');

x1_noise = fftshift(abs(fft(x_noise,1024)));
f = -1/2:1/1023:1/2;
subplot(4,2,4);
plot(f,x1_noise);
title('FFT of original signal with noise');


N = 64; %Number of samples 
n = 1:1:N;
wc = 0.3*pi;
k = (N-1)/2;
hd = zeros(1,N);

for i = 1:N
    if i ==k
        hd(1,i) = wc/pi;
    else
        hd(1,i) = (sin(wc*(i-k)))/(pi*(i-k));
    end
end

%%%%%%%%%%%%triangular window%%%%%%%%%%%%%%%%%%%%%%%

w_tri = zeros(1,N);
for i = 1:N
    w_tri(1,i) = 1 - 2*(i - (N-1)/2)/(N-1);
end
h1 = hd.*w_tri;

y = filtfilt(h1,1,x);
subplot(4,2,5);
plot(y);
title('filtered signal');
axis([0 1000 -5 5])
y1 = fftshift(abs(fft(y,1024)));
f = -1/2:1/1023:1/2;
subplot(4,2,6);
plot(f,y1);
title('FFT of filtered signal');

y_noise = filtfilt(h1,1,x_noise);
subplot(4,2,7);
plot(t,y_noise);
title('filtered signal with noise');
y1_noise = fftshift(abs(fft(y_noise,1024)));
f = -1/2:1/1023:1/2;
subplot(4,2,8);
plot(f,y1_noise);
title('FFT of filtered signal with noise');







