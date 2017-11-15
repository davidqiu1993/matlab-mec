%% Linear Control Systems Examples
%  Including:
%  - linear state space control (lcss) systems, and 
%  - linear classical control (lcc) systems.


%% Eigenvalues (Poles) Placement
%  Find the close-loop control feedback matrix K by defining the placement
%  of the eigenvalues (poles).

A = [0 1 0;
     0 0 1;
     1 5 7];
B = [1;
     0;
     0];

p = [-1+1i, -1-1i, -2];

K = place(A, B, p);


%% Laplace Transform
%  Connecting the state space control systems and classical control systems
%  by transforming from time domain (t) to frequency domain (s).

syms t s
f = cos(pi*t);
Lf = laplace(f, t, s);
