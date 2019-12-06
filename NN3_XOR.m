clc;
clear all;
x=[0,0;1,0;0,1;1,1;];
w=[1,-1;-1,1];
v=[1,1];
NETz=x*w';
z=1./(1+exp(-NETz));
z=z>0.5;
NETy=z*v';
y=1./(1+exp(-NETy));
y=y>0.5

