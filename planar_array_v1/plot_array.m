function plot_array(array,ne)
for ii=1:1:ne
    plot3(array(1,:,ii),array(2,:,ii),array(3,:,ii));
    view([45 45])
    grid on;
    hold on
    grid on;
    axis equal;
    title('Array')
    xlabel('X-axis [cm]')
    ylabel('Y-axis [cm]')
    zlabel('Z-axis [cm]')
    
end