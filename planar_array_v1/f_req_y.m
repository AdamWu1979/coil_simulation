function [ypmin,ypmax,py]=f_req_y()

prompt={'Ymin in cm:','Ymax in cm:',...
    'Precision in cm:'};
answer=inputdlg(prompt,'Y axis request');
ypmin=str2num(answer{1})*0.01;
ypmax=str2num(answer{2})*0.01;
py=str2num(answer{3})*0.01;
end