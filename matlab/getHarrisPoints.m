function [points] = getHarrisPoints(I, alpha, k)
% Finds the corner points in an image using the Harris Corner detection algorithm
% Input:
%   I:                      grayscale image
%   alpha:                  number of points
%   k:                      Harris parameter
% Output:
%   points:                    point locations
%
    % -----fill in your implementation here --------
     h=size(I,1);
     w=size(I,2);
     filterBank = createFilterBank();
     R=zeros(h,w);

    % find gradient
    filter1=cell2mat(filterBank(11,1));
    filter2=cell2mat(filterBank(16,1));

%     len=size(filter1,1);
%     padsize=0.5*(len-1);
%     imgpad= padarray(I,[padsize padsize],'replicate');

    Ix=imfilter(I,filter1);
    Iy=imfilter(I,filter2);
    
%     for i=1:h
%         for j=1:w
%             I1=double(imgpad(i:i+len-1,j:j+len-1));
%             temp=I1.*filter1;
%             Ix(i,j)=sum(temp(:));
%             
%             temp1=I1.*filter2;
%             Iy(i,j)=sum(temp1(:));
%         end 
%     end
    

    % calculate gradient of small block
    % use size 5*5
    msize=5;
      for i=1:h-msize+1
        for j=1:w-msize+1
            block_Ix=Ix(i:i+msize-1,j:j+msize-1);
            newIx=double(block_Ix-mean(block_Ix(:)));
            block_Iy=Iy(i:i+msize-1,j:j+msize-1);
            newIy=double(block_Iy-mean(block_Iy(:)));
            H=cov(newIx,newIy);

            R(i+2,j+2)=det(H)-k*(rank(H).^2);
        end
      end
      
    [~,idx]=sort(R(:),'descend');
    idx=idx(1:alpha,1);
    idx_x=floor(idx/h)+1;
    idx_y=rem(idx,h);
    points=[idx_x idx_y];




    % ------------------------------------------

end
