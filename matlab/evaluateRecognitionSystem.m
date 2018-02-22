% evaluateRecognitionSystem.m
% This script evaluates nearest neighbour recognition system on test images
% load traintest.mat and classify each of the test_imagenames files.
% Report both accuracy and confusion matrix
clc;
clear;
close all hidden;

% load files here
load 'traintest.mat';

% set parameters here
method='chi2';
%method = 'euclidean';

temp=load('visionHarris.mat');
histSet=temp.trainFeatures;
dictionary=temp.dictionary;
dictionarySize=size(dictionary,1);
test_labels=test_labels';

num = length(test_imagenames);
dist=zeros(num,size(train_labels,2));


for i=1:num
    test_imagenames{i}=strrep(test_imagenames{i},'.jpg','.mat');
    temp=load(['../data/',test_imagenames{i}]);
    wordMap=temp.wordMap;
    testFeatures(i,:) = getImageFeatures(wordMap, dictionarySize);
end


for i=1:num
    hist1=testFeatures(i,:);
    dist(i,:)=getImageDistance(hist1, histSet, method);
end

[~,idx]=min(dist,[],2);
predict_labels=train_labels(1,idx)';
error=predict_labels-test_labels;
correct=length(find(error==0));
accuracy=correct/size(test_labels,1);
C= confusionmat(test_labels,predict_labels);

