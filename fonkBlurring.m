function bulanikResim = fonkBlurring(resim, yaricap)

    [m, n, c] = size(resim);
    bulanikResim = zeros(m, n, c, 'uint8');
  
    for ch = 1:c
        kanal = resim(:,:,ch);
        for i = 1:m
            for j = 1:n

                r1 = max(1, i - yaricap);
                r2 = min(m, i + yaricap);
                c1 = max(1, j - yaricap);
                c2 = min(n, j + yaricap);
                blok = double(kanal(r1:r2, c1:c2));
                
                ort = mean(blok(:));
                bulanikResim(i,j,ch) = uint8(ort);
            end
        end
    end
end
