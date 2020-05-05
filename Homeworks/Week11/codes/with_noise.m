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
% g_noise = g; % �����������
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
subplot(231);imshow(I0);title('ԭʼͼ��');
subplot(232);imshow(I);title('ԭʼͼ����չ��');
subplot(233);imshow(g);title('5\times5ģ����');
subplot(234);imshow(g_noise);title(['ģ����Ӹ�˹���������',num2str(variance)]);
subplot(235);imshow(f1);title('���˲���');
subplot(236);imshow(wnr);title('ά���˲���');

