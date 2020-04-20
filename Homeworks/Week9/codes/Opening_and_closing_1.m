clear;clc;
I=imread('trove.png');
I = rgb2gray(I);
I = im2double(I);
k=graythresh(I);              %得到最优阈值

f = imbinarize(I,k);                  %转换成二值图，k为分割阈值
f = I;%可注释，用于区别膨胀前是否进行Otsu
se=strel('square',3');%方型结构元素
%se=strel('disk',3');%圆盘型结构元素
imshow(f);title('原始图像')

fo=imopen(f,se);%直接开运算
figure,subplot(221),imshow(fo);
title('直接开运算');

fc=imclose(f,se);%直接闭运算
subplot(222),imshow(fc);
title('直接闭运算');

foc=imclose(fo,se);%先开后闭运算
subplot(223),imshow(foc);
title('先开后闭运算');

fco=imopen(fc,se);%先闭后开运算
subplot(224),imshow(fco);
title('先闭后开运算');