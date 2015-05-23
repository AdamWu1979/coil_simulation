clc
clear all;
close all;

answer=inputdlg('Number of configurations:');
nc=str2num(answer{1});
clear answer;

for ii=1:1:nc
[B1tmp,Bxtmp,Bytmp,Bztmp,xptmp,yptmp,zptmp,pxtmp,pytmp,pztmp]=planar_array()
B1f(:,ii)=B1tmp(:,:);
Bxf(:,ii)=Bxtmp(:,:);
Byf(:,ii)=Bytmp(:,:);
Bzf(:,ii)=Bztmp(:,:);
xpf(ii,:)=xptmp(1,:);
ypf(ii,:)=yptmp(1,:);
zpf(ii,:)=zptmp(1,:);
pxf(:,ii)=pxtmp;
pyf(:,ii)=pytmp;
pzf(:,ii)=pztmp;
clear B1tmp Bxtmp Bytmp Bztmp xptmp yptmp zptmp pxtmp pytmp pztmp;
end

plot(xpf(1,:),B1f(:,1))
hold on
plot(xpf(2,:),B1f(:,2),'r')


