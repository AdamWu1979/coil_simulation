function plot_planar_array(array,ne)
%
% This function plots the coil array 

close all;

%plot elements
for hh=1:1:ne
p=plot3(array(1,:,hh),array(2,:,hh),array(3,:,hh));
set(p,'Color','black','LineWidth',2)
hold on;
%view([30 15])
title('Elements distribution around a cylinder')
xlabel('X-axis [m]')
ylabel('Y-axis [m]')
zlabel('Z-axis [m]')
grid on;

 end
