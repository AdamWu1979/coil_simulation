

function circular_array()

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
freq=123.2*10^6; %define frequqncy

ans=inputdlg('Radius of cylinder in cm:');% get the radius of the cylinder
radc=str2num(ans{1})*0.01; % convert radius to cm

[rada,radb,xin,yin,zin,ne]=define_array(); % get the array elements

xinr=zeros(size(xin)); %reinitialise the position along X
clear xin;
xin=create_wrapped_elem(radc,ne); %compute the new X position of the element around the cylinder
arrayi=gen_array(rada,radb,xinr,yin,zin,ne); %generate initial array

%rotate each element of the array 
for ii=1:1:ne
    relem=rotation(arrayi,xin,ii,radc);
    arrayr(:,:,ii)=relem;
end

%rotate each element of the array
for ii=1:1:ne
    telem=translation(arrayr,xin,ii,radc);
    arrayt(:,:,ii)=telem;
end

%define field request domain
[xpmin,xpmax,px,ypmin,ypmax,py,zpmin,zpmax,pz]= field_req_def();

%compute B field and A magnetic potential vector for each element
[B1,Bx,By,Bz,Ax,Ay,Az,A,xp,yp,zp]=calc_comp(arrayt,ne,xpmin,xpmax,px,ypmin,ypmax,py,zpmin,zpmax,pz);

%compute noise impedance matrix
[R]=calc_R(A,ne,radc,xpmin,xpmax,px,ypmin,ypmax,py,zpmin,zpmax,pz);

%compute SNR of the array
[SNR]=calc_SNR(B1,ne,R);

%compute magnetic field of the array
[bB1]=calc_final_field(B1,ne);

%crop to 2-D for single slice
B1f(:,:)=bB1(:,1,:);

%save all variables
ans=inputdlg('Define results folder:');
mkdir(ans{1});
array=arrayt;
s1='Results_';
s2=num2str(ne);
s3='ch_Rx_only.mat';
s4=strcat(s1,s2,s3);
save(strcat(pwd,'\',ans{1},'\',s4));
clear all;
end
