function gerilmisGri = fonkHistogramGerme(rgbGoruntu)

    gri = fonkGray(rgbGoruntu);  

    griD = double(gri);
    c = min(griD(:));           
    d = max(griD(:));         

    if d == c
        gerilmisGri = gri;
        return;
    end
    alpha = 255/(d - c);

    [m,n] = size(griD);
    tmp = zeros(m,n,'uint8');
    for i = 1:m
        for j = 1:n
            val = (griD(i,j) - c)*alpha;  
            tmp(i,j) = uint8( min(max(val,0),255) );
        end
    end

    gerilmisGri = tmp;
end
