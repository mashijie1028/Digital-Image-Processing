img = imread('2.jpg');
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

figure;
subplot(2,2,1);
imshow(img);
title('原图像'); 

subplot(2,2,2);
imshow(R);
title('R分量（红）'); 

subplot(2,2,3);
imshow(G);
title('G分量（绿）'); 

subplot(2,2,4);
imshow(B);
title('B分量（蓝）');
