I = imread('trove.png');
I = rgb2gray(I);
imshow(I);
%���ֱ��ͼ
figure;imhist(I);
%�˹�ѡ����ֵ���зָѡ����ֵΪ120
[width,height]=size(I);
T1=120;
for i=1:width
    for j=1:height
        if(I(i,j)<T1)
            BW1(i,j)=0;
        else 
            BW1(i,j)=1;
        end
    end
end
figure;imshow(BW1),title('�˹���ֵ���зָ�');
%�Զ�ѡ����ֵ
T2=graythresh(I);
BW2=im2bw(I,T2);%Otus��ֵ���зָ�
figure;imshow(BW2),title('Otus��ֵ���зָ�');

