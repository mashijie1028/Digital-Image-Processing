I=imread('����X��ͼ��.jpg');
I=imread('����NOAA�ɼ�����ͼ.jpg');
I=rgb2gray(I);

figure;
subplot(1,2,1);imshow(I);title('ԭʼͼ��');             %��ʾ�Ҷ�ͼ��
thresholds= [45 65 84 108 134 157 174 189 206 228]; %������ֵ
G2C=grayslice(I,thresholds);   % �ܶȷֲ�

mymap = [0 0 0                  %��ɫ
    1 0 0                       %��ɫ
    0 1 0                       %��ɫ
    0 0 1                       %��ɫ
    1 1 0                       %��ɫ
    1 1 1];                     %��ɫ
subplot(1,2,2);
surf(peaks)
imshow(G2C,colormap(mymap));title('�Ҷȷֲ��α��ɫͼ��')    %��ʾα��ɫͼ��