function [ H, S ] = DHTrans( params )
% Transform the DH parameters table to final and intermediate homogeneous 
% transoformation matrices.
%
% @param params The DH paramters in the format of 
%               `[ ...; theta_i, d_i, a_i, alpha_i; ... ]`.
% @return H The final homogeneous transformation matrix.
% @return S The intermediate steps homogeneous transformation matrices, 
%           organized as `{ ..., { Rz, Tz, Tx, Rx }, ... }`.

n = size(params, 1);

S = {};
H = eye(4);
for i = 1:n
    S{i}.Rz = Rot('z', params(i,1));
    S{i}.Tz = Trans('z', params(i,2));
    S{i}.Tx = Trans('x', params(i,3));
    S{i}.Rx = Rot('x', params(i,4));
    S{i}.Hi = S{i}.Rz * S{i}.Tz * S{i}.Tx * S{i}.Rx;
    H = H * S{i}.Hi;
end

end

