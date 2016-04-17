[x1] = % Gen wave one
[x2] = % Gen wave two
m = size(x1, 1); % size of each signal
n = 2; % Number of
A = randn(n, n); %  Random 2 X 2 mixing matrix
x = A*[x1';x2']; % Mixed signals
mx = sum(x, 2)/m; % supposed to be the mean; E{x}
x = x - repmat(mx, 1, m); % x - E{x}
% the following 3 lines whiten the data
c = cov(x');
sq = inv(sqrtm(c));
x = c*xx;

w = randn(n, 1); % Random weight vector
w = w/norm(w,2); % make 'w' a unit vector
w0 = randn(n, 1);
w0 = w0/norm(w0, 2);
while abs(abs(w0'*w)-1) > 0.000001
    w0 = w;
    w = x*G(w'*x)'/m - sum(DG(w'*x))*w/m; % This step is supposed to perform:
                                          % w = E{xg(w^{T}*x)} - E{g'(w^{T}*x)}w
    w = w/norm(w, 2);
end
sound(w'*x); % Supposed to be one of the original signals
