clear;clc;
I=imread('trove.png');
I = rgb2gray(I);
%I = im2double(I);
k=graythresh(I);              %�õ�������ֵ
f = imbinarize(I,k);                  %ת���ɶ�ֵͼ��kΪ�ָ���ֵ
f = I;%��ע�ͣ�������������ǰ�Ƿ����Otsu

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

%se=strel('square',3');%���ͽṹԪ��
se=strel('square',3');%Բ���ͽṹԪ��
imshow(f);title('ԭʼͼ��')

%�������ٸ�ʴ
fse=imdilate(f,se);%����
%fse=imdilate(f,B);
figure,set(gcf,'outerposition',get(0,'screensize'));%����Ŀ�������õ�ǰ���ڵĴ�С
subplot(221),imshow(fse);
title('ʹ��square(3)�����ͺ��ͼ��');

fes=imerode(fse,se);
%des=imerode(fse,B);
subplot(222),imshow(fes);
title('ʹ��square(3)�������ٸ�ʴ���ͼ��');

%�ȸ�ʴ������
fse=imerode(f,se);
%fse=imerode(f,B);
%figure,set(gcf,'outerposition',get(0,'screensize'))
subplot(223),imshow(fse);
title('ʹ��square(3)�ȸ�ʴ���ͼ��');

fes=imdilate(fse,se);
%fes=imdilate(fse,B);
subplot(224),imshow(fes);
title('ʹ��square(3)�ȸ�ʴ�����ͺ��ͼ��');
