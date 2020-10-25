function A = TriDiagonalMatrix(M)
[m,n] = size(M); %// get size
A = M.*( bsxfun(@le,(0:m-1)',1:n) & bsxfun(@ge,(1:m)',0:n-1));
end

