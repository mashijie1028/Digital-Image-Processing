imga = imread('作业5_A.jpg');
imgb = imread('作业5_B.jpg');

hsia = user_defined_rgb2hsi(imga);
Ha = hsia(:,:,1);
Sa = hsia(:,:,2);
Ia = hsia(:,:,3);
hsib = user_defined_rgb2hsi(imgb);
Hb = hsib(:,:,1);
Sb = hsib(:,:,2);
Ib = hsib(:,:,3);

hista = imhist(Ia,64);
histb = imhist(Ib,64);
match_a = histeq(Ia,0.5*hista+0.5*histb);
match_b = histeq(Ib,0.5*histb+0.5*hista);

hsi_a_spec = cat(3,Ha,Sa,match_a);
hsi_b_spec = cat(3,Hb,Sb,match_b);

figure;
subplot(2,2,1);
imshow(hsia); title('原始A图像（HSI）')
subplot(2,2,2);
imshow(hsib); title('原始B图像（HSI）')
subplot(2,2,3);
imshow(hsi_a_spec); title('直方图规定化后A图像（HSI）')
subplot(2,2,4);
imshow(hsi_b_spec); title('直方图规定化后B图像（HSI）')

rgb_a = user_defined_hsi2rgb(hsi_a_spec);
rgb_b = user_defined_hsi2rgb(hsi_b_spec);

figure;
subplot(2,2,1);
imshow(imga); title('原始A图像（RGB）')
subplot(2,2,2);
imshow(imgb); title('原始B图像（RGB）')
subplot(2,2,3);
imshow(rgb_a); title('直方图规定化后A图像（RGB）,p=0.5')
subplot(2,2,4);
imshow(rgb_b); title('直方图规定化后B图像（RGB）,p=0.5')

figure;
subplot(2,2,1);
imhist(Ia,64); title('原始A图像灰度直方图')
subplot(2,2,2);
imhist(Ib,64); title('原始B图像灰度直方图')
subplot(2,2,3);
imhist(match_a,64); title('规定化后A图像灰度直方图,p=0.5')
subplot(2,2,4);
imhist(match_b,64); title('规定化后B图像灰度直方图,p=0.5')

