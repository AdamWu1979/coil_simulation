function [relem]=rotation(array,xin,en,radc)
%
% This function computes the rotated elements
% array = initial coil array
% xin = X initial position
% en = element number
% radc = cylinder radius 
% relem = matrix 2-D

theta=-asin(xin(en)/radc);
%theta=(ang*pi/180);

%generate rotation matrix along Y axis
Ry = [ cos(theta) 0 sin(theta);0 1 0; -sin(theta) 0 cos(theta)];
%Rx = [1 0 0 ;cos(theta) -sin(theta) 0;0 sin(theta) cos(theta) ];
%Rz = [cos(theta) -sin(theta) 0;sin(theta) cos(theta) 0; 0 0 1];
s=[array(1,:,en);array(2,:,en);array(3,:,en)];

relem=Ry*s;
end
