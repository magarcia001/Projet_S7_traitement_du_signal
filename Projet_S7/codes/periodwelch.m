function [pwelch] = periodwelch(s,K,N)
    
    pwelch= abs(fft(s(1:N),N)).^2;
    for i = 2 : K
        pwelch = pwelch + abs(fft(s((i-1)*N+1:i*N),N)).^2;
    end
    
    pwelch = pwelch/K;