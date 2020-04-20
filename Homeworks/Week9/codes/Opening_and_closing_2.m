clear;clc;
I=imread('trove.png');
I = rgb2gray(I);
%I = im2double(I);
k=graythresh(I);              %得到最优阈值
f = imbinarize(I,k);                  %转换成二值图，k为分割阈值
f = I;%可注释，用于区别膨胀前是否进行Otsu

B=[0 1 0
   1 1 1
   0 1 0];
B=[0,1;1,1];
%{
[m,n] = size(I);
BW1 = logical(zeros(m,n));
for i=1:m
    for j=1:n
        if(I(i,j)<133)
            BW1(i,j)=0;
        else 
            BW1(i,j)=1;
        end
    end
end
f=BW1;
%}

%se=strel('square',3');%方型结构元素
se=strel('square',3');%圆盘型结构元素
imshow(f);title('原始图像')

%先膨胀再腐蚀
fse=imdilate(f,se);%膨胀
%fse=imdilate(f,B);
figure,set(gcf,'outerposition',get(0,'screensize'));%具体目的是设置当前窗口的大小
subplot(221),imshow(fse);
title('使用square(3)先膨胀后的图像');

fes=imerode(fse,se);
%des=imerode(fse,B);
subplot(222),imshow(fes);
title('使用square(3)先膨胀再腐蚀后的图像');

%先腐蚀再膨胀
fse=imerode(f,se);
%fse=imerode(f,B);
%figure,set(gcf,'outerposition',get(0,'screensize'))
subplot(223),imshow(fse);
title('使用square(3)先腐蚀后的图像');

fes=imdilate(fse,se);
%fes=imdilate(fse,B);
subplot(224),imshow(fes);
title('使用square(3)先腐蚀再膨胀后的图像');
