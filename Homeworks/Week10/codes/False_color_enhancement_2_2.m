I=imread('焊接X光图像.jpg');
I=imread('美国NOAA可见光云图.jpg');
I=rgb2gray(I);
I=double(I);
[M,N]=size(I);
J1=double(zeros(M,N,3));
J2=J1;
J3=J1;

T1=255;
T2=255/2;
T3=255/4;
delta1=T1/3;
delta2=T2/3;
delta3=T3/3;

J1(:,:,1)=255*(1+sin(2*pi/T1*I))/2;
J1(:,:,2)=255*(1+sin(2*pi/T1*(I-delta1)))/2;
J1(:,:,3)=255*(1+sin(2*pi/T1*(I-2*delta1)))/2;

J2(:,:,1)=255*(1+sin(2*pi/T2*I))/2;
J2(:,:,2)=255*(1+sin(2*pi/T2*(I-delta2)))/2;
J2(:,:,3)=255*(1+sin(2*pi/T2*(I-2*delta2)))/2;

J3(:,:,1)=255*(1+sin(2*pi/T3*I))/2;
J3(:,:,2)=255*(1+sin(2*pi/T3*(I-delta3)))/2;
J3(:,:,3)=255*(1+sin(2*pi/T3*(I-2*delta3)))/2;

figure;
subplot(2,2,1);imshow(uint8(I));title('原始图像');
subplot(2,2,2);imshow(uint8(J1));title('伪彩色处理后图像: T = 255');
subplot(2,2,3);imshow(uint8(J2));title('伪彩色处理后图像: T = 255/2');
subplot(2,2,4);imshow(uint8(J3));title('伪彩色处理后图像: T = 255/4');