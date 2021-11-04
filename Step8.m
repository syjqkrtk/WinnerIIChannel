Random_Coupling = zeros(n_cluster,n_ray_cluster);

for i = 1:n_cluster
    Random_Coupling(i,:) = randperm(n_ray_cluster);
end