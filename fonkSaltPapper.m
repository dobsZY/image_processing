function gurultuluResim = fonkSaltPapper(orijinalResim, gurultuOrani)

    [m, n, c] = size(orijinalResim);
    numGurultu = floor(m * n * gurultuOrani);
    gurultuluResim = orijinalResim;
    
    for t = 1:numGurultu
        i = randi(m);
        j = randi(n);
        if rand < 0.5
            % pepper: tüm kanalları 0 yap (siyah)
            gurultuluResim(i,j,1:c) = 0;
        else
            % salt: tüm kanalları 255 yap (beyaz)
            gurultuluResim(i,j,1:c) = 255;
        end
    end
end
