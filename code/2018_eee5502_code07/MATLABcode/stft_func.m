function [y, xSTFT, ySTFT] = stft_func(x, W, lambda)

    % DETERMINE LENGTH INFORMATION
    N       = length(x);            % Number of samples
    M       = floor(N/W);           % Number of frames
    
    % INITIALIZE INTERMEDIATE AND OUTPUT SIGNALS
    y       = zeros(N,1);           % Initialize the output singnal
    xSTFT   = zeros(W,M*2-1);       % Initialize short-time Fourier transform
    ySTFT   = zeros(W,M*2-1);       % Initialize short-time Fourier transform
    
    % LOOP OVER SEGMENTS
    for m = 1:(M*2-1)
        z = x((W*(m-1)/2+1):(W*(m-1)/2+W));             % Get data segment
        xSTFT(:,m) = fft(z);                            % Fourier Transform 
        % ***** PERFORM PROCESSING HERE AND ASSIGN ySTFT *************
        P(:,m) = angle(xSTFT(:,m));
        if m>1
            magN(:,m) = (1-lambda)*abs(xSTFT(:,m))+lambda*magN(:,m-1);
        else
            magN(:,m) = (1-lambda)*abs(xSTFT(:,m));
        end
        for k = 1:length(xSTFT(:,m))
            if abs(xSTFT(k,m))-abs(magN(k,m))>0
                magY(k,m) = abs(xSTFT(k,m))-magN(k,m);
            else
                magY(k,m) = 0;
            end
        end
        ySTFT(:,m) = magY(:,m).*exp(1j*P(:,m));                        % REPLACE THIS
        % ************************************************************
        y((W*(m-1)/2+1):(W*(m-1)/2+W)) = ...            % Inverse Fourier Transform
            y((W*(m-1)/2+1):(W*(m-1)/2+W)) + ...
            real(ifft(ySTFT(:,m))).*hann(W); 
    end

end


