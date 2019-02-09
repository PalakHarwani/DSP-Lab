%%%%%%%%%Exp03b%%%%%%%%%%
clc
clear all
close all

data = load('eeg1-f3.dat') ;
Fs = 100; %%(0 to 1 ----> 1 corresponds to 50Hz ----> 0.01 corresponds to 0.5Hz)
t= 1:1:length(data);
T = 1/Fs;
% subplot(4,2,1);
% stem(t,data);

nf=1024; %number of point in DTFT
f =-Fs/2:(Fs)/(nf-1):Fs/2;
Y = fftshift(abs(fft(data,nf)));
subplot(2,2,1);
plot(f,Y);
title('FFT of data');



[b1,a1] = butter(3,[0.01 0.08],'bandpass');
y1 = filter(b1,a1,data);
% subplot(4,2,3);
% stem(t,y1);
% title('Delta frequency 0.5 to 4 Hz');
Y1 = fftshift(abs(fft(y1,nf)));
subplot(2,2,2);
plot(f,Y1);
xlabel('frequency');
ylabel('X(f)');
title('FFT of delta 0.5 to 4Hz');


[b2,a2] = butter(3,[0.08 0.16],'bandpass');
y2 = filter(b2,a2,data);
% subplot(4,2,5);
% stem(t,y2);
% title('Theta frequency 4 to 8 Hz');
Y2 = fftshift(abs(fft(y2,nf)));
subplot(2,2,3);
plot(f,Y2);
xlabel('frequency');
ylabel('X(f)');
title('FFT of theta 4 to 8 Hz');

[b3,a3] = butter(3,[0.16 0.26],'bandpass');
y3 = filter(b3,a3,data);
% subplot(4,2,7);
% stem(t,y3);
% title('Alpha frequency 8 to 13Hz');
Y3 = fftshift(abs(fft(y3,nf)));
subplot(2,2,4);
plot(f,Y3);
xlabel('frequency');
ylabel('X(f)');
title('FFT of alpha 8 to 13Hz');

