I=imread('trove.png');
I = rgb2gray(I);
%I = im2double(I);
k=graythresh(I);              %�õ�������ֵ
J=im2bw(I,k);                  %ת���ɶ�ֵͼ��kΪ�ָ���ֵ
subplot(121);imshow(I); title('ԭͼ��');
subplot(122);imshow(J); title('Otsu');
T = double(255)*k
