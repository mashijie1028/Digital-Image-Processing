imga = imread('��ҵ5_A.jpg');
imgb = imread('��ҵ5_B.jpg');

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
imshow(hsia); title('ԭʼAͼ��HSI��')
subplot(2,2,2);
imshow(hsib); title('ԭʼBͼ��HSI��')
subplot(2,2,3);
imshow(hsi_a_spec); title('ֱ��ͼ�涨����Aͼ��HSI��')
subplot(2,2,4);
imshow(hsi_b_spec); title('ֱ��ͼ�涨����Bͼ��HSI��')

rgb_a = user_defined_hsi2rgb(hsi_a_spec);
rgb_b = user_defined_hsi2rgb(hsi_b_spec);

figure;
subplot(2,2,1);
imshow(imga); title('ԭʼAͼ��RGB��')
subplot(2,2,2);
imshow(imgb); title('ԭʼBͼ��RGB��')
subplot(2,2,3);
imshow(rgb_a); title('ֱ��ͼ�涨����Aͼ��RGB��,p=0.5')
subplot(2,2,4);
imshow(rgb_b); title('ֱ��ͼ�涨����Bͼ��RGB��,p=0.5')

figure;
subplot(2,2,1);
imhist(Ia,64); title('ԭʼAͼ��Ҷ�ֱ��ͼ')
subplot(2,2,2);
imhist(Ib,64); title('ԭʼBͼ��Ҷ�ֱ��ͼ')
subplot(2,2,3);
imhist(match_a,64); title('�涨����Aͼ��Ҷ�ֱ��ͼ,p=0.5')
subplot(2,2,4);
imhist(match_b,64); title('�涨����Bͼ��Ҷ�ֱ��ͼ,p=0.5')

