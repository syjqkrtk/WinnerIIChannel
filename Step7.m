C = zeros(20,1); C(4) = 0.779; C(5) = 0.860; C(8) = 1.018; C(10) = 1.090; C(11) = 1.123; C(12) = 1.146; C(14) = 1.190;C(15) = 1.211;C(16) = 1.226;C(20) = 1.289;
alpha = [0.0447,-0.0447,0.1413,-0.1413,0.2492,-0.2492,0.3715,-0.3715,0.5129,-0.5129,0.6797,-0.6797,0.8844,-0.8844,1.1481,-1.1481,1.5195,-1.5195,2.1551,-2.1551];
switch Delay_distribution
    case 'Exp'
        C = C*(1.1035-0.028*K-0.002*K^2+0.0001*K^3);
        varphi_n = 2*ASA_sigma/1.4*sqrt(-log(P_n/max(P_n)))/C(n_cluster);
        param_X = 2*rand(n_cluster,1)-1; param_Y = normrnd(0,ASA_sigma/7,n_cluster,1);
        varphi_n = (param_X.*varphi_n+param_Y)-(param_X*varphi_n(1)+param_Y(1)-varphi_LOS);
        
        phi_n = 2*ASD_sigma/1.4*sqrt(-log(P_n/max(P_n)))/C(n_cluster);
        param_X = 2*rand(n_cluster,1)-1; param_Y = normrnd(0,ASD_sigma/7,n_cluster,1);
        phi_n = (param_X.*phi_n+param_Y)-(param_X*phi_n(1)+param_Y(1)-phi_LOS);
    case 'Unif'
        varphi_n = 2*ASA_sigma/1.4*sqrt(-log(P_n/max(P_n)))/C(n_cluster);
        param_X = 2*rand(n_cluster,1)-1; param_Y = normrnd(0,ASA_sigma/7,n_cluster,1);
        varphi_n = param_X.*varphi_n+param_Y+varphi_LOS;
        
        phi_n = 2*ASD_sigma/1.4*sqrt(-log(P_n/max(P_n)))/C(n_cluster);
        param_X = 2*rand(n_cluster,1)-1; param_Y = normrnd(0,ASD_sigma/7,n_cluster,1);
        phi_n = param_X.*phi_n+param_Y+phi_LOS;
end

varphi_nm = zeros(n_cluster,n_ray_cluster);
phi_nm = zeros(n_cluster,n_ray_cluster);

for i = 1:n_ray_cluster
    varphi_nm(:,i) = varphi_n(:)+cluster_ASA*alpha(i);
    phi_nm(:,i) = phi_n(:)+cluster_ASD*alpha(i);
end




