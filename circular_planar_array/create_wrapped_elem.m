function [xelem]=create_wrapped_elem(radc,ne)
%
% This function returns the new X position of the element around the cylinder:
% radc = cylinder radius
% ne = the number of elements


n=ne+1;
ang=linspace(-pi/2,pi/2,n+1); % angle generation between -180 to 180 degrees

for ii=2:1:(size(ang,2)-1)

    angelem(ii-1)=ang(ii);

end

xelem=sin(angelem)*radc; %the new X position of the element
end
