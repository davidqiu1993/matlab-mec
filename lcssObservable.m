function [ observability, W_o ] = lcssObservable(A, C)
% Check whether a linear state space control system is observable or not,
% where the system is described as
%   dx(t) = Ax(t) + Bu(t)
%   y(t) = Cx(t)
% 
% Input:
% - A: the state transformation matrix.
% - C: the observation matrix.
%
% Output:
% - observability: 1 if observable; -1 if not observable.
% - W_o: the matrix W_o.

n = size(A,1);

W_o = [];
for i_n = 0:n-1
    W_o = [W_o; C * A^(i_n)];
end

if rank(W_o) == n
    observability = 1;
    fprintf('observable: rank(W_o) = n\n');
elseif rank(W_o) < n
    observability = -1;
    fprintf('not observable: rank(W_o) < n\n');
else
    observability = 0;
    fprintf('unexpected result: rank(W_o) > n\n');
end

end
