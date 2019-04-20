%%%%%%%%%Exp03c%%%%%%%%%%
clc
clear all
close all

[x,Fs] = audioread('fivewo.wav');
%sound(x,Fs);
x = x./max(abs(x));
t = linspace(0,1 ,size(x,1));
nf = 1024;
f =-Fs/2:(Fs)/(nf-1):Fs/2;
X = fftshift(abs(fft(x,nf)));
w_lp = 240*2/Fs;
[b,a] = butter(2,w_lp,'low');
noise = randn(length(x),1);



%%%%%%%%%%%%%1 band%%%%%%%%%%%%%
%%%%BPF - 90Hz to 5.76kHz
%%%%%%% 1 corresponds to Fs/2
w1L = 90*2/Fs;
w1H = 5760*2/Fs;
[b1,a1] = butter(2,[w1L w1H],'bandpass');
y1 = filtfilt(b1,a1,x);
n1 = filtfilt(b1,a1,noise);
Y1 = fftshift(abs(fft(y1,nf)));
figure
subplot(2,2,1);
plot(t,x);
title('original audio signal')
subplot(2,2,2);
plot(f,X);
title('FFT of original audio signal')
y1_e = abs(hilbert(y1));
y1_f = filtfilt(b,a,y1_e);
y1_n = y1_f.*n1;
subplot(2,2,3);
plot(t,y1_n,'b');
title('1 band filtered envelope audio signal')
Y1_F = fftshift(abs(fft(y1_n,nf)));
subplot(2,2,4);
plot(f,Y1_F,'b');
title('FFT of 1 band filtered envelope audio signal')
filename = '1band.wav';
audiowrite(filename,y1_n,Fs);
%sound(y1_n, Fs);

%%%%%%%%%%%%%2 bands%%%%%%%%%%%%%
%%%%BPF - 90Hz to 720Hz  and 720 to 5760Hz
%%%%%%% 1 corresponds to Fs/2
w2L = 90*2/Fs;
w2H = 5760*2/Fs;
w2M = 720*2/Fs;
[b21,a21] = butter(2,[w2L w2M],'bandpass');
y21 = filtfilt(b21,a21,x);
Y21 = fftshift(abs(fft(y21,nf)));
n21 = filtfilt(b21,a21,noise);
[b22,a22] = butter(2,[w2M w2H],'bandpass');
y22 = filtfilt(b22,a22,x);
Y22 = fftshift(abs(fft(y22,nf)));
n22 = filtfilt(b22,a22,noise);
figure
subplot(2,2,1);
plot(t,x);
title('original audio signal')
subplot(2,2,2);
plot(f,X);
title('FFT of original audio signal')
y21_e = abs(hilbert(y21));
y21_f = filtfilt(b,a,y21_e);
y21_n = y21_f.*n21;
subplot(2,2,3);
plot(t,y21_e,'b');
y22_e = abs(hilbert(y22));
y22_f = filtfilt(b,a,y22_e);
y22_n = y22_f.*n22;
y2 = y21_n + y22_n;
subplot(2,2,3);
plot(t,y2);
title('2 band filtered envelope audio signal')
Y2 = fftshift(abs(fft(y2,nf)));
subplot(2,2,4);
plot(f,Y2);
title('FFT of 2 band filtered envelope audio signal')
filename = '2band.wav';
audiowrite(filename,y2,Fs);
%sound(y2, Fs);


%%%%%%%%%%%%%3 bands%%%%%%%%%%%%%
%%%%BPF - 90Hz to 360Hz  and 360 to 1440Hz and 1440Hz to 5760Hz
%%%%%%% 1 corresponds to Fs/2
w3L = 90*2/Fs;
w3M1 = 360*2/Fs;
w3M2 = 1440*2/Fs;
w3H = 5760*2/Fs;
[b31,a31] = butter(2,[w3L w3M1],'bandpass');
y31 = filtfilt(b31,a31,x);
Y31 = fftshift(abs(fft(y31,nf)));
n31 = filtfilt(b31,a31,noise);
[b32,a32] = butter(2,[w3M1 w3M2],'bandpass');
y32 = filtfilt(b32,a32,x);
Y32 = fftshift(abs(fft(y32,nf)));
n32 = filtfilt(b32,a32,noise);
[b33,a33] = butter(2,[w3M2 w3H],'bandpass');
y33 = filtfilt(b33,a33,x);
Y33 = fftshift(abs(fft(y33,nf)));
n33 = filtfilt(b33,a33,noise);
figure
subplot(2,2,1);
plot(t,x);
title('original audio signal')
subplot(2,2,2);
plot(f,X);
title('FFT of original audio signal')
y31_e = abs(hilbert(y31));
y31_f = filtfilt(b,a,y31_e);
y31_n = y31_f.*n31;
y32_e = abs(hilbert(y32));
y32_f = filtfilt(b,a,y32_e);
y32_n = y32_f.*n32;
y33_e = abs(hilbert(y33));
y33_f = filtfilt(b,a,y33_e);
y33_n = y33_f.*n33;
y3 = y31_n + y32_n + y33_n;
subplot(2,2,3);
plot(t,y3);
title('3 band filtered envelope audio signal')
Y3 = fftshift(abs(fft(y3,nf)));
subplot(2,2,4);
plot(f,Y3);
title('FFT of 3 band filtered envelope audio signal')
filename = '3band.wav';
audiowrite(filename,y3,Fs);
%sound(y3, Fs);

%%%%%%%%%%%%%4 bands%%%%%%%%%%%%%
%%%%BPF - 90Hz to 255Hz  and 255 to 720Hz and 720Hz to 2036Hz and 2036Hz to 5760Hz
%%%%%%% 1 corresponds to Fs/2
w4L = 90*2/Fs;
w4M1 = 255*2/Fs;
w4M2 = 720*2/Fs;
w4M3 = 2036*2/Fs;
w4H = 5760*2/Fs;
[b41,a41] = butter(2,[w4L w4M1],'bandpass');
y41 = filtfilt(b41,a41,x);
Y41 = fftshift(abs(fft(y41,nf)));
n41 = filtfilt(b41,a41,noise);
[b42,a42] = butter(2,[w4M1 w4M2],'bandpass');
y42 = filtfilt(b42,a42,x);
Y42 = fftshift(abs(fft(y42,nf)));
n42 = filtfilt(b42,a42,noise);
[b43,a43] = butter(2,[w4M2 w4M3],'bandpass');
y43 = filtfilt(b43,a43,x);
Y43 = fftshift(abs(fft(y43,nf)));
n43 = filtfilt(b43,a43,noise);
[b44,a44] = butter(2,[w4M3 w4H],'bandpass');
y44 = filtfilt(b44,a44,x);
Y44 = fftshift(abs(fft(y44,nf)));
n44 = filtfilt(b44,a44,noise);
figure
subplot(2,2,1);
plot(t,x);
title('original audio signal')
subplot(2,2,2);
plot(f,X);
title('FFT of original audio signal')
y41_e = abs(hilbert(y41));
y41_f = filtfilt(b,a,y41_e);
y41_n = y41_f.*n41;
y42_e = abs(hilbert(y42));
y42_f = filtfilt(b,a,y42_e);
y42_n = y42_f.*n42;
y43_e = abs(hilbert(y43));
y43_f = filtfilt(b,a,y43_e);
y43_n = y43_f.*n43;
y44_e = abs(hilbert(y44));
y44_f = filtfilt(b,a,y44_e);
y44_n = y44_f.*n44;
y4 = y41_n + y42_n + y43_n + y44_n;
subplot(2,2,3);
plot(t,y4);
title('4 band filtered envelope audio signal')
Y4 = fftshift(abs(fft(y4,nf)));
subplot(2,2,4);
plot(f,Y4);
title('FFT of 4 band filtered envelope audio signal')
filename = '4band.wav';
audiowrite(filename,y4,Fs);
%sound(y4, Fs);


%%%%%%%%%%%%%8 bands%%%%%%%%%%%%%
%%%%BPF - 90Hz to 151.3Hz  and 151.3 to 254.55Hz and 254.55Hz to 428.11Hz and 428.11Hz to 720Hz and 2036Hz to 5760Hz
%%%%%%% 1 corresponds to Fs/2
w8L = 90*2/Fs;
w8M1 = 151.3*2/Fs;
w8M2 = 254.55*2/Fs;
w8M3 = 428.11*2/Fs;
w8M4 = 720*2/Fs;
w8M5 = 1210.9*2/Fs;
w8M6 = 2036.46*2/Fs;
w8M7 = 3424.9*2/Fs;
w8H = 5760*2/Fs;
[b81,a81] = butter(2,[w8L w8M1],'bandpass');
y81 = filtfilt(b81,a81,x);
Y81 = fftshift(abs(fft(y81,nf)));
n81 = filtfilt(b81,a81,noise);
[b82,a82] = butter(2,[w8M1 w8M2],'bandpass');
y82 = filtfilt(b82,a82,x);
Y82 = fftshift(abs(fft(y82,nf)));
n82 = filtfilt(b82,a82,noise);
[b83,a83] = butter(2,[w8M2 w8M3],'bandpass');
y83 = filtfilt(b83,a83,x);
Y83 = fftshift(abs(fft(y83,nf)));
n83 = filtfilt(b83,a83,noise);
[b84,a84] = butter(2,[w8M3 w8M4],'bandpass');
y84 = filtfilt(b84,a84,x);
Y84 = fftshift(abs(fft(y84,nf)));
n84 = filtfilt(b84,a84,noise);
[b85,a85] = butter(2,[w8M4 w8M5],'bandpass');
y85 = filtfilt(b85,a85,x);
Y85 = fftshift(abs(fft(y85,nf)));
n85 = filtfilt(b85,a85,noise);
[b86,a86] = butter(2,[w8M5 w8M6],'bandpass');
y86 = filtfilt(b86,a86,x);
Y86 = fftshift(abs(fft(y86,nf)));
n86 = filtfilt(b86,a86,noise);
[b87,a87] = butter(2,[w8M6 w8M7],'bandpass');
y87 = filtfilt(b87,a87,x);
Y87 = fftshift(abs(fft(y87,nf)));
n87 = filtfilt(b87,a87,noise);
[b88,a88] = butter(2,[w8M7 w8H],'bandpass');
y88 = filtfilt(b88,a88,x);
Y88 = fftshift(abs(fft(y88,nf)));
n88 = filtfilt(b88,a88,noise);
figure
subplot(2,2,1);
plot(t,x);
title('original audio signal')
subplot(2,2,2);
plot(f,X);
title('FFT of original audio signal')
y81_e = abs(hilbert(y81));
y81_f = filtfilt(b,a,y81_e);
y81_n = y81_f.*n81;
y82_e = abs(hilbert(y82));
y82_f = filtfilt(b,a,y82_e);
y82_n = y82_f.*n82;
y83_e = abs(hilbert(y83));
y83_f = filtfilt(b,a,y83_e);
y83_n = y83_f.*n83;
y84_e = abs(hilbert(y84));
y84_f = filtfilt(b,a,y84_e);
y84_n = y84_f.*n84;
y85_e = abs(hilbert(y85));
y85_f = filtfilt(b,a,y85_e);
y85_n = y85_f.*n85;
y86_e = abs(hilbert(y86));
y86_f = filtfilt(b,a,y86_e);
y86_n = y86_f.*n86;
y87_e = abs(hilbert(y87));
y87_f = filtfilt(b,a,y87_e);
y87_n = y87_f.*n87;
y88_e = abs(hilbert(y88));
y88_f = filtfilt(b,a,y88_e);
y88_n = y88_f.*n88;
y8 = y81_n + y82_n + y83_n + y84_n + y85_n + y86_n + y87_n + y88_n;
subplot(2,2,3);
plot(t,y8);
title('8 band filtered envelope audio signal')
Y8 = fftshift(abs(fft(y8,nf)));
subplot(2,2,4);
plot(f,Y8);
title('FFT of 8 band filtered envelope audio signal')
filename = '8band.wav';
audiowrite(filename,y8,Fs);
%sound(y8, Fs);