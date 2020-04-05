A1 = fspecial('gaussian',2);
A2 = fspecial('gaussian',3);
A3 = fspecial('gaussian',5);
A4 = fspecial('gaussian',7);
J21 = filter2(A1,J2)/255;
J22 = filter2(A2,J2)/255;
J23 = filter2(A3,J2)/255;
J24 = filter2(A4,J2)/255;

%filter gaussian noise
figure;
subplot(2,3,1)
imshow(I)
title('original image')

subplot(2,3,2)
imshow(J2)
title('gaussian noise : variance = 0.01')

subplot(2,3,3)
imshow(J21)
title('gaussian average filter 2*2')

subplot(2,3,4)
imshow(J22)
title('gaussian average filter 3*3')

subplot(2,3,5)
imshow(J23)
title('gaussian average filter 5*5')

subplot(2,3,6)
imshow(J24)
title('gaussian average filter 7*7')


%filter several gaussian noises
J12 = filter2(A2,J1)/255;
J32 = filter2(A2,J3)/255;
J42 = filter2(A2,J4)/255;
J52 = filter2(A2,J5)/255;
figure;
subplot(2,3,1)
imshow(I)
title('original image')

subplot(2,3,2)
imshow(J12)
title('filter gaussian noise : variance = 0.005')

subplot(2,3,3)
imshow(J22)
title('filter gaussian noise : variance = 0.01')

subplot(2,3,4)
imshow(J32)
title('filter gaussian noise : variance = 0.02')

subplot(2,3,5)
imshow(J42)
title('filter gaussian noise : variance = 0.05')

subplot(2,3,6)
imshow(J52)
title('filter gaussian noise : variance = 0.1')

% filter other noises
K22 = filter2(A2,K2)/255;
L22 = filter2(A2,L2)/255;
P2 = filter2(A2,P)/255;
figure;
subplot(2,2,1)
imshow(J22)
title('filter gaussian noise')

subplot(2,2,2)
imshow(K22)
title('filter salt & pepper noise')

subplot(2,2,3)
imshow(L22)
title('filter speckle noise')

subplot(2,2,4)
imshow(P2)
title('filter poisson noise')