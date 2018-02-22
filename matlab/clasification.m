clc;
clear;
close all hidden;

% set parameters here
%method='euclidean';
method='chi2';

temp=load('dictionaryHarris.mat');
histSet=temp.dictionary;
K=size(histSet,1);
dist=zeros(K,K);

for i=1:K
    hist1=histSet(i,:);
    dist(i,:) = getImageDistance(hist1, histSet, method);
end
