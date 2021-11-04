if isLOS
    switch scene
        case 'B1'
            d_BP = 4*(h_BS-1)*(h_MS-1)*f_c/c;
            d_1 = abs(x_BS-x_MS);
            
            if (10 < d) && (d < d_BP)
                A = 22.7;
                B = 27;
                C = 20;
                PL = A*log10(d)+B+C*log10(f_c/(5*10^9));
                sigma = 3;
            elseif (d_BP < d) && (d < 5000)
                PL = 40*log10(d)+7.56-17.3*log10(h_BS-1)-17.3*log10(h_MS-1)+2.7*log10(f_c/(5.0*10^9));
                sigma = 3;
            else
                error('error');
            end
    end
else
    switch scene
        case 'B1'
            switch cellLayout
                case 'Man'
                    w = 20;
            
                    d_BP = 4*(h_BS-1)*(h_MS-1)*f_c/c;
                    d_1 = abs(x_BS-x_MS);
                    d_2 = abs(y_BS-y_MS);

                    if (10 < d_1) && (d_1 < d_BP)
                        A = 22.7;
                        B = 27;
                        C = 20;
                        PL_LOS_d1 = A*log10(d_1)+B+C*log10(f_c/(5*10^9));
                        sigma = 3;
                    elseif (d_BP < d_1) && (d_1 < 5000)
                        PL_LOS_d1 = 40*log10(d_1)+7.56-17.3*log10(h_BS-1)-17.3*log10(h_MS-1)+2.7*log10(f_c/(5.0*10^9));
                        sigma = 3;
                    else
                        error('error');
                    end

                    if (0 < d_2) && (d_2 < w/2)
                        PL = PL_LOS_d1;
                    elseif (w/2 < d_2) && (d_2 < 2000)
                        if (10 < d_2) && (d_2 < d_BP)
                            A = 22.7;
                            B = 27;
                            C = 20;
                            PL_LOS_d2 = A*log10(d_2)+B+C*log10(f_c/(5*10^9));
                            sigma = 3;
                        elseif (d_BP < d_2) && (d_2 < 5000)
                            PL_LOS_d2 = 40*log10(d_2)+7.56-17.3*log10(h_BS-1)-17.3*log10(h_MS-1)+2.7*log10(f_c/(5.0*10^9));
                            sigma = 3;                
                        end
                        nj_d1 = max(2.8-0.0024*d_1, 1.84);
                        nj_d2 = max(2.8-0.0024*d_2, 1.84);
                        PL_d1d2 = PL_LOS_d1+17.3-12.5*nj_d1+10*nj_d1*log10(d_2)+3*log10(f_c/(5*10^9));
                        PL_d2d1 = PL_LOS_d2+17.3-12.5*nj_d2+10*nj_d1*log10(d_1)+3*log10(f_c/(5*10^9));
                        PL = min(PL_d1d2, PL_d2d1);
                    else
                        error('error');
                    end
                    
                case 'Hex'
                    if ~(10 < d && d < 2000)
                        error('error');
                    elseif 0.45 < f_c/10^9 < 1.5
                        PL = (44.9-6.55*log10(h_BS))*log10(d)+5.83*log10(h_BS)+16.33+26.16*log10(f_c);
                    elseif 1.5 <= f_c/10^9 < 2.0
                        PL = (44.9-6.55*log10(h_BS))*log10(d)+5.83*log10(h_BS)+14.78+34.97*log10(f_c);
                    elseif 2.0 <= f_c/10^9 < 6.0
                        PL = (44.9-6.55*log10(h_BS))*log10(d)+5.83*log10(h_BS)+18.38+23*log10(f_c);
                    else
                        error('error');
                    end
                            
            end
    end
end