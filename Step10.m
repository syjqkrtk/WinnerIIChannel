Initial_Phase = 2*pi()*rand(n_cluster,n_ray_cluster,4)-pi();

if isLOS
    Initial_Phase(:,:,5:6) = 2*pi()*rand(n_cluster,n_ray_cluster,2)-pi();
end