load('work2.mat');
f = mat2gray(abs(image));
v_1 = 1;  
g_1 = log2(1 + v_1*f)/log2(v_1+1);  
  
v_2 = 20;  
g_2 = log2(1 + v_2*f)/log2(v_2+1);  
  
v_3 = 100;  
g_3 = log2(1 + v_3*f)/log2(v_3+1);  

v_4 = 1000;  
g_4 = log2(1 + v_4*f)/log2(v_4+1);  
  
v_5 = 100000;  
g_5 = log2(1 + v_5*f)/log2(v_5+1);  

figure;  
subplot(2,3,1);  
imshow(f,[]);  
title('Original Image');  

subplot(2,3,2);  
imshow(g_1,[]);  
title(['Log Transformations v=',num2str(v_1)]);  
  
subplot(2,3,3);  
imshow(g_2,[]);  
title(['Log Transformations v=',num2str(v_2)]);  
  
subplot(2,3,4);  
imshow(g_3,[]);  
title(['Log Transformations v=',num2str(v_3)]);  

subplot(2,3,5);  
imshow(g_4,[]);  
title(['Log Transformations v=',num2str(v_4)]);  

subplot(2,3,6);  
imshow(g_5,[]);  
title(['Log Transformations v=',num2str(v_5)]);  
