function [ H ] = Rot( axis, angle )
% Rotate about an axis for a certain angle. (in rad)
% Note that SE(3) space is assumed.
%
% @param axis The axis of rotation in { 'x', 'y', 'z' }.
% @param angle The angle of rotation. (in rad)

switch axis
    case 'x'
        H = [ 1,          0,           0, 0;
              0, cos(angle), -sin(angle), 0;
              0, sin(angle),  cos(angle), 0;
              0,          0,           0, 1 ];
    case 'y'
        H = [  cos(angle), 0, sin(angle), 0;
                        0, 1,          0, 0;
              -sin(angle), 0, cos(angle), 0;
                        0, 0,          0, 1 ];
    case 'z'
        H = [ cos(angle), -sin(angle), 0, 0;
              sin(angle),  cos(angle), 0, 0;
                       0,           0, 1, 0;
                       0,           0, 0, 1 ];
    otherwise
        H = eye(4);
end

end
