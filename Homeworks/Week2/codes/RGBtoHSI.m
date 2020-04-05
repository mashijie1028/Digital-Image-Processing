img = imread('2.jpg');
hsi = user_defined_rgb2hsi(img);
H = hsi(:,:,1);
S = hsi(:,:,2);
I = hsi(:,:,3);

figure;
subplot(2,2,1);
imshow(hsi);
title('HSI图像'); 

subplot(2,2,2);
imshow(H);
title('H分量（色调）'); 

subplot(2,2,3);
imshow(S);
title('S分量（饱和度）'); 

subplot(2,2,4);
imshow(I);
title('I分量（亮度）');
