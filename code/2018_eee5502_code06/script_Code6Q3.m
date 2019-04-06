close all
clc
clear
dbstop if error

W = 1000;
%% (a)
% [xa, Fsa]            = audioread('chiptune_noise.wav');
% [ya, xSTFTa, ySTFTa] = stft_func3a(xa, W);
% 
% % figure
% % subplot(1,2,1), plot(abs(reshape(xSTFTa, [size(xSTFTa,1)*size(xSTFTa,2),1]))), title('STFT of the original signal')
% % axis([0 600000 0 90])
% % subplot(1,2,2), plot(abs(reshape(ySTFTa, [size(ySTFTa,1)*size(ySTFTa,2),1]))), title('STFT of the modified signal using system 1')
% % axis([0 600000 0 90])
% % saveas(gca, 'code6_hudanyun_sheng/3a.jpg', 'jpg')
% 
% figure, subplot(1,2,1), imagesc(0:(size(xSTFTa,2)-1),2*pi*(0:W-1)/W, abs(xSTFTa)), axis([0,600, 0, 2*120*pi/W])
% xlabel('Time [samples]'), ylabel('Normalized frequency [rad/s]')
% subplot(1,2,2), imagesc(0:(size(xSTFTa,2)-1),2*pi*(0:W-1)/W, abs(ySTFTa)), axis([0,600, 0, 2*120*pi/W])
% xlabel('Time [samples]'), ylabel('Normalized frequency [rad/s]')
% saveas(gca, 'code6_hudanyun_sheng/3a.jpg', 'jpg')
% % figure, subplot(1,2,1), imagesc(abs(xSTFTa)), axis([0,600, 0, 120])
% % subplot(1,2,2), imagesc(abs(ySTFTa)), axis([0,600, 0, 120])
% 
% figure, subplot(1,2,1), plot(2*pi*(0:W-1)/W, abs(xSTFTa))
% xlabel('Normalized frequency [rad/s]'), ylabel('Amplitude')
% subplot(1,2,2), plot(2*pi*(0:W-1)/W, abs(ySTFTa))
% xlabel('Normalized frequency [rad/s]'), ylabel('Amplitude')
% saveas(gca, 'code6_hudanyun_sheng/3a_.jpg', 'jpg')
% 
% figure, plot(xa), hold on, plot(ya), legend('input signal', 'modified signal')
% saveas(gca, 'code6_hudanyun_sheng/3a_audio.jpg', 'jpg')

%% (b)
% [xb,Fsb]             = audioread('chiptune_normal.wav');
% [yb, xSTFTb, ySTFTb] = stft_func3b(xb, W);
% 
% figure, subplot(1,2,1), imagesc(0:(size(xSTFTb,2)-1),2*pi*(0:W-1)/W, abs(xSTFTb)), axis([0,600, 0, 2*120*pi/W]), caxis([0,80])
% xlabel('Time [samples]'), ylabel('Normalized frequency [rad/s]')
% subplot(1,2,2), imagesc(0:(size(xSTFTb,2)-1),2*pi*(0:W-1)/W, abs(ySTFTb)), axis([0,600, 0, 2*120*pi/W]), caxis([0,80])
% xlabel('Time [samples]'), ylabel('Normalized frequency [rad/s]')
% saveas(gca, 'code6_hudanyun_sheng/3b.jpg', 'jpg')
% 
% % figure, subplot(1,2,1), plot(2*pi*(0:W-1)/W, abs(xSTFTb))
% % xlabel('Normalized frequency [rad/s]'), ylabel('Amplitude')
% % subplot(1,2,2), plot(2*pi*(0:W-1)/W, abs(ySTFTb))
% % xlabel('Normalized frequency [rad/s]'), ylabel('Amplitude')
% % saveas(gca, 'code6_hudanyun_sheng/3b_.jpg', 'jpg')
% % 
% figure, plot(xb), hold on, plot(yb), legend('input signal', 'modified signal')
% saveas(gca, 'code6_hudanyun_sheng/3b_audio.jpg', 'jpg')

%% (c)
[xc,Fsc]             = audioread('chiptune_nooaudio.wav');
[yc, xSTFTc, ySTFTc] = stft_func3c(xc, W);
figure, subplot(1,2,1), imagesc(0:(size(xSTFTc,2)-1),2*pi*(0:W-1)/W, abs(xSTFTc)), axis([150,250, 0, 2*120*pi/W]), caxis([0,9])
xlabel('Time [samples]'), ylabel('Normalized frequency [rad/s]')
subplot(1,2,2), imagesc(0:(size(xSTFTc,2)-1),2*pi*(0:W-1)/W, abs(ySTFTc)), axis([150,250, 0, 2*120*pi/W]), caxis([0,9])
xlabel('Time [samples]'), ylabel('Normalized frequency [rad/s]')
saveas(gca, 'code6_hudanyun_sheng/3c.jpg', 'jpg')

% figure, subplot(1,2,1), plot(2*pi*(0:W-1)/W, abs(xSTFTc))
% xlabel('Normalized frequency [rad/s]'), ylabel('Amplitude')
% subplot(1,2,2), plot(2*pi*(0:W-1)/W, abs(ySTFTc))
% xlabel('Normalized frequency [rad/s]'), ylabel('Amplitude')
% saveas(gca, 'code6_hudanyun_sheng/3c_.jpg', 'jpg')

figure, plot(xc), hold on, plot(yc), legend('input signal', 'modified signal')
saveas(gca, 'code6_hudanyun_sheng/3c_audio.jpg', 'jpg')