%%%%%%%%%%%%%Exp04%%%%%%%%%%%%
clc
clear all
close all


key = 'B';
Fs = 3500;
nf = 1024;
beta = 1;
L = Fs;

wc = [697 770 852 941 1209 1336 1477 1633];
x = gen_dtmf(key, Fs);
s = 0:1/Fs:0.1;

h1 = beta*cos(wc(1,1)*2*pi*s);
h2 = beta*cos(wc(1,2)*2*pi*s);
h3 = beta*cos(wc(1,3)*2*pi*s);
h4 = beta*cos(wc(1,4)*2*pi*s);
h5 = beta*cos(wc(1,5)*2*pi*s);
h6 = beta*cos(wc(1,6)*2*pi*s);
h7 = beta*cos(wc(1,7)*2*pi*s);
h8 = beta*cos(wc(1,8)*2*pi*s);


y1 = conv(x, h1);
y2 = conv(x, h2);
y3 = conv(x, h3);
y4 = conv(x, h4);
y5 = conv(x, h5);
y6 = conv(x, h6);
y7 = conv(x, h7);
y8 = conv(x, h8);

Y = zeros(1,8);
Y(1) = max(fftshift(abs(fft(y1,nf))));
Y(2) = max(fftshift(abs(fft(y2,nf))));
Y(3) = max(fftshift(abs(fft(y3,nf))));
Y(5) = max(fftshift(abs(fft(y5,nf))));
Y(6) = max(fftshift(abs(fft(y6,nf))));
Y(4) = max(fftshift(abs(fft(y4,nf))));
Y(7) = max(fftshift(abs(fft(y7,nf))));
Y(8) = max(fftshift(abs(fft(y8,nf))));

[M1,I1] = max(Y);
temp = Y(I1);
Y(I1) = -inf;
[M2, I2] = max(Y);
Y(I1) = temp;

Key = 100;

if(I1 == 1 && I2 == 5 )
    Key = '1';
elseif(I2 == 1 && I1 == 5)
    Key = '1';
elseif(I1 == 1 && I2 == 6)
    Key = '2';
elseif(I2 == 1 && I1 == 6)
    Key = '2';
elseif (I1 == 1 && I2 == 7)
    Key = '3';
elseif(I2 == 1 && I1 == 7)
    Key = '3';
elseif(I1 == 2 && I2 == 5)
    Key = '4';
elseif(I2 == 2 && I1 == 5)
    Key = '4';
elseif(I1 == 2 && I2 == 6)
    Key = '5';
elseif(I2 == 2 && I1 == 6)
    Key = '5';
elseif(I1 == 2 && I2 == 7)
    Key = '6';
elseif(I2 == 2 && I1 == 7)
    Key = '6';
elseif(I1 == 3 && I2 == 5)
    Key = '7';
elseif(I2 == 3 && I1 == 5)
    Key = '7';
elseif(I1 == 3 && I2 == 6)
    Key = '8';
elseif(I2 == 3 && I1 == 6)
    Key = '8';
elseif(I1 == 3 && I2 == 7)
    Key = '9';
elseif(I2 == 3 && I1 == 7)
    Key = '9';
elseif(I1 == 4 && I2 == 6)
    Key = '0';
elseif(I2 == 4 && I1 == 6)
    Key = '0';
elseif(I1 == 4 && I2 == 5)
    Key = '*';
elseif(I2 == 4 && I1 == 5)
    Key = '*';
elseif(I1 == 4 && I2 == 7)
    Key = '#';
elseif(I2 == 4 && I1 == 7)
    Key = '#';
elseif(I1 == 1 && I2 == 8)
    Key = 'A';
elseif(I2 == 1 && I1 == 8)
    Key = 'A';
elseif(I1 == 2 && I2 == 8)
    Key = 'B';
elseif(I2 == 2 && I1 == 8)
    Key = 'B';
elseif(I1 == 3 && I2 == 8)
    Key = 'C';
elseif(I2 == 3 && I1 == 8)
    Key = 'C';
elseif(I1 == 4 && I2 == 8)
    Key = 'D';
elseif(I2 == 4 && I1 == 8)
    Key = 'D';
end


Key




