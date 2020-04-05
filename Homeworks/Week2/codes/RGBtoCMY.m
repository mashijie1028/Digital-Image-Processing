img = imread('1.jpg');
cmy = user_defined_rgb2cmy(img);
C = cmy(:,:,1);
M = cmy(:,:,2);
Y = cmy(:,:,3);

figure;
subplot(2,2,1);
imshow(cmy);
title('CMY图像'); 

subplot(2,2,2);
imshow(C);
title('C分量（青）'); 

subplot(2,2,3);
imshow(M);
title('M分量（品红）'); 

subplot(2,2,4);
imshow(Y);
title('Y分量（黄）');
