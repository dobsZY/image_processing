function kapatilmisGoruntu = fonkMorfoKapama(girisBinary)

    if ~islogical(girisBinary)
        ikili = girisBinary > 0;
    else
        ikili = girisBinary;
    end

    genomur = fonkMorfoGenisleme(ikili * 255);  
  
    genomurLog = genomur > 0;

    sonucLog = fonkMorfoAsinma(genomurLog);

    kapatilmisGoruntu = uint8(sonucLog) * 255;
end
