img = imread('work1.png');
I = rgb2gray(img);
J = histeq(I);  

figure;
subplot(121)
imshow(uint8(I));
title('ԭͼ�Ҷ�ͼ')
subplot(122)
imshow(uint8(J));
title('���⻯��Ҷ�ͼ')

figure;
subplot(121)
imhist(I,64);
title('ԭͼ��ֱ��ͼ��תΪ�ҶȺ�');
subplot(122)
imhist(J,64);
title('���⻯���ֱ��ͼ��תΪ�ҶȺ�');