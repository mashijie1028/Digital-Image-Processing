I=imread('trove.png');
I = rgb2gray(I);
%I = im2double(I);
k=graythresh(I);              %得到最优阈值
J=im2bw(I,k);                  %转换成二值图，k为分割阈值
subplot(121);imshow(I); title('原图像');
subplot(122);imshow(J); title('Otsu');
T = double(255)*k
