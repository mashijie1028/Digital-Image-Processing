I  = imread('board-Gauss-0.01.bmp');
I = mat2gray(I);   %图像矩阵的归一化
[m,n]=size(I);
% A = fspecial('gaussian',3);
% I= filter2(A,I); %% 注意刚才用了mat2gray，因此A不用再除以255了
K = medfilt2(I,[3,3]);


J = logical(I);       %保留图像的边缘一个像素
L=0;
%设定阈值
t1=0.05;
t2=0.1;
t3=0.2;
t4=0.3;
t5=0.5;
t6=0.8;
t = [t1,t2,t3,t4,t5,t6]; 
figure;
%Laplace算子
for i=1:6
 for j=2:m-1 
    for k=2:n-1
        L=abs(4*I(j,k)-I(j-1,k)-I(j+1,k)-I(j,k+1)-I(j,k-1));
        if(L > t(i))
            J(j,k)=1;  %白
        else
            J(j,k)=0;    %黑
        end
    end
 end
 subplot(2,3,i);imshow(J,[]);title(['Laplacian threshold: ',num2str(t(i))])
end
