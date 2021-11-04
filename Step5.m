sigma_tau = normrnd(DS_mu,DS_sigma);

switch Delay_distribution
    case 'Exp'
        delay_tau = -r_tau*sigma_tau*log(rand(n_cluster,1));
        
    case 'Unif'
        delay_tau = rand(n_cluster,1)*Unif_range;
end

delay_tau = sort(delay_tau,'descend') - min(delay_tau);
D = 1;
if isLOS
    K = normrnd(K_factor_mu,K_factor_sigma);
    D = 0.7705-0.0433*K+0.0002*K^2+0.000017*K^3;
end
delay_tau_scaled = delay_tau/D;