imga = imread('作业5_A.jpg');
imgb = imread('作业5_B.jpg');
Ia = rgb2gray(imga);
Ib = rgb2gray(imgb);

figure;
subplot(1,2,1);
imhist(Ia,64);
title('图片A灰度直方图')
subplot(1,2,2);
imhist(Ib,64);
title('图片B灰度直方图')

hista = imhist(Ia,64);
histb = imhist(Ib,64);
match_a = histeq(Ia,histb);
match_b = histeq(Ib,hista);

figure;
subplot(2,2,1);
imshow(Ia); title('原始A图像（灰度图）')
subplot(2,2,2);
imshow(Ib); title('原始B图像（灰度图）')
subplot(2,2,3);
imshow(match_a); title('直方图规定化后A图像（灰度图）')
subplot(2,2,4);
imshow(match_b); title('直方图规定化后B图像（灰度图）')

figure;
subplot(2,2,1);
imhist(Ia,64); title('原始A图像灰度直方图')
subplot(2,2,2);
imhist(Ib,64); title('原始B图像灰度直方图')
subplot(2,2,3);
imhist(match_a,64); title('规定化后A图像灰度直方图')
subplot(2,2,4);
imhist(match_b,64); title('规定化后B图像灰度直方图')

