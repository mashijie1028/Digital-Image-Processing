I=imread('trove.png');
I = rgb2gray(I);
%figure;imshow(I);

f_sobel = fspecial('sobel');
F2 = imfilter(I,f_sobel);
figure;imshow(I+F2);title('Sobel���ӱ�Ե��ͼ��')
I = I+F2;

J = im2double(I+F2);
k=graythresh(I);              %�õ�������ֵ

A1=imbinarize(I,k);                  %ת���ɶ�ֵͼ��kΪ�ָ���ֵ
%J=A1;%��ע�ͣ�������������ǰ�Ƿ����Otsu��ע�͵���ʾʹ��ԭͼ��������m�ļ�������Ƿ�ʹ��Ostu����ԭͼ������෴
f=J;
%se=strel('square',3');%���ͽṹԪ��
se=strel('disk',3');%Բ���ͽṹԪ��
imshow(f);title('Sobel���ӱ�Ե��ͼ��')

%�������ٸ�ʴ
fse=imdilate(f,se);%����
%fse=imdilate(f,B);
figure,set(gcf,'outerposition',get(0,'screensize'));%����Ŀ�������õ�ǰ���ڵĴ�С
subplot(221),imshow(fse);
title('ʹ��disk(3)�����ͺ��ͼ��');

fes=imerode(fse,se);
%des=imerode(fse,B);
subplot(222),imshow(fes);
title('ʹ��disk(3)�������ٸ�ʴ���ͼ��');

%�ȸ�ʴ������
fse=imerode(f,se);
%fse=imerode(f,B);
%figure,set(gcf,'outerposition',get(0,'screensize'))
subplot(223),imshow(fse);
title('ʹ��disk(3)�ȸ�ʴ���ͼ��');

fes=imdilate(fse,se);
%fes=imdilate(fse,B);
subplot(224),imshow(fes);
title('ʹ��disk(3)�ȸ�ʴ�����ͺ��ͼ��');