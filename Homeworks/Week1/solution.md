# <center>数字图像处理作业&ensp;&ensp;&ensp;第一周</center>

<center>马时杰&ensp;&ensp;&ensp;精71&ensp;&ensp;&ensp;2017010671</center>

[toc]

## 引言

&emsp;&emsp;数字图像处理在生活和科学研究中的方方面面都发挥着重要的作用，也催生了很多有意义的技术和产品，其中，有一种结合**数字图像处理**和**光场信息**的技术——**重聚焦**，便是其中的代表之一。本文首先简介光场技术，随后利用matlab进行实现重聚焦技术，并给出了代码实现和最后结果。



## 原理简述

&emsp;&emsp;所谓**光场（light field）**，实质上就是一个**矢量函数**，描述了光在空间中的每一个点处的每一个传播方向。空间中所有光线的信息（位置、方向）由五维全光函数确定，函数值代表光强，或可用表示光线强度的任意物理量表示。

&emsp;&emsp;这个函数可以描述为：$L(x,y,z,\theta,\phi)$，其中，$x$,$y$,$z$描述空间坐标，$\theta$,$\phi$描述空间角度，整个函数值表示光的辐射度，自变量为光线的方位信息（位置与角度），如图1。整个**5D**函数描绘出了一个空间内的全部光学信息，当然，如果考虑光线的波长$\lambda$和时间$t$，则整个光场信息成为了一个**7D**函数：$L(x,y,z,\theta,\phi,\lambda,t)$。

![264px-Plenoptic_function_b.svg](E:\课程\大三下\数字图像处理\264px-Plenoptic_function_b.svg.png)

<center>图1. 光场信息描述（5D函数）</center>

&emsp;&emsp;重聚焦是在获得光场信息之后的后续处理。通俗地讲，在获得整个光场的信息后，我们便可以合成出在此光场中任意位置和方法拍摄出来的照片，因为获取光场信息等价于获取该空间内的一切光学信息。但是，合成图像的主观成分较大，严格意义上讲，得到的图像并非完全真实的图像，而是人工合成的。

&emsp;&emsp;重聚焦实际上是改变焦平面的位置，在新选定的焦平面上对光线积分，得到重聚焦的图像。

&emsp;&emsp;而下文的实现，由于原始数据仅有64张图片，得到的棋盘光场信息其实是很有限的，因此重聚焦也无法实现精确的积分，下文主要使用了插值方法，利用matlab插值函数，合成重聚焦图像。通过改变参数`pixels`的值，可以改变焦平面的位置。事实证明，利用下面的程序和图片，仍然可以获得很好的重聚焦效果。



## 实际效果

* 根据已有的光场数据（64张棋盘的图片）进行重聚焦，这些图像选取的焦平面略有差别。根据参数调节，可以实现不同深度的重聚焦效果。 

* 具体效果如下：

  ![image-20200226203241141](C:\Users\DELL\AppData\Roaming\Typora\typora-user-images\image-20200226203241141.png)
<center>图2. 原始图片数据</center>

![image-20200226203411389](C:\Users\DELL\AppData\Roaming\Typora\typora-user-images\image-20200226203411389.png)

<center>图3. 利用原始图片处理后得到的重聚焦图像  
（左边为聚焦在前部，右侧为后部）</center>




## 代码实现

```matlab
%% reFocus.m
%%任意读取一张图片，获取图片矩阵大小
image0=imread(['./Chess_LF/1.png']);    
lightField=zeros(8,8,size(image0,1),size(image0,2),3);    %%建立光场五维数组
pixels=-2;    %%重聚焦位置参数
 
%%读取64张图片
for ky=1:8                             
  for kx=1:8        
     image =imread( ['./Chess_LF/' num2str((ky-1)*8+kx) '.png']);    
     lightField(kx,ky,:,:,:)=image;     
  end
end

 %%RGB归一化
 for s=1:3                            
    lightField(:,:,:,:,s)=lightField(:,:,:,:,s)/255;
 end   

    Iout = zeros([size(lightField,3) size(lightField,4) 3]);    
    [XX YY] = meshgrid(1:size(lightField,4), 1:size(lightField,3));
  
  %%重聚焦  
    for ky=1:size(lightField,1)
        for kx=1:size(lightField,2)
            II = reshape(lightField(kx,ky,:,:,:), [size(lightField,3) size(lightField,4) 3] );
            for k=1:3
                I(:,:,k) = interp2(XX,YY,II(:,:,k), XX + pixels*(kx-(floor(size(lightField,2)/2)+1)), YY - pixels*(ky-(floor(size(lightField,1)/2)+1)), 'linear', 1);
            end

            Iout = Iout + (1/(size(lightField,2)*size(lightField,1))) .* I;
        end

    end
    
   imshow(Iout);    %%输出重聚焦图像
```

根据实际情况，作简要说明如下：

> * 可调整的参数仅有pixels，已在程序最开始处列出，可以更改其值实现不同位置处的重聚焦。
> * 其中，pixels值越小，表示聚焦平面越靠前。  
>   例如：pixels=-2时，可以观察到聚焦平面在棋盘前面的图像；pixels=0时，可以观察到聚焦平面在棋盘后面的图像。  
>   pixels值不宜小于-3且不宜大于1，否则将导致图像不清晰。



## 说明与展望

&emsp;&emsp;本文只是很粗浅地说明了光场和重聚焦的主要思。简而言之，就是先获取全部空间光学信息，然后就可以利用这些信息获得任意想获得的子情形的信息了，重聚焦只是光场的一个应用而已。

&emsp;&emsp;市面上，已经出现了利用光场信息的产品，比较著名的就是：**光场相机**，也被称为**全光相机**。著名的公司是美国的Lytro公司，下图是其产品。

![330px-Lytro_light_field_camera_-_front_and_back](E:\课程\大三下\数字图像处理\330px-Lytro_light_field_camera_-_front_and_back.jpg)
<center>图4. 光场相机的正面和背面</center>

&emsp;&emsp;与普通的仅仅记录光强度和二维坐标的常规相机相比，光场相机获得了更多的角度和空间信息，然而成本问题使得光场相机短时间内无法普及市场，现在更多的是用在了教学和学术科研领域。

&emsp;&emsp;相信随着制造业水平的发展和理论的进步，这一光学信息和数字图像处理交叉学科的产物，将发挥越来越大的作用，也有助于我们越来越好地认识世界。




## 参考文献

> 1. https://github.com/MITComputationalCamera/LightFields
> 2. https://en.wikipedia.org/wiki/Light_field
> 3. https://en.wikipedia.org/wiki/Light-field_camera
> 

