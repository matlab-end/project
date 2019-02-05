function [s, mea, med] = get_rows_smm( A )
    s = sum(A);
    mea = mean(A);
    med = median(A);
end
