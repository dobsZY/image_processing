function counts = fonkHistogramGoster(img)

    if ndims(img) == 3
        
        gray = fonkGray(img);
    else
        gray = img;
    end

    counts = zeros(256,1,'uint32');

    [m, n] = size(gray);
    for i = 1:m
        for j = 1:n
            v = gray(i,j);    
            counts(v+1) = counts(v+1) + 1;
        end
    end
end
