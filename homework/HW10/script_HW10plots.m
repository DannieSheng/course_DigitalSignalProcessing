clear 
close all 
clc
dbstop if error

w = -pi:0.01*pi:pi;

%% 2(b)
x = [-5*pi/6 -23*pi/30 -13*pi/30 13*pi/30 23*pi/30 5*pi/6];
y = [0.5 0.25 0.25 0.25 0.25 0.5];
figure, stem(x,y,'filled', 'MarkerSize', 2), xlabel('\omega'), ylabel('|H(\omega)|')
set(gca, 'FontSize', 13)
saveas(gcf, '2b.jpg', 'jpg')


%% 3(d)
Vw = 1+0.5*exp(-1j*w*2);
figure, plot(w, abs(Vw), 'Linewidth',2), xlabel('\omega'), ylabel('|V(\omega)|')
set(gca, 'FontSize', 13)
saveas(gcf, '3d.jpg', 'jpg')

%% 4(b)
Hw = 1./(1+exp(-2*1j*w)-2*exp(-1j*w)+pi);
figure, plot(w, abs(Hw), 'Linewidth',2), xlabel('\omega'), ylabel('|H(\omega)|')
set(gca, 'FontSize', 13)
saveas(gcf, '4b.jpg', 'jpg')

%% 4(d)
Gw = (1./(2*1j*sqrt(pi)))*(1./(1-exp(1j*sqrt(pi))*exp(-1j*w))+1./(1-exp(-1j*sqrt(pi))*exp(-1j*w)));
figure, plot(w, abs(Gw), 'Linewidth',2), xlabel('\omega'), ylabel('|G(\omega)|')
set(gca, 'FontSize', 13)
saveas(gcf, '4d.jpg', 'jpg')

% 4(f)
Rw = (exp(-2j*w)+2*exp(-1j*w)+1)./(pi*(9*exp(-2j*w)-6*exp(-1j*w)+5));
figure, plot(w, abs(Rw), 'Linewidth',2), xlabel('\omega'), ylabel('|R(\omega)|')
set(gca, 'FontSize', 13)
saveas(gcf, '4f.jpg', 'jpg')

%% 5(c)
w  = -pi:0.01*pi:pi;
Hw = 1-exp(-1j*w);
figure, plot(w, abs(Hw), 'Linewidth',2), xlabel('\omega'), ylabel('|H(\omega)|')
set(gca, 'FontSize', 13)
saveas(gcf, '5c.jpg', 'jpg')

%% 5(i)
% w  = -pi:0.1*pi:pi;
Rw = 2*(1-exp(-1j*w))./(1+exp(-1j*w));
figure, plot(w, abs(Rw), 'Linewidth',2), xlabel('\omega'), ylabel('|R(\omega)|')
set(gca, 'FontSize', 13)
saveas(gcf, '5i.jpg', 'jpg')