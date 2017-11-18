%% Linear Quadratic Regulation (LQR)
%  Use linear quadratic regulation to find the close-loop control feedback 
%  matrix K by defining the optimization attention of the state dimensions 
%  by Q and the cost of control dimensions by R (instead of the placement 
%  of the eigenvalues/poles manually).
%
%  cost:
%    J(x(t), u(t)) = integral_0_inf [ x(t)'Qx(t) + u(t)'Ru(t) ] dt
%    u(t) = - Kx
%
%  goal:
%    K_star = argmin_{K} [ J(x(t), u(t)) ]

A = [0 0  1 0;
     0 0  0 1;
     0 1 -3 0;
     0 2 -3 0];

B = [0;
     0;
     1;
     1];

Q = [1 0 0 0;
     0 5 0 0;
     0 0 1 0;
     0 0 0 5];

R = 10;

[K, S, e] = lqr(A, B, Q, R);



%% Plotting Transitions
%  Plotting the transitions of the system starting from different initial 
%  states, using ODE45 as a numerical solver for the system.

t = 0:0.01:30;

x_0 = [0, 0.1, 0, 0;
       0, 0.5, 0, 0;
       0, 1.0886, 0, 0;
       0, 1.1, 0, 0];

for i_x0 = 1:4
    [t1, x] = ode45(@(t,x) (A-B*K)*x, t, x_0(i_x0,:)');

    figure;

    subplot(4, 1, 1);
    plot(t1, x(:,1));
    xlabel('t');
    ylabel('x_1 (x_c)');

    subplot(4, 1, 2);
    plot(t1, x(:,2));
    xlabel('t');
    ylabel('x_2 (\phi)');

    subplot(4, 1, 3);
    plot(t1, x(:,3));
    xlabel('t');
    ylabel('x_3 (dx_c/dt)');

    subplot(4, 1, 4);
    plot(t1, x(:,4));
    xlabel('t');
    ylabel('x_4 (d\phi/dt)');
    
    suptitle(['x_0 = [', num2str(x_0(i_x0,1)), ', ', num2str(x_0(i_x0,2)), ', ', num2str(x_0(i_x0,3)), ', ', num2str(x_0(i_x0,4)), ']^T']);
end

