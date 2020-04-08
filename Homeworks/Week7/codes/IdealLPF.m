function  H_L = IdealLPF(u_max, v_max, D0)
% defining range of axis
U=0:u_max;
V=0:v_max;

% calculating coordinate of center
center_u = ceil(u_max/2);
center_v = ceil(v_max/2);

% initilization
H_L=zeros(u_max, v_max);

for u=1:u_max+1
    for v=1:v_max+1
        % distance between (u,v) and center
        dist = sqrt((U(u) - center_u)^2 + (V(v) - center_v)^2);
        % judge thread
        if(dist<=D0)
            H_L(u,v) = 1;
        else
            H_L(u,v) = 0;
        end
    end
end

figure(1);
surf(U,V,H_L)
xlabel('u')
ylabel('v')
zlabel('H(u,v)')
legend('H(u,v)')
