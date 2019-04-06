function [y, xSTFT, ySTFT] = stft_func3c(x, W)

    % CHOOSE WINDOW 
    N       = length(x);            % Number of samples
    M       = floor(N/W);           % Number of frames
    xSTFT   = zeros(W,M);           % Initialize short-time Fourier transform
    ySTFT   = zeros(W,M);           % Initialize short-time Fourier transform

    % LOOP OVER SEGMENTS
    y = zeros(N,1);
    for m = 200:M
        z = x((W*(m-1)+1):(W*(m-1)+W));                % Get data segment
        xSTFT(:,m) = fft(z);                           % Fourier Transform 
        % ***** PERFORM PROCESSING HERE AND ASSIGN ySTFT *****
        if m <= 100
            ySTFT(:,m) = xSTFT(:,m)/2;
        else
            ySTFT(:,m) = xSTFT(:,m)/2+ySTFT(:,m-100);
        end
        % REPLACE THIS
        % ****************************************************
        y((W*(m-1)+1):(W*(m-1)+W)) = real(ifft(ySTFT(:,m))); % Inverse Fourier Transform
    end
end