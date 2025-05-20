function cropped = fonkCrop(img, startCol, startRow, endCol, endRow)
    [m, n, ~] = size(img);
    if startCol > endCol
        tmp      = startCol; 
        startCol = endCol; 
        endCol   = tmp; 
    end
    if startRow > endRow
        tmp      = startRow; 
        startRow = endRow; 
        endRow   = tmp; 
    end
    %  Sınır koruması
    startCol = max(1, min(n, startCol));
    endCol   = max(1, min(n, endCol));
    startRow = max(1, min(m, startRow));
    endRow   = max(1, min(m, endRow));
    cropped = img(startRow:endRow, startCol:endCol, :);
end