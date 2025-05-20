function out = FonkAdaptifEsikleme(grayImage, w, C)

    [m, n] = size(grayImage);
    out = zeros(m, n, 'uint8');
    half = floor(w/2);

    for i = 1:m
        for j = 1:n
           
            r1 = max(1, i-half);
            r2 = min(m, i+half);
            c1 = max(1, j-half);
            c2 = min(n, j+half);
            block = grayImage(r1:r2, c1:c2);

         
            s = sum( double(block(:)) );      
            cnt = numel(block);              
            T = s/cnt - C;                    

            if double(grayImage(i,j)) >= T
                out(i,j) = 255;
            else
                out(i,j) =   0;
            end
        end
    end
end
