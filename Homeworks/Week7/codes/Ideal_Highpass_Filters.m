f = imread('board-orig.bmp');
f = mat2gray(f,[0 255]);

[M,N] = size(f);
P = 2*M;
Q = 2*N;
fc = zeros(M,N);

for x = 1:1:M
    for y = 1:1:N
        fc(x,y) = f(x,y) * (-1)^(x+y);
    end
end

F = fft2(fc,P,Q);

H_1 = zeros(P,Q);
H_2 = zeros(P,Q);
H_3 = zeros(P,Q);

for x = (-P/2):1:(P/2)-1
     for y = (-Q/2):1:(Q/2)-1
        D = (x^2 + y^2)^(0.5);
        if(D >= 30)  H_1(x+(P/2)+1,y+(Q/2)+1) = 1; end  
        if(D >= 60)  H_2(x+(P/2)+1,y+(Q/2)+1) = 1; end    
        if(D >= 160)  H_3(x+(P/2)+1,y+(Q/2)+1) = 1; end
     end
end

G_1 = H_1 .* F;
G_2 = H_2 .* F;
G_3 = H_3 .* F;

g_1 = real(ifft2(G_1));
g_1 = g_1(1:1:M,1:1:N);

g_2 = real(ifft2(G_2));
g_2 = g_2(1:1:M,1:1:N);    

g_3 = real(ifft2(G_3));
g_3 = g_3(1:1:M,1:1:N); 

for x = 1:1:M
    for y = 1:1:N
        g_1(x,y) = g_1(x,y) * (-1)^(x+y);
        g_2(x,y) = g_2(x,y) * (-1)^(x+y);
        g_3(x,y) = g_3(x,y) * (-1)^(x+y);
    end
end

figure();
subplot(1,2,1);
imshow(f,[0 1]);
xlabel('Original Image');
subplot(1,2,2);
imshow(log(1 + abs(F)),[ ]);
xlabel('Frequency Domain');

figure();
subplot(2,2,2);
imshow(H_1,[0 1]);
xlabel('Ideal Highpass filter(D){0}=30)');
subplot(2,2,1);
h = mesh(1:5:P,1:5:Q,H_1(1:5:P,1:5:Q)');
set(h,'EdgeColor','k');
axis([0 P 0 Q 0 1]);
xlabel('u');ylabel('v');
zlabel('|H(u,v)|');
subplot(2,2,4);
imshow(log(1 + abs(G_1)),[ ]);
xlabel('Result in frequency domain');
subplot(2,2,3);
imshow(g_1,[0 1]);
xlabel('Result image');

figure();
subplot(2,2,2);
imshow(H_2,[0 1]);
xlabel('Ideal Highpass filter(D_{0}=60)');
subplot(2,2,1);
h = mesh(1:5:P,1:5:Q,H_2(1:5:P,1:5:Q)');
set(h,'EdgeColor','k');
axis([0 P 0 Q 0 1]);
xlabel('u');ylabel('v');
zlabel('|H(u,v)|');
subplot(2,2,4);
imshow(log(1 + abs(G_2)),[ ]);
xlabel('Result in frequency domain');
subplot(2,2,3);
imshow(g_2,[0 1]);
xlabel('Result image');

figure();
subplot(2,2,2);
imshow(H_3,[0 1]);
xlabel('Ideal Highpass filter(D_{0}=160)');
subplot(2,2,1);
h = mesh(1:5:P,1:5:Q,H_3(1:5:P,1:5:Q)');
set(h,'EdgeColor','k');
axis([0 P 0 Q 0 1]);
xlabel('u');ylabel('v');
zlabel('|H(u,v)|');
subplot(2,2,4);
imshow(log(1 + abs(G_3)),[ ]);
xlabel('Result in frequency domain');
subplot(2,2,3);
imshow(g_3,[0 1]);
xlabel('Result image');

figure;
subplot(2,2,1);imshow(f);title('original image');
subplot(2,2,2);imshow(g_1+f);title('D_{0} = 30');
subplot(2,2,3);imshow(g_2+f);title('D_{0} = 60');
subplot(2,2,4);imshow(g_3+f);title('D_{0} = 160');