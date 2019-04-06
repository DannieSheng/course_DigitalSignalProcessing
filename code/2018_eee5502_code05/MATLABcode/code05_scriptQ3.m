clear
close all
clc

plotsSavePath = '/Users/hudanyun.sheng/Google Drive/Me/201808Fall/EEE5502/code/2018_eee5502_code05/code5_hudanyun_sheng';

N = 2500;
n = 0:N-1;
xn = cos(2*pi*n.^2/10000);
listW = [10 20 40 80 160 320 640 1280];
for ii = 1:length(listW)
    W = listW(ii);
    M = floor(N/W);
    STFT = zeros(W, M);
    for m = 1:M
        xnw  = xn((m-1)*W+1:m*W);
        STFT(:,m) = fft(xnw);
    end
    figure(ii)
    imagesc(0:(M-1), 2*pi*(0:(W-1))/W, abs(STFT))
    xlabel('Time [samples]'), ylabel('Normalized Frequency [rad/s]')
    title(['Short-time Fourier Transform when W is ' num2str(W)])
    set(gca, 'FontSize', 15)
    saveas(gcf, fullfile(plotsSavePath, ['Q3W' num2str(W) '.jpg']), 'jpg')
end