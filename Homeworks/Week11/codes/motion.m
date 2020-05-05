I = im2double(imread('Lena.bmp'));
[M,N] = size(I);% square

% Display the original image.
figure;
subplot(1,3,1), imshow(I);
title('原始图像');

%% Simulate a Motion Blur：H(u,v)
T=1;a=0.02;b=0.02;
v=[-M/2:M/2-1];u=v';
A=repmat(a.*u,1,M)+repmat(b.*v,M,1);
H=T/pi./A.*sin(pi.*A).*exp(-1i*pi.*A);
H(A==0)=T;% replace NAN

%% Get the blurred Image
% Warning: fftshift should be written
F=fftshift(fft2(I));
FBlurred=F.*H;

% Display the blurred image
IBlurred =real(ifft2(ifftshift(FBlurred)));
subplot(1,3,2), imshow(uint8(255.*mat2gray(IBlurred)));
title('运动模糊图像');

%% Deblur perfectly without Noise
FDeblurred=FBlurred./H;
IDeblurred=real(ifft2(ifftshift(FDeblurred)));
subplot(1,3,3), imshow(uint8(255.*mat2gray(IDeblurred)));
title('无噪声时直接逆滤波');

%% Simulate Noise Model
noise_mean = 0;
noise_var = 1e-3;
noise=imnoise(zeros(M),'gaussian', noise_mean,noise_var);
FNoise=fftshift(fft2(noise));

%% Get the Blurred_Noised Image
FBlurred_Noised=FNoise+FBlurred;

% Display the blurred_noised image
IBlurred_Noised=real(ifft2(ifftshift(FBlurred_Noised)));
figure;
subplot(1,2,1), imshow(uint8(255.*mat2gray(IBlurred_Noised)));
title('加噪运动模糊图像');

%% Deblur when Ignoring Noise
FDeblurred2=FBlurred_Noised./H;
FH1=abs(FDeblurred2);
IDeblurred2=real(ifft2(ifftshift(FDeblurred2)));
subplot(1,2,2), imshow(uint8(255.*mat2gray(IDeblurred2)));
title ('加噪声后直接逆滤波');


%% Wiener filter
figure;
subplot(1,3,1);
imshow(uint8(255.*mat2gray(IBlurred_Noised)));
title('加噪运动模糊图像');

% Deblur with theoretic NSR
buf=(abs(H)).^2; 
NSR=FNoise./F;
FDeblurred3=FBlurred_Noised./H.*buf./(buf+NSR);
IDeblurred3=real(ifft2(ifftshift(FDeblurred3)));
subplot(1,3,2), imshow(uint8(255.*mat2gray(IDeblurred3)));
title('K=NSR的理论维纳滤波');

bestK=0.05;
FDeblurred3=FBlurred_Noised./H.*buf./(buf+bestK);
IDeblurred3=real(ifft2(ifftshift(FDeblurred3)));

% Display the best restored Image
subplot(1,3,3), imshow(uint8(255.*mat2gray(IDeblurred3)));
title(['K= ', num2str(bestK),'时维纳滤波']);
