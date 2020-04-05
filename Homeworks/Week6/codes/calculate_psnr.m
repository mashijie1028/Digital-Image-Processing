M = double(I);
N = double(K21);

MSE=sum(sum((M-N).^2))/(448*464);  
PSNR = 10*log10(255^2/MSE);
disp(PSNR)
disp(psnr(uint8(I),uint8(K21)))