clear
close all
clc

plotsSavePath = '/Users/hudanyun.sheng/Google Drive/Me/201808Fall/EEE5502/code/2018_eee5502_code05/code5_hudanyun_sheng';

[x, Fs] = audioread(['rudenko_01.mp4']);
sound(x, Fs)

%% part a b
W = 10000;
N = length(x);
M = floor(N/W);
STFT = zeros(W, M);
for m = 1:M
    xnw  = x((m-1)*W+1:m*W);
	STFT(:,m) = fft(xnw);
end

figure
imagesc((0:(M-1))*W/Fs, 2*pi/W*(0:(W-1)), abs(STFT))
axis([0 max((0:(M-1))*W/Fs) 0 pi/20])
xlabel('Time [seconds]')
ylabel('Normalized Frequency [rad/s]');
set(gca, 'FontSize', 15)
saveas(gcf, fullfile(plotsSavePath, 'Q4parta.jpg'), 'jpg')

figure
imagesc((0:(M-1))*W/Fs, 2*pi/W*(0:(W-1)), 10*log10(abs(STFT)./max(max(abs(STFT)))), [-20 -5])
axis([0 max((0:(M-1))*W/Fs) 0 pi/20])
xlabel('Time [seconds]')
ylabel('Normalized Frequency [rad/s]');
set(gca, 'FontSize', 15)
saveas(gcf, fullfile(plotsSavePath, 'Q4partb.jpg'), 'jpg')

%% part c
hn = ones(W,1)/W;
yn = conv(x, hn);
sound(yn, Fs)
M  = floor(length(yn)/W);
STFT = zeros(W, M);
for m = 1:M
    ynw  = yn((m-1)*W+1:m*W);
	STFT(:,m) = fft(ynw);
end
figure
imagesc((0:(M-1))*W/Fs, 2*pi/W*(0:(W-1)), abs(STFT))
xlabel('Time [seconds]')
ylabel('Normalized Frequency [rad/s]');
axis([0 max((0:(M-1))*W/Fs) 0 pi/20])
set(gca, 'FontSize', 15)
saveas(gcf, fullfile(plotsSavePath, 'Q4partc1.jpg'), 'jpg')

figure
imagesc((0:(M-1))*W/Fs, 2*pi/W*(0:(W-1)), 10*log10(abs(STFT)./max(max(abs(STFT)))), [-20 -5])
axis([0 max((0:(M-1))*W/Fs) 0 pi/20])
xlabel('Time [seconds]')
ylabel('Normalized Frequency [rad/s]');
set(gca, 'FontSize', 15)
saveas(gcf, fullfile(plotsSavePath, 'Q4partc2.jpg'), 'jpg')