function [shape1, shape2] = formatImages(shape1Image, shape2Image)
shape1Temp = im2bw(imcomplement(imread(shape1Image)));
shape2Temp = im2bw(imcomplement(imread(shape2Image)));

[Label]=bwlabel(shape1Temp,8);
Sdata=regionprops(Label,'BoundingBox'); 
shape1Temp = imcrop(shape1Temp,Sdata(1).BoundingBox);
[Label]=bwlabel(shape2Temp,8);
Sdata=regionprops(Label,'BoundingBox'); 
shape2Temp = imcrop(shape2Temp,Sdata(1).BoundingBox);

[y1,x1] = size(shape1Temp);
[y2,x2] = size(shape2Temp);
maxY = y1+(2*y2);
maxX = x1+(2*x2);
shape1 = zeros(maxY, maxX);
shape2 = zeros(maxY, maxX);
shape1(y2:(y2-1)+y1, x2:(x2-1)+x1) = shape1Temp;
shape2(((y1+y2)/2):(((y1+y2)/2)-1)+y2, ((x1+x2)/2):(((x1+x2)/2)-1)+x2) = shape2Temp;