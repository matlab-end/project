function tr = get_trace( A )
    try
       tr = trace(A);
    catch
       error('problem');    %��� ���� �� ���� �� �� �� ����� ���� �� ������� �� �������, ����� �� ���� ��� �� ������ �� ������ ���
    end
end
