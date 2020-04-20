I = imread('trove.png');
I = rgb2gray(I);
%I = im2double(I);
[width,height] = size(I);
T0 = 0.001;%��������
T1= 100;%��ʼ��ֵT1
%����G1��G2����������������ͳ��<T��>T��ֵ
gray_leval_1 = 0;
gray_leval_2 = 0;
G1 = 0;
G2 = 0;
n=0;
while 1
    for i = 1:width
        for j = 1:height
            if I(i,j)>T1
                G1 = G1+double(I(i,j)); %�õ�����G1
                gray_leval_1 = gray_leval_1 + 1;
            else
                G2 = G2+double(I(i,j)); %�õ�����G2
                gray_leval_2 = gray_leval_2 + 1;
            end
        end
    end
    %����G1��G2��ֵ
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
subplot(1,2,1);imshow(I);title('ԭͼ��')
subplot(1,2,2);imshow(BW1);title('����ȫ����ֵ�ָ�');
disp(T1)
