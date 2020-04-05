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
syth = extra+surr;
imshow(syth);