clear;clc;close;

[file,path] = uigetfile('*.png',...
   'Select One or More Files', ...
   'MultiSelect', 'on');
X=zeros(length(file),63);
W=zeros(63,length(file));
for f=1:length(file)
    image_location=fullfile(path,file(f));
    imsi=imread(char(image_location(1,1)));
    imsi=imsi(:,:,1);
    imsi=imsi==0;
    imsi=imsi*2-1;
    X(f,:)=reshape(imsi',1,63);
    t=zeros(1,length(file));
    t(f)=1;
    t=t*2-1;
    delta_W=X(f,:)'*t;
    W=W+delta_W;
    
end
for f=1:length(file)
    NET=X(f,:)*W;
    y=NET>=0;
    if(length(find(y,1))~=0)
        value=char(64+find(y,1))
    end
    
end