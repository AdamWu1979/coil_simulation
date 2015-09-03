function [xcyl,zcyl,ycyl]=gen_cylinder(radc)
%
% This function generates and plots the cylinder the cyclinder
% radc = cylinder radius


N=25;
t=-pi/2:2*pi/(N-1):3*pi/2;

zinitc=radc;
xinitc=0;
zcyl = zinitc+radc*cos(t) ;
xcyl = xinitc+radc*sin(t) ;
ycyl = zeros(size(xcyl));
figure()
plot3(xcyl,ycyl,zcyl,'*');
hold on;
end