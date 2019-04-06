function [y, xSTFT, ySTFT] = stft_func4b(x, W)

    % CHOOSE WINDOW 
    N       = length(x);            % Number of samples
    M       = floor(N/W)*2-1;           % Number of frames
    xSTFT   = zeros(W,M);           % Initialize short-time Fourier transform
    ySTFT   = zeros(W,M);           % Initialize short-time Fourier transform
    ytemp       = zeros(N,M);
    % LOOP OVER SEGMENTS
    y = zeros(N,1);
    for m = 1:M
        z = x((W*(m-1)/2+1):(W*(m-1)/2+W));                % Get data segment
        xSTFT(:,m) = fft(z);                           % Fourier Transform 
        % ***** PERFORM PROCESSING HERE AND ASSIGN ySTFT *****
        if m == 1
            ySTFT(:,m) = 0;      
        elseif m>=10
            ySTFT(:,m) = mean(xSTFT(:,m-9:m),2);
        else
            ySTFT(:,m) = sum(xSTFT(:,1:m),2)/10;
        end               % REPLACE THIS
        % ****************************************************
        ytemp((W*(m-1)/2+1):(W*(m-1)/2+W),m) = real(ifft(ySTFT(:,m))); % Inverse Fourier Transform
        ytemp((W*(m-1)/2+1):(W*(m-1)/2+W),m) = ytemp((W*(m-1)/2+1):(W*(m-1)/2+W),m).*((1-cos(2*pi*(0:(W-1))/(W-1)))/2)';
    end
	y = sum(ytemp,2);
end