d=[1,0,0;0,1,0;0,0,1];
X=[ 1, 1, 1, 0, 1, 0, 0, 1, 0;
	0, 1, 0, 0, 1, 0, 0, 1, 0;
	1, 1, 1, 1, 0, 0, 1, 1, 1];
W=rand(9,3);
eta=1;
while(1)
    tempW=W;
    NET=X*W;
    y=NET>1;
    e=d-y;
    dW=eta*X'*e;
    W=W+dW;
    if(W==tempW)
        break
    end
end


