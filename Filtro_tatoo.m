 %% limpeza
 clc 
 clear all 
 close all
 
 %% le imagem
 
 I = imread('Tatoo1.jpg');
 I = im2double(I);
 figure;imshow(I)
 
 %% 1° passo
 
 for i = 0:6
 
 Ii = I;
 Iaux1 = rgb2gray(I);
 
 I2 = Ii([50:587],[220:460],:);
 I2 = rgb2gray(I2);
 
 I2 = edge(I2,'sobel');

  
 
 S = strel('diamond', 1);
 I2 = imdilate(I2,S);
 I2 = (I2-1).^2;
 imshow(I2); 

I3 = ones(size(Iaux1));
I3([50:587],[220:460],:) = I2([1:538],[1:241]);
I3 = (I3-1).^2;
I5 = imclearborder(I3);
I3 = (I5-1).^2;


I4 = ones(size(I));
I4 = I3.*I;
 
 [M,N,l] = size(I4); 
 Ia = I4;
 
 for i = 1:N
     for j = 1:M
         
             if  Ia(j,i,:) == 0
              Ia(j,i,:) =  I(j+8,i-8,:);         
             end
        
     end
 end
 I = Ia;
 
 
 end

ii = Ia;
I = ii;
 
N = 10;
K = 1/(N^2) * ones(N);
 
%filtragem 2D

   I8(:,:,1) =  filter2(K,I([50:587],[220:460],1),'same'); 
   I8(:,:,2) =  filter2(K,I([50:587],[220:460],2),'same');
   I8(:,:,3) =  filter2(K,I([50:587],[220:460],3),'same');
 
  
   I([65:569],[236:442],1) = I8([15:519],[16:222],1);
   I([65:569],[236:442],2) = I8([15:519],[16:222],2);
   I([65:569],[236:442],3) = I8([15:519],[16:222],3);
  
 figure; imshow(I);
 

 
 
 
 
 
 
 