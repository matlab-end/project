function [diag, P] = diagonalization( A )
    try
        [diag, P] = eig(A);
    catch
        error('The matrice is not diagonalizable');   %��� ���� �� ���� �� �� �� ����� ���� �� ������� �� �������, ����� �� ���� ��� �� ������ �� ������ ���
    end
end