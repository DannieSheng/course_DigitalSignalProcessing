function [y, xSTFT, ySTFT] = stft_func(x, W)

    % CHOOSE WINDOW 
    N       = length(x);            % Number of samples
    M       = floor(N/W);           % Number of frames
    xSTFT   = zeros(W,M);           % Initialize short-time Fourier transform
    ySTFT   = zeros(W,M);           % Initialize short-time Fourier transform

    % LOOP OVER SEGMENTS
    y = zeros(N,1);
    for m = 1:M
        z = x((W*(m-1)+1):(W*(m-1)+W));                % Get data segment
        xSTFT(:,m) = fft(z);                           % Fourier Transform 
        % ***** PERFORM PROCESSING HERE AND ASSIGN ySTFT *****
        ySTFT(:,m) = xSTFT(:,m);                % REPLACE THIS
%         z2 = x((W*(m-1)/2+1):(W*(m-1)/2+W/2));  
%         ySTFT(:,m) = fft(z2);
        % ****************************************************
        y((W*(m-1)+1):(W*(m-1)+W)) = real(ifft(ySTFT(:,m))); % Inverse Fourier Transform
    end
%     y2 = y.*(1-cos(2*pi*(0:(W-1))/(W-1)))/2;
end