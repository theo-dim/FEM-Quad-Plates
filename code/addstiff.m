%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% addstiff.m - November, 21 2002                           %
% author: Jean H. Prevost                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [K]=addstiff(K,id,ke,ien,nen,ndf)

%------------------------------------------------------------------------
%  Purpose:
%     add elemental stiffnesss in global stiffness matrix
%
%  Synopsis:
%     [K]=addstiff(Id,Ke,ien,nen,ndf)
%
%  Variable Description:
%     nen  - number of nodes per element = 4
%     ndf  - number of equations per node = 3
%------------------------------------------------------------------------

for n=1:nen
    for i=1:ndf
        if (id(i,ien(n)) > 0)
            P=id(i,ien(n));
            for m=1:nen
                for j=1:ndf
                    if (id(j,ien(m)) > 0)
                        Q=id(j,ien(m));
                        K(P,Q)=K(P,Q)+ke(i+(n-1)*ndf,j+(m-1)*ndf);
                    end
                end
           end
        end
    end
end

