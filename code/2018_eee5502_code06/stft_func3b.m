function [y, xSTFT, ySTFT] = stft_func3b(x, W)

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
        if m == 1
            ySTFT(:,m) = 0;      
        elseif m>=10
            ySTFT(:,m) = mean(xSTFT(:,m-9:m),2);
        else
            ySTFT(:,m) = sum(xSTFT(:,1:m),2)/10;
        end
%         for w = 1:W
%             if w == 1
%                 ySTFT(w,m) = 0;
%             elseif w>=10
%                 ySTFT(w,m) = mean(xSTFT(w-9:w,m),1);
%             else
%                 ySTFT(w,m) = sum(xSTFT(1:w,m),1)/10;
%             end
%         end
        % ****************************************************
        y((W*(m-1)+1):(W*(m-1)+W)) = real(ifft(ySTFT(:,m))); % Inverse Fourier Transform
    end
end

