close all
clc
clear

dbstop if error
W = 1000;
%% (a)
% [xa, Fsa]            = audioread('chiptune_noise.wav');
% [ya, xSTFTa, ySTFTa] = stft_func4a(xa, W);
% 
% figure
% subplot(1,2,1), imagesc(0:(size(xSTFTa,2)-1),2*pi*(0:W-1)/W, abs(xSTFTa)), axis([150,250, 0, 2*120*pi/W])
% subplot(1,2,2), imagesc(0:(size(ySTFTa,2)-1),2*pi*(0:W-1)/W, abs(ySTFTa)), axis([150,250, 0, 2*120*pi/W])
% saveas(gca, 'code6_hudanyun_sheng/4a.jpg', 'jpg')
% 
% figure, plot(xa), hold on, plot(ya), legend('input signal', 'modified signal')
% saveas(gca, 'code6_hudanyun_sheng/4a_audio.jpg', 'jpg')
% close all
%% (b)
% [xb,Fsb]             = audioread('chiptune_normal.wav');
% [yb, xSTFTb, ySTFTb] = stft_func4b(xb, W);
% 
% figure, subplot(1,2,1),  imagesc(0:(size(xSTFTb,2)-1),2*pi*(0:W-1)/W, abs(xSTFTb)), axis([0,600, 0, 2*120*pi/W]),caxis([0,90])
% subplot(1,2,2), imagesc(0:(size(ySTFTb,2)-1),2*pi*(0:W-1)/W, abs(ySTFTb)), axis([0,600, 0, 2*120*pi/W]),caxis([0,90])
% saveas(gca, 'code6_hudanyun_sheng/4b.jpg', 'jpg')
% figure, plot(xb), hold on, plot(yb), legend('input signal', 'modified signal')
% saveas(gca, 'code6_hudanyun_sheng/4b_audio.jpg', 'jpg')

%% (c)
[xc,Fsc]             = audioread('chiptune_nooaudio.wav');
[yc, xSTFTc, ySTFTc] = stft_func4c(xc, W);
figure, subplot(1,2,1), imagesc(0:(size(xSTFTc,2)-1),2*pi*(0:W-1)/W, abs(xSTFTc)), axis([150,250, 0, 2*120*pi/W]), caxis([0,45])
subplot(1,2,2), imagesc(0:(size(ySTFTc,2)-1),2*pi*(0:W-1)/W, abs(ySTFTc)), axis([150,250, 0, 2*120*pi/W]), caxis([0,45])
saveas(gca, 'code6_hudanyun_sheng/4c.jpg', 'jpg')
figure, plot(xc), hold on, plot(yc), legend('input signal', 'modified signal')
saveas(gca, 'code6_hudanyun_sheng/4c_audio.jpg', 'jpg')