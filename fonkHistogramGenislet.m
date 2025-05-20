function genisletilmisGoruntu = fonkHistogramGenislet(rgbGoruntu, altDeger, ustDeger)

    gri = fonkGray(rgbGoruntu);  

    griD = double(gri);
    [m, n] = size(griD);

    enKucuk = min(griD(:));
    enBuyuk = max(griD(:));

    if enBuyuk == enKucuk
     
        genisletilmisGoruntu = uint8( altDeger * ones(m,n) );
        return;
    end


    gerilmis = zeros(m, n);
    for i = 1:m
        for j = 1:n
            gerilmis(i,j) = (griD(i,j) - enKucuk) * ...
                            ((ustDeger - altDeger) / (enBuyuk - enKucuk)) + ...
                            altDeger;
        end
    end

    gerilmis = max(min(gerilmis, ustDeger), altDeger);
    genisletilmisGoruntu = uint8(gerilmis);
end
