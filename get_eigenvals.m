function e = get_eigenvals ( A )
    try
        e = eig(A);
    catch
        error('problem');   %��� ���� �� ���� �� �� �� ����� ���� �� ������� �� �������, ����� �� ���� ��� �� ������ �� ������ ���
    end
end