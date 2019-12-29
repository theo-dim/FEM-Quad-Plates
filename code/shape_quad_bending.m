function [Bblarge] = shape_quad_bending(r, s, xn, ien, nen) 
  
    [N, Nr, Ns] = shape2_quad(r,s); 
    %[J] = jacobian_2d(r,s, x, y, nen); 
    %detJ = det(J); 
    %invJ = (inv(J));

    Bb = zeros(3,3,nen);
    
    %Nsr= zeros(2,4); 
    %for i = 1:nen
    %Nsr(1,i) = Nr(1,i); 
    %Nsr(2,i) = Ns(1,i); 
    %end
   
    %Bb = (invJ)*(Nsr); 
    %Bb; 
    for i=1:nen
    Bb(1,2,i) = Nr(1,i);
    Bb(2,3,i) = Ns(1,i);
    Bb(3,2,i) = Ns(1,i);
    Bb(3,3,i) = Nr(1,i);
    %disp(Bb);
    end
    
    
    Bblarge=horzcat(Bb(:,:,1), Bb(:,:,2), Bb(:,:,3), Bb(:,:,4));
    
    disp(Bblarge);
end

    
    
    

   
    
   
     
        