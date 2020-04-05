img = imread('1.jpg');
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

figure;
subplot(2,2,1);
imshow(img);
title('原图像'); 

subplot(2,2,2);
imshow(255-R);
title('R分量（红）'); 

subplot(2,2,3);
imshow(255-G);
title('G分量（绿）'); 

subplot(2,2,4);
imshow(255-B);
title('B分量（蓝）');
