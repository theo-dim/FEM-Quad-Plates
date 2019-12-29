function [Bslarge] = shape_quad_shear(r, s, xn, ien, nen) 
x = zeros(1,nen);
y = zeros(1,nen);
    for i= 1:nen
        x(1,i) = xn(1, ien(i)); 
        y(1,i) = xn(2, ien(i)); 
    end
  
    [N, Nr, Ns] = shape2_quad(r,s); 
    %[J] = jacobian_2d(r,s, x, y, nen); 
    %detJ = det(J); 
    %invJ = (inv(J));

    Bs = zeros(2,2,nen);
    
    %Nsr= zeros(2,4); 
    %for i = 1:nen
    %Nsr(1,i) = Nr(1,i); 
    %Nsr(2,i) = Ns(1,i); 
    %end
   
    %Bs = (invJ)*(Nsr); 
    %Bs; 
    for i=1:nen
        
        Bs(1,1,i)=Nr(1,i);
        Bs(1,2,i)=-N(1,i);
        Bs(2,1,i)=Ns(1,i);
        Bs(2,3,i)=-N(1,i);
    end
    
    
    Bslarge=horzcat(Bs(:,:,1), Bs(:,:,2), Bs(:,:,3), Bs(:,:,4));
    
    disp(Bslarge);
end

    
    
    

   
    
   
     
        