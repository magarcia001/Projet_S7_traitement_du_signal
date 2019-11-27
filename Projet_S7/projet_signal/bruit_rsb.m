function [ s_a ] = bruit_rsb( s,RSB, N)
b_r=randn(1,N);

S=0;
B_r=0;

for i=1:N
    S=S+s(i)^2;
    B_r=B_r+b_r(i)^2;
end

sigma=sqrt(10^(-RSB/10)*(S/B_r));

b2=sigma*b_r;

s_a=s+b2;
end
