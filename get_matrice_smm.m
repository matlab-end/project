function [s, mea, med] = get_matrice_smm( A )
    s = sum(A,'all');
    mea = mean(A,'all');
    med = median(A,'all');
end