I = imread('trove.png');
I = rgb2gray(I);
%I = im2double(I);
figure;imhist(I);title('原始图像灰度直方图');

[m,n] = size(I);
T1 = 50;
T2 = 100;
T3 = 150;
T4 = 200;
T5 = 250;
BW1 = logical(zeros(m,n));
for i=1:m
    for j=1:n
        if(I(i,j)<T1)
            BW1(i,j)=0;
        else 
            BW1(i,j)=1;
        end
    end
end
BW2 = logical(zeros(m,n));
for i=1:m
    for j=1:n
        if(I(i,j)<T2)
            BW2(i,j)=0;
        else 
            BW2(i,j)=1;
        end
    end
end
BW3 = logical(zeros(m,n));
for i=1:m
    for j=1:n
        if(I(i,j)<T3)
            BW3(i,j)=0;
        else 
            BW3(i,j)=1;
        end
    end
end
BW4 = logical(zeros(m,n));
for i=1:m
    for j=1:n
        if(I(i,j)<T4)
            BW4(i,j)=0;
        else 
            BW4(i,j)=1;
        end
    end
end
BW5 = logical(zeros(m,n));
for i=1:m
    for j=1:n
        if(I(i,j)<T5)
            BW5(i,j)=0;
        else 
            BW5(i,j)=1;
        end
    end
end

figure;
subplot(2,3,1);imshow(I);title('原图像')
subplot(2,3,2);imshow(BW1);title(['阈值：',num2str(T1)]);
subplot(2,3,3);imshow(BW2);title(['阈值：',num2str(T2)]);
subplot(2,3,4);imshow(BW3);title(['阈值：',num2str(T3)]);
subplot(2,3,5);imshow(BW4);title(['阈值：',num2str(T4)]);
subplot(2,3,6);imshow(BW5);title(['阈值：',num2str(T5)]);