function [diag, P] = diagonalization( A )
    try
        [diag, P] = eig(A);
    catch
        error('The matrice is not diagonalizable');   %כאן נקבע מה יקרה אם זה לא יצילח יענו אם המטריצה לא ריבועית, נחליט מה יקרה כאן רק שנתעסק עם ההממשק גוי
    end
end