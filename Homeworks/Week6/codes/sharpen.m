I = imread('board-orig.bmp');
f_laplacian = fspecial('laplacian',0);
f_sobel = fspecial('sobel');
f_sharp = fspecial('unsharp');
f_prewitt = fspecial('prewitt');

F1 = imfilter(I,f_laplacian);
F2 = imfilter(I,f_sobel);
F3 = imfilter(I,f_sharp);
F4 = imfilter(I,f_prewitt);

Igrad = I;
for i = 1:448-1
    for j = 1:464-1
        x = I(i,j+1)-I(i,j);
        y = I(i+1,j)-I(i,j);
        grad = max(abs(x),abs(y));
        Igrad(i,j)=grad;
    end
    
end

w1 = [-1,0;0,1];
w2 = [0,-1;1,0];
R1 = imfilter(I,w1,'corr','replicate');
R2 = imfilter(I,w2,'corr','replicate');
C = abs(R1)+abs(R2);

% edge
figure;
subplot(2,3,1)
imshow(I)
title('original image')

subplot(2,3,2)
imshow(Igrad)
title('gradient')


subplot(2,3,3)
imshow(F1)
title('laplacian')

subplot(2,3,4)
imshow(F2)
title('sobel')

subplot(2,3,5)
imshow(F4)
title('prewitt')

subplot(2,3,6)
imshow(F3-I)
title('unsharp')

% sharpen
figure;
subplot(2,3,1)
imshow(I)
title('original image')

subplot(2,3,2)
imshow(I+Igrad)
title('gradient')

subplot(2,3,3)
imshow(I+F1)
title('laplacian')

subplot(2,3,4)
imshow(I+F2)
title('sobel')

subplot(2,3,5)
imshow(I+F4)
title('prewitt')

subplot(2,3,6)
imshow(F3)
title('unsharp')