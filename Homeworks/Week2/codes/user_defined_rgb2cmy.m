function cmy = user_defined_rgb2cmy(rgb)
% RGB to CMY
rgb = im2double(rgb);
r = rgb(:,:,1);
g = rgb(:,:,2);
b = rgb(:,:,3);
c = 1-r;
m = 1-g;
y = 1-b;
cmy = cat(3,c,m,y);

end
