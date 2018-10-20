clc
dbstop if error
% you may need to modify the save path to be able to run the code, or
% simply comment the code to save plots
plotsavepath = '/Users/hudanyun.sheng/Google Drive/Me/201808Fall/EEE5502/code/2018_eee5502_code04/code4_hudanyun_sheng/';

[x, Fs] = audioread('rudenko_01.mp4');
% sound(x, Fs)

M = 10000;
h = ones(1,M)/M;
y = conv(x,h);
% sound(y, Fs)

dftX = fft(x);
dftH = fft(h);
dftY = fft(y);

figure, plot(2*pi*(0:length(dftX)-1)/length(dftX), abs(dftX), 'LineWidth', 1)
xlabel('2\pik/N'), ylabel('Magnitude')
set(gca, 'FontSize', 15)
saveas(gcf, fullfile(plotsavepath, 'Q4X.jpg'), 'jpg')

figure, plot(2*pi*(0:length(dftH)-1)/length(dftH), abs(dftH), 'LineWidth', 1)
xlabel('2\pik/N'), ylabel('Magnitude')
set(gca, 'FontSize', 15)
saveas(gcf, fullfile(plotsavepath, 'Q4H.jpg'), 'jpg')

figure, plot(2*pi*(0:length(dftY)-1)/length(dftY), abs(dftY), 'LineWidth', 1)
xlabel('2\pik/N'), ylabel('Magnitude')
set(gca, 'FontSize', 15)
saveas(gcf, fullfile(plotsavepath, 'Q4Y.jpg'), 'jpg')