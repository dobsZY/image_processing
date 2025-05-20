function temiz = fonkMedyanFiltre(resim, filtreBoyutu)
    [m, n, c] = size(resim);
    temiz = zeros(m, n, c, 'uint8');

    yaricap = floor(filtreBoyutu/2);

    for i = 1:m
        for j = 1:n
            for k = 1:c
               
                r1 = max(1, i - yaricap);
                r2 = min(m, i + yaricap);
                c1 = max(1, j - yaricap);
                c2 = min(n, j + yaricap);
                
                blok = double(resim(r1:r2, c1:c2, k));
                
                pikselListe = blok(:);
                md = median(pikselListe);
               
                temiz(i,j,k) = uint8(md);
            end
        end
    end
end
