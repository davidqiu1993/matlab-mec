%% PID Controller
%  Design a PID controller to stable the plant 
%    G = tf([0, 0, 0, 1, 10], [1, 71, 1070, 1000, 0])
%  with the constraints:
%    - tr = 0.5
%    - Mp < 5%
%    - ys = 0

b_G = [0, 0, 0, 1, 10];
a_G = [1, 71, 1070, 1000, 0];
G = tf(b_G, a_G);

%[A,B,C,D] = tf2ss(b_G, a_G);

kp = 550;
kd = 400;
ki = 1;

K = tf([kd, kp, ki], [0, 1, 0]);

T = (K * G) / (1 + K * G);

figure(1);
%step(G);
%hold on;
[yT, TT] = step(T);
step(T);
%hold off;
grid on;

tr_min = 0;
tr_max = 0;
for i_t = 1:size(TT,1)
    if yT(i_t) > 0.1 * 1
        tr_min = TT(i_t - 1);
        break;
    end
end
for i_t = 1:size(TT,1)
    if yT(i_t) > 0.9 * 1
        tr_max = TT(i_t);
        break;
    end
end
tr = tr_max - tr_min;
fprintf('10%% - 90%% rise time: tr = %f s\n', tr);

Mp = (max(yT) - 1) / 1;
fprintf('percent overshoot: Mp = %f %%\n', Mp * 100);

