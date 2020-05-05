I0 = imread('lena.bmp');
I0 = im2double(I0);
[m,n] = size(I0);
m_h = 5;
n_h = 5;

I = zeros(260,260);
I(1:256,1:256)=I0;
h0 = zeros(5,5);
for i=1:5
    for j=1:5
        h0(i,j) = exp(sqrt((i-3)^2+(j-3)^2)/240);
    end
end
h0 = h0/sum(sum(h0));
h = zeros(260,260);
h(1:5,1:5)=h0;

g = imfilter(I0,h0,'conv','full');
% g = imfilter(I,h,'conv','same');
G = fft2(g);
G = fftshift(G);

H = fft2(h);
H = fftshift(H);
F1 = G./H;
F1 = ifftshift(F1);
f1 = ifft2(F1);

figure;
subplot(131);imshow(I0);title('原始图像');
subplot(132);imshow(g);title('模糊化后图像');
subplot(133);imshow(f1);title('直接逆滤波后图像');
