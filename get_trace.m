function tr = get_trace( A )
    [u,v] = size(A);
    if (u == v)
       tr = trace(A);
    else
        error('problem');
    end
end
