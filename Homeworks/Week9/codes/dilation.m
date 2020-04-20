clear;clc;
I=imread('trove.png');
I = rgb2gray(I);
%I = im2double(I);
k=graythresh(I);              %�õ�������ֵ
f = imbinarize(I,k);                  %ת���ɶ�ֵͼ��kΪ�ָ���ֵ


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

A1=I; %��ע�ͣ�������������ǰ�Ƿ����Otsu������ע�͵�����ֱ��ʹ��ԭʼͼ�����룬������Otsu���ж�ֵ������
A2=imdilate(A1,B); %ͼ��A1���ṹԪ��B����
A3=imdilate(A2,B);
A4=imdilate(A3,B);
figure; 
subplot(221),imshow(A1);title('imdilate����ԭʼͼ��');
subplot(222),imshow(A2);title('ʹ��B��1�����ͺ��ͼ��');
subplot(223),imshow(A3);title('ʹ��B��2�����ͺ��ͼ��');
subplot(224),imshow(A4);title('ʹ��B��3�����ͺ��ͼ��');
