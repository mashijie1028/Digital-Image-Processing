img = imread('image2.jpg');
load('image2_mask.mat');
surr0 = imread('surrounding1.jpg');
surr = surr0(1:800,301:900,:);
sz = size(img);
extra = img;
for i = 1:800
    for j = 1:600
        if mask(i,j,:) == 0
            extra(i,j,:) = 0;
        else
            surr(i,j,:) = 0;
        end
    end
end

syth = extra+surr;
imshow(syth);