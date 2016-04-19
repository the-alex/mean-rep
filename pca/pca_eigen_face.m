function [V] = pca_eigen_face(A)

    %subtract mean
    A = bsxfun(@minus, A, mean(A,2));

    % calculate covariance
    C = cov(A');

    % get eigen values/vectors
    [V D] = eig(C);

    % sort eigen values
    [D order] = sort(diag(D), 'descend');

    % sort columns based on eigenvalues
    V = V(:,order);

end