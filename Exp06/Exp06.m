%%%%%%%%%Exp 06%%%%%%%%%%%%%%%

clc
clear all
close all

A = 2;
Fo = 3000;          %Fo = 1KHz
Fs = 10000;
t = 0:1/Fs:0.1;
m = A*sin(2*pi*Fo*t);

noise = normrnd(0,1,1,length(m));
x = m + noise;

N=20;
mu = 0.0001;
w = zeros(1,N);
epsilon = 1;
error = [];
i = 1;
a = [];

while epsilon > 0.00001    
    w_prev = w;
    error(i,1) = x(1,i+N) - w*(x(N+i-1:-1:i))';
    w = w +mu*x(N+i-1:-1:i)*error(i,1);
    epsilon = ((norm(w-w_prev))/(norm(w_prev)))^2;
    a(i,1) = epsilon;
    i = i+1;
end

epsilon_vec = a(2:length(a),1);
subplot(2,1,1);
plot(epsilon_vec);
xlabel('iterations')
ylabel('Epsilon');
title('Epsilon vs time,Fo = 3000');

subplot(2,1,2);
[h,omega] = freqz(w,1,linspace(-pi,pi,1000));
plot(omega*Fs*0.5/pi, abs(h).^2);
xlabel('frequency');
ylabel('|H|^2');
title('Transfer function,Fo = 3000');
print(gcf,'06_3000_20_2.png','-dpng','-r300');

