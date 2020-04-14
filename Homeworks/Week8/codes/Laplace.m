I  = imread('board-Gauss-0.01.bmp');
I = mat2gray(I);   %ͼ�����Ĺ�һ��
[m,n]=size(I);
% A = fspecial('gaussian',3);
% I= filter2(A,I); %% ע��ղ�����mat2gray�����A�����ٳ���255��
K = medfilt2(I,[3,3]);


J = logical(I);       %����ͼ��ı�Եһ������
L=0;
%�趨��ֵ
t1=0.05;
t2=0.1;
t3=0.2;
t4=0.3;
t5=0.5;
t6=0.8;
t = [t1,t2,t3,t4,t5,t6]; 
figure;
%Laplace����
for i=1:6
 for j=2:m-1 
    for k=2:n-1
        L=abs(4*I(j,k)-I(j-1,k)-I(j+1,k)-I(j,k+1)-I(j,k-1));
        if(L > t(i))
            J(j,k)=1;  %��
        else
            J(j,k)=0;    %��
        end
    end
 end
 subplot(2,3,i);imshow(J,[]);title(['Laplacian threshold: ',num2str(t(i))])
end
