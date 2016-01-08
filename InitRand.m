function [offsets,distances] = InitRand(A,B,w)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here

tsz=size(A);%size of original image
ssz=size(B);%size of image were we will take patches from

offsets = cat(3,...
    randi([1+w,ssz(1)-w],tsz(1:2)),...
    randi([1+w,ssz(2)-w],tsz(1:2))...
    )-...
    cat(3,repmat((1:tsz(1))',1,tsz(2)),repmat((1:tsz(2)),tsz(1),1));
distances=inf(tsz(1:2));
Apadded=padarray(A,[w,w]);
for i=1:tsz(1)
    for j=1:tsz(2)
        distances(i,j)=sumsqr(reshape(Apadded(i-w+w:i+w+w,j-w+w:j+w+w,:),[],1)-...
            reshape(B(offsets(i,j,1)+i-w:offsets(i,j,1)+i+w,offsets(i,j,2)+j-w:offsets(i,j,2)+j+w,:),[],1));
        
        
    end
end

end

