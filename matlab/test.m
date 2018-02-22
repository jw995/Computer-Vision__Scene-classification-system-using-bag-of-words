clc;
clear;
close all hidden;

I=imread('../data/campus/sun_bqdonmainqnkdcoj.jpg');
load('dictionaryHarris.mat');

[filterBank] = createFilterBank();
% [filterResponses] = extractFilterResponses(I, filterBank);
[wordMap] = getVisualWords(I, dictionary, filterBank);
RGB = label2rgb(wordMap);
figure;
imshow(RGB);


alpha=500;
k=0.05;
I1=double(rgb2gray(I));

randpoints = getRandomPoints(I1, alpha);
figure;
imshow(I);
hold on;
plot(randpoints(:,1),randpoints(:,2),'b.','Markersize',8);

points = getHarrisPoints(I1, alpha, k);
figure;
imshow(I);
hold on;
plot(points(:,1),points(:,2),'b.','Markersize',8);






