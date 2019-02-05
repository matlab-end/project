function [s, mea, med] = get_sum_mean_med( A )
    s = sum(A);
    mea = mean(A);
    med = median(A);
end
