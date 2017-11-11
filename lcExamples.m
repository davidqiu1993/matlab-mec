%% Linear Control Systems Examples
%  Including:
%  - linear state space control (lcss) systems, and 
%  - linear classical control (lcc) systems.


%% Laplace Transform
%  Connecting the state space control systems and classical control systems
%  by transforming from time domain (t) to frequency domain (s).

syms t s
f = cos(pi*t);
Lf = laplace(f, t, s);
