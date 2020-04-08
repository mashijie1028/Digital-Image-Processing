function H_L = GLPF(u_max, v_max, sigma)

% defining range of axis
U=0:u_max - 1;
V=0:v_max - 1;

% calculating coordinate of center
center_u = ceil(u_max/2);
center_v = ceil(v_max/2);

% initialization
H_L=zeros(u_max, v_max);

for u=1:u_max
    for v=1:v_max
        % distence between U(u,v) and center
        dist = sqrt((U(u) - center_u)^2 + (V(v) - center_v)^2);
        H_L(u,v) = exp(-dist^2/(2*sigma^2));
    end
end

figure(1);
surf(U,V,H_L)
xlabel('u')
ylabel('v')
zlabel('H(u,v)')
legend('H(u,v)')
