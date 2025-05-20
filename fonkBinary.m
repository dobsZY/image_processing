function rgbOut = fonkBinary(img, threshold)

    grayImage = fonkGray(img);   


    thr = round(threshold);


    mask = grayImage >= thr;      

    bin = uint8(mask) * 255;     

    rgbOut = repmat(bin, [1 1 3]);
end