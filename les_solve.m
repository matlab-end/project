function x = les_solve ( A, b )
%     try
        system = [A b];
        system = row_reduction(system);
        [m,n] = size(system);
         for i = n-1:-1:0
            x(i) = system(i,n)/system(i,i);
            for k = i-1:-1:0
                system(k,n) =   system(k,n) - system(k,i)*x(i);
            end
         end   
%     catch
%         error('problem');   %��� ���� �� ���� �� �� �� ����� ���� �� ������� �� �������, ����� �� ���� ��� �� ������ �� ������ ���
%     end
% end