clear;clc;close;
x1=[0,1,1,1,1,1,0,1,0,0,0,0,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,1,1,0,0,0,0];
x1=x1*2-1;
x2=[0,1,0,0,0,0,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,1,1,0,0,0,1,1,1,1,1,1,1,1,0,0];
x2=x2*2-1;
x3=[0,1,1,1,1,1,1,1,1,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,1,1,0,0,0,1,1,1,1,1,1,1,1,0,0];
x3=x3*2-1;
x4=[1,1,1,1,1,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,1,1,0,0,0,1,1,0,1,1,1,1,1,1];
x4=x4*2-1;
x5=[1,1,1,1,1,1,0,1,1,0,0,0,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0,1,1,1,0,0,0,1,0,0,1,1,1,1,1,1];
x5=x5*2-1;
xt1=[1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,1,1,1,1,1,1,1,0,1,1,0,0,0,0,0];
xt1=xt1*2-1;
w1=x1'*x1-eye(length(x1));
w2=x2'*x2-eye(length(x2));
w3=x3'*x3-eye(length(x3));
w4=x4'*x4-eye(length(x4));
w5=x5'*x5-eye(length(x5));
W=w1+w2+w3+w4+w5;
y=xt1;
y1=y;
for i=1:30
    y=y1;
    for f=1:length(xt1)
        NET=xt1(f)+y*W(:,f);
        if NET>0
            y1(f)=1;
        end
        if NET==0
            y1(f)=y1(f);
        end
        if NET<0
            y1(f)=-1;
        end
    end
end
a=reshape(y1,[7,9])
imshow(a')
    