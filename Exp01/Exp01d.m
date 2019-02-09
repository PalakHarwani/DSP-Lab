%Exp01d

f = 6000;
Fs1 = 12000;

t= 0:1/Fs1:0.01;
x = 10*cos(2*pi*1000*t) + 6*cos(2*pi*1000*2*t) + 2*cos(2*pi*4000*t); %sampling
subplot(2,2,1);
stem(t,x);
%length(x)
title('Sampled plot 12KHz');

%x1 = reshape([x; zeros(size(x))],[],1);
%x2 = x1';
x2 = zeros(1,2*length(x));
for i = 1:length(x2)
    if mod(i,2) == 0
        x2(1,i) = 0;
    else
        x2(1,i) = x((i+1)/2);
    end
end
t1 = zeros(1, length(x2));
t1(1,1) = 0;
for i = 2 : length(t1)
    t1(1,i) = t1(1,i-1) + 1/Fs1;
end
%t1 = cat(2,t,t);
subplot(2,2,2);
stem(t1,x2);
title('Interpolated signal');
fs = 24000;
%wn = Fc/(Fs/2) ---> wn = 6000*2/24000
[b,a] = butter(2,0.5,'low');
y = filter(b,a,x2);
%t1= 0:1/Fs1:0.01;
subplot(2,2,3);
stem(t1,y);
title('Filtered signal after interpolation');


Fs2 = 24000;
t= 0:1/Fs2:0.01;
x = 10*cos(2*pi*1000*t) + 6*cos(2*pi*1000*2*t) + 2*cos(2*pi*4000*t); %sampling
subplot(2,2,4);
stem(t,x);
title('Sampled plot 24KHz');
