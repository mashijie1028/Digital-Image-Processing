I=imread('焊接X光图像.jpg');
I=imread('美国NOAA可见光云图.jpg');
I=rgb2gray(I);
I=double(I);
[M,N]=size(I);
J1=double(zeros(M,N,3));
J2=J1;

T=255;
delta1=255/3;
delta2=255/6;

J1(:,:,1)=255*(1+sin(2*pi/T*I))/2;
J1(:,:,2)=255*(1+sin(2*pi/T*(I-delta1)))/2;
J1(:,:,3)=255*(1+sin(2*pi/T*(I-2*delta1)))/2;

J2(:,:,1)=255*(1+sin(2*pi/T*I))/2;
J2(:,:,2)=255*(1+sin(2*pi/T*(I-delta2)))/2;
J2(:,:,3)=255*(1+sin(2*pi/T*(I-2*delta2)))/2;

figure;
subplot(1,3,1);imshow(uint8(I));title('原始图像');
subplot(1,3,2);imshow(uint8(J1));title('伪彩色处理后图像: δ = 255/3');
subplot(1,3,3);imshow(uint8(J2));title('伪彩色处理后图像: δ = 255/6');