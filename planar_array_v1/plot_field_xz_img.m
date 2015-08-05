function plot_field_xz_img(B1,tpy,xp,zp)
ihm(:,:)=B1(:,tpy,:);
ihm=ihm';
imagesc(ihm);
title('B1 sensitivity profile')
xlabel('X-axis [cm]')
ylabel('Z-axis [cm]')
grid on;
colorbar;
t = colorbar('peer',gca);
set(get(t,'Ylabel'),'String', '[Tesla]');
end
