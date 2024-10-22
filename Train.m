clear all;
clc;
close all;
load Letters;  % Load Capital and small letters
X = Letters;
T = [eye(27) eye(27) eye(27)]; % The Desired output 
% [X,T] = prprob;
setdemorandstream(pi);
net = feedforwardnet(30);  % The hidden layer with 30 nodes
view(net);                   % view net 
net1.divideFcn = '';
numNoise = 35;                
Xn = min(max(repmat(X,1,numNoise)+randn(50,81*numNoise)*0.2,0),1); % Add 35 noisy copy of letters to makt it more real
Tn = repmat(T,1,numNoise);
[net tr Output E] = train(net,Xn,Tn,nnMATLAB);  % Train the network
