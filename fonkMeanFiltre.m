function temiz = fonkMeanFiltre(resim, filtreBoyutu)

    [m, n, c] = size(resim);
    temiz = zeros(m, n, c, 'double');
    yaricap = floor(filtreBoyutu/2);

    for i = 1:m
        for j = 1:n

            r1 = max(1, i - yaricap);
            r2 = min(m, i + yaricap);
            c1 = max(1, j - yaricap);
            c2 = min(n, j + yaricap);

            for k = 1:c
                blok = double(resim(r1:r2, c1:c2, k));
                temiz(i,j,k) = mean(blok(:));
            end
        end
    end
    temiz = uint8(temiz);
end
