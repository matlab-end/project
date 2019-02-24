function [s, mea, med] = get_columns_smm( A )
    s = sum(A);
    mea = mean(A);
    med = median(A);
end
