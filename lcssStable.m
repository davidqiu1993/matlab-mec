function [ stability ] = lcssStable(A)
% Check whether a linear state space control system is stable or not at the
% equilibrium point of x=0, where a LSS control system is described as
%   dx(t) = Ax(t) + Bu(t)
%   y(t) = Cx(t)
% 
% Input:
% - A: the state transformation matrix.
%
% Output:
% - stability: 1 if stable; -1 if unstable; 0 if unknown without knowledge
%              of Jordan Blocks.

e_val = eig(A);

fprintf('eigenvalues:\n');
disp(e_val);

if sum(real(e_val) < 0) == size(e_val,1)
    stability = 1;
    fprintf('stable (1): all eiganvalues have negative real parts.\n');
elseif sum(real(e_val) > 0) > 0
    stability = -1;
    fprintf('unstable (-1): some eiganvalues have positive real parts.\n');
else
    idx_re0 = (real(e_val) == 0);
    e_val_re0 = zeros(sum(idx_re0), 1);
    i_re0 = 0;
    for i_idx=1:size(e_val,1)
        if idx_re0(i_idx) == 1
            i_re0 = i_re0 + 1;
            e_val_re0(i_re0) = e_val(i_idx);
        end
    end
    
    stability = 1;
    for i_re0 = 1:size(e_val_re0,1)
        for j_re0 = 1:size(e_val_re0,1)
            if i_re0 ~= j_re0 && e_val_re0(i_re0) == e_val_re0(j_re0)
                stability = 0;
                fprintf('unknown (0): two eigenvalues with zero real parts overlaps.\n');
                break;
            end
        end
        if stability == 0
            break;
        end
    end
    if stability == 1
        fprintf('stable (1): all eigenvalues have non-positive real parts and those with zero real parts do not overlap.\n');
    end
end

figure;
scatter(real(e_val), imag(e_val));
grid on;
xlabel('Re[eig(A)]');
ylabel('Im[eig(A)]');

end
