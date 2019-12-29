%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot_results_shell  (+plate)                             % 
% author: Yong Yang  (12/17/2003)                          %
% modified by: James Guest  (1/7/2005)                     %
% icase = 0 plots 3D elastic plate                         %
% icase = 1 plots 3D elastic shell                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function plot_results_shell(icase,xn_act,Ucomp,ien,nel,nen,nsd,ndf,nnp)

display_factor=.5;
eps=1e-4;

xn=zeros(3,nnp);
if(icase==1)
    disp('SHELL PLOTTING PROGRAM')
    xn = xn_act;
elseif(icase==0)
    disp('PLATE PLOTTING PROGRAM')
    for i= 1:nnp
      xn(1,i) = xn_act(1,i);
      xn(2,i) = xn_act(2,i);
      xn(3,i) = 0;
    end    
end

% characteristic distances
xmax=max(max(xn(1,:)));
xmin=min(min(xn(1,:)));

ymax=max(max(xn(2,:)));
ymin=min(min(xn(2,:)));

zmax=max(max(xn(3,:)));
zmin=min(min(xn(3,:)));

Lcar=((xmax-xmin)+(ymax-ymin)+(zmax-zmin))/3;

k=0;
while (k~=4)
    k=menu('results','undeformed mesh', 'deformed mesh','undeformed and deformed mesh','exit');
    
    switch k
    case 1 
        figure;    
        axis equal;
        box on;
        view(3);
        title('Undeformed mesh');
        hold on;
        plot_mesh_undeformed(nel,ien,xn,nnp,nsd,nen);
        hold off;
    case 2
        figure;
        axis equal;
        box on;
        view(3);
        title('Deformed mesh');
        hold on;
        if(icase==0) 
          plot_mesh_deformed_Pl(xn,Ucomp,display_factor,Lcar,nel,ien,ndf,nsd,nen,nnp);
        elseif(icase==1) 
          plot_mesh_deformed(xn,Ucomp,display_factor,Lcar,nel,ien,ndf,nsd,nen,nnp);
        end
        hold off;
    case 3
        figure;
        axis equal;
        box on;
        view(3);
        title('Undeformed and deformed mesh');
        hold on;
        plot_mesh_undeformed(nel,ien,xn,nnp,nsd,nen);        
        if(icase==0) 
          plot_mesh_deformed_Pl(xn,Ucomp,display_factor,Lcar,nel,ien,ndf,nsd,nen,nnp);
        elseif(icase==1) 
          plot_mesh_deformed(xn,Ucomp,display_factor,Lcar,nel,ien,ndf,nsd,nen,nnp);
        end
        hold off;
        
    end
    
    
end

%-----------------------------------------
% PLOT FUNCTIONS
%-----------------------------------------

function plot_mesh_undeformed(nel,ien,xn,nnp,nsd,nen)
for e=1:nel
    for m=1:nen
        node(m)=ien(m,e);
    end
        
    x=[xn(1,node(1)); xn(1,node(2)); xn(1,node(3)); xn(1,node(4))]; 
    y=[xn(2,node(1)); xn(2,node(2)); xn(2,node(3)); xn(2,node(4))];   
    z=[xn(3,node(1)); xn(3,node(2)); xn(3,node(3)); xn(3,node(4))];
        
    % filled color 
    c=[1,1,1];
    view(3);
    patch(x,y,z,c); 
end

    
function plot_mesh_deformed_Pl(xn,Ucomp,display_factor,Lcar,nel,ien,ndf,nsd,nen,nnp);

scale=display_factor*Lcar/max(max(abs(Ucomp))); % scale factor for the displacements
xt=zeros(3,4);
for e=1:nel
    for i=1:4
        node(i)=ien(i,e);
        xt(1,i)=xn(1,node(i));
        xt(2,i)=xn(2,node(i));
        xt(3,i)=xn(3,node(i))+scale*Ucomp(1,node(i));
    end;
    
    x=[xt(1,1); xt(1,2); xt(1,3); xt(1,4)]; 
    y=[xt(2,1); xt(2,2); xt(2,3); xt(2,4)];   
    z=[xt(3,1); xt(3,2); xt(3,3); xt(3,4)];
    
    % filled color 
    c=[.5,.5,.5];
    view(3);
    patch(x,y,z,c); 
end


function plot_mesh_deformed(xn,Ucomp,display_factor,Lcar,nel,ien,ndf,nsd,nen,nnp);

scale=display_factor*Lcar/max(max(abs(Ucomp))); % scale factor for the displacements
xt=zeros(3,4);
for e=1:nel
    for i=1:4
        node(i)=ien(i,e);
        xt(1,i)=xn(1,node(i))+scale*Ucomp(1,node(i));
        xt(2,i)=xn(2,node(i))+scale*Ucomp(2,node(i));
        xt(3,i)=xn(3,node(i))+scale*Ucomp(3,node(i));
    end;
        
    x=[xt(1,1); xt(1,2); xt(1,3); xt(1,4)]; 
    y=[xt(2,1); xt(2,2); xt(2,3); xt(2,4)];   
    z=[xt(3,1); xt(3,2); xt(3,3); xt(3,4)];
    
    % filled color 
    c=[.5,.5,.5];
    view(3);
    patch(x,y,z,c); 

end

    

