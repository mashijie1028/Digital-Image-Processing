I = im2double(rgb2gray(imread('焊接X光图像.jpg')));
I = im2double(rgb2gray(imread('美国NOAA可见光云图.jpg')));
% 高斯金字塔调用
gauss_pyr=gauss_pyramid1(I,5);
color = ['FF','00 ','FF','8B','00','8B','FF','00','00','CD','68','39','19','19','70'];
for k=1:length(gauss_pyr)
    [M,N]=size(gauss_pyr{k});
    for i=1:M
        for j=1:N
            if gauss_pyr{k}(i,j)<0.2
                % 变色
                gauss_pyr{k}(i,j,1)=hex2dec(color(3*k-2));
                gauss_pyr{k}(i,j,2)=hex2dec(color(3*k-1));
                gauss_pyr{k}(i,j,3)=hex2dec(color(3*k));
            elseif gauss_pyr{k}(i,j)<0.3
                % #FF00FF 洋红
                gauss_pyr{k}(i,j,1)=hex2dec('FF');
                gauss_pyr{k}(i,j,2)=hex2dec('00');
                gauss_pyr{k}(i,j,3)=hex2dec('FF');
            elseif gauss_pyr{k}(i,j)<0.4
                % #FFD700金
                gauss_pyr{k}(i,j,1)=hex2dec('FF');
                gauss_pyr{k}(i,j,2)=hex2dec('D7');
                gauss_pyr{k}(i,j,3)=hex2dec('00');
            elseif gauss_pyr{k}(i,j)<0.6
                % #4B0082靛青
                gauss_pyr{k}(i,j,1)=hex2dec('4B');
                gauss_pyr{k}(i,j,2)=hex2dec('00');
                gauss_pyr{k}(i,j,3)=hex2dec('82');
            elseif gauss_pyr{k}(i,j)<0.8
                % #FFFF00纯黄
                gauss_pyr{k}(i,j,1)=hex2dec('FF');
                gauss_pyr{k}(i,j,2)=hex2dec('FF');
                gauss_pyr{k}(i,j,3)=hex2dec('00');
            else
                % #008000纯绿
                gauss_pyr{k}(i,j,1)=hex2dec('00');
                gauss_pyr{k}(i,j,2)=hex2dec('80');
                gauss_pyr{k}(i,j,3)=hex2dec('00');
            end 
        end
    end
end

figure;
for i=1:5
    subplot(2,3,i);
    imshow(gauss_pyr{i});
    title(['高斯金字塔伪彩色图像: 第',num2str(i),'层']);
end