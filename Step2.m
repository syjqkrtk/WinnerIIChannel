d = sqrt((x_BS-x_MS)^2+(y_BS-y_MS)^2);

switch scene
    case 'B1'
        P_LOS = min(18/d,1)*(1-exp(-d/36))+exp(-d/36);
end

if P_LOS >= rand()
    isLOS = 1;
else
    isLOS = 0;
end