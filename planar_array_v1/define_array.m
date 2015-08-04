function [rada,radb,xin,yin,zin,ne,radc]=define_array()

answer=inputdlg('Number of elements:');
ne=str2num(answer{1});

for(ii=1:1:ne)
    prompt={'Radius A(X-axis) in cm:','Radius B(Y-axis) in cm:',...
        'X position in cm:','Y position in cm:','Z position in cm:'};
    answer=inputdlg(prompt);
    radaa=str2num(answer{1});
    radbb=str2num(answer{2});
    xinit=str2num(answer{3});
    yinit=str2num(answer{4});
    zinit=str2num(answer{5});
    rada(ii)=radaa*0.01;
    radb(ii)=radbb*0.01;
    xin(ii)=xinit*0.01;
    yin(ii)=yinit*0.01;
    zin(ii)=zinit*0.01;
    clear xinit yinit zinit radaa radbb;
end
end