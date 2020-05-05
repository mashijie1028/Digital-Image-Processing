I=imread('焊接X光图像.jpg');
I=imread('美国NOAA可见光云图.jpg');
I=rgb2gray(I);
F=fft2(double(I));
F=fftshift(F);             %中心化
sz=size(I);
fm=abs(F);       %取模，傅里叶变换图像上的点的值成为了复数，取模后才能显示为图像
subplot(131),imshow(log(1+fm),[]); title('原灰度图像频域图像') %对数变换 拉伸 增强显示视觉效果
threshold=60; % boundary between lower frequency and higher frequency
highF(sz(1),sz(2))=zeros;
lowF(sz(1),sz(2))=zeros;

for i=1:sz(1)
    for j=1:sz(2)
        d=sqrt((i-sz(1)/2)*(i-sz(1)/2)+(j-sz(2)/2)*(j-sz(2)/2));
        if d<threshold
            lowF(i,j)=F(i,j);
            highF(i,j)=0;
        else
            highF(i,j)=F(i,j);
            lowF(i,j)=0;
        end
    end
end

highF=ifftshift(highF);
highI=ifft2(highF);
lowF=ifftshift(lowF);
lowI=ifft2(lowF);
lowI=real(lowI); %reserve the real part
highI=real(highI); %reserve the real part
 
lowIII(sz(1),sz(2),3)=zeros;
highIII(sz(1),sz(2),3)=zeros;
for i=1:sz(1)
    for j=1:sz(2)
        lowIII(i,j,1)=lowI(i,j);
        lowIII(i,j,2)=lowI(i,j);
        lowIII(i,j,3)=lowI(i,j);
        if highI(i,j)<10
            % #4B0082
            highIII(i,j,1)=hex2dec('4B');
            highIII(i,j,2)=hex2dec('00');
            highIII(i,j,3)=hex2dec('82');
        elseif highI(i,j)<50
            % #8B0000
            highIII(i,j,1)=hex2dec('8B');
            highIII(i,j,2)=hex2dec('00');
            highIII(i,j,3)=hex2dec('00');
        elseif highI(i,j)<100
            % #FF4500
            highIII(i,j,1)=hex2dec('FF');
            highIII(i,j,2)=hex2dec('45');
            highIII(i,j,3)=hex2dec('00');
        elseif highI(i,j)<150
            % #FFD700
            highIII(i,j,1)=hex2dec('FF');
            highIII(i,j,2)=hex2dec('D7');
            highIII(i,j,3)=hex2dec('00');
        elseif highI(i,j)<200
            % #7A67EE
            highIII(i,j,1)=hex2dec('7A');
            highIII(i,j,2)=hex2dec('67');
            highIII(i,j,3)=hex2dec('EE');
        else
            % #008B00
            highIII(i,j,1)=hex2dec('00');
            highIII(i,j,2)=hex2dec('8B');
            highIII(i,j,3)=hex2dec('00');
        end
    end
end

lowIII=uint8(lowIII);
highIII=uint8(highIII);
subplot(132); imshow(I); title('灰度图像');
subplot(133); imshow(highIII); title('伪彩色图像');
