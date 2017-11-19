%% Negative Feedback Classical Control
%  LTI (linear time invariant) classical control systems with negative
%  feedback control (unity feedback control).

syms s

H = tf([0, 0, 0, 200], [1, 22, 141, 2]);


%% Unity Negative Feedback
%  Add a (unity) negative feedback of G(s) = 1 to the control system.

G = 1;
%T = H / (1 + G * H);
T = tf([0, 0, 0, 200], [1, 22, 141, 202]);


%% Poles and Zeros
%  Find the poles and zeros of the feedback system.

p = roots([1, 22, 141, 202]);

z = roots([0, 0, 0, 200]);


%% Dominant pole
%  show the dominant pole is dominating the response.
%  poles: -10 + 1i, -10 - 1i, -2
%  dominant pole: -2

TT = tf([0, 0, 0, 200], [0, 0, 101, 202]); % dominant pole simplification

figure;
hold on;
step(T);
step(TT);
hold off;
legend('full poles', 'dominant pole');

