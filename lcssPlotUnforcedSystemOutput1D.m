function [] = lcssPlotUnforcedSystemOutput1D( A, C, x_0, T )
% Plot for output of an one-dimensional unforced linear state space control
% system with respect to a period of time.
%
% Input:
% - A: the state transformation matrix
% - C: the observation matrix
% - x_0: the initial state of the system
% - T: the period of time

y = zeros(1, size(T,2));

for i_T = 1:size(T,2)
    y(1,i_T) = C * expm(A * T(1,i_T)) * x_0;
end

plot(T, y);
xlabel('t');
ylabel('y(t)');

end
