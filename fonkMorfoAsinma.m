function inceltilmisGoruntu = fonkMorfoAsinma(girisGoruntu)

    if ~islogical(girisGoruntu)
        ikili = girisGoruntu > 0;
    else
        ikili = girisGoruntu;
    end

    se = [0 1 0;
          1 1 1;
          0 1 0];
    yaricap = floor(size(se,1)/2); 

    [m, n] = size(ikili);
    padli = false(m + 2*yaricap, n + 2*yaricap);
    padli(yaricap+1:end-yaricap, yaricap+1:end-yaricap) = ikili;

    erozyonSonuc = false(m, n);
    for sat = 1:m
        for sut = 1:n
           
            bolge = padli(sat:sat+2*yaricap, sut:sut+2*yaricap);
            if all( bolge(se==1) )
                erozyonSonuc(sat, sut) = true;
            end
        end
    end

    inceltilmisGoruntu = uint8(erozyonSonuc) * 255;
end
