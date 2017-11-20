%% ODE45 for Nonlinear Systems
%  Using ODE45 ordinary differential equations solver for nonlinear state 
%  space systems.


%% State Space Representation
%  Get the state space representation of the nonlinear system.
%  ref: problem set 3, question 2

syms gamma alpha beta D mu phi dphi xc dxc F


M1 = [             gamma, -beta * cos(phi) ;
       - beta * cos(phi),           alpha  ];

M2 = [ F ;
       0 ];

M3 = [ beta * dphi^2 * sin(phi) + mu * dxc ;
                            - D * sin(phi) ];

M = M1^(-1) * (M2 - M3);

syms x1 x2 x3 x4 u

M_subs_statespace = subs(M, [xc, phi, dxc, dphi, F], [x1, x2, x3, x4, u]);

M_subs_params = subs(M_subs_statespace, [gamma, alpha, beta, D, mu], [2, 1, 1, 1, 3]);

K = [-0.3162, 10.2723, -6.7857, 9.2183];

M_subs_u = subs(M_subs_params, u, - K * [x1; x2; x3; x4]);

M_final = M_subs_u;

dx_dt = [x3;
         x4;
         M_final(1);
         M_final(2)];
dx_dt = simplify(dx_dt);


%% Numerical Solution
%  Solve the system with ODE45 as the numerical ordinary differential 
%  equations solver.

t = 0:0.01:30;

x_0 = [0, 0.1, 0, 0;
       0, 0.5, 0, 0;
       0, 1.0886, 0, 0;
       0, 1.1, 0, 0];

for i_x0 = 1:4
    if i_x0 == 4
        t = 0:0.01:6;
    end
    
    [t1, x] = ode45(@(t,x) double(subs(dx_dt, [x1,x2,x3,x4], [x(1),x(2),x(3),x(4)])), t, x_0(i_x0,:)');

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
%}
