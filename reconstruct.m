
A=imread('a.png');
B=imread('b.png');
psz=3;
w=1;
fprintf('Reconstructing Output Image... ');
reconstImg = zeros(size(A));
for ii = (1+w):psz:size(A,1)-w
    for jj = (1+w):psz:size(A,2)-w
        reconstImg(ii-w:ii+w,jj-w:jj+w,:) = B(offsets(ii,jj,1)+ii-w:offsets(ii,jj,1)+ii+w,offsets(ii,jj,2)+jj-w:offsets(ii,jj,2)+jj+w,:);
    end
end
fprintf('Done!\n');

imagen=uint8(reconstImg);
imshow(imagen)