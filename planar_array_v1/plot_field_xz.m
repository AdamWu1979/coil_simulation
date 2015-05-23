function plot_field_xz(B1,tpy,xp,zp)
Bd(:,:)=B1(:,tpy,:);
lim1=min(min(Bd));
lim2=max(max(Bd));
steps=(lim2-lim1)/100;
contour(zp*100,xp*100,Bd,lim1:steps:lim2)
hold on
title('B1 sensitivity profile contour')
xlabel('Z-axis [cm]')
ylabel('X-axis [cm]')
colorbar;
t = colorbar('peer',gca);
set(get(t,'Ylabel'),'String', '[Tesla]');
end