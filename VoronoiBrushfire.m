function [ res ,I] = VoronoiBrushfire( img )
img = 1-im2bw(img);

% considering the boundaries as an obstacle
img(size(img,1),:) = 1;
img(1,:) = 1;
img(:,size(img,2)) = 1;
img(:,1) = 1;

I = getDistanceMap(img);
imshow(I);
[Gmag, ~] = imgradient(I');
res = Gmag'./max(Gmag(:));
imshow(res);
end

