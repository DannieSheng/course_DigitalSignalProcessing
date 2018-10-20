clc
close all
dbstop if error

N = 100;
n  = 0:N-1;
xn = cos((pi/2)*n);
% you may need to modify the save path to be able to run the code, or
% simply comment the code to save plots
plotsavepath = '/Users/hudanyun.sheng/Google Drive/Me/201808Fall/EEE5502/code/2018_eee5502_code04/code4_hudanyun_sheng/';

%% part (a)
X   = zeros(1,N);
for k = 0:N-1
    X(k+1) = sum(xn.*exp(-1i*2*pi*k*n/N));
end
mag = abs(X);
figure, plot(2*pi*n/N, mag,'.-', 'linewidth', 3)
xlabel('2\pik/N (for 0\leqk\leqN-1)'), ylabel('Magnitude of X[k]')
set(gca, 'fontsize', 15)
% saveas(gcf, fullfile(plotsavepath, 'Q3pa.jpg'), 'jpg')

%% part (b)
K   = 10;
X   = zeros(1,K);
% for k = 0:N-1
for k = 0:K-1
    X(k+1) = sum(xn.*exp(-1i*2*pi*k*n/K));
end
mag = abs(X);
% figure, plot(2*pi*n/K, mag,'.-', 'linewidth', 3)
figure, plot(2*pi*(0:K-1)/K, mag,'.-', 'linewidth', 3)
xlabel('2\pik/K (for 0\leqk\leqN-1)'), ylabel('Magnitude of X[k]')
set(gca, 'fontsize', 15)
saveas(gcf, fullfile(plotsavepath, 'Q3pb.jpg'), 'jpg')

%% part (c)
K   = 1000;
X   = zeros(1,K);
% for k = 0:N-1
for k = 0:K-1
    X(k+1) = sum(xn.*exp(-1i*2*pi*k*n/K));
end
mag = abs(X);
figure, plot(2*pi*(1:K)/K, mag,'.-', 'linewidth', 3)
xlabel('2\pik/K (for 0\leqk\leqN-1)'), ylabel('Magnitude of X[k]')
set(gca, 'fontsize', 15)
saveas(gcf, fullfile(plotsavepath, 'Q3pc.jpg'), 'jpg')