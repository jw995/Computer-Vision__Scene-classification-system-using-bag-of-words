clc;
clear;
close all hidden;

load '../data/traintest.mat'; 
% set parameters
alpha=300;
K=500;

% method='random';
method='harris';
imgPaths=train_imagenames;

dictionary=getDictionary(imgPaths, alpha, K, method);

save harris_300_500 dictionary;
