function [B1,Bx,By,Bz,xp,yp,zp,px,py,pz]=planar_array()

%define global parameters

global u0 I N ;
u0=4*pi()*10^-7; %relative permitivity for air
I=1; %current in coil
N=100;

[rada,radb,xin,yin,zin,ne]=define_array();
arrayi=gen_array(rada,radb,xin,yin,zin,ne);

[xpmin,xpmax,px,ypmin,ypmax,py,zpmin,zpmax,pz]= field_req_def();

[B1c,Bxc,Byc,Bzc,xp,yp,zp]=calc_comp(arrayi,ne,xpmin,xpmax,px,ypmin,ypmax,py,zpmin,zpmax,pz);

[B1,Bx,By,Bz]=calc_array(Bxc,Byc,Bzc,B1c,ne);
end

