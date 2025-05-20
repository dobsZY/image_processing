function out = fonkCarpma(img1, img2)

    [m1, n1, c1] = size(img1);
    [m2, n2, c2] = size(img2);
    m = min(m1,m2);
    n = min(n1,n2);
    c = min(c1,c2);
    img1 = img1(1:m,1:n,1:c);
    img2 = img2(1:m,1:n,1:c);

    out = zeros(m, n, c, 'uint8');

    for i = 1:m
        for j = 1:n
            for k = 1:c
                p1 = double(img1(i,j,k));
                p2 = double(img2(i,j,k));
                val = (p1 * p2) / 255;
                val = min(max(val,0),255);
                out(i,j,k) = uint8(val);
            end
        end
    end
end