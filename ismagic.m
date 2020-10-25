function c = ismagic(A)

sum_equal_of_dig = sum(diag(A));
sum_equal_of_dig_rev = sum(diag(flip(A,1)));
sum_of_row = sum(A,1);
sum_of_col=sum(A,2);
B = sum_of_col.';
size_of_row=size(A,1);

%First checking if for each row and colum, 
%sum of row = sum of columns; if true then,
if(isequal(sum_of_row,B)==true)
    %Checking if sum of diagonal 1 = diagonal 2 = each value in the sum of rows
    %and columns
    for i=1:size_of_row
   if(isequal(sum_equal_of_dig,sum_equal_of_dig_rev,sum_of_row(1,i),B(1,i))==true)
       c = true;
   else
       c = false;
   end
    end
   else
       c = false;
end
end
