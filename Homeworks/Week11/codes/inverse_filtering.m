I0 = imread('lena.bmp');
I0 = im2double(I0);
[m,n] = size(I0);
m_h = 5;
n_h = 5;
h0 = zeros(5,5);

for i=1:5
    for j=1:5
        h0(i,j) = exp(sqrt((i-3)^2+(j-3)^2)/240);
    end
end
h0 = h0/sum(sum(h0));

I = zeros(260,260);
% I(3:258,3:258) = I0;
I(1:256,1:256)=I0;
h = zeros(260,260);
%h(129:133,129:133) = h0;
h(1:5,1:5)=h0;
% figure;
% imshow(I);
% figure;
% imshow(h)

F = fft2(I);
F = fftshift(F);
H = fft2(h);
H = fftshift(H);

G = F.*H;
F1 = G./H; % ע�⽫��һ������G��ifftshift֮ǰ
G = ifftshift(G);
g = ifft2(G);
F1 = ifftshift(F1);
f1 = ifft2(F1);
figure;
subplot(131);imshow(I);title('ԭʼͼ����չ��');
subplot(132);imshow(g);title('5\times5ģ����');
subplot(133);imshow(f1);title('���˲���');
