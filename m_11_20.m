clc
clear
close

[file,path] = uigetfile('*.png',...
   'Select One or More Files', ...
   'MultiSelect', 'on');
x=zeros(length(file),63);
for f=1:length(file)
    image_location=fullfile(path,file(f));
    imsi=imread(char(image_location(1,1)));
    imsi=imsi(:,:,1);
    imsi=imsi==0;
    x(f,:)=reshape(imsi',1,63);
end
d=eye(10);
hidden_node=5;
z=rand(1,hidden_node);
y=rand(1,10);
V=rand(length(z),length(x(1,:)));
W=rand(length(d(1,:)),length(z));
eta=0.1;
n=1;
len=100000;
for j=1:len
 
    NETz=x*V';
    z=1./(1.+exp(-NETz));
    NETy=z*W';
    y=1./(1.+exp(-NETy));
    dy=(d-y).*y.*(1-y);
    dz=z.*(1-z).*(dy*W);
    E(n)=(1/2).*sum(sum(((d-y).^2)));
    delta_W=eta*dy'*z;
    W=W+delta_W;
    delta_V=eta*dz'*x;
    V=V+delta_V;
    n=n+1;
    if E<0.1
        break
    end
end
plot(E)
y=y>0.5;
