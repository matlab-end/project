function A = row_reduction ( A )
    if size(A,2)>=size(A,1)
        i = 1;
        j = 1;
        [m,n] = size(A);
        while (i <= m && j <= n)
            maxi = i;
            for k = i+1:m
                if (abs(A(k,j)) > abs(A(maxi,j)))
                    maxi = k;
                end
            end
            if A(maxi,j) ~= 0
                temp=A(i,:);
                A(i,:)=A(maxi,:);
                A(maxi,:)=temp; 
                A(i,:)=A(i,:)*(1/A(i,j));
                for u = i+1:m
                    A(u,:) = A(u,:)-A(u,j)*A(i,:);
                end
                i=i+1;
            end
        j = j + 1;
        end
    else
        error('error');
    end
end