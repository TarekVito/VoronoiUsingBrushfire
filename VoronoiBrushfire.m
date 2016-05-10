function [ res ] = VoronoiBrushfire( img )
img = 1-im2bw(img);
I = getDistanceMap(img);
[Gmag, ~] = imgradient(I');
res = Gmag'./max(Gmag(:));
imshow(res);
end

