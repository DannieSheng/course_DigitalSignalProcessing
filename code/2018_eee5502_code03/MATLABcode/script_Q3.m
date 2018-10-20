close all; clear; clc

%% part (a)
N = 1000000;
x = cos(4*pi/N*(1:N))+randn(1,N);
figure, plot(x), title('Plot of random signal'); xlabel('n'), ylabel('Amplitude')
% saveas(gcf, '/Users/hudanyun.sheng/Google Drive/Me/201808Fall/EEE5502/code/2018_eee5502_code03/code3_hudanyun_sheng/Q3a.jpg', 'jpg')

%% part (b)
M = 10000;
h = ones(1,M)/M;
y1 = conv(x, h);
nx = 1:N;
ny1 = 1:(N+M-1);
figure, plot(nx, x); hold on; plot(ny1, y1, 'linewidth', 2);xlim([1 1010000]); hold off
legend('x', 'y1'); xlabel('n'), ylabel('Amplitude'); title('Plot of x and y1')
% saveas(gcf, '/Users/hudanyun.sheng/Google Drive/Me/201808Fall/EEE5502/code/2018_eee5502_code03/code3_hudanyun_sheng/Q3b.jpg', 'jpg')

%% part (d)
h2 = [h zeros(1, N-M)];
y2 = ifft(fft(x).*fft(h2));
figure, plot(nx, x); hold on; plot(ny1, y1, 'linewidth', 2);xlim([1 1010000]); hold on; plot(nx, y2, 'linewidth', 2); hold off
legend('x', 'y1', 'y2'); xlabel('n'), ylabel('Amplitude'); title('Plot of x, y1 and y2')
% saveas(gcf, '/Users/hudanyun.sheng/Google Drive/Me/201808Fall/EEE5502/code/2018_eee5502_code03/code3_hudanyun_sheng/Q3d.jpg', 'jpg')