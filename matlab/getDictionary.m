function [dictionary] = getDictionary(imgPaths, alpha, K, method)
% Generate the filter bank and the dictionary of visual words
% Inputs:
%   imgPaths:        array of strings that repesent paths to the images
%   alpha:          num of points
%   K:              K means parameters
%   method:         string 'random' or 'harris'
% Outputs:
%   dictionary:         a length(imgPaths) * K matrix where each column
%                       represents a single visual word
    % -----fill in your implementation here --------
    k=0.05;
    [filterBank] = createFilterBank();
   
    % read image
    for i=1:size(imgPaths,2)
        Paths=char(imgPaths(1,i));
   
        filename=['../data/',Paths];
        I=imread(filename);
%         I1=double(rgb2gray(I));

        % apply filter bank
        [filterResponses] = extractFilterResponses(I, filterBank);

        % choose alpha points 
        if (method == 'random')
            points = getRandomPoints(I, alpha);
        elseif (method == 'harris')
            points = getHarrisPoints(I, alpha, k);
        else 
            disp('Wrong input in terms of method,try random or harris.');
        end
        
        pixelRes=filterResponses(points(:,2),points(:,1),:);
        for j=1:alpha
            idx=(i-1)*alpha+j;
            temp=pixelRes(j,j,:);
            pixelResponses(idx,:)=squeeze(temp)';
        end
        
%         for j=1:alpha
%             idx=(i-1)*alpha+j;
%             pixelRes=filterResponses(points(j,2),points(j,1),:);
%             pixelResponses(idx,:)=squeeze(pixelRes)';
%         end
    end
     
    [~, dictionary] = kmeans(pixelResponses, K,'EmptyAction','drop');
    
    % ------------------------------------------
    
end
