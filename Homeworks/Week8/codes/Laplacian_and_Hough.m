I  = imread('board-Gauss-0.01.bmp');
I = mat2gray(I);   %图像矩阵的归一化
[m,n]=size(I);
J = logical(I);       %保留图像的边缘一个像素
L=0;
%设定阈值
t=0.5;
%Laplace算子
for j=2:m-1 
    for k=2:n-1
        L=abs(4*I(j,k)-I(j-1,k)-I(j+1,k)-I(j,k+1)-I(j,k-1));
        if(L > t)
            J(j,k)=1;  %白
        else
            J(j,k)=0;    %黑
        end
    end
end
figure;
subplot(2,2,1);imshow(I);title('Original Image');

BW = J;
subplot(2,2,2); imshow(BW);title('The edge')

[H,T,R] = hough(BW);
subplot(2,2,3);
imshow(H,[],'XData',T,'YData',R,'InitialMagnification','fit');
xlabel('\theta/°'), ylabel('\rho');
axis on
axis normal
hold on

P  = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
x = T(P(:,2)); y = R(P(:,1));
plot(x,y,'s','color','white');
title('Hough space');

% Find lines and plot them
lines = houghlines(BW,T,R,P,'FillGap',5,'MinLength',7);
subplot(2,2,4);imshow(I);hold on;title('Mark the straight line')

max_len = 0;
for k = 1:length(lines)
    xy = [lines(k).point1; lines(k).point2];
    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
    
    % Plot beginnings and ends of lines
    plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
    plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
    
    % Determine the endpoints of the longest line segment
    len = norm(lines(k).point1 - lines(k).point2);
    if ( len > max_len)
        max_len = len;
        xy_long = xy;
    end
end
% highlight the longest line segment
plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','blue');