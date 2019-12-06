clc;
clear;
close;
x=[1,1,1,0,1,0,0,1,0;0,1,0,0,1,0,0,1,0;1,1,1,1,0,0,1,1,1];
w=rand(length(x),2);
eta=1;

NETz=x*w;
z=1./(1+exp(-NETz));
z=z>0.5;
