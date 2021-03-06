if isLOS == 1
    DS_mu = 10^-7.44;
    DS_sigma = 10^0.25;
    ASD_mu = 10^0.40;
    ASD_sigma = 10^0.37;
    ASA_mu = 10^1.40;
    ASA_sigma = 10^0.20;
    shadow_Fading = 3;      %% in decibels
    K_factor_mu = 9;        %% in decibels
    K_factor_sigma = 6;     %% in decibels
    Cross_correlation_ASDvsDS = 0.5;
    Cross_correlation_ASAvsDS = 0.8;
    Cross_correlation_ASAvsSF = -0.5;
    Cross_correlation_ASDvsSF = -0.5;
    Cross_correlation_DSvsSF = -0.4;
    Cross_correlation_ASDvsASA = 0.4;
    Cross_correlation_ASDvsK = -0.3;
    Cross_correlation_ASAvsK = -0.3;
    Cross_correlation_DSvsK = -0.7;
    Cross_correlation_SFvsK = 0.5;
    Delay_distribution = 'Exp';
    ASD_distribution = 'WrappedGaussian';
    ASA_distribution = 'WrappedGaussian';
    r_tau = 3.2;
    XPR_mu = 9;             %% in decibels
    XPR_sigma = 3;          %% in decibels
    n_cluster = 8;
    n_ray_cluster = 20;
    cluster_ASD = 3;
    cluster_ASA = 18;
    cluster_Shadowing = 3;  %@decibels
    corr_dist_DS = 9;
    corr_dist_ASD = 13;
    corr_dist_ASA = 12;
    corr_dist_SF = 14;
    corr_dist_K = 10;
else
    DS_mu = 10^-7.12;
    DS_sigma = 10^0.12;
    ASD_mu = 10^1.19;
    ASD_sigma = 10^0.21;
    ASA_mu = 10^1.55;
    ASA_sigma = 10^0.20;
    shadow_Fading = 4;      %% in decibels
    K_factor_mu = NaN;        %% in decibels
    K_factor_sigma = NaN;     %% in decibels
    Cross_correlation_ASDvsDS = 0.2;
    Cross_correlation_ASAvsDS = 0.4;
    Cross_correlation_ASAvsSF = -0.4;
    Cross_correlation_ASDvsSF = 0;
    Cross_correlation_DSvsSF = -0.7;
    Cross_correlation_ASDvsASA = 0.1;
    Cross_correlation_ASDvsK = NaN;
    Cross_correlation_ASAvsK = NaN;
    Cross_correlation_DSvsK = NaN;
    Cross_correlation_SFvsK = NaN;
    Delay_distribution = 'Unif';
    Unif_range = 800*10^(-9);
    ASD_distribution = 'WrappedGaussian';
    ASA_distribution = 'WrappedGaussian';
    r_tau = NaN;
    XPR_mu = 8;             %% in decibels
    XPR_sigma = 3;          %% in decibels
    n_cluster = 16;
    n_ray_cluster = 20;
    cluster_ASD = 10;
    cluster_ASA = 22;
    cluster_Shadowing = 3;  %@decibels
    corr_dist_DS = 8;
    corr_dist_ASD = 10;
    corr_dist_ASA = 9;
    corr_dist_SF = 12;
    corr_dist_K = NaN;
end