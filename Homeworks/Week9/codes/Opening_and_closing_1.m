clear;clc;
I=imread('trove.png');
I = rgb2gray(I);
I = im2double(I);
k=graythresh(I);              %�õ�������ֵ

f = imbinarize(I,k);                  %ת���ɶ�ֵͼ��kΪ�ָ���ֵ
f = I;%��ע�ͣ�������������ǰ�Ƿ����Otsu
se=strel('square',3');%���ͽṹԪ��
%se=strel('disk',3');%Բ���ͽṹԪ��
imshow(f);title('ԭʼͼ��')

fo=imopen(f,se);%ֱ�ӿ�����
figure,subplot(221),imshow(fo);
title('ֱ�ӿ�����');

fc=imclose(f,se);%ֱ�ӱ�����
subplot(222),imshow(fc);
title('ֱ�ӱ�����');

foc=imclose(fo,se);%�ȿ��������
subplot(223),imshow(foc);
title('�ȿ��������');

fco=imopen(fc,se);%�ȱպ�����
subplot(224),imshow(fco);
title('�ȱպ�����');