[signal,fs]=audioread('fivewo.wav');
N=length(signal);
nb=[1,2,3,4,8,16];
f1=90;
f2=5760;
%Random noise
noise=rand(1,N);
sig=zeros(6,N);
for p=1:6
n=nb(p);
k=nthroot(f2/f1,n);
band=zeros(1,n+1);
%Creating the edge frequencies for given number of bands
for i=1:n+1
band(i)=f1*(k^(i-1));
end
bandsig=zeros(n,N);
noisebp=zeros(n,N);
%bandsig:Filetered component of the signal in respective bands
%noisebp:Filetered component of the noise in respective bands
for i=1:n
[b, a]=butter(2,[band(i) , band(i+1)].*(2/fs),'bandpass');
bandsig(i,:)=filtfilt(b,a,signal);
noisebp(i,:)=filtfilt(b,a,noise);
end
env=zeros(n,N);
%Envelop of bandpass filtered components in respective bands
for i=1:n
y=hilbert(bandsig(i,:));
env(i,:)=abs(y);
end
%Designing lowpass filter with fcutoff=240Hz: 2pi*240/fs
fcut=240*2/fs;
[blow,alow]=butter(2,fcut,'low');
envlow=zeros(n,N);
envnoise=zeros(n,N);
%envlow:Lowpass filtered componentof envelop in respective bands
%envnoise:Envlow multiplied elementwise with respective bandpass
%component of noise
for i=1:n
envlow(i,:)=filtfilt(blow,alow,env(i,:));
envnoise(i,:)=envlow(i,:).*noisebp(i,:);
end
%Final ouput signal by elementwise addition of envnoise
for j=1:N
for i=1:n
sig(p,j)=sig(p,j)+ envnoise(i,j);
end
end
end

%Scaling by multiplying with (number of bands)^0.5
for p=1:6
sig(p,:)=(sig(p,:))*sqrt(nb(p));
end
%Converting the signals into audio files
audiowrite('audio_nb=1.wav',sig(1,:),fs);
audiowrite('audio_nb=2.wav',sig(2,:),fs);
audiowrite('audio_nb=3.wav',sig(3,:),fs);
audiowrite('audio_nb=4.wav',sig(4,:),fs);
audiowrite('audio_nb=8.wav',sig(5,:),fs);
audiowrite('audio_nb=16.wav',sig(6,:),fs);