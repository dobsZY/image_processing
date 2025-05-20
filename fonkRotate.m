function rotated = fonkRotate(img, derece)

[m, n, c] = size(img);
rotated = zeros(m, n, c, 'like', img);
theta = deg2rad(derece);
%  görüntü merkezini bulma
cx = (m + 1)/2;
cy = (n + 1)/2;
for i = 1:m
    for j = 1:n
        x0 =  cos(theta)*(i - cx) + sin(theta)*(j - cy) + cx;
        y0 = -sin(theta)*(i - cx) + cos(theta)*(j - cy) + cy;
        xi = round(x0);
        yj = round(y0);
        if xi >= 1 && xi <= m && yj >= 1 && yj <= n
            rotated(i, j, :) = img(xi, yj, :);
        end
    end
end
end