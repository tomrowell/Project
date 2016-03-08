function completeShape = constructShape(shape1, shape2, disparity1, disparity2)
[Label]=bwlabel(shape2,8);
Sdata=regionprops(Label,'BoundingBox'); 
shape2 = imcrop(shape2,Sdata(1).BoundingBox);

[y1,x1] = size(shape1);
[y2,x2] = size(shape2);
shapeTemp = zeros(y1,x1);
shapeTemp(((y1-y2)/2)+disparity2:(((y1-y2)/2))+y2+disparity2-1, ((x1-x2)/2)+disparity1:(((x1-x2)/2))+x2+disparity1-1) = shape2;
completeShape = shape1 + shapeTemp;