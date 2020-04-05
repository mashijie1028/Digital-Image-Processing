img = imread('image1.jpg');
mask = imread('image1_mask.jpg');
surr0 = imread('surrounding1.jpg');
surr = surr0(1:800,301:900,:);
sz = size(img);
extra = img;
for k = 1:3
    for i = 1:800
        for j = 1:600
            if mask(i,j,k) == 0
                extra(i,j,k) = 0;
            else
                surr(i,j,k) = 0;
            end
        end
    end
end
extra_r = medfilt2(extra(:,:,1));
extra_g = medfilt2(extra(:,:,2));
extra_b = medfilt2(extra(:,:,3));
extra_final = cat(3,extra_r,extra_g,extra_b);
syth = extra+surr;
syth_final = extra_final+surr;

figure;
subplot(1,2,1);
imshow(extra);
title('原提取图像')

subplot(1,2,2);
imshow(extra_final);
title('平滑后提取图像')

figure;
subplot(1,2,1);
imshow(syth);
title('原合成图像')

subplot(1,2,2);
imshow(syth_final);
title('平滑后合成图像')
%{
prewittSample = uint8(filter2(fspecial('prewitt'),extra));
extra1 = (mean3_extra(:,1:600,:)+mean3_extra(:,601:1200,:)+mean3_extra(:,1201:1800,:));
syth1 = uint8(extra1)+surr;
imshow(syth1);
%}