function out = fonkRenkUzayi(img, space)
rgb = double(img) / 255;
[h, w, ~] = size(rgb);

switch lower(space)
    case 'hsv'
        H = zeros(h,w);
        S = zeros(h,w);
        Vv = zeros(h,w);
        for i = 1:h
            for j = 1:w
                r = rgb(i,j,1);
                g = rgb(i,j,2);
                b = rgb(i,j,3);
                mx = max([r g b]);
                mn = min([r g b]);
                C  = mx - mn;
                % Hue
                if C == 0
                    hval = 0;
                elseif mx == r
                    hval = mod((g - b)/C, 6);
                elseif mx == g
                    hval = (b - r)/C + 2;
                else
                    hval = (r - g)/C + 4;
                end
                H(i,j) = hval/6;
                % Saturation
                if mx == 0
                    S(i,j) = 0;
                else
                    S(i,j) = C / mx;
                end
                % Value
                Vv(i,j) = mx;
            end
        end
        out = uint8(cat(3, H, S, Vv) * 255);

    case 'ycbcr'
        Y  = zeros(h,w);
        Cb = zeros(h,w);
        Cr = zeros(h,w);
        for i = 1:h
            for j = 1:w
                R = rgb(i,j,1)*255;
                G = rgb(i,j,2)*255;
                B = rgb(i,j,3)*255;
                y  = 0.299*R + 0.587*G + 0.114*B;
                cb = 128 - 0.168736*R - 0.331264*G + 0.5*B;
                cr = 128 + 0.5*R - 0.418688*G - 0.081312*B;
                Y(i,j)  = min(max(y,  0),255);
                Cb(i,j) = min(max(cb, 0),255);
                Cr(i,j) = min(max(cr, 0),255);
            end
        end
        out = uint8(cat(3, Y, Cb, Cr));

    case 'lab'
  
        lin = zeros(h,w,3);
        for i = 1:h
            for j = 1:w
                for k = 1:3
                    v = rgb(i,j,k);
                    if v <= 0.04045
                        lin(i,j,k) = v / 12.92;
                    else
                        lin(i,j,k) = ((v + 0.055)/1.055)^2.4;
                    end
                end
            end
        end

        Mmat = [0.4124564 0.3575761 0.1804375;
                0.2126729 0.7151522 0.0721750;
                0.0193339 0.1191920 0.9503041];
        XYZ = zeros(h,w,3);
        for i = 1:h
            for j = 1:w
                rgbv = squeeze(lin(i,j,:));
                xyzv = Mmat * rgbv;
                XYZ(i,j,:) = xyzv;
            end
        end
        % beyaz nokta normalize
        Xn = 0.95047; Yn = 1.00000; Zn = 1.08883;
        xr = XYZ(:,:,1)/Xn;
        yr = XYZ(:,:,2)/Yn;
        zr = XYZ(:,:,3)/Zn;
        epsVal = 0.008856; kVal = 903.3;
        fx = xr.^(1/3); fy = yr.^(1/3); fz = zr.^(1/3);
        idx = xr < epsVal; fx(idx) = (kVal*xr(idx)+16)/116;
        idx = yr < epsVal; fy(idx) = (kVal*yr(idx)+16)/116;
        idx = zr < epsVal; fz(idx) = (kVal*zr(idx)+16)/116;
        L  = 116 * fy - 16;        
        a_ = 500 * (fx - fy);        
        b_ = 200 * (fy - fz);         
        % 0–255 aralığına ölçekle
        Lu = uint8((L/100) * 255);
        au = uint8(((a_ + 128)/255) * 255);
        bu = uint8(((b_ + 128)/255) * 255);
        out = cat(3, Lu, au, bu);

    otherwise
        error('fonkColorSpace: Unknown space "%s"', space);
end
