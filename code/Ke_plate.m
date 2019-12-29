%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ke_plate.m - 1/12/16                                     %
% author: Tehila Stone | Theo Dimitrasopoulos              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ke]=Ke_plate(r,s,t,v,E,l,xn,ien,nen,ndf,nsd,point,weight,nglx,ngly)
%------------------------------------------------------------------------
%  Purpose:
%     compute plate element stiffness
% 
%  Synopsis:
%     [Bb,Bs,Db,Ds,ke]=Ke_plate(t,v,E,l,xn,ien,nen,ndf,nsd,point,weight,nglx,ngly)
% 
%  Variable Description:
%     nen  - number of nodes per element
%     ndf  - number of equations per node
%     nsd  - number of spatial dimensions
%------------------------------------------------------------------------
k=5/6;

x = zeros(1,nen);
y = zeros(1,nen);
    for i= 1:nen
        x(1,i) = xn(1, ien(i)); 
        y(1,i) = xn(2, ien(i)); 
    end
        
        Db=zeros(3,3);
        Db=(3.2967e7)*[1 v 0; v 1 0; 0 0 0.5*(1-v)];
        Ds=zeros(2,2);
        Ds=(1.15385e7)*[1 0; 0 1];
        [J] = jacobian_2d(r,s, x, y, nen); 
        detJ = det(J);
        ke  = zeros(12,12);
        keb = zeros(12,12);
        kes = zeros(12,12);
       

        
                for j=1:l
                
                    [Bblarge] = shape_quad_bending(r, s, xn, ien, nen);
                    [Bslarge] = shape_quad_shear(r, s, xn, ien, nen); 
                    disp(Bblarge);
                    disp(Bslarge);

                    kjb=0.6220*Bblarge.'*Db*Bblarge;
                    kjs=0.6220*Bslarge.'*Ds*Bslarge;
                    keb = keb+t^3/12*kjb;
                    kes = kes+t*k*kjs;
                    
                end
       ke = keb+kes;
       disp(keb);
       disp(kes);
       disp(ke);
end
 
%add bending and shear contributions

% Global Stiffness Ke(i,j)
%Kes=zeros(ndf*nen,ndf*nen);
%Kes(:,:)=kes(:,:);
%Keb=zeros(ndf*nen,ndf*nen);
%Keb(:,:)=keb(:,:);

