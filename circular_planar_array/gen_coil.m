function [coil]=gen_coil(rada,radb,xinit,yinit,zinit)
%
% This function computes the coordinates for each element:
% rada = coil radius along X-axis
% radb = coil radius along Y-axis
% xinit = initial X position of the element
% yinit = initial Y position of the element
% zinit = initial Z position of the element

global N;
t=-pi/2:2*pi/(N-1):3*pi/2;  %used to describe the circle
xc = xinit+rada*cos(t) ;    %y coordinates of the coil
yc = yinit+radb*sin(t) ;    %x coordinates of the coil
zc = zinit*ones(size(t)) ; %z coordinates of the coil

coil=[xc;yc;zc]; % matrix 3-D
end