Z_n = normrnd(0,cluster_Shadowing,n_cluster,1);
if isLOS == 1
    P_n = exp(-delay_tau*(r_tau-1)/(r_tau*sigma_tau)).*10.^(-Z_n/10);
else
    P_n = exp(-delay_tau/sigma_tau).*10.^(-Z_n/10);
end

P_n = P_n/sum(P_n);
