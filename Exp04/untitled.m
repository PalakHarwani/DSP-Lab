fs=10000;
dtmfr=[697,770,852,941];
dtmfc=[1209,1336,1477,1633];
keyf=zeros(16,2);
keys=['1','2','3','A','4','5','6','B','7','8','9','C','*','0','#','D'];
%assigning frow and fcol for the keys
for t=0:1:15
[i,j]=quorem(sym(t),sym(4));
keyf(t+1,1)=dtmfr(i+1);
keyf(t+1,2)=dtmfc(j+1);
end
%randomly selecting p keys as testcases
p=4;
r=randi([1 16],1,p);
ip=keys(r)
N=500;
f=-fs/2:fs/N:fs/2-fs/N;
%time division multiplexing of the p signals produced into single signal
sig=zeros(1,N*p);
%coding the corresponding signals for each key selected
for k=1:p
l=N*(k-1);
n=1:1:500;
f1=keyf(r(k),1);
f2=keyf(r(k),2);
sig(l+n)=sin(2*pi*f1*n/fs)+sin(2*pi*f2*n/fs);
figure
subplot(2,1,1)
plot(sig(l+n));
title(sprintf('Signal corresponding to the key %c',ip(k)));
xlabel('time-->');ylabel('signal-->');
sig_fft=fftshift(abs(fft(sig(l+n),N)))/N;
subplot(212)
plot(f,sig_fft);
title(sprintf('Spectrum of signal for pressed key %c',ip(k)));
xlabel('Frequency');ylabel('|X(f)|/N')
print(gcf,'Exp04_4.png','-dpng','-r300');
end
eval_row=zeros(1,4);
eval_col=zeros(1,4);
row=0; col=0; I=0;
for k=1:p
l=500*(k-1);
%decoding the signal to identify the p keys selected
for i=1:4
L=100;
n=0:1:L-1;
hrow=cos(2*pi*dtmfr(i)*n/fs);
%BPF filter designhcol=cos(2*pi*dtmfc(i)*n/fs);
filter_oprow=filter(hrow,1,sig(l+1:l+500));
filter_opcol=filter(hcol,1,sig(l+1:l+500));
%evaluating the rms of the filtered outputs
eval_row(i)=rms(filter_oprow);
eval_col(i)=rms(filter_opcol);
end
%estimating the maximum to detect the key pressed
[I,row]=max(eval_row);
[I,col]=max(eval_col);
z=(row-1)*4 + col;
fprintf('Frequency detected:%d and %d;Key is %c \n',dtmfr(row),dtmfc(col),keys(z));
end