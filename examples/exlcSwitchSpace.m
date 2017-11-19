%% Switch Space Examples
%  Switch between state space control systems and classical control systems
%  by switching between time domain (t) and frequency domain (s).


%% Laplace Transforms and Inverse Laplace Transforms
%  Switch from time domain (t) to frequency domain (s).

if 0
    syms t s

    f = cos(pi*t);

    F = laplace(f, t, s);

    ff = ilaplace(F, s, t);
end


%% State Space Transformations and Frequency Domain Transfer Functions
%  Switch between state space control system transformations and frequency 
%  domain transfer functions.

if 1
    A = [0 1 0;
         0 0 1;
         1 5 7];
    B = [1;
         0;
         0];
    C = [0 1 3];
    D = 0;

    [b, a] = ss2tf(A, B, C, D);

    [AA, BB, CC, DD] = tf2ss(b, a);
    
    H = tf(b, a); % get the transfer function
    
    step(b, a); % display the step response
end

