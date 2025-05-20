function out = fonkToplama(img1, img2)
    [m1,n1,c1] = size(img1);
    [m2,n2,c2] = size(img2);
    m = min(m1,m2);
    n = min(n1,n2);
    c = min(c1,c2);

    % resimleri ortak boyuta getirme 
    img1 = img1(1:m,1:n,1:c);
    img2 = img2(1:m,1:n,1:c);

    % piksel başına toplama 
    out = zeros(m, n, c, 'uint8');
    for i = 1:m
        for j = 1:n
            for k = 1:c
                s = double(img1(i,j,k)) + double(img2(i,j,k));
                if s > 255, s = 255; end
                out(i,j,k) = uint8(s);
            end
        end
    end
end