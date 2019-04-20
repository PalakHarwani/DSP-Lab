[signal , fs]=audioread('audio48kHz.wav');
N=length(signal);
df=fs/N;
freq=-fs/2:df:fs/2-df;
%FFT of the audio_file
X=fftshift(abs(fft(signal))/N);
plot(freq,X);
title('FFT of audio signal');
xlabel('Frequency');
ylabel('|X(f)|/N');
print(gcf,'03a_audio48kHz.png','-dpng','-r300');
upsig2=zeros(1,2*N);
upsig4=zeros(1,4*N);
upsig6=zeros(1,6*N);
%Upsampling the signal by 2,4,6
for i=1:N
upsig2(1,2*i)=signal(i);
upsig4(1,4*i)=signal(i);
upsig6(1,6*i)=signal(i);
end
%FFT of upsampled signals
Xup2=fftshift(abs(fft(upsig2(1,:)))/(2*N));
Xup4=fftshift(abs(fft(upsig4(1,:)))/(4*N));
Xup6=fftshift(abs(fft(upsig6(1,:)))/(6*N));
figure
subplot(3,1,1);
frequp2=-fs/2:df/2:fs/2-df/2;
plot(frequp2,Xup2);
title('FFT of audio upsampled signal by 2');
xlabel('Frequency');ylabel('|X(f)|/N');
subplot(3,1,2);
frequp4=-fs/2:df/4:fs/2-df/4;
plot(frequp4,Xup4);
title('FFT of audio upsampled signal by 4');
xlabel('Frequency');ylabel('|X(f)|/N');
subplot(3,1,3);
frequp6=-fs/2:df/6:fs/2-df/6;
plot(frequp6,Xup6);
title('FFT of audio upsampled signal by 6');
xlabel('Frequency');ylabel('|X(f)|/N');
print(gcf,'03a_upsample.png','-dpng','-r300');

%Downsampling by 4
downsig4=zeros(1,floor(N/4));
for i=1:floor(N/4)
downsig4(1,i)=signal(4*i);
end

%Downsampling by 6
downsig6=zeros(1,floor(N/6));
for i=1:floor(N/6)
downsig6(1,i)=signal(6*i);
end
%Downsampling by 8
downsig8=zeros(1,floor(N/8));
for i=1:floor(N/8)
downsig8(1,i)=signal(8*i);
end
%FFT of downsampled signals
Xdown4=fftshift(abs(fft(downsig4(1,:)))/(floor(N/4)));
Xdown6=fftshift(abs(fft(downsig6(1,:)))/(floor(N/6)));
Xdown8=fftshift(abs(fft(downsig8(1,:)))/(floor(N/8)));
figure
subplot(3,1,1);
freqd4=-fs/2:4*df:fs/2-4*df;
plot(freqd4,Xdown4);
title('FFT of audio downsampled signal by 4');
xlabel('Frequency');ylabel('|X(f)|/N');
subplot(3,1,2);
freqd6=-fs/2:6*df:fs/2-6*df;
plot(freqd6,Xdown6);
title('FFT of audio downsampled signal by 6');
xlabel('Frequency');ylabel('|X(f)|/N');
subplot(3,1,3);
freqd8=-fs/2:8*df:fs/2-8*df;
plot(freqd8,Xdown8);
title('FFT of audio downsampled signal by 8');
xlabel('Frequency');ylabel('|X(f)|/N');
print(gcf,'03a_downsample.png','-dpng','-r300');
%Creating audio files of corresponding upsampled signals
audiowrite('audioup2.wav',upsig2,2*fs);
audiowrite('audioup4.wav',upsig4,4*fs);
audiowrite('audioup6.wav',upsig6,6*fs);
%Creating audio files of corresponding downsampled signals
audiowrite('audiodown4.wav',downsig4,fs/4);
audiowrite('audiodown6.wav',downsig6,fs/6);
audiowrite('audiodown8.wav',downsig8,fs/8);