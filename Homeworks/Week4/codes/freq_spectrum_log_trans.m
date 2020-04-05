load('work2.mat');
img = mat2gray(abs(image));
img_1 = mat2gray(log(1+abs(image)));

figure;
subplot(1,2,1);  

imshow(img,[]);
title('ԭƵ��ͼ-��ֵ')
subplot(1,2,2);  
imshow(img_1,[]);
title('�����任��Ƶ��ͼ-��ֵ')

pha = log(abs(angle((image))*180/pi));
pha_1 = log(abs(1+pha));

figure;
subplot(1,2,1);  
imshow(pha,[]);
title('ԭƵ��ͼ-��λ')
subplot(1,2,2);  
imshow(pha_1,[]);
title('�����任��Ƶ��ͼ-��λ')
