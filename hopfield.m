clear all;
s=[ 1, 1, 1, -1, -1, 1, -1, -1, 1;
	1, -1, -1, 1, -1, -1, 1, 1, 1];

W1= s(1,:)'*s(1,:)-eye(length(s));
W2= s(2,:)'*s(2,:)-eye(length(s));
W = W1+W2