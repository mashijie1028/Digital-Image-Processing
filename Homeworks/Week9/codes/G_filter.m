f = imread('trove.png');
f = rgb2gray(f);
f = im2double(f);
[M,N] = size(f);
P = 2*M;
Q = 2*N;
fc = zeros(M,N);

for x = 1:1:M
    for y = 1:1:N
        fc(x,y) = f(x,y) * (-1)^(x+y);
    end
end

F = fft2(fc,P,Q);

H_1 = zeros(P,Q);
H_2 = zeros(P,Q);
H_3 = zeros(P,Q);

for x = (-P/2):1:(P/2)-1
     for y = (-Q/2):1:(Q/2)-1
        D = (x^2 + y^2)^(0.5);
        D_0 = 5;
        H_1(x+(P/2)+1,y+(Q/2)+1) = 1-exp(-(D*D)/(2*D_0*D_0));   
        D_0 = 60;
        H_2(x+(P/2)+1,y+(Q/2)+1) = 1-exp(-(D*D)/(2*D_0*D_0));
        D_0 = 160;
        H_3(x+(P/2)+1,y+(Q/2)+1) = 1-exp(-(D*D)/(2*D_0*D_0));
     end
end

G_1 = H_1 .* F;
G_2 = H_2 .* F;
G_3 = H_3 .* F;

g_1 = real(ifft2(G_1));
g_1 = g_1(1:1:M,1:1:N);

g_2 = real(ifft2(G_2));
g_2 = g_2(1:1:M,1:1:N);   

g_3 = real(ifft2(G_3));
g_3 = g_3(1:1:M,1:1:N); 

for x = 1:1:M
    for y = 1:1:N
        g_1(x,y) = g_1(x,y) * (-1)^(x+y);
        g_2(x,y) = g_2(x,y) * (-1)^(x+y);
        g_3(x,y) = g_3(x,y) * (-1)^(x+y);
    end
end

g_1 = mat2gray(g_1,[0 1]);

k=graythresh(g_1);              %�õ�������ֵ

A1=imbinarize(g_1,k);                  %ת���ɶ�ֵͼ��kΪ�ָ���ֵ

A1 = g_1; %��ע�ͣ�������������ǰ�Ƿ����Otsu
f=A1;
%se=strel('square',3');%���ͽṹԪ��
se=strel('disk',3');%Բ���ͽṹԪ��
imshow(f);title('��ͨ�˲���ͼ��')

%�������ٸ�ʴ
fse=imdilate(f,se);%����
%fse=imdilate(f,B);
figure,set(gcf,'outerposition',get(0,'screensize'));%����Ŀ�������õ�ǰ���ڵĴ�С
subplot(221),imshow(fse);
title('ʹ��disk(3)�����ͺ��ͼ��');

fes=imerode(fse,se);
%des=imerode(fse,B);
subplot(222),imshow(fes);
title('ʹ��disk(3)�������ٸ�ʴ���ͼ��');

%�ȸ�ʴ������
fse=imerode(f,se);
%fse=imerode(f,B);
%figure,set(gcf,'outerposition',get(0,'screensize'))
subplot(223),imshow(fse);
title('ʹ��disk(3)�ȸ�ʴ���ͼ��');

fes=imdilate(fse,se);
%fes=imdilate(fse,B);
subplot(224),imshow(fes);
title('ʹ��disk(3)�ȸ�ʴ�����ͺ��ͼ��');