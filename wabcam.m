clear all; clc
vid = videoinput('winvideo', 1, 'YUY2_320x240');

% webcam인 winvideo를 320x240사이즈로 받아온다.

 

preview(vid);
start(vid);

 

FrameCount = 1;

% 현재 frame 숫자
FrameTotalNum = 30;

% 총 저장할 frame 숫자

 

while( FrameCount < FrameTotalNum )
    preview(vid);
    data = getsnapshot(vid);
   
    data = ycbcr2rgb(data);

    % ycrcb를 rgb 색으로 바꿔줌.

    
    imshow( data);

    % data를 보여줌.


    img(FrameCount) = getframe;

    % 보여준것에서 데이터를 가져오기
    pause(0.05);
    FrameCount = FrameCount +1;
    if mod ( FrameCount, 100 ) == 1
        disp('a');
    end
end

movie2avi( img, 'test4.avi', 'fps', 5);

% test4.avi 파일로 저장
stop(vid);
delete(vid)
close(gcf)