function [retA, V] = pca_prime(A, k)

    % subtract mean from each column
    A = bsxfun(@minus, A, mean(A,1));
    
    % generate covariance matrix
    C = cov(A);
    
    % get eigen values/vectors
    [V D] = eig(C);
    
    % sort eigen values
    [D order] = sort(diag(D), 'descend');
    
    % sort columns based on eigenvalues
    V = V(:,order);
    
    % return new data points with k dimensions
    retA = A*V(:,1:k);
end



