function [y, xSTFT, ySTFT] = stft_func3a(x, W)

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
        idx1 = find((abs(xSTFT(:,m))<20));
        ySTFT(idx1,m) = 0;
        idx2 = find((abs(xSTFT(:,m))>=20));
        ySTFT(idx2,m) = xSTFT(idx2,m);
        % ****************************************************
        y((W*(m-1)+1):(W*(m-1)+W)) = real(ifft(ySTFT(:,m))); % Inverse Fourier Transform
    end
end

