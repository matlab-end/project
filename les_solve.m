function x = les_solve ( system )
%     try
        [m,n] = size(system);
        x=zeros(m,1);
         for i = m:-1:1
             x(i)=system(i,n)/system(i,i);
             for k=i-1:-1:1
               system(k,n) = system(k,n) - system(k,i)*x(i);
             end
         end   
%     catch
%         error('problem');   %כאן נקבע מה יקרה אם זה לא יצילח יענו אם המטריצה לא ריבועית, נחליט מה יקרה כאן רק שנתעסק עם ההממשק גוי
%     end
% end