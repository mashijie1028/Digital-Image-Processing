img = imread('work1.png');
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);
R_1 = histeq(R);
G_1 = histeq(G);
B_1 = histeq(B);
img_1 = cat(3,R_1,G_1,B_1);

figure;
subplot(1,3,1);
imshow(R);
title('ԭͼ-R����');
subplot(1,3,2);
imshow(G);
title('ԭͼ-G����');
subplot(1,3,3);
imshow(B);
title('ԭͼ-B����');

figure;
subplot(121)
imshow(img);
title('ԭͼ')
subplot(122)
imshow(img_1);
title('���⻯��')

figure;
subplot(321)
imhist(R,64);
title('ԭͼ��ֱ��ͼ-Rͨ��');
subplot(322)
imhist(R_1,64);
title('���⻯���ֱ��ͼ-Rͨ��');

subplot(323)
imhist(G,64);
title('ԭͼ��ֱ��ͼ-Gͨ��');
subplot(324)
imhist(G_1,64);
title('���⻯���ֱ��ͼ-Gͨ��');

subplot(325)
imhist(B,64);
title('ԭͼ��ֱ��ͼ-Bͨ��');
subplot(326)
imhist(B_1,64);
title('���⻯���ֱ��ͼ-Bͨ��');