clc
clear all
close all

t = 0: 1 : 10000;
figure('Name', 'Rectangular window');

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


N = 512; %Number of samples 
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



%%%%%%%%%%%%rectangular window%%%%%%%%%%%%%%%%%%%%%%%
w_rect = ones(1,N);
h1 = hd.*w_rect;

y_rec = filtfilt(h1,1,x);
subplot(4,2,5);
plot(y_rec);
title('filtered signal');
axis([0 1000 -5 5])
y1_rec = fftshift(abs(fft(y_rec,1024)));
f = -1/2:1/1023:1/2;
subplot(4,2,6);
plot(f,y1_rec);
title('FFT of filtered signal');

y_noise_rec = filtfilt(h1,1,x_noise);
subplot(4,2,7);
plot(t,y_noise_rec);
title('filtered signal with noise');
y1_noise_rec = fftshift(abs(fft(y_noise_rec,1024)));
f = -1/2:1/1023:1/2;
subplot(4,2,8);
plot(f,y1_noise_rec);
title('FFT of filtered signal with noise');
axis([-0.3 0.3 0 1500])

%%%%%%%%%%%%triangular window%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure('Name', 'Triangular window');

subplot(4,2,1);
plot(t,x);
title('original signal');

subplot(4,2,2);
plot(f,x1);
title('FFT of original signal');

subplot(4,2,3);
plot(t,x_noise);
title('original signal with noise');

subplot(4,2,4);
plot(f,x1_noise);
title('FFT of original signal with noise');


w_tri = zeros(1,N);
for i = 1:N
    w_tri(1,i) = 1 - 2*(i - (N-1)/2)/(N-1);
end
h2 = hd.*w_tri;

y_tri = filtfilt(h2,1,x);
subplot(4,2,5);
plot(y_tri);
title('filtered signal');
axis([0 1000 -5 5])
y1_tri = fftshift(abs(fft(y_tri,1024)));
f = -1/2:1/1023:1/2;
subplot(4,2,6);
plot(f,y1_tri);
title('FFT of filtered signal');

y_noise_tri = filtfilt(h2,1,x_noise);
subplot(4,2,7);
plot(t,y_noise_tri);
title('filtered signal with noise');
y1_noise_tri = fftshift(abs(fft(y_noise_tri,1024)));
f = -1/2:1/1023:1/2;
subplot(4,2,8);
plot(f,y1_noise_tri);
title('FFT of filtered signal with noise');
axis([-0.3 0.3 0 1500])

%%%%%%%%%%%%hanning window%%%%%%%%%%%%%%%%%%%%%%%

figure('Name', 'Hanning');

subplot(4,2,1);
plot(t,x);
title('original signal');

subplot(4,2,2);
plot(f,x1);
title('FFT of original signal');

subplot(4,2,3);
plot(t,x_noise);
title('original signal with noise');

subplot(4,2,4);
plot(f,x1_noise);
title('FFT of original signal with noise');


w_hanning = zeros(1,N);
for i = 1:N
    w_hanning(1,i) = 0.5 - 0.5*(cos(2*pi*i/(N-1)));
end
h3 = hd.*w_hanning;

y_hann = filtfilt(h3,1,x);
subplot(4,2,5);
plot(y_hann);
title('filtered signal');
axis([0 1000 -5 5])
y1_hann = fftshift(abs(fft(y_hann,1024)));
f = -1/2:1/1023:1/2;
subplot(4,2,6);
plot(f,y1_hann);
title('FFT of filtered signal');

y_noise_hann = filtfilt(h3,1,x_noise);
subplot(4,2,7);
plot(t,y_noise_hann);
title('filtered signal with noise');
y1_noise_hann = fftshift(abs(fft(y_noise_hann,1024)));
f = -1/2:1/1023:1/2;
subplot(4,2,8);
plot(f,y1_noise_hann);
title('FFT of filtered signal with noise');
axis([-0.3 0.3 0 1500])

%%%%%%%%%%%%hamming window%%%%%%%%%%%%%%%%%%%%%%%
figure('Name', 'Hamming');
subplot(4,2,1);
plot(t,x);
title('original signal');

subplot(4,2,2);
plot(f,x1);
title('FFT of original signal');

subplot(4,2,3);
plot(t,x_noise);
title('original signal with noise');

subplot(4,2,4);
plot(f,x1_noise);
title('FFT of original signal with noise');


w_hamming = zeros(1,N);
for i = 1:N
    w_hamming(1,i) = 0.54 - 0.46*(cos(2*pi*i/(N-1)));
end
h4 = hd.*w_hamming;

y_hamm = filtfilt(h4,1,x);
subplot(4,2,5);
plot(y_hamm);
title('filtered signal');
axis([0 1000 -5 5])
y1_hamm = fftshift(abs(fft(y_hamm,1024)));
f = -1/2:1/1023:1/2;
subplot(4,2,6);
plot(f,y1_hamm);
title('FFT of filtered signal');

y_noise_hamm = filtfilt(h4,1,x_noise);
subplot(4,2,7);
plot(t,y_noise_hamm);
title('filtered signal with noise');
y1_noise_hamm = fftshift(abs(fft(y_noise_hamm,1024)));
f = -1/2:1/1023:1/2;
subplot(4,2,8);
plot(f,y1_noise_hamm);
title('FFT of filtered signal with noise');
axis([-0.3 0.3 0 1500])

%%%%%%%%%%%%blackmann window%%%%%%%%%%%%%%%%
figure('Name', 'Blackmann');
subplot(4,2,1);
plot(t,x);
title('original signal');

subplot(4,2,2);
plot(f,x1);
title('FFT of original signal');

subplot(4,2,3);
plot(t,x_noise);
title('original signal with noise');

subplot(4,2,4);
plot(f,x1_noise);
title('FFT of original signal with noise');


w_tri = zeros(1,N);
for i = 1:N
    w_tri(1,i) = 1 - 2*(i - (N-1)/2)/(N-1);
end
h5 = hd.*w_tri;

y_bm = filtfilt(h5,1,x);
subplot(4,2,5);
plot(y_bm);
title('filtered signal');
axis([0 1000 -5 5])
y1_bm = fftshift(abs(fft(y_bm,1024)));
f = -1/2:1/1023:1/2;
subplot(4,2,6);
plot(f,y1_bm);
title('FFT of filtered signal');

y_noise_bm = filtfilt(h5,1,x_noise);
subplot(4,2,7);
plot(t,y_noise_bm);
title('filtered signal with noise');
y1_noise_bm = fftshift(abs(fft(y_noise_bm,1024)));
f = -1/2:1/1023:1/2;
subplot(4,2,8);
plot(f,y1_noise_bm);
title('FFT of filtered signal with noise');
axis([-0.3 0.3 0 1500])
