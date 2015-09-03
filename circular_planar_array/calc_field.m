function [B1,BX,BY,BZ,AX,AY,AZ,A,xp,yp,zp]=calc_field(array,ne,xpmin,xpmax,px,ypmin,ypmax,py,zpmin,zpmax,pz)

%
% This function computes the B field and the A magnetic field potential

global I u0 N;

xp=xpmin:px:xpmax; % X axis measuring position
yp=ypmin:py:ypmax; % Y axis measuring position
zp=zpmin:pz:zpmax; % Z axis measuring position

Nx=size(xp,2);  % No. of grids in x-axis
Ny=size(yp,2);  % No. of grids in Y-axis
Nz=size(zp,2);  % No. of grids in Z-axis

%Generate mesh
X(1:Nx,1:Ny,1:Nz)=0;
Y(1:Nx,1:Ny,1:Nz)=0;
Z(1:Nx,1:Ny,1:Nz)=0;

for i=1:Nx
    X(i,:,:)=xp(i);
end

for i=1:Ny
    Y(:,i,:)=yp(i);
end

for i=1:Nz
    Z(:,:,i)=zp(i);
end

%Compute B field in 3D
Xc(1,:)=array(1,:,ne); %get X coordiantes for each element of the array
Yc(1,:)=array(2,:,ne); %get Y coordiantes for each element of the array
Zc(1,:)=array(3,:,ne); %get Z coordiantes for each element of the array
g = waitbar(0,'Please wait...'); % initiate waitbar

% looping around the grids in X-axis
for a=1:Nx
    
    perc=a/Nx;
    waitbar(perc,g,sprintf('%d%% '))
    % looping around the grids in Y-axis
    for b=1:Ny
        % looping around the grids in Z-axis
        for c=1:Nz
            
            %looping  for all the points which are defining the coil
            for i=1:N-1
                % calculate R- position vector from the coil to the observation point where we
                % want are calculate the magnetic field
                Rx(i)=(X(a,b,c)-(0.5*(Xc(i)+Xc(i+1))));
                Ry(i)=(Y(a,b,c)-(0.5*(Yc(i)+Yc(i+1))));
                Rz(i)=(Z(a,b,c)-(0.5*(Zc(i)+Zc(i+1))));
                
                % calculate dl-vector along the coil where current is flowing
                dlx(i)=Xc(i+1)-Xc(i);
                dly(i)=Yc(i+1)-Yc(i);
                dlz(i)=Zc(i+1)-Zc(i);
            end
            Rx(N)=(X(a,b,c)-(0.5*(Xc(N)+Xc(1))));
            Ry(N)=(Y(a,b,c)-(0.5*(Yc(N)+Yc(1))));
            Rz(N)=(Z(a,b,c)-(0.5*(Zc(N)+Zc(1))));
            dlx(N)=-Xc(N)+Xc(1);
            dly(N)=-Yc(N)+Yc(1);
            dlz(N)=-Zc(N)+Zc(1);
            
            
            % dl cross R is the curl of vector dl and R
            % XCross is X-component of the curl of dl and R
            % YCross is Y-component of the curl of dl and R
            % ZCross is Z-component of the curl of dl and R
            for i=1:N
                Xcross(i)=(dly(i).*Rz(i))-(dlz(i).*Ry(i));
                Ycross(i)=(dlz(i).*Rx(i))-(dlx(i).*Rz(i));
                Zcross(i)=(dlx(i).*Ry(i))-(dly(i).*Rx(i));
                R(i)=sqrt(Rx(i).^2+Ry(i).^2+Rz(i).^2);
            end
            
            
            % Biot savarts law for each axis component
            
            Bx1=(I*u0./(4*pi*(R.^3))).*Xcross;
            By1=(I*u0./(4*pi*(R.^3))).*Ycross;
            Bz1=(I*u0./(4*pi*(R.^3))).*Zcross;
            
            % Magnetic vector potential for each axis component
            Ax1=(I*u0./(4*pi*R));
            Ay1=(I*u0./(4*pi*R));
            Az1=(I*u0./(4*pi*R));
            
            BX(a,b,c)=0;       % Initialize sum magnetic field to zero
            BY(a,b,c)=0;
            BZ(a,b,c)=0;
            
            AX(a,b,c)=0;       % Initialize sum magnetic potential to zero
            AY(a,b,c)=0;
            AZ(a,b,c)=0;
            
            % looping over all current elements along coil
            for i=1:N
                BX(a,b,c)=BX(a,b,c)+Bx1(i);
                BY(a,b,c)=BY(a,b,c)+By1(i);
                BZ(a,b,c)=BZ(a,b,c)+Bz1(i);
                
                AX(a,b,c)=AX(a,b,c)+Ax1(i);
                AY(a,b,c)=AY(a,b,c)+Ay1(i);
                AZ(a,b,c)=AZ(a,b,c)+Az1(i);
            end
        end
    end
end
close(g);%close waitbar

B1 = sqrt(BX.^2 + BY.^2 + BZ.^2); % summing all components of magnetic field
A = sqrt(AX.^2+AY.^2+AZ.^2); % summing all components of magnetic vector potential

end

