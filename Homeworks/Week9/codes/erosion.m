clear;clc;
I = imread('trove.png');
I = rgb2gray(I);
I = im2double(I);
k=graythresh(I);              %�õ�������ֵ

A1=imbinarize(I,k);                  %ת���ɶ�ֵͼ��kΪ�ָ���ֵ

A1=I; %��ע�ͣ�������������ǰ�Ƿ����Otsu
figure;
subplot(221),imshow(A1);
title('ԭʼͼ��');

%strel�����Ĺ��������ø�����״�ʹ�С����ṹԪ��
se1=strel('disk',3);%�����Ǵ���һ���뾶Ϊ3��ƽ̹��Բ�̽ṹԪ��
%se1=strel('square',3);
%se1 = strel('line', 10, 45)
B2=[0 1 0
   1 1 1
   0 1 0];
B1=[0,1;1,1];
A2=imerode(A1,se1);
subplot(222),imshow(A2);
title('ʹ�ýṹԪdisk(3)��ʴ���ͼ��');

se2=strel('disk',5);
A3=imerode(A1,se2);
subplot(223),imshow(A3);
title('ʹ�ýṹԪdisk(5)��ʴ���ͼ��');

se3=strel('disk',10);
A4=imerode(A1,se3);
subplot(224),imshow(A4);
title('ʹ�ýṹԪdisk(10)��ʴ���ͼ��');


% B�ṹԪ
figure;
subplot(131),imshow(A1);title('ԭʼͼ��')
A5=imerode(A1,B1);
subplot(132),imshow(A5);
title('ʹ�ýṹԪB_1��ʴ���ͼ��');

A6=imerode(A1,B2);
subplot(133),imshow(A6);
title('ʹ�ýṹԪB_2��ʴ���ͼ��');