K21 = medfilt2(K2,[3,3]);
K22 = medfilt2(K2,[5,5]);
K23 = medfilt2(K2,[7,7]);
K24 = medfilt2(K2,[9,9]);

%filter several salt & pepper noise
figure;
subplot(2,3,1)
imshow(I)
title('original image')

subplot(2,3,2)
imshow(K2)
title('salt & pepper noise : d = 0.05')

subplot(2,3,3)
imshow(K21)
title('median filter 3*3')

subplot(2,3,4)
imshow(K22)
title('median filter 5*5')

subplot(2,3,5)
imshow(K23)
title('median filter 7*7')

subplot(2,3,6)
imshow(K24)
title('median filter 9*9')


%filter several salt & pepper noises
K11 = medfilt2(K1,[3,3]);
K31 = medfilt2(K3,[3,3]);
K41 = medfilt2(K4,[3,3]);
K51 = medfilt2(K5,[3,3]);
figure;
subplot(2,3,1)
imshow(I)
title('original image')

subplot(2,3,2)
imshow(K11)
title('salt & pepper noise : d = 0.005')

subplot(2,3,3)
imshow(K21)
title('filter gaussian noise : d = 0.05')

subplot(2,3,4)
imshow(K31)
title('filter gaussian noise : d = 0.1')

subplot(2,3,5)
imshow(K41)
title('filter gaussian noise : d = 0.2')

subplot(2,3,6)
imshow(K51)
title('filter gaussian noise : d = 0.5')

% filter other noises
J22 = medfilt2(J2,[3,3]);
L22 = medfilt2(L2,[3,3]);
P2 = medfilt2(P,[3,3]);
figure;
subplot(2,2,1)
imshow(J22)
title('filter gaussian noise')

subplot(2,2,2)
imshow(K21)
title('filter salt & pepper noise')

subplot(2,2,3)
imshow(L22)
title('filter speckle noise')

subplot(2,2,4)
imshow(P2)
title('filter poisson noise')