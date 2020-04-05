f = 0:0.01:1;
v1 = 1;
y1 = log2(1 + v1*f)/log2(v1+1); 
v2 = 10;
y2 = log2(1 + v2*f)/log2(v2+1); 
v3 = 50;
y3 = log2(1 + v3*f)/log2(v3+1); 
v4 = 100;
y4 = log2(1 + v4*f)/log2(v4+1); 
v5 = 200;
y5 = log2(1 + v5*f)/log2(v5+1); 
plot(f,y1,'g',f,y2,'r',f,y3,'b',f,y4,'c',f,y5,'y');
xlabel('Input gray level');
ylabel('Output gray level');
title('Log transformation: s = log(1+v*s)/log(1+v)');

lgd = legend('Log(v=1)','Log(v=10)','Log(v=50)','Log(v=100)','Log(v=200)');
legend('Location','southeast');
title(lgd,'The Legend Title')