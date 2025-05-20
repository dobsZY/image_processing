function zoomed = fonkZoom(img, scaleFactor)

    if isempty(scaleFactor) || ~isnumeric(scaleFactor) || scaleFactor <= 0
        error('fonkZoom:scaleFactor','Pozitif bir ölçek faktörü girilmeli.');
    end

    [m, n, c] = size(img);

   
    new_m = max(1, round(m * scaleFactor));
    new_n = max(1, round(n * scaleFactor));
  
    zoomed = zeros(new_m, new_n, c, 'like', img);

 
    for i = 1:new_m
        
        srcRow = floor((i - 1)/scaleFactor) + 1;
        srcRow = min(max(srcRow,1), m);

        for j = 1:new_n
            
            srcCol = floor((j - 1)/scaleFactor) + 1;
            srcCol = min(max(srcCol,1), n);

            zoomed(i, j, :) = img(srcRow, srcCol, :);
        end
    end
end