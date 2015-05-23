function plot_field_xz_img(B1,tpy,xp,px,zp,pz)
ihm(:,:)=B1(:,tpy,:);
ihm=ihm';
imagesc(ihm);
set(gca,'XTick',0:10:size(xp,2))
set(gca,'XTickLabel',min(xp)*100:10*px*100:max(xp)*100)
set(gca,'YTick',0:10:size(zp,2))
set(gca,'YTickLabel',min(zp)*100:10*pz*100:max(zp)*100)
title('B1 sensitivity profile')
xlabel('X-axis [cm]')
ylabel('Z-axis [cm]')
grid on;
colorbar;
t = colorbar('peer',gca);
set(get(t,'Ylabel'),'String', '[Tesla]');
end
