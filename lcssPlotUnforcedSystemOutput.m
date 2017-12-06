function [] = lcssPlotUnforcedSystemOutput( A, C, x_0, T )
% Plot for output of an unforced linear state space control system with 
% respect to a period of time.
%
% Input:
% - A: the state transformation matrix
% - C: the observation matrix
% - x_0: the initial state of the system
% - T: the period of time

if ~exist('C', 'var')
    C = eye(size(A,1));
end

if ~exist('x_0', 'var')
    x_0 = ones(size(A,1),1);
end

if ~exist('T', 'var')
    T = 0:0.01:10;
end

y = zeros(size(C,1), size(T,2));

for i_T = 1:size(T,2)
    y(:,i_T) = C * expm(A * T(1,i_T)) * x_0;
end

for i_y = 1:size(C,1)
    subplot(size(C,1),1,i_y);
    plot(T, y(i_y,:));
end

end
