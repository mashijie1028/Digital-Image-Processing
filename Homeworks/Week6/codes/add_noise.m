I = imread('board-orig.bmp');
% add Gaussion noise
figure;
subplot(2,3,1)
imshow(I)
title('original image')

subplot(2,3,2)
J1 = imnoise(I,'gaussian',0,0.005);
imshow(J1)
title('gaussian noise : variance = 0.005')

subplot(2,3,3)
J2 = imnoise(I,'gaussian',0,0.01);
imshow(J2)
title('gaussian noise : variance = 0.01')

subplot(2,3,4)
J3 = imnoise(I,'gaussian',0,0.02);
imshow(J3)
title('gaussian noise : variance = 0.02')

subplot(2,3,5)
J4 = imnoise(I,'gaussian',0,0.05);
imshow(J4)
title('gaussian noise : variance = 0.05')

subplot(2,3,6)
J5 = imnoise(I,'gaussian',0,0.1);
imshow(J5)
title('gaussian noise : variance = 0.1')

% add salt & pepper noise
figure;
subplot(2,3,1)
imshow(I)
title('original image')

subplot(2,3,2)
K1 = imnoise(I,'salt & pepper',0.01);
imshow(K1)
title('salt & pepper noise : d = 0.01')

subplot(2,3,3)
K2 = imnoise(I,'salt & pepper',0.05);
imshow(K2)
title('salt & pepper noise : d = 0.05')

subplot(2,3,4)
K3 = imnoise(I,'gaussian',0.1);
imshow(K3)
title('salt & pepper noise : d = 0.1')

subplot(2,3,5)
K4 = imnoise(I,'salt & pepper',0.2);
imshow(K4)
title('salt & pepper noise : d = 0.2')

subplot(2,3,6)
K5 = imnoise(I,'salt & pepper',0.5);
imshow(K5)
title('salt & pepper noise : d = 0.5')

% add Poisson noise
figure;
subplot(1,2,1)
imshow(I)
title('original image')
subplot(1,2,2)
P = imnoise(I,'poisson');
imshow(P)
title('Poisson noise')

% add speckle noise
figure;
subplot(2,3,1)
imshow(I)
title('original image')

subplot(2,3,2)
L1 = imnoise(I,'speckle',0.01);
imshow(L1)
title('speckle noise : variance = 0.01')

subplot(2,3,3)
L2 = imnoise(I,'speckle',0.05);
imshow(L2)
title('speckle noise : variance = 0.05')

subplot(2,3,4)
L3 = imnoise(I,'speckle',0.1);
imshow(L3)
title('speckle noise : variance = 0.1')

subplot(2,3,5)
L4 = imnoise(I,'speckle',0.2);
imshow(L4)
title('speckle noise : variance = 0.2')

subplot(2,3,6)
L5 = imnoise(I,'speckle',0.5);
imshow(L5)
title('speckle noise : variance = 0.5')
