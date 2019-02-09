%%%Exp 01 1 to 8(before a,b,c,d)
clc
clear all
close all

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

subplot(3,1,1);
plot(n,hd);
title("LPF: hd[n]");


%%%%%%%%%%%%rectangular window%%%%%%%%%%%%%%%%%%%%%%%
w_rect = ones(1,N);
subplot(3,1,2);
plot(n, w_rect);
title("rectangular window");

h1 = hd.*w_rect;
w = (-1)*pi : 0.01 : pi;

hf1 = freqz(h1,1,w);
hf_abs1 = 20*log10(abs(hf1));
subplot(3,1,3);
plot(w/pi,hf_abs1);
title("windowed LPF");
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude (dB)')

%%%%%%%%%%%%triangular window%%%%%%%%%%%%%%%%%%%%%%%
figure;
subplot(3,1,1);
plot(n,hd);
title("LPF: hd[n]");

w_tri = zeros(1,N);
for i = 1:N
    w_tri(1,i) = 1 - 2*(i - (N-1)/2)/(N-1);
end
subplot(3,1,2);
plot(n, w_tri);
title("triangular window");

h2 = hd.*w_tri;
w = (-1)*pi : 0.01 : pi;

hf2 = freqz(h2,1,w);
hf_abs2 = 20*log10(abs(hf2));
subplot(3,1,3);
plot(w/pi,hf_abs2);
title("windowed LPF");
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude (dB)')

%%%%%%%%%%%%hanning window%%%%%%%%%%%%%%%%%%%%%%%

figure;
subplot(3,1,1);
plot(n,hd);
title("LPF: hd[n]");

w_hanning = zeros(1,N);
for i = 1:N
    w_hanning(1,i) = 0.5 - 0.5*(cos(2*pi*i/(N-1)));
end
subplot(3,1,2);
plot(n, w_hanning);
title("hanning window");

h3 = hd.*w_hanning;
w = (-1)*pi : 0.01 : pi;

hf3 = freqz(h3,1,w);
hf_abs3 = 20*log10(abs(hf3));
subplot(3,1,3);
plot(w/pi,hf_abs3);
title("windowed LPF");
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude (dB)')


%%%%%%%%%%%%hamming window%%%%%%%%%%%%%%%%%%%%%%%

figure;
subplot(3,1,1);
plot(n,hd);
title("LPF: hd[n]");

w_hamming = zeros(1,N);
for i = 1:N
    w_hamming(1,i) = 0.54 - 0.46*(cos(2*pi*i/(N-1)));
end
subplot(3,1,2);
plot(n, w_hamming);
title("hamming window");

h4 = hd.*w_hamming;
w = (-1)*pi : 0.01 : pi;

hf4 = freqz(h4,1,w);
hf_abs4 = 20*log10(abs(hf4));
subplot(3,1,3);
plot(w/pi,hf_abs4);
title("windowed LPF");
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude (dB)')

%%%%%%%%%%%%blackmann window%%%%%%%%%%%%%%%%%%%%%%%

figure;
subplot(3,1,1);
plot(n,hd);
title("LPF: hd[n]");

w_blackmann = zeros(1,N);
for i = 1:N
    w_blackmann(1,i) = 0.42 - 0.5*(cos(2*pi*i/(N-1))) + 0.08*(cos(4*pi*i/(N-1)));
end
subplot(3,1,2);
plot(n, w_blackmann);
title("blackmann window");

h5 = hd.*w_blackmann;
w = (-1)*pi : 0.01 : pi;

hf5 = freqz(h5,1,w);
hf_abs5 = 20*log10(abs(hf5));
subplot(3,1,3);
plot(w/pi,hf_abs5);
title("windowed LPF");
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude (dB)')





