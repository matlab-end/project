function [s, mea, med] = get_lines_smm( B )
    A = B.';
    s = sum(A);
    mea = mean(A);
    med = median(A);
end