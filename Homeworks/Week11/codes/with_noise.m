I0 = imread('lena.bmp');
I0 = im2double(I0);
[m,n] = size(I0);
h0 = zeros(5,5);

for i=1:5
    for j=1:5
        h0(i,j) = exp(sqrt((i-3)^2+(j-3)^2)/240);
    end
end
h0 = h0/sum(sum(h0));

I = zeros(260,260);
I(1:256,1:256)=I0;
h = zeros(260,260);
h(1:5,1:5)=h0;

F = fft2(I);
F = fftshift(F);
H = fft2(h);
H = fftshift(H);

G = F.*H;
G = ifftshift(G);
g = ifft2(G);
variance = 1e-12;
% g = im2uint8(g);
g_noise = imnoise(g,'gaussian',0,variance);
% g_noise = g; % 无噪声的情况
% g_noise = im2double(g_noise);

% A = fspecial('gaussian',3);
% g_noise = filter2(A,g_noise);

G_N = fft2(g_noise);
G_N = fftshift(G_N);
F1 = G_N./H;
F1 = ifftshift(F1);
f1 = ifft2(F1);

% wnr=deconvwnr(g_noise,h);
wnr=deconvwnr(g_noise,h0);

figure;
subplot(231);imshow(I0);title('原始图像');
subplot(232);imshow(I);title('原始图像（扩展后）');
subplot(233);imshow(g);title('5\times5模糊后');
subplot(234);imshow(g_noise);title(['模糊后加高斯噪声，方差：',num2str(variance)]);
subplot(235);imshow(f1);title('逆滤波后');
subplot(236);imshow(wnr);title('维纳滤波后');

