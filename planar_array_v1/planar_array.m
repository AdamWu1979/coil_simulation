%function [B1,Bx,By,Bz,xp,yp,zp,px,py,pz,radc]=planar_array()
clear all
close all
%define global parameters

global u0 I N ;
u0=4*pi()*10^-7; %relative permitivity for air
N=100; %points used to define coil
I=0.5;


[rada,radb,xin,yin,zin,ne]=define_array();
arrayi=gen_array(rada,radb,xin,yin,zin,ne);


[xpmin,xpmax,px,ypmin,ypmax,py,zpmin,zpmax,pz]= field_req_def();

[B1c,Bxc,Byc,Bzc,xp,yp,zp]=calc_comp(arrayi,ne,xpmin,xpmax,px,ypmin,ypmax,py,zpmin,zpmax,pz);

[B1,Bx,By,Bz]=calc_array(Bxc,Byc,Bzc,B1c,ne);
%end
ans=inputdlg('Define results folder:');
mkdir(ans{1});
array=arrayi;
s1='Results_a_';
s2=num2str(ne);
s3='ch_Rx_only.mat';
s4=strcat(s1,s2,s3);
save(strcat(pwd,'\',ans{1},'\',s4),'ne','array','xp','yp','zp','B1','Bz','Bx','By');
clear all;



