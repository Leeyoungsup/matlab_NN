clear
close
clc
%학습입력패턴
x=[0 1 1]

%목표치
d=1

%초기연결강도
v=[0.1 0.2 0.1
   0.2 0.1 0.1]
w=[0.1 0.2 0.2]

%오차 최대치
e_max=0.01
%학습률
eta=1

%은닉층 출력
NET_z1 = x*v(1,:)'

z1= 1/(1+exp(-NET_z1))

NET_z2 = x*v(2,:)'

z2= 1/(1+exp(-NET_z2))

%출력
z=[z1 z2 1]
NET_y= z*w'

y= 1/(1+exp(-NET_y))

%오차
E= (1/2)*(d-y)^2

dy=(d-y)*y*(1-y)

dz1= z1*(1-z1)*dy*w(1)

dz2= z2*(1-z2)*dy*w(2)

dw=eta*dy*z

dv1=eta*dz1*x

dv2=eta*dz2*x

dv=[dv1;  dv2]

v=v+dv

w=w+dw