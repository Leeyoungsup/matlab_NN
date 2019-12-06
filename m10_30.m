clear;clc;close;
W=rand(9,6);
X=[1,1,1,0,1,0,0,1,0;0,1,0,0,1,0,0,1,0];
X=X*2-1;
d=[1,-1,-1,-1,-1,1;-1,1,-1,-1,1,-1];
n=100;
E=zeros(n,1);
eta=1;
for i=1:n
    NET=X*W;
    y=NET>=0;
    y=y*2-1;
    E(i)=sum(sum(abs(d-y)));
    gamma=d-y;
    delta_W=eta*X'*gamma;
    W=W+delta_W;
end
plot(E)