function genisletilmisGoruntu = fonkMorfoGenisleme(inputGri)

    bin = inputGri > 0;      

    SE = [0 1 0;
          1 1 1;
          0 1 0];
    pad = floor(size(SE,1)/2);

    [m, n] = size(bin);
    padded = false(m + 2*pad, n + 2*pad);
    padded(pad+1:pad+m, pad+1:pad+n) = bin;

    genisletilmis = false(m, n);
    for i = 1:m
        for j = 1:n
            region = padded(i:i+2*pad, j:j+2*pad);
            
            if any( region(SE==1) )
                genisletilmis(i,j) = true;
            end
        end
    end

    genisletilmisGoruntu = uint8(genisletilmis) * 255;
end
