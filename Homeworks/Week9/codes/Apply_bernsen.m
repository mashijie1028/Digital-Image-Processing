I = imread('trove.png');
I = rgb2gray(I);

figure;
subplot(1,2,1);imshow(I);title('ԭʼͼ��');
subplot(1,2,2);
%imshow(bernsen(I));
imshow(bernsen(rgb2gray(imread('trove.png')), [93,93]));
title('bernsen��ֵ��')