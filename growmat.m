function A = growmat(n)

M = ones(n,n); %initial matrix 

k = 1; 
m = 1;

for i=2:n
    %initiates all the rows of column 1 with an increment of +1 columnwise
    %starting from second row
    M(i,1) = k+1;
    k = k + 1;
    
    %in each row, elements are incremented by m consecutively and m 
    %increases by 1 as we go down the rows starting from second row
    for j=1:n-1
        M(i,j+1) = M(i,j) + m;
    end
    
    m = m + 1;
end

A = M; %finalised matrix for the output

end

