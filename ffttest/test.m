clc;
clear all;
f = readtable('Z001.txt');
N = 4097;
fsample = 173.61;
fn = (0 : N - 1) / (N / fsample) - fsample / 2;
t = linspace(0,23.8,N);
x = table2array(f);
wn = 2/173.61 * 0.1;
lowpass=fir1(30, wn, 'low');
y = filter(lowpass,1,x);
y1 = icwt(cwt(y));

figure
plot(fn,abs(fftshift(fft(x))));
figure
plot(fn,abs(fftshift(fft(y1))));
figure
subplot(211)
plot(x)
subplot(212)
plot(y1);