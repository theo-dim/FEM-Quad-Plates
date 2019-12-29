%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% final_project.m - 1/12/16                                %
% author: Theo Dimitrasopoulso               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear; % removes all variables from the workspace.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                          DATA                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%
% Material %
%%%%%%%%%%%%

L = 10;     % meters
t = 0.1;    % meters
E = 30.0e6; % MPa
v = 0.3;

%%%%%%%%%%%%
%   Other  %
%%%%%%%%%%%%

%l=1;   % 1 integration point
l=4;   % 4 integration points
icase = 0;

%%%%%%%%
% Mesh %
%%%%%%%%
nsd=2;      % number of space dimensions
ndf=3;      % number of freedom per node 
nen=4;      % number of element nodes

nel=64;      % number of elements
nnp=81;     % number of nodal points
nglx = 1;
ngly = 1;
nglz = 0;

%%%%%%%%%%%%%%%%%%%%%
% Nodal coordinates %
%%%%%%%%%%%%%%%%%%%%%
% xn(i,N):= coordinate i for node N
% N=1,...,nnp
% i=1,...,nsd
xn=zeros(nsd,nnp);

% 1 or more elements
xn(1,2) = 5;
xn(1,3) = 5;
xn(2,3) = 5;
xn(2,4) = 5;

% % 4 or more elements
xn(1,5) = 2.5;
xn(1,6) = 5;
xn(2,6) = 2.5;
xn(1,7) = 2.5;
xn(2,7) = 5;
xn(2,8) = 2.5;
xn(1,9) = 2.5;
xn(2,9) = 2.5;


% % 16 or more elements
xn(1,10)=1.25;
xn(1,11)=3.75;
xn(1,12)=5;
xn(2,12)=1.25;
xn(1,13)=5;
xn(2,13)=3.75;
xn(1,14)=3.75;
xn(2,14)=5;
xn(1,15)=1.25;
xn(2,15)=5;
xn(2,16)=3.75;
xn(2,17)=1.25;
xn(1,18)=1.25;
xn(2,18)=1.25;
xn(1,19)=2.5;
xn(2,19)=1.25;
xn(1,20)=3.75;
xn(2,20)=1.25;
xn(1,21)=3.75;
xn(2,21)=2.5;
xn(1,22)=3.75;
xn(2,22)=3.75;
xn(1,23)=2.5;
xn(2,23)=3.75;
xn(1,24)=1.25;
xn(2,24)=3.75;
xn(1,25)=1.25;
xn(2,25)=2.5;
% 
% %64 or more elements
xn(1,26)=0.625;
xn(1,27)=1.875;
xn(1,28)=3.125;
xn(1,29)=4.375;
xn(1,30)=5;
xn(2,30)=0.625;
xn(1,31)=5;
xn(2,31)=1.875;
xn(1,32)=5;
xn(2,32)=3.125;
xn(1,33)=5;
xn(2,33)=4.375;
xn(1,34)=4.375;
xn(2,34)=5;
xn(1,35)=3.125;
xn(2,35)=5;
xn(1,36)=1.875;
xn(2,36)=5;
xn(1,37)=0.625;
xn(2,37)=5;
xn(2,38)=4.375;
xn(2,39)=3.125;
xn(2,40)=1.875;
xn(2,41)=0.625;
xn(1,42)=0.625;
xn(2,42)=0.625;
xn(1,43)=1.25;
xn(2,43)=0.625;
xn(1,44)=1.875;
xn(2,44)=0.625;
xn(1,45)=2.5;
xn(2,45)=0.625;
xn(1,46)=3.125;
xn(2,46)=0.625;
xn(1,47)=3.75;
xn(2,47)=0.625;
xn(1,48)=4.375;
xn(2,48)=0.625;
xn(1,49)=4.375;
xn(2,49)=1.25;
xn(1,50)=4.375;
xn(2,50)=1.875;
xn(1,51)=4.375;
xn(2,51)=2.5;
xn(1,52)=4.375;
xn(2,52)=3.125;
xn(1,53)=4.375;
xn(2,53)=3.75;
xn(1,54)=4.375;
xn(2,54)=4.375;
xn(1,55)=3.75;
xn(2,55)=4.375;
xn(1,56)=3.125;
xn(2,56)=4.375;
xn(1,57)=2.5;
xn(2,57)=4.375;
xn(1,58)=1.875;
xn(2,58)=4.375;
xn(1,59)=1.25;
xn(2,59)=4.375;
xn(1,60)=0.625;
xn(2,60)=4.375;
xn(1,61)=0.625;
xn(2,61)=3.75;
xn(1,62)=0.625;
xn(2,62)=3.125;
xn(1,63)=0.625;
xn(2,63)=2.5;
xn(1,64)=0.625;
xn(2,64)=1.875;
xn(1,65)=0.625;
xn(2,65)=1.25;
xn(1,66)=1.875;
xn(2,66)=1.25;
xn(1,67)=3.125;
xn(2,67)=1.25;
xn(1,68)=3.75;
xn(2,68)=1.875;
xn(1,69)=3.75;
xn(2,69)=3.125;
xn(1,70)=3.125;
xn(2,70)=3.75;
xn(1,71)=1.875;
xn(2,71)=3.75;
xn(1,72)=1.25;
xn(2,72)=3.125;
xn(1,73)=1.25;
xn(2,73)=1.875;
xn(1,74)=1.875;
xn(2,74)=1.875;
xn(1,75)=2.5;
xn(2,75)=1.875;
xn(1,76)=3.125;
xn(2,76)=1.875;
xn(1,77)=3.125;
xn(2,77)=2.5;
xn(1,78)=3.125;
xn(2,78)=3.125;
xn(1,79)=2.5;
xn(2,79)=3.125;
xn(1,80)=1.875;
xn(2,80)=3.125;
xn(1,81)=1.875;
xn(2,81)=2.500;
%%%%%%%%%%%%%%%%
% Connectivity %
%%%%%%%%%%%%%%%%
% ien(a,e)=N
% N: global node number - N=1,...,nnp
% e: element number - e=1,...,nel
% a: local node number - a=1,...,nen

ien=zeros(nen,nel);

% 1 element
% ien(1,1) = 1;
% ien(2,1) = 2;
% ien(3,1) = 3;
% ien(4,1) = 4;

% 4 elements
% ien(1,1)=1;     ien(1,2)=5;     ien(1,3)=9;     ien(1,4)=8;
% ien(2,1)=5;     ien(2,2)=2;     ien(2,3)=6;     ien(2,4)=9;
% ien(3,1)=9;     ien(3,2)=6;     ien(3,3)=3;     ien(3,4)=7;
% ien(4,1)=8;     ien(4,2)=9;     ien(4,3)=7;     ien(4,4)=4;

% 16 elements
% ien(1,1)=1;     ien(1,2)=10;    ien(1,3)=5;     ien(1,4)=11;
% ien(2,1)=10;    ien(2,2)=5;     ien(2,3)=11;    ien(2,4)=2;
% ien(3,1)=18;    ien(3,2)=19;    ien(3,3)=20;    ien(3,4)=12;
% ien(4,1)=17;    ien(4,2)=18;    ien(4,3)=19;    ien(4,4)=20;
% % 
% ien(1,5)=20;    ien(1,6)=21;    ien(1,7)=22;    ien(1,8)=23;
% ien(2,5)=12;    ien(2,6)=6;     ien(2,7)=13;    ien(2,8)=22;
% ien(3,5)=6;     ien(3,6)=13;    ien(3,7)=3;     ien(3,8)=14;
% ien(4,5)=21;    ien(4,6)=22;    ien(4,7)=14;    ien(4,8)=7;
% 
% ien(1,9)=24;    ien(1,10)=16;   ien(1,11)=8;    ien(1,12)=17;
% ien(2,9)=23;    ien(2,10)=24;   ien(2,11)=25;   ien(2,12)=18;
% ien(3,9)=7;     ien(3,10)=15;   ien(3,11)=24;   ien(3,12)=25;
% ien(4,9)=15;    ien(4,10)=4;    ien(4,11)=16;   ien(4,12)=8;
% 
% ien(1,13)=18;   ien(1,14)=19;   ien(1,15)=9;    ien(1,16)=25;
% ien(2,13)=19;   ien(2,14)=20;   ien(2,15)=21;   ien(2,16)=9;
% ien(3,13)=9;    ien(3,14)=21;   ien(3,15)=22;   ien(3,16)=23;
% ien(4,13)=25;   ien(4,14)=9;    ien(4,15)=23;   ien(4,16)=24;

% 64 elements
ien(1,1)=1;     ien(1,2)=26;    ien(1,3)=10;    ien(1,4)=27;
ien(2,1)=26;    ien(2,2)=10;    ien(2,3)=27;    ien(2,4)=5;
ien(3,1)=42;    ien(3,2)=43;    ien(3,3)=44;    ien(3,4)=45;
ien(4,1)=41;    ien(4,2)=42;    ien(4,3)=43;    ien(4,4)=44;

ien(1,5)=5;    ien(1,6)=28;    ien(1,7)=11;     ien(1,8)=29;
ien(2,5)=28;    ien(2,6)=11;    ien(2,7)=29;    ien(2,8)=2;
ien(3,5)=46;    ien(3,6)=47;    ien(3,7)=48;    ien(3,8)=30;
ien(4,5)=45;    ien(4,6)=46;    ien(4,7)=47;    ien(4,8)=48;

ien(1,9)=48;    ien(1,10)=49;    ien(1,11)=50;    ien(1,12)=51;
ien(2,9)=30;    ien(2,10)=12;    ien(2,11)=31;    ien(2,12)=6;
ien(3,9)=12;    ien(3,10)=31;    ien(3,11)=6;     ien(3,12)=32;
ien(4,9)=49;    ien(4,10)=50;    ien(4,11)=51;    ien(4,12)=52;

ien(1,13)=52;    ien(1,14)=53;    ien(1,15)=54;    ien(1,16)=55;
ien(2,13)=32;    ien(2,14)=13;    ien(2,15)=33;    ien(2,16)=54;
ien(3,13)=13;    ien(3,14)=33;    ien(3,15)=3;     ien(3,16)=34;
ien(4,13)=53;    ien(4,14)=54;    ien(4,15)=34;    ien(4,16)=14;

ien(1,17)=56;    ien(1,18)=57;    ien(1,19)=58;    ien(1,20)=59;
ien(2,17)=55;    ien(2,18)=56;    ien(2,19)=57;    ien(2,20)=58;
ien(3,17)=14;    ien(3,18)=35;    ien(3,19)=7;     ien(3,20)=36;
ien(4,17)=35;    ien(4,18)=7;     ien(4,19)=36;     ien(4,20)=15;

ien(1,21)=60;    ien(1,22)=38;    ien(1,23)=16;    ien(1,24)=39;
ien(2,21)=59;    ien(2,22)=60;    ien(2,23)=61;    ien(2,24)=62;
ien(3,21)=15;    ien(3,22)=37;    ien(3,23)=60;    ien(3,24)=61;
ien(4,21)=37;    ien(4,22)=4;     ien(4,23)=38;    ien(4,24)=16;

ien(1,25)=8;     ien(1,26)=40;   ien(1,27)=17;    ien(1,28)=41;
ien(2,25)=63;    ien(2,26)=64;   ien(2,27)=65;    ien(2,28)=42;
ien(3,25)=62;    ien(3,26)=63;   ien(3,27)=64;    ien(3,28)=65;
ien(4,25)=39;    ien(4,26)=8;    ien(4,27)=40;    ien(4,28)=17;

ien(1,29)=42;    ien(1,30)=43;    ien(1,31)=44;    ien(1,32)=45;
ien(2,29)=43;    ien(2,30)=44;    ien(2,31)=45;    ien(2,32)=46;
ien(3,29)=18;    ien(3,30)=66;    ien(3,31)=19;    ien(3,32)=67;
ien(4,29)=65;    ien(4,30)=18;    ien(4,31)=66;    ien(4,32)=19;

ien(1,33)=46;    ien(1,34)=47;    ien(1,35)=20;    ien(1,36)=68;
ien(2,33)=47;    ien(2,34)=48;    ien(2,35)=49;    ien(2,36)=50;
ien(3,33)=20;    ien(3,34)=49;    ien(3,35)=50;    ien(3,36)=51;
ien(4,33)=67;    ien(4,34)=20;    ien(4,35)=68;    ien(4,36)=21;

ien(1,37)=21;    ien(1,38)=69;    ien(1,39)=22;    ien(1,40)=70;
ien(2,37)=51;    ien(2,38)=52;    ien(2,39)=53;    ien(2,40)=22;
ien(3,37)=52;    ien(3,38)=53;    ien(3,39)=54;    ien(3,40)=55;
ien(4,37)=69;    ien(4,38)=22;    ien(4,39)=55;    ien(4,40)=56;

ien(1,41)=23;    ien(1,42)=71;    ien(1,43)=24;    ien(1,44)=61;
ien(2,41)=70;    ien(2,42)=23;    ien(2,43)=71;    ien(2,44)=24;
ien(3,41)=56;    ien(3,42)=57;    ien(3,43)=58;    ien(3,44)=59;
ien(4,41)=57;    ien(4,42)=58;    ien(4,43)=59;    ien(4,44)=60;

ien(1,45)=62;    ien(1,46)=63;    ien(1,47)=64;    ien(1,48)=65;
ien(2,45)=72;    ien(2,46)=25;    ien(2,47)=73;    ien(2,48)=18;
ien(3,45)=24;    ien(3,46)=72;    ien(3,47)=25;    ien(3,48)=73;
ien(4,45)=61;    ien(4,46)=62;    ien(4,47)=63;    ien(4,48)=64;

ien(1,49)=18;    ien(1,50)=66;    ien(1,51)=19;    ien(1,52)=67;
ien(2,49)=66;    ien(2,50)=19;    ien(2,51)=67;    ien(2,52)=20;
ien(3,49)=74;    ien(3,50)=75;    ien(3,51)=76;    ien(3,52)=68;
ien(4,49)=73;    ien(4,50)=74;    ien(4,51)=75;    ien(4,52)=76;

ien(1,53)=76;    ien(1,54)=77;    ien(1,55)=78;    ien(1,56)=79;
ien(2,53)=68;    ien(2,54)=21;    ien(2,55)=69;    ien(2,56)=78;
ien(3,53)=21;    ien(3,54)=69;    ien(3,55)=22;    ien(3,56)=70;
ien(4,53)=77;    ien(4,54)=78;    ien(4,55)=70;    ien(4,56)=23;

ien(1,57)=80;    ien(1,58)=72;    ien(1,59)=25;    ien(1,60)=73;
ien(2,57)=79;    ien(2,58)=80;    ien(2,59)=81;    ien(2,60)=74;
ien(3,57)=23;    ien(3,58)=71;    ien(3,59)=80;    ien(3,60)=81;
ien(4,57)=71;    ien(4,58)=24;    ien(4,59)=72;    ien(4,60)=25;

ien(1,61)=74;    ien(1,62)=75;    ien(1,63)=9;    ien(1,64)=81;
ien(2,61)=75;    ien(2,62)=76;    ien(2,63)=77;    ien(2,64)=9;
ien(3,61)=9;    ien(3,62)=77;    ien(3,63)=78;    ien(3,64)=79;
ien(4,61)=81;    ien(4,62)=9;    ien(4,63)=79;    ien(4,64)=80;

%%%%%%%%%%%%%%%%%%%%%%%
% Boundary conditions %
%%%%%%%%%%%%%%%%%%%%%%%
% prescribed displacement (essential boundary condition)
%
% idb(i,N)=1 if the degree of freedom i of the node N is prescribed
%         =0 otherwise
%
% 1) initialize idb to 0

idb=zeros(ndf,nnp);

% 2) enter the flag for prescribed displacement boundary conditions

% 1 or more elements 
idb(1,1) = 1; idb(2,1) = 1; idb(3,1) = 1;
idb(1,2) = 1; idb(2,2) = 1; idb(3,2) = 1;
idb(1,4) = 1; idb(2,4) = 1; idb(3,4) = 1;

% % 4 or more elements
idb(1,5) = 1; idb(2,5) = 1; idb(3,5) = 1;
idb(1,8) = 1; idb(2,8) = 1; idb(3,8) = 1;
% 
% 16 or more elements
 idb(1,10) = 1;  idb(2,10) = 1;  idb(3,10) = 1;
 idb(1,11) = 1;  idb(2,11) = 1;  idb(3,11) = 1;
 idb(1,16) = 1;  idb(2,16) = 1;  idb(3,16) = 1;
 idb(1,17) = 1;  idb(2,17) = 1;  idb(4,17) = 1;
 
% % 64 or more elements
 idb(1,38) = 1;  idb(2,38) = 1;  idb(3,38) = 1;
 idb(1,39) = 1;  idb(2,39) = 1;  idb(3,39) = 1;
 idb(1,40) = 1;  idb(2,40) = 1;  idb(3,40) = 1;
 idb(1,41) = 1;  idb(2,41) = 1;  idb(4,41) = 1;
 idb(1,26) = 1;  idb(2,26) = 1;  idb(3,26) = 1;
 idb(1,27) = 1;  idb(2,27) = 1;  idb(3,27) = 1;
 idb(1,28) = 1;  idb(2,28) = 1;  idb(3,28) = 1;
 idb(1,29) = 1;  idb(2,29) = 1;  idb(4,29) = 1;  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% prescribed nodal displacement boundary conditions %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% g(i,N): prescribed displacement for the dof i of node N
% initialize g
g=zeros(ndf,nnp);
% enter the values


%%%%%%%%%%%%%%%%%%%%%%%%%%%
% prescribed nodal forces %
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% f(i,N): prescribed force for the dof i of node N
% initialize f
f=zeros(ndf,nnp);
% enter the values

% concentrated load - for all meshes
f(2,3)=-1;  %kN

% distributed load - 1 element
% for i = 1:4
%     f(2,i)=-0.0625;
% end

% distributed load - 4 elements
% for i = 1:9
%    f(2,i)=-0.02778;
% end

% distributed load - 16 elements
%for i = 1:25
%    f(2,i) = -0.01;
% end
% 
% % distributed load - 64 elements
%for i = 1:81
%    f(2,i) = -0.003086;
% end


%---------------------------------------------------------------

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% number the equations; build the id table %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[id,neq]=number_eq(idb,nnp,ndf)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     Gaussian Integration Parameters      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[point,weight]=gauss(nglx,ngly,nglz,nsd)
        
        r = zeros(4,1);
        s = zeros(4,1);
        r(1) = point(1,1); 
        %r(2) = point(2,1); 
        %r(3) = point(2,2);
        %r(4) = point(1,2);
        s(1) = point(1,1); 
        %s(2) = point(1,2);
        %s(3) = point(2,1); 
        %s(4) = point(2,2);         
        


for e=1:nel
  [ke(:,:,e)] = Ke_plate(r,s,t,v,E,l,xn,ien(:,e),nen,ndf,nsd,point,weight,nglx,ngly);
end;

disp(ke);


% Contribution of the prescribed displacements to the elemental force vector
%f=f-Ke*Ue;
fe=zeros(ndf*nen,nel);     % fe may be non zero in general
Ue=zeros(ndf*nen,nel);
for e=1:nel
    for n=1:nen
        for i=1:ndf
            Ue(i+(n-1)*ndf,e)=g(i,ien(n,e));
        end
    end
    fe(:,e)=fe(:,e)-ke(:,:,e)*Ue(:,e);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                        Assembly operation                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%----------------
% build K and F
%----------------
K=zeros(neq,neq);
F=zeros(neq,1);

% input the prescribed nodal forces in F
for N=1:nnp
    for i=1:ndf
        if (id(i,N) > 0)
            P=id(i,N);
            F(P)=f(i,N);
            %F(id(i,N))=f(i,N);
        end
    end
end

% compute global K and F
if (neq > 0)
    for e=1:nel
        K = addstiff(K,id,ke(:,:,e),ien(:,e),nen,ndf);
        F = addforce(F,id,fe(:,e),ien(:,e),nen,ndf);
        %Ks = addstiff(K,id,ke(:,:,e),ien(:,e),nen,ndf);
        disp(F);
    end
end
disp(K);

if (neq > 0)
    U=K\F;
    
end
disp(U);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     Post Processing                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%
% complete U %
%%%%%%%%%%%%%%
Ucomp=zeros(ndf,nnp);
for N=1:nnp
    for i=1:ndf
        if (id(i,N) == 0) 
            Ucomp(i,N)=g(i,N);
        else
            P=id(i,N);
            Ucomp(i,N)=U(P);
        end
    end
end
% print results
disp('Nodal Displacements:')
disp(' node     Displacement ')
for N=1:nnp
   disp(sprintf('%5d %7g',N,Ucomp(:,N)))
end 
disp(' ')

% Contribution of the displacement to the elemental force vector
% fe=Ke*Ue
for e=1:nel
    Ue(:,e)=zeros(ndf*nen,1);
    for n=1:nen
        for i=1:ndf
            Ue(i+(n-1)*ndf,e)=Ucomp(i,ien(n,e));
        end
    end
    fe(:,e)=ke(:,:,e)*Ue(:,e);
end;

%%%%%%%%%%%%%%%%%%%%                                
% Moment and Shear %
%%%%%%%%%%%%%%%%%%%%

[m] = zeros(3,1);
[s] = zeros(2,1);
kappa = zeros(3,1);
gamma = zeros(2,1);
Db=zeros(3,3);
Db=(3.2967e7)*[1 v 0; v 1 0; 0 0 0.5*(1-v)];
Ds=zeros(2,2);
Ds=(1.15385e7)*[1 0; 0 1];

% Calculate curvature kappa
[kappa] = [Ucomp(2);
           Ucomp(6);
           Ucomp(3) + Ucomp(5)];

% Calculate shear gamma
[gamma] = [-sqrt(Ucomp(2)^2+Ucomp(3)^2) + Ucomp(1);
           -sqrt(Ucomp(5)^2+Ucomp(6)^2) + Ucomp(4)];
       


% Calculate moment vector
[m] = (-t^3/12)*Db*kappa;
disp('Moment');
[m]

% Calculate shear vector
[s] = t*Ds*gamma;
disp('Shear');
[s]

%%%%%%%%%%%%%%%%%%%%
% plot the results %
%%%%%%%%%%%%%%%%%%%%

plot_results_shell(icase,xn,Ucomp,ien,nel,nen,nsd,ndf,nnp);