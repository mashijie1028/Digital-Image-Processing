A = imread('trove.png');  
A = rgb2gray(A);
figure;  
subplot(131);imshow(A);title('ԭͼ')  
[m,n] = size(A);  
% A1 = A(1:m/4,1:n/4);  
% A2 = A(m/4+1:m/3,1:n/4);  
B = mat2cell(A,[166,166,166,169],[154,154,154,156]); %������A�ֳ�16�� 
C = mat2cell(A,[166,166,166,169],[154,154,154,156]);   

%�ֱ��ÿһ�������д���  
for i=1:4  
    for j=1:4  
        T = mean2(B{i,j});   %ȡ��ֵ��Ϊ��ʼ��ֵ  
        done = false;   %��������ѭ������  
        a = 0;  
        % whileѭ�����е���  
        while ~done  
            r1 = find(B{i,j}<=T);  %С����ֵ�Ĳ���  
            r2 = find(B{i,j}>T);   %������ֵ�Ĳ���  
            Tnew = (mean(B{i,j}(r1)) + mean(B{i,j}(r2))) / 2;  %����ָ�������ֵ���ֵ��ֵ�ľ�ֵ  
            done = abs(Tnew - T) < 1;     %�жϵ����Ƿ�����  
            T = Tnew;      %�粻����,�򽫷ָ��ľ�ֵ�ľ�ֵ��Ϊ�µ���ֵ����ѭ������  
            a = a+1;  
        end  
        B{i,j}(r1) = 0;   %��С����ֵ�Ĳ��ָ�ֵΪ0  
        B{i,j}(r2) = 1;   %��������ֵ�Ĳ��ָ�ֵΪ1   �������ǽ�ͼ��ת���ɶ�ֵͼ��  
    end  
end  
J = cell2mat(B); %���ֿ鴦���ľ���ת������������  
subplot(132);imshow(J,[]);title('�ֲ�����̬����ֵ+����') 

for i=1:4  
    for j=1:4  
        %C{i,j} = im2double(A);
        C{i,j} = im2double(C{i,j});
        t=graythresh(C{i,j});              %�õ�������ֵ
        C{i,j}=im2bw(C{i,j},t);                  %ת���ɶ�ֵͼ��kΪ�ָ���ֵ
    end  
end
K = cell2mat(C); %���ֿ鴦���ľ���ת������������  
subplot(133);imshow(K,[]);title('�ֲ�����̬����ֵ+Otsu')