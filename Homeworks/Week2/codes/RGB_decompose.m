img = imread('2.jpg');
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

figure;
subplot(2,2,1);
imshow(img);
title('ԭͼ��'); 

subplot(2,2,2);
imshow(R);
title('R�������죩'); 

subplot(2,2,3);
imshow(G);
title('G�������̣�'); 

subplot(2,2,4);
imshow(B);
title('B����������');
