function planar_array()

%
% This code computes the B field compunents and A the magnetic vector 
% potential of the array of elements equally distributed around a cylinder


clear all
close all

%define global parameters
global u0 I N cond freq;
u0=4*pi()*10^-7; %relative permitivity for air
N=100; %points used to define coil
I=1; %constant current distribution in each coil
cond=0.7; %define conductivity
freq=123.2*10^6; %define frequency

[rada,radb,xin,yin,zin,ne]=define_array(); % get the array elements

arrayi=gen_array(rada,radb,xin,yin,zin,ne); %generate initial array

%define field request domain
[xpmin,xpmax,px,ypmin,ypmax,py,zpmin,zpmax,pz]= field_req_def();

%compute B field and A magnetic potential vector for each element
[B1,Bx,By,Bz,Ax,Ay,Az,A,xp,yp,zp]=calc_comp(arrayi,ne,xpmin,xpmax,px,ypmin,ypmax,py,zpmin,zpmax,pz);

%compute magnetic field of the array
[bB1]=calc_final_field(B1,ne);

%crop to 2-D for single slice
B1f(:,:)=bB1(:,1,:);

%save all variables
ans=inputdlg('Define results folder:');
mkdir(ans{1});
array=arrayi;
s1='Results_';
s2=num2str(ne);
s3='ch_Rx_only.mat';
s4=strcat(s1,s2,s3);
save(strcat(pwd,'\',ans{1},'\',s4));
clear all;
end
