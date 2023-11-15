function out = myspecgram(data,window,nfft,shift)

N = floor((length(data)-window-1)/shift);

for i=1:N
    
    tmp = fftshift(fft(data((i-1)*shift+1:(i-1)*shift+window).*hann(window),nfft));
    out(:,i) = tmp;
    
end
end