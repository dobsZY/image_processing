function gray = fonkGray(img)

    if size(img,3) == 1
        gray = img;
        return
    end

    [m,n,~] = size(img);
    gray = zeros(m,n,'uint8');
    for i = 1:m
        for j = 1:n
            r = double(img(i,j,1));
            g = double(img(i,j,2));
            b = double(img(i,j,3));
            gray(i,j) = uint8(0.299*r + 0.587*g + 0.114*b);
            
        end
    end
end
