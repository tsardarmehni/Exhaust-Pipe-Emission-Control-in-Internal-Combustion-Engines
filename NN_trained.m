function y = NN_trained(x)

global W1 W2 b1 b2 

y = W2 * tansig(W1 * x + b1)+ b2; 

end
