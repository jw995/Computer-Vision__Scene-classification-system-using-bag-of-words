% buildRecognitionSystem.m
% This script loads the visual word dictionary 
% (in dictionaryRandom.mat or dictionaryHarris.mat) and processes
% the training images so as to build the recognition system. The result is
% stored in visionRandom.mat and visionHarris.mat.

clc;
clear;
close all hidden;

[filterBank] = createFilterBank();

% choose your dictionary here
temp=load('dictionaryRandom.mat');
% temp=load('dictionaryHarris.mat');

dictionary=temp.dictionary;
dictionarySize=size(dictionary,1);

% comment this part if already have .mat file for each image
% batchToVisualWords(2);

load('traintest.mat','train_imagenames','train_labels');
train_labels=train_labels';

num = length(train_imagenames);
trainFeatures=zeros(num, dictionarySize);
for i=1:num
    train_imagenames{i}=strrep(train_imagenames{i},'.jpg','.mat');
    temp=load(['../data/',train_imagenames{i}]);
    wordMap=temp.wordMap;
    trainFeatures(i,:) = getImageFeatures(wordMap, dictionarySize);
end


% save('visionHarris.mat','dictionary', 'filterBank', 'trainFeatures', 'train_labels');
save('visionRandom.mat','dictionary', 'filterBank', 'trainFeatures', 'train_labels');

