clear all; clc
vid = videoinput('winvideo', 1, 'YUY2_320x240');

% webcam�� winvideo�� 320x240������� �޾ƿ´�.

 

preview(vid);
start(vid);

 

FrameCount = 1;

% ���� frame ����
FrameTotalNum = 30;

% �� ������ frame ����

 

while( FrameCount < FrameTotalNum )
    preview(vid);
    data = getsnapshot(vid);
   
    data = ycbcr2rgb(data);

    % ycrcb�� rgb ������ �ٲ���.

    
    imshow( data);

    % data�� ������.


    img(FrameCount) = getframe;

    % �����ذͿ��� �����͸� ��������
    pause(0.05);
    FrameCount = FrameCount +1;
    if mod ( FrameCount, 100 ) == 1
        disp('a');
    end
end

movie2avi( img, 'test4.avi', 'fps', 5);

% test4.avi ���Ϸ� ����
stop(vid);
delete(vid)
close(gcf)