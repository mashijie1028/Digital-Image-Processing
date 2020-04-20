clear;clc;
I = imread('trove.png');
I = rgb2gray(I);
I = im2double(I);
k=graythresh(I);              %得到最优阈值

A1=imbinarize(I,k);                  %转换成二值图，k为分割阈值

A1=I; %可注释，用于区别膨胀前是否进行Otsu
figure;
subplot(221),imshow(A1);
title('原始图像');

%strel函数的功能是运用各种形状和大小构造结构元素
se1=strel('disk',3);%这里是创建一个半径为3的平坦型圆盘结构元素
%se1=strel('square',3);
%se1 = strel('line', 10, 45)
B2=[0 1 0
   1 1 1
   0 1 0];
B1=[0,1;1,1];
A2=imerode(A1,se1);
subplot(222),imshow(A2);
title('使用结构元disk(3)腐蚀后的图像');

se2=strel('disk',5);
A3=imerode(A1,se2);
subplot(223),imshow(A3);
title('使用结构元disk(5)腐蚀后的图像');

se3=strel('disk',10);
A4=imerode(A1,se3);
subplot(224),imshow(A4);
title('使用结构元disk(10)腐蚀后的图像');


% B结构元
figure;
subplot(131),imshow(A1);title('原始图像')
A5=imerode(A1,B1);
subplot(132),imshow(A5);
title('使用结构元B_1腐蚀后的图像');

A6=imerode(A1,B2);
subplot(133),imshow(A6);
title('使用结构元B_2腐蚀后的图像');