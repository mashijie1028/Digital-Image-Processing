A = imread('trove.png');  
A = rgb2gray(A);
figure;  
subplot(131);imshow(A);title('原图')  
[m,n] = size(A);  
% A1 = A(1:m/4,1:n/4);  
% A2 = A(m/4+1:m/3,1:n/4);  
B = mat2cell(A,[166,166,166,169],[154,154,154,156]); %将矩阵A分成16块 
C = mat2cell(A,[166,166,166,169],[154,154,154,156]);   

%分别对每一块矩阵进行处理  
for i=1:4  
    for j=1:4  
        T = mean2(B{i,j});   %取均值作为初始阈值  
        done = false;   %定义跳出循环的量  
        a = 0;  
        % while循环进行迭代  
        while ~done  
            r1 = find(B{i,j}<=T);  %小于阈值的部分  
            r2 = find(B{i,j}>T);   %大于阈值的部分  
            Tnew = (mean(B{i,j}(r1)) + mean(B{i,j}(r2))) / 2;  %计算分割后两部分的阈值均值的均值  
            done = abs(Tnew - T) < 1;     %判断迭代是否收敛  
            T = Tnew;      %如不收敛,则将分割后的均值的均值作为新的阈值进行循环计算  
            a = a+1;  
        end  
        B{i,j}(r1) = 0;   %将小于阈值的部分赋值为0  
        B{i,j}(r2) = 1;   %将大于阈值的部分赋值为1   这两步是将图像转换成二值图像  
    end  
end  
J = cell2mat(B); %将分块处理后的矩阵转换成整个矩阵  
subplot(132);imshow(J,[]);title('局部（动态）阈值+迭代') 

for i=1:4  
    for j=1:4  
        %C{i,j} = im2double(A);
        C{i,j} = im2double(C{i,j});
        t=graythresh(C{i,j});              %得到最优阈值
        C{i,j}=im2bw(C{i,j},t);                  %转换成二值图，k为分割阈值
    end  
end
K = cell2mat(C); %将分块处理后的矩阵转换成整个矩阵  
subplot(133);imshow(K,[]);title('局部（动态）阈值+Otsu')