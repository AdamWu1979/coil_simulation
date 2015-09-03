function plot_array(array,radc,ne)
%
% This function plots the coil array 

close all;

%plot cylinder
[xcyl,zcyl,ycyl]=gen_cylinder(radc);

%plot elements
for hh=1:1:ne
p=plot3(array(1,:,hh),array(2,:,hh),array(3,:,hh));
set(p,'Color','black','LineWidth',2)
hold on;
view([30 15])
axis equal
title('Elements distribution around a cylinder')
xlabel('X-axis [m]')
ylabel('Y-axis [m]')
zlabel('Z-axis [m]')
grid on;

 end
