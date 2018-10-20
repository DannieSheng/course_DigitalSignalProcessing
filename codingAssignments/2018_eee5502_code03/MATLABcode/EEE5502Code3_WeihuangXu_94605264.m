%% EEE5502Code#3
clear all;
close all;

%% Question 3
% Q(a)
N = 1000000;
x = cos(4*pi/N*(1:N)) + randn(1, N);
figure;
plot(x);
xlabel('N');
ylabel('Intensity');
title('Figure (a)');

% Q(b)
M = 10000;
h = ones(1,M)/M;
y1 = conv(x,h);
nx = 1:N;
ny1 = 1:M+N-1;
figure;
plot(nx,x); hold on; plot(ny1,y1,'LineWidth', 2); hold off;
legend('x[n]','y1[n]');
xlabel('N');
ylabel('Intensity');
title('Figure(b)');
xlim([1 1010000]);
% Q(d)
h2 = [h, zeros(1,N-M)];
y2 = ifft(fft(x).*fft(h2));
figure;
plot(nx, x); hold on; plot(ny1, y1,'LineWidth', 2); plot(nx,y2,'LineWidth', 2); hold off;
xlim([1 1010000]);
xlabel('N');
ylabel('Intensity');
legend('x[n]','y1[n]','y2[n]');
%% Question 4
ufid = '59483128';
[findme, Fs] = get_tune(ufid);
corscore = cell(39,1);
tic
%sound(findme, Fs);
for ii=1:39
    [y, Fs] = audioread(['rudenko_' num2str(ii, '%02i') '.mp4']);
    findme2 = [fliplr(findme); zeros(length(y)-length(findme), 1)];
    ii
    corscore{ii, 1} = ifft(fft(findme2).* fft(y));
end
toc

maxcor = [];
for j = 1:length(corscore)
    maxcor(j) = max(corscore{j});
end
