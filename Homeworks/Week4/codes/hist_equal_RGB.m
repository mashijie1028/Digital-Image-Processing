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
title('原图-R分量');
subplot(1,3,2);
imshow(G);
title('原图-G分量');
subplot(1,3,3);
imshow(B);
title('原图-B分量');

figure;
subplot(121)
imshow(img);
title('原图')
subplot(122)
imshow(img_1);
title('均衡化后')

figure;
subplot(321)
imhist(R,64);
title('原图像直方图-R通道');
subplot(322)
imhist(R_1,64);
title('均衡化后的直方图-R通道');

subplot(323)
imhist(G,64);
title('原图像直方图-G通道');
subplot(324)
imhist(G_1,64);
title('均衡化后的直方图-G通道');

subplot(325)
imhist(B,64);
title('原图像直方图-B通道');
subplot(326)
imhist(B_1,64);
title('均衡化后的直方图-B通道');