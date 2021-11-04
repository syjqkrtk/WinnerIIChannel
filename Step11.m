H_usnm = zeros(n_rx,n_tx,n_cluster,n_ray_cluster);

P_result = [P_n(1)*0.5; P_n(1)*0.3; P_n(1)*0.2; P_n(2)*0.5; P_n(2)*0.3; P_n(2)*0.2; P_n(3:end)];
delay_result = [delay_tau(1); delay_tau(1)+5*10^(-9); delay_tau(1)+10*10^(-9); delay_tau(2); delay_tau(2)+5*10^(-9); delay_tau(2)+10*10^(-9); delay_tau(3:end)];

subcluster = cell(3,1);
subcluster{1} = [1,2,3,4,5,6,7,8,19,20];
subcluster{2} = [9,10,11,12,17,18];
subcluster{3} = [13,14,15,16];
ray_index = [1,1,1,1,1,1,1,1,2,2,2,2,3,3,3,3,2,2,1,1];

theta_v = 180*angle(v_MS(1)/v_MS(2))/pi();
v_nm = norm(v_MS)*cosd(varphi_nm-theta_v)/lambda_0;

for u = 1:n_rx
    for s = 1:n_tx
        for i = 1:2
            for j = 1:n_ray_cluster
                H_usnm(u,s,i,j) = sqrt(P_result(3*(i-1)+ray_index(j)))*[F_tx_V(floor(varphi_nm(i,j))+181,s), F_tx_H(floor(varphi_nm(i,j))+181,s)]...
                    *[exp(1j*Initial_Phase(i,j,1)),sqrt(XPR(i,j))*exp(1j*Initial_Phase(i,j,2)); sqrt(XPR(i,j))*exp(1j*Initial_Phase(i,j,3)), exp(1j*Initial_Phase(i,j,4))]...
                    *[F_rx_V(floor(phi_nm(i,j))+181,u); F_rx_H(floor(phi_nm(i,j))+181,u)]...
                    *exp(1j*(s-1)*d_s*2*pi()*lambda_0^(-1)*sind(phi_nm(i,j)))...
                    *exp(1j*(u-1)*d_u*2*pi()*lambda_0^(-1)*sind(varphi_nm(i,j)))...
                    *exp(1j*2*pi()*v_nm(i,j)*t);
            end
        end
    end
end

for u = 1:n_rx
    for s = 1:n_tx
        for i = 3:n_cluster
            for j = 1:n_ray_cluster
                H_usnm(u,s,i,j) = sqrt(P_n(i))*[F_tx_V(floor(varphi_nm(i,j))+181,s), F_tx_H(floor(varphi_nm(i,j))+181,s)]...
                    *[exp(1j*Initial_Phase(i,j,1)),sqrt(XPR(i,j))*exp(1j*Initial_Phase(i,j,2)); sqrt(XPR(i,j))*exp(1j*Initial_Phase(i,j,3)), exp(1j*Initial_Phase(i,j,4))]...
                    *[F_rx_V(floor(phi_nm(i,j))+181,u); F_rx_H(floor(phi_nm(i,j))+181,u)]...
                    *exp(1j*(s-1)*d_s*2*pi()*lambda_0^(-1)*sind(phi_nm(i,j)))...
                    *exp(1j*(u-1)*d_u*2*pi()*lambda_0^(-1)*sind(varphi_nm(i,j)))...
                    *exp(1j*2*pi()*v_nm(i,j)*t);
            end
        end
    end
end

H_usn = zeros(n_rx,n_tx,n_cluster+4);

H_usn(:,:,7:end) = sum(H_usnm(:,:,3:end,:),4);

for i = 1:2
    for j = 1:3
        H_usn(:,:,3*(i-1)+j) = sum(H_usnm(:,:,i,subcluster{j}),4);
    end
end


