I = imread('trove.png');
I = rgb2gray(I);
%I = im2double(I);
[width,height] = size(I);
T0 = 0.001;%设置门限
T1= 100;%初始阈值T1
%设置G1，G2两个列向量，各自统计<T和>T的值
gray_leval_1 = 0;
gray_leval_2 = 0;
G1 = 0;
G2 = 0;
n=0;
while 1
    for i = 1:width
        for j = 1:height
            if I(i,j)>T1
                G1 = G1+double(I(i,j)); %得到分组G1
                gray_leval_1 = gray_leval_1 + 1;
            else
                G2 = G2+double(I(i,j)); %得到分组G2
                gray_leval_2 = gray_leval_2 + 1;
            end
        end
    end
    %计算G1、G2均值
    avg1 = G1/gray_leval_1;
    avg2 = G2/gray_leval_2;
    T2 = (avg1 + avg2)/2;
    if abs(T2 - T1)<T0 
        break
    end
    T1 = T2;
    gray_leval_1 = 0;
    gray_leval_2 = 0;
    G1 = 0;
    G2 = 0;
    n=n+1;
end

BW1 = logical(zeros(width,height));
for i=1:width
    for j=1:height
        if(I(i,j)<T1)
            BW1(i,j)=0;
        else 
            BW1(i,j)=1;
        end
    end
end
subplot(1,2,1);imshow(I);title('原图像')
subplot(1,2,2);imshow(BW1);title('迭代全局阈值分割');
disp(T1)
