%%%%%%Exp03a%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear all
close all


[signal,Fs] = audioread('audio48kHz.wav');
nf=1024; %number of point in DTFT
f =-Fs/2:(Fs)/(nf-1):Fs/2;
Y = (abs(fft(signal,nf)));
subplot(3,1,1);
stem(f,Y);
xlabel('frequency');
ylabel('X(f)');
title('FFT of audio signal');

n_up = 2;  %upsampling by 2
x1 = upsample(signal,n_up);
X1 = (abs(fft(x1,nf)));
f1 =-2*Fs/2:(2*Fs)/(nf-1):2*Fs/2;
subplot(3,1,2);
stem(f1,X1);
xlabel('frequency');
ylabel('X(f)');
title('FFT of upsampled audio signal by 2');
n_dn = 4;  %downsample by 4
x2 = downsample(signal,n_dn);
X2 = (abs(fft(x2,nf)));
f2 =-Fs/8:(Fs/4)/(nf-1):Fs/8;
subplot(3,1,3);
stem(f2,X2);
xlabel('frequency');
ylabel('X(f)');
title('FFT of downsampled audio signal by 2');

soundsc(signal, Fs);
soundsc(x1, n_up*Fs);
soundsc(x2x, n_up*Fs/n_dn);