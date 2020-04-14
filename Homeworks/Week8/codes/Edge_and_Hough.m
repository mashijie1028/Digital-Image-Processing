I = imread('board-orig.bmp');
figure;
subplot(2,2,1);imshow(I);

BW = edge(I,'Canny');%Canny������ȡͼ��߽磬���ض�ֵͼ��(�߽�1,����0)
[H,T,R] = hough(BW);%�����ֵͼ��ı�׼����任��HΪ����任����I,RΪ�������任�ĽǶȺͰ뾶ֵ
subplot(2,2,2);imshow(BW);
subplot(2,2,3);
imshow(H,[],'XData',T,'YData',R,'InitialMagnification','fit');%hough�任��ͼ��
xlabel('\theta'), ylabel('\rho');
axis on,axis square,hold on;
P  = houghpeaks(H,3);%��ȡ3����ֵ��
x = T(P(:,2)); 
y = R(P(:,1));
plot(x,y,'s','color','white');%�����ֵ��
lines=houghlines(BW,T,R,P);%��ȡ�߶�
subplot(2,2,4);
imshow(I), hold on;

for k = 1:length(lines)
xy = [lines(k).point1; lines(k).point2];
plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');%�����߶�
plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');%���
plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');%�յ�
end