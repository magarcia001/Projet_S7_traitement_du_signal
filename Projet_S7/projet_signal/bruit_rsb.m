function [ s_bruit] = bruit_rsb( s, RSB, N)

b1=randn(1,N);

S=0;
B1=0;

for i=1:N
    S=S+s(i)^2;
    B1=B1+b1(i)^2;
end

sigma=sqrt(10^(-RSB/10)*(S/B1));

b2=sigma*b1;

s_bruit=s+b2;
end
