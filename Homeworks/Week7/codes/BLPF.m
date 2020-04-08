function H_L = BLPF(u_max, v_max, D0, n)

% define range of axis
U=0:u_max;
V=0:v_max;

% calculate coordinate of center
center_u = ceil(u_max/2);
center_v = ceil(v_max/2);

% initilization
H_L=zeros(u_max, v_max);

for u=1:u_max + 1 
    for v=1:v_max + 1
        % distance between (u,v) and center
        dist = sqrt((U(u) - center_u)^2 + (V(v) - center_v)^2);
        H_L(u,v)=1 / (1 + power(dist/D0, 2*n));
    end
end

figure(1);
surf(U,V,H_L)
xlabel('u')
ylabel('v')
zlabel('H(u,v)')
legend('H(u,v)')

