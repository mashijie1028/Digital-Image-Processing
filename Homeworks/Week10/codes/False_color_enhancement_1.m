I=imread('焊接X光图像.jpg');
I=imread('美国NOAA可见光云图.jpg');
I=rgb2gray(I);
I=double(I);
[M,N]=size(I);
J=double(zeros(M,N,3));

for i=1:M
    for j=1:N
        if I(i,j)<=64
            J(i,j,1)=0;
            J(i,j,2)=255;
            J(i,j,3)=255/64*I(i,j);
        elseif I(i,j)<=128
            J(i,j,1)=255/64*(I(i,j)-64);
            J(i,j,2)=255-255/64*(I(i,j)-64);
            J(i,j,3)=255;
        elseif I(i,j)<=192
            J(i,j,1)=255;
            J(i,j,2)=0;
            J(i,j,3)=255;
        else
            J(i,j,1)=255;
            J(i,j,2)=0;
            J(i,j,3)=255-255/63*(I(i,j)-192);
        end
    end
end

figure;
subplot(1,2,1);imshow(uint8(I));title('原始图像');
subplot(1,2,2);imshow(uint8(J));title('伪彩色处理后图像');