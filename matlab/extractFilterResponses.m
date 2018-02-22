function [filterResponses] = extractFilterResponses(I, filterBank)
% CV Spring 2018 - Provided Code
% Extract the filter responses given the image and filter bank
% Pleae make sure the output format is unchanged.
% Inputs:
%   I:                  a 3-channel RGB image with width W and height H
%   filterBank:         a cell array of N filters
% Outputs:
%   filterResponses:    a W*H x N*3 matrix of filter responses


    %Convert input Image to Lab
    doubleI = double(I);
    if length(size(doubleI)) == 2
        tmp = doubleI;
        doubleI(:,:,1) = tmp;
        doubleI(:,:,2) = tmp;
        doubleI(:,:,3) = tmp;
    end
    [L,a,b] = RGB2Lab(doubleI(:,:,1), doubleI(:,:,2), doubleI(:,:,3));
    % L for brightness (from white to black, range 1-100), 
    % a from green to magenta, range -500~500
    % b from blue to yellow, range -200~200
    h = size(I,1);
    w = size(I,2);

   
    % -----fill in your implementation here --------
     filterResponses=zeros(h,w,3*size(filterBank,1));
    
for n=1:size(filterBank,1)
    
    idx=(n-1)*3;
    filter1=cell2mat(filterBank(n,1));
    filterResponses(:,:,idx+1)=imfilter(L,filter1);
    filterResponses(:,:,idx+2)=imfilter(a,filter1);
    filterResponses(:,:,idx+3)=imfilter(b,filter1);
    
%     len=size(filter1,1);
%     padsize=0.5*(len-1);
%     
%     imgpad= padarray(doubleI,[padsize padsize],'replicate');
%     L0=imgpad(:,:,1);
%     a0=imgpad(:,:,2);
%     b0=imgpad(:,:,3);

%     for i=1:h
%         for j=1:w
%             L1=L0(i:i+len-1,j:j+len-1);
%             temp1=L1.*filter1;
%             L2(i,j)=sum(temp1(:));
%             
%             a1=a0(i:i+len-1,j:j+len-1);
%             temp2=a1.*filter1;
%             a2(i,j)=sum(temp2(:));
%             
%             b1=b0(i:i+len-1,j:j+len-1);
%             temp3=b1.*filter1;
%             b2(i,j)=sum(temp3(:));
%             idx=(n-1)*3;
%             filterResponses(:,:,idx+1)=L2;
%             filterResponses(:,:,idx+2)=a2;
%             filterResponses(:,:,idx+3)=b2;
%         end 
%     end

end

    % ------------------------------------------
end
