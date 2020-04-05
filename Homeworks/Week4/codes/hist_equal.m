img = imread('work1.png');
I = rgb2gray(img);
J = histeq(I);  

figure;
subplot(121)
imshow(uint8(I));
title('原图灰度图')
subplot(122)
imshow(uint8(J));
title('均衡化后灰度图')

figure;
subplot(121)
imhist(I,64);
title('原图像直方图（转为灰度后）');
subplot(122)
imhist(J,64);
title('均衡化后的直方图（转为灰度后）');