I = imread('board-Gauss-0.005.bmp');
A = fspecial('gaussian',3);
J = filter2(A,I)/255;
K = medfilt2(I,[3,3]);
figure;
subplot(2,2,1);imshow(J);title('Filtered Image');

BW = edge(J,'Roberts');
subplot(2,2,2); imshow(BW);title('The edge')

[H,T,R] = hough(BW);
subplot(2,2,3);
imshow(H,[],'XData',T,'YData',R,'InitialMagnification','fit');
xlabel('\theta/бу'), ylabel('\rho');
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