function [wordMap] = getVisualWords(I, dictionary, filterBank)
% Convert an RGB or grayscale image to a visual words representation, with each
% pixel converted to a single integer label.   
% Inputs:
%   I:              RGB or grayscale image of size H * W * C
%   filterBank:     cell array of matrix filters used to make the visual words.
%                   generated from getFilterBankAndDictionary.m
%   dictionary:     matrix of size 3*length(filterBank) * K representing the
%                   visual words computed by getFilterBankAndDictionary.m
% Outputs:
%   wordMap:        a matrix of size H * W with integer entries between
%                   1 and K

    % -----fill in your implementation here --------
     len=size(filterBank,1);
     h=size(I,1);
     w=size(I,2);
     imgrsp= extractFilterResponses(I, filterBank);
     imgpoints=reshape(imgrsp,h*w,3*len);
     
     dist=pdist2(dictionary,imgpoints);
     [~,idx]=min(dist);
     wordMap=reshape(idx,h,w);

    
    % ------------------------------------------
end
