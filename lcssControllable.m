function [ controllability, Q ] = lcssControllable(A, B)
% Check whether a linear state space control system is controllable or not,
% where the system is described as
%   dx(t) = Ax(t) + Bu(t)
%   y(t) = Cx(t)
% 
% Input:
% - A: the state transformation matrix.
% - B: the control transformation matrix.
%
% Output:
% - controllability: 1 if controllable; -1 if not controllable.
% - Q: the matrix Q.

n = size(A,1);

Q = [];
for i_n = 0:n-1
    Q = [Q, A^(i_n) * B];
end

if rank(Q) == n
    controllability = 1;
    fprintf('controllable: rank(Q) = n\n');
elseif rank(Q) < n
    controllability = -1;
    fprintf('not controllable: rank(Q) < n\n');
else
    controllability = 0;
    fprintf('unexpected result: rank(Q) > n\n');
end

end
