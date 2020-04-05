load('work2.mat');
img = mat2gray(abs(image));
img_1 = mat2gray(log(1+abs(image)));

figure;
subplot(1,2,1);  

imshow(img,[]);
title('原频谱图-幅值')
subplot(1,2,2);  
imshow(img_1,[]);
title('对数变换后频谱图-幅值')

pha = log(abs(angle((image))*180/pi));
pha_1 = log(abs(1+pha));

figure;
subplot(1,2,1);  
imshow(pha,[]);
title('原频谱图-相位')
subplot(1,2,2);  
imshow(pha_1,[]);
title('对数变换后频谱图-相位')
