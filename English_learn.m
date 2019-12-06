clear;clc;close;

[file,path] = uigetfile('*.png',...
   'Select One or More Files', ...
   'MultiSelect', 'on');
W=rand(63,length(file));
X=zeros(length(file),63);
for f=1:length(file)
    image_location=fullfile(path,file(f));
    imsi=imread(char(image_location(1,1)));
    imsi=imsi(:,:,1);
    imsi=imsi==0;
    X(f,:)=reshape(imsi',1,63);
end
    
d=eye(length(file));
n=1000;
E=zeros(n,1);
eta=1;
for i=1:n
    NET=X*W;
    y=NET>=0;

    E(i)=sum(sum(abs(d-y)));
    gamma=d-y;
    delta_W=eta*gamma*X;
    W=W+delta_W';
end
plot(E)
   

