function e = get_eigenvals ( A )
    try
        e = eig(A);
    catch
        error('problem');   %כאן נקבע מה יקרה אם זה לא יצילח יענו אם המטריצה לא ריבועית, נחליט מה יקרה כאן רק שנתעסק עם ההממשק גוי
    end
end