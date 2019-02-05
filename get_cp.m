function cp = get_cp ( A )
    try
        syms x;
        cp = charpoly(A,x);
    catch
        error('problem');   %כאן נקבע מה יקרה אם זה לא יצילח יענו אם המטריצה לא ריבועית, נחליט מה יקרה כאן רק שנתעסק עם ההממשק גוי
    end
end