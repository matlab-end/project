function cp = get_cp ( A )
    try
        syms x;
        cp = charpoly(A,x);
    catch
        error('problem');   %��� ���� �� ���� �� �� �� ����� ���� �� ������� �� �������, ����� �� ���� ��� �� ������ �� ������ ���
    end
end