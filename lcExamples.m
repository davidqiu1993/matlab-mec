%% Linear Control Systems Examples
%  Including:
%  - linear state space control (lcss) systems, and 
%  - linear classical control (lcc) systems.

A = [0 1 0;
     0 0 1;
     1 5 7];
B = [1;
     0;
     0];
C = [0 1 3];
x_0 = [0;
       1;
       0];


%% Eigenvalues (Poles) Placement
%  Find the close-loop control feedback matrix K by defining the placement
%  of the eigenvalues (poles).

p = [-1+1i, -1-1i, -2];

K = place(A, B, p);

figure;
lcssPlotUnforcedSystemOutput1D(A, C, x_0, 0:0.01:0.5);
hold on;
lcssPlotUnforcedSystemOutput1D((A-B*K), C, x_0, 0:0.01:10);
hold off;


%% Laplace Transform
%  Connecting the state space control systems and classical control systems
%  by transforming from time domain (t) to frequency domain (s).

syms t s
f = cos(pi*t);
Lf = laplace(f, t, s);

