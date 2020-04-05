subplot(1,3,1);imshow(I);title('original image')
subplot(1,3,2);imshow(C);title('edge')
subplot(1,3,3);imshow(I+C);title('sharpened image')