function outputRGB = FonkGaussKonvolusyon(inputRGB, radius, sigma)

    kSize = 2*radius + 1;
    half  = radius;
    kernel = zeros(kSize, kSize);
    W = 0;
    for u = 1:kSize
      for v = 1:kSize
        du = u - (half+1);
        dv = v - (half+1);
        val = exp(-(du^2 + dv^2)/(2*sigma^2));
        kernel(u,v) = val;
        W = W + val;
      end
    end
    kernel = kernel / W;  
    [m, n, c] = size(inputRGB);
    outputRGB = zeros(m, n, c, 'uint8');
    for ch = 1:3
      I = double(inputRGB(:,:,ch));    
      outCh = zeros(m,n);
      % konvolüsyon
      for i = 1:m
        for j = 1:n
          acc = 0;
          for u = 1:kSize
            ri = min(max(i + u-(half+1), 1), m);
            for v = 1:kSize
              cj = min(max(j + v-(half+1), 1), n);
              acc = acc + I(ri,cj) * kernel(u,v);
            end
          end
          outCh(i,j) = acc;
        end
      end
      outputRGB(:,:,ch) = uint8(outCh);
    end
end
