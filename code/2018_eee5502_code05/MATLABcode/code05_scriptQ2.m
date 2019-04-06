clear
close all
clc

plotsSavePath = '/Users/hudanyun.sheng/Google Drive/Me/201808Fall/EEE5502/code/2018_eee5502_code05/code5_hudanyun_sheng';

%% part c
N = 2500;
n = 0:N;
xn = cos(2*pi*n.^2/10000);
figure, plot(n, xn, 'Linewidth', 1)
xlabel('Samples'), ylabel('Amplitude')
set(gca, 'FontSize', 15)
saveas(gcf, fullfile(plotsSavePath, 'Q2partc.jpg'), 'jpg')

%% part d
Xk  = fft(xn);
mag = abs(Xk);
figure, plot(2*pi*n/N, mag, 'Linewidth', 1)
xlabel('Normalized frequency [rad/s]'), ylabel('Magnitude')
axis([0 2*pi 0 max(mag)])
set(gca, 'FontSize', 15)
saveas(gcf, fullfile(plotsSavePath, 'Q2partd.jpg'), 'jpg')

%% part e
phase = angle(Xk);
figure, plot(2*pi*n/N, phase, 'Linewidth', 1)
xlabel('Normalized frequency [rad/s]'), ylabel('Phase [rad]')
set(gca, 'FontSize', 15)
saveas(gcf, fullfile(plotsSavePath, 'Q2parte.jpg'), 'jpg')
