imga = imread('��ҵ5_A.jpg');
imgb = imread('��ҵ5_B.jpg');
Ia = rgb2gray(imga);
Ib = rgb2gray(imgb);

figure;
subplot(1,2,1);
imhist(Ia,64);
title('ͼƬA�Ҷ�ֱ��ͼ')
subplot(1,2,2);
imhist(Ib,64);
title('ͼƬB�Ҷ�ֱ��ͼ')

hista = imhist(Ia,64);
histb = imhist(Ib,64);
match_a = histeq(Ia,histb);
match_b = histeq(Ib,hista);

figure;
subplot(2,2,1);
imshow(Ia); title('ԭʼAͼ�񣨻Ҷ�ͼ��')
subplot(2,2,2);
imshow(Ib); title('ԭʼBͼ�񣨻Ҷ�ͼ��')
subplot(2,2,3);
imshow(match_a); title('ֱ��ͼ�涨����Aͼ�񣨻Ҷ�ͼ��')
subplot(2,2,4);
imshow(match_b); title('ֱ��ͼ�涨����Bͼ�񣨻Ҷ�ͼ��')

figure;
subplot(2,2,1);
imhist(Ia,64); title('ԭʼAͼ��Ҷ�ֱ��ͼ')
subplot(2,2,2);
imhist(Ib,64); title('ԭʼBͼ��Ҷ�ֱ��ͼ')
subplot(2,2,3);
imhist(match_a,64); title('�涨����Aͼ��Ҷ�ֱ��ͼ')
subplot(2,2,4);
imhist(match_b,64); title('�涨����Bͼ��Ҷ�ֱ��ͼ')

