clear
close all
clc

[findme, Fs] = get_tune('21959681');
% sound(findme, Fs)

%% use correlation
% tic
% for ii = 1:39
%     [y, Fs] = audioread(['rudenko_' num2str(ii, '%02i') '.mp4']);
%     z{ii}   = conv(fliplr(findme), y);
% % 	t = 1/Fs:1/Fs:length(y)/Fs;
% %     plot(t, y);
% % 	xlabel('Time [sec]')
% %     ylabel('Amplitude')
%     [cM(ii), cidx(ii)] = max(z{ii});
% end
% [~, cidx2] = max(M);
% cidx1 = cidx(cidx2);
% toc

%% use FFT
tic
for ii = 1:39
    [y, Fs] = audioread(['rudenko_' num2str(ii, '%02i') '.mp4']);
    findme2 = [findme; zeros(length(y)-length(findme), 1)];
%     y2{ii}  = ifft(fft(y).*fft(fliplr(findme2)));
%     y2{ii}  = ifft(fft(y).*conj(fft(findme2)));
    y2{ii}  = ifft(conj(fft(y)).*fft(findme2));
    [M(ii), idx(ii)] = max(y2{ii});
end
[~, idx2] = max(M);
idx1 = idx(idx2);
toc
idx11 = idx1-length(findme)+1;
disp(['The name of the matching music file is rudenko_' num2str(idx2, '%02i') '.mp4'])