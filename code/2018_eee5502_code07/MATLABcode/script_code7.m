dbstop if error

[x, Fs] = audioread('noisy_speech.wav');
% sound(x, Fs);
W      = 1000;
lambda = 0.9;
[y, xSTFT, ySTFT] = stft_func(x, W, lambda);
% sound(y, Fs)

figure, subplot(1,2,1), imagesc(0:(size(xSTFT,2)-1),2*pi*(0:W-1)/W, abs(xSTFT)), axis([150,250, 0, 2*120*pi/W]), caxis([0,45])
subplot(1,2,2), imagesc(0:(size(ySTFT,2)-1),2*pi*(0:W-1)/W, abs(ySTFT)), axis([150,250, 0, 2*120*pi/W]), caxis([0,45])
saveas(gca, '/Users/hudanyun.sheng/Google Drive/Me/201808Fall/EEE5502/code/2018_eee5502_code07/code7_hudanyun_sheng/1.jpg', 'jpg')
figure, plot(x), hold on, plot(y), legend('speech', 'noise free audio')
saveas(gca, '/Users/hudanyun.sheng/Google Drive/Me/201808Fall/EEE5502/code/2018_eee5502_code07/code7_hudanyun_sheng/1_audio.jpg', 'jpg')

audiowrite('speechAfterSpectralSubtraction.wav',y,Fs)