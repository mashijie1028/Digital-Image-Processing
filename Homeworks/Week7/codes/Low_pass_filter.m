lena = imread('Lena.bmp');
image1 = Bfilter(lena, 10, 2);
image2 = Bfilter(lena, 30, 2);
image3 = Bfilter(lena, 60, 2);
image4 = Bfilter(lena, 160, 2);
image5 = Bfilter(lena, 460, 2);

figure;
subplot(2,3,1), imshow(lena), title('Ô­Í¼Ïñ');
subplot(2,3,2), imshow(image1), title('D0 = 10, n = 2');
subplot(2,3,3), imshow(image2), title('D0 = 30, n = 2');
subplot(2,3,4), imshow(image3), title('D0 = 60, n = 2');
subplot(2,3,5), imshow(image4), title('D0 = 100, n = 2');
subplot(2,3,6), imshow(image5), title('D0 = 300, n = 2');

image7 = Bfilter(lena,60,1);
image8 = Bfilter(lena,60,3);
image9 = Bfilter(lena,60,4);
image10 = Bfilter(lena,60,5);

figure;
subplot(2,3,1), imshow(lena), title('Ô­Í¼Ïñ');
subplot(2,3,2), imshow(image7), title('D0 = 60, n = 1');
subplot(2,3,3), imshow(image3), title('D0 = 60, n = 2');
subplot(2,3,4), imshow(image8), title('D0 = 60, n = 3');
subplot(2,3,5), imshow(image9), title('D0 = 60, n = 4');
subplot(2,3,6), imshow(image10), title('D0 = 60, n = 5');

