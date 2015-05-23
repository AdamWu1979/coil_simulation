function [B1,BX,BY,BZ,xp,yp,zp]=calc_field(coil,ne,xpmin,xpmax,px,ypmin,ypmax,py,zpmin,zpmax,pz)
global I u0 N;


xp=xpmin:px:xpmax;
yp=ypmin:py:ypmax;
zp=zpmin:pz:zpmax;

%xp=-0.06:0.01:0.06;
%yp=0;
%zp=0:0.01:0.1;

Nx=size(xp,2);  % No. of grids in x-axis
Ny=size(yp,2);  % No. of grids in Y-axis
Nz=size(zp,2);  % No. of grids in Z-axis

%------------------------------------
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

xxp(1:Ny,1:Nz)=0;
yyp(1:Ny,1:Nz)=0; % This array is for 1-d to 2-d conversion of coordinates
zzp(1:Ny,1:Nz)=0;

for i=1:Nx
    xxp(:,i)=xp(i);% all z-coordinates value in 2-d form
end

for i=1:Ny
    yyp(i,:)=yp(i); % all y-coordinates value in 2-d form
end

for i=1:Nz
    zzp(:,i)=zp(i);% all z-coordinates value in 2-d form
end



%---------------------------------------
%Compute B field 3D
Xc(1,:)=coil(1,:,ne);
Yc(1,:)=coil(2,:,ne);
Zc(1,:)=coil(3,:,ne);
g = waitbar(0,'Please wait...');
for a=1:Nx
    
    perc=a/Nx;
    waitbar(perc,g,sprintf('%d%% '))
    for b=1:Ny
        for c=1:Nz
            
            %-------------------------------------------------------------------------
            % calculate R-vector from the coil(X-Y plane)to Y-Z plane where we are
            % interested to find the magnetic field and also the dl-vector along the
            % coil where current is flowing
            % (note that R is the position vector pointing from coil (X-Y plane) to
            % the point where we need the magnetic field (in this case Y-Z plane).)
            % dl is the current element vector which will make up the coil------------
            %-------------------------------------------------------------------------
            
            for i=1:N-1
                Rx(i)=(X(a,b,c)-(0.5*(Xc(i)+Xc(i+1))));
                Ry(i)=(Y(a,b,c)-(0.5*(Yc(i)+Yc(i+1))));
                Rz(i)=(Z(a,b,c)-(0.5*(Zc(i)+Zc(i+1))));
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
            
            
            %--------------------------------------------------------------------------
            % for all the elements along coil, calculate dl cross R -------------------
            % dl cross R is the curl of vector dl and R--------------------------------
            % XCross is X-component of the curl of dl and R, similarly I get Y and Z-
            %--------------------------------------------------------------------------
            
            for i=1:N
                Xcross(i)=(dly(i).*Rz(i))-(dlz(i).*Ry(i));
                Ycross(i)=(dlz(i).*Rx(i))-(dlx(i).*Rz(i));
                Zcross(i)=(dlx(i).*Ry(i))-(dly(i).*Rx(i));
                R(i)=sqrt(Rx(i).^2+Ry(i).^2+Rz(i).^2);
            end
            
            %-------------------------------------------------------------------------
            % this will be the biot savarts law equation------------------------------
            %--------------------------------------------------------------------------
            
            Bx1=(I*u0./(4*pi*(R.^3))).*Xcross;
            By1=(I*u0./(4*pi*(R.^3))).*Ycross;
            Bz1=(I*u0./(4*pi*(R.^3))).*Zcross;
            %--------------------------------------------------------------------------
            % now we have  magnetic field from all current elements in the form of an
            % array named Bx1,By1,Bz1, now its time to add them up to get total
            % magnetic field
            %-------------------------------------------------------------------------
            
            BX(a,b,c)=0;       % Initialize sum magnetic field to be zero first
            BY(a,b,c)=0;
            BZ(a,b,c)=0;
            
            %--------------------------------------------------------------------------
            % here we add all magnetic field from different current elements which
            % make up the coil
            %--------------------------------------------------------------------------
            
            for i=1:N   % loop over all current elements along coil
                BX(a,b,c)=BX(a,b,c)+Bx1(i);
                BY(a,b,c)=BY(a,b,c)+By1(i);
                BZ(a,b,c)=BZ(a,b,c)+Bz1(i);
            end
            
            %-------------------------------------------------------------------------
            
        end
    end
end
close(g);
B1 = sqrt(BX.^2 + BY.^2 + BZ.^2);
end

