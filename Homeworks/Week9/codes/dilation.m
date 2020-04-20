clear;clc;
I=imread('trove.png');
I = rgb2gray(I);
%I = im2double(I);
k=graythresh(I);              %得到最优阈值
f = imbinarize(I,k);                  %转换成二值图，k为分割阈值


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
A1=BW1;

B=[0 1 0
   1 1 1
   0 1 0];
%B=[0,1;1,1];

A1=I; %可注释，用于区别膨胀前是否进行Otsu，若不注释掉，则直接使用原始图像输入，不经过Otsu进行二值化处理
A2=imdilate(A1,B); %图像A1被结构元素B膨胀
A3=imdilate(A2,B);
A4=imdilate(A3,B);
figure; 
subplot(221),imshow(A1);title('imdilate膨胀原始图像');
subplot(222),imshow(A2);title('使用B后1次膨胀后的图像');
subplot(223),imshow(A3);title('使用B后2次膨胀后的图像');
subplot(224),imshow(A4);title('使用B后3次膨胀后的图像');
