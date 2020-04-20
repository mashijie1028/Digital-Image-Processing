I=imread('trove.png');
I = rgb2gray(I);
%figure;imshow(I);

f_sobel = fspecial('sobel');
F2 = imfilter(I,f_sobel);
figure;imshow(I+F2);title('Sobel算子边缘锐化图像')
I = I+F2;

J = im2double(I+F2);
k=graythresh(I);              %得到最优阈值

A1=imbinarize(I,k);                  %转换成二值图，k为分割阈值
%J=A1;%可注释，用于区别膨胀前是否进行Otsu，注释掉表示使用原图，和其余m文件的这个是否使用Ostu还是原图的情况相反
f=J;
%se=strel('square',3');%方型结构元素
se=strel('disk',3');%圆盘型结构元素
imshow(f);title('Sobel算子边缘锐化图像')

%先膨胀再腐蚀
fse=imdilate(f,se);%膨胀
%fse=imdilate(f,B);
figure,set(gcf,'outerposition',get(0,'screensize'));%具体目的是设置当前窗口的大小
subplot(221),imshow(fse);
title('使用disk(3)先膨胀后的图像');

fes=imerode(fse,se);
%des=imerode(fse,B);
subplot(222),imshow(fes);
title('使用disk(3)先膨胀再腐蚀后的图像');

%先腐蚀再膨胀
fse=imerode(f,se);
%fse=imerode(f,B);
%figure,set(gcf,'outerposition',get(0,'screensize'))
subplot(223),imshow(fse);
title('使用disk(3)先腐蚀后的图像');

fes=imdilate(fse,se);
%fes=imdilate(fse,B);
subplot(224),imshow(fes);
title('使用disk(3)先腐蚀再膨胀后的图像');