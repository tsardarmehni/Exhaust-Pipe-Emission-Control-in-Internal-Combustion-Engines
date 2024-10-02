function y = MPC_controller_GD(u)
global U_1 min_lambda max_lambda W1 W2 b1 b2

Max_Itr_MPC = 1000;
x = u(1:4,1);
time = u(5,1);


lambda_d_1 = 1-exp(-2 * time);
lambda_d = (lambda_d_1 - min_lambda)/ (max_lambda - min_lambda); 


alpha_MPC = 0.5e-4; 

for i=1:Max_Itr_MPC
    hat_lambda = NN_trained(x);
    error = hat_lambda - lambda_d;
    diff_J_u = (W2 * (diff_tansig(W1*x+b1).* W1(:,1)) ) * error;
    U_1 = U_1 - alpha_MPC * diff_J_u;
    x(1,1) = U_1;
    
    if abs(NN_trained(x) - lambda_d)<0.01
        break
    end
end
y = U_1;
end