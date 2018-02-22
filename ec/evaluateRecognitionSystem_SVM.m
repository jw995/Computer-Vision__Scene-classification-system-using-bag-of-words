clc;
clear;
close all hidden;

% load files here
% SVM training data here
load '../matlab/traintest.mat';

% train features
temp=load('../matlab/visionHarris.mat');
histSetHarris=temp.trainFeatures;


dictionary=temp.dictionary;
dictionarySize=size(dictionary,1);
test_labels=test_labels';
train_labels=train_labels';

num = length(test_imagenames);
dist=zeros(num,size(train_labels,2));


for i=1:num
    test_imagenames{i}=strrep(test_imagenames{i},'.jpg','.mat');
    temp=load(['../data/',test_imagenames{i}]);
    wordMap=temp.wordMap;
    % test features
    testFeatures(i,:) = getImageFeatures(wordMap, dictionarySize);
end

SVMStruct = svmtrain(train_labels,histSetHarris,'-t 0 -s 1');
[predict_label,accuracy,prob_estimates] = svmpredict(test_labels,testFeatures,SVMStruct); 



