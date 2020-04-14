set(0,'defaultfigurecolor',[1,1,1]) 
I  = imread('board-orig.bmp');
BW = edge(I,'canny');
 
figure(1)
imshow(BW)
title('原图像');
figure(2)
subplot 211;
%%进行霍夫变换
[H, theta , rho] = hough (BW);
%%绘制霍夫空间
imshow(imadjust(mat2gray(H)),[],'XData',theta,'YData',rho,...
        'InitialMagnification','fit');
xlabel('\theta (degrees)'), ylabel('\rho');
axis on, axis normal, hold on;
colormap(hot);  
title('霍夫空间')
%%峰值
P = houghpeaks(H,5,'threshold',0.5*max(H(:)));
x = theta(P(:,2));
y = rho(P(:,1));
plot(x,y,'s','color','black');
%lines = houghlines(BW,theta,rho,P,'FillGap',10,'MinLength',10);
lines = houghlines(BW,theta,rho,P,'FillGap',10,'MinLength',10);
subplot 212
imshow(BW) ,hold on
max_len  = 0;
count = 1;
points = zeros(2,2);
for k = 1:length(lines)
   points(count,1) = lines(k).point1(1);
   points(count,2) = lines(k).point1(2);
   count =count +1;
   points(count,1) = lines(k).point2(1);
   points(count,2) = lines(k).point2(2);
   count =count +1;
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
end
title('直线检测');