close all
clc

h = ones(1,10)/10;
figure, plot((0:9999)/10000*2*pi, abs(fft(h,10000)), 'Linewidth', 2)
saveas(gcf, 'code6_hudanyun_sheng/2c.jpg', 'jpg')

%% part(d)
numer = zeros(1,101);
numer(1,1) = 1;
denor = zeros(1,101);
denor(1,1) = 2;
denor(1,end) = -1;
sys = tf(numer, denor);
h = pzplot(sys);
saveas(gcf, 'code6_hudanyun_sheng/2d.jpg', 'jpg')