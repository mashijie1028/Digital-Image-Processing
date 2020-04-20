I = imread('trove.png');
I = rgb2gray(I);

figure;
subplot(1,2,1);imshow(I);title('原始图像');
subplot(1,2,2);
%imshow(bernsen(I));
imshow(bernsen(rgb2gray(imread('trove.png')), [93,93]));
title('bernsen二值化')