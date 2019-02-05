function tr = get_trace( A )
    try
       tr = trace(A);
    catch
       error('problem');    %כאן נקבע מה יקרה אם זה לא יצילח יענו אם המטריצה לא ריבועית, נחליט מה יקרה כאן רק שנתעסק עם ההממשק גוי
    end
end
