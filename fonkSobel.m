function edges = fonkSobel(img)
    % Eğer renkli resimse kendi fonksiyonla griye çevir
    if size(img,3)==3
        gray = fonkGray(img);      
    else
        gray = img;              
    end

    [m,n] = size(gray);
    Gx = [-1 0 1; -2 0 2; -1 0 1];
    Gy = Gx';

    edges = zeros(m,n,'uint8');
    for i = 1:m
        for j = 1:n
            sx = 0; sy = 0;
            for u = 1:3
                for v = 1:3
                    ii = min(max(i + u-2,1), m);
                    jj = min(max(j + v-2,1), n);
                    val = double(gray(ii,jj));
                    sx = sx + Gx(u,v)*val;
                    sy = sy + Gy(u,v)*val;
                end
            end
            mag = sqrt(sx^2 + sy^2);
            edges(i,j) = uint8(min(mag,255));
        end
    end
end