function [ H ] = Trans( axis, magnitude )
% Translate along an axis for a certain magnitude.
% Note that SE(3) space is assumed.
%
% @param axis The axis of translation in { 'x', 'y', 'z' }.
% @param magnitude The magnitude of translation.

switch axis
    case 'x'
        H = [ 1 0 0 magnitude;
              0 1 0         0;
              0 0 1         0;
              0 0 0         1 ];
    case 'y'
        H = [ 1 0 0         0;
              0 1 0 magnitude;
              0 0 1         0;
              0 0 0         1 ];
    case 'z'
        H = [ 1 0 0         0;
              0 1 0         0;
              0 0 1 magnitude;
              0 0 0         1 ];
    otherwise
        H = eye(4);
end

end
