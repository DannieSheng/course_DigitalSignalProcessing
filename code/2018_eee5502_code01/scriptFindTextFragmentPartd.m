dbstop if error
clear;
close all; clc
load('2018_eee5502_code01_q2.mat')

%% part (d)
corrCoef = [];
corrCoef = counts*counts';
norm2   =  sum(abs(counts).^2,2).^(1/2);
corrCoef = corrCoef./(norm2*norm2');
corrCoe  = corrCoef; 
for ii = 1:length(documents)
    corrCoe(ii,ii) = 0;
end
[x,y] = find(corrCoe == max(corrCoe(:)));
disp(['The two most similar texts in documents are "' documents{x(1)} '" and "' documents{y(1)} '"'])
disp(['The corresponding correlation coefficient is ' num2str(corrCoe(x(1), y(1)))])