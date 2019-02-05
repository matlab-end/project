function [mi ma] = get_extremum( A )
    mi = min(min(A));
    ma = max(max(A));
end