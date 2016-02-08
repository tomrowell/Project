function shapeCombined = combineShapes(shape1,shape2,outline1, outline2)
%uses the dimensions of the outlines to work out the maximum possible size
%of the combined shapes
[y1,x1] = size(outline1);
[y2,x2] = size(outline2);
maxY = y1+(2*y2);
maxX = x1+(2*x2);

%makes a blank image big enough to fit both shapes together in any
%arrangement
shapeBlank = zeros(maxY,maxX);
shapeOutlines = zeros(maxY,maxX); 

%adds the outline of shape1 onto the blank image in the centre
leftY = y2;
topX = x2;
shapeOutlines(leftY:(leftY-1)+y1,topX:(topX-1)+x1) = outline1;  

%uses the outline of shape2 to find the best fit into shape 1
shapeBest = im2bw(ones(maxY,maxX));
for i = 1:(maxY-y2)
    for j = 1:(maxX-x2)
        shapeTemp = shapeBlank;
        shapeTemp(i:((i-1)+y2),j:((j-1)+x2)) = outline2;
        shapeTemp = shapeTemp + shapeOutlines;
        shapeTemp = im2bw(shapeTemp);
        a = sum(shapeTemp(:));
        b = sum(shapeBest(:));
        disp(a);
        disp(b);
        if (sum(shapeTemp(:)) < sum(shapeBest(:)))
            shapeBest = im2bw(shapeTemp);
            bestY = i;
            bestX = j;
        end
    end
end
shapeCombined = zeros(maxY,maxX);
shapeCombinedPart1 = zeros(maxY,maxX);
shapeCombinedPart2 = zeros(maxY,maxX);
shapeCombinedPart1(leftY:(leftY-1)+y1,topX:(topX-1)+x1) = shape1;
shapeCombinedPart2(bestY:(bestY-1)+y2,bestX:(bestX-1)+x2) = shape2;
shapeCombined = shapeCombinedPart1 + shapeCombinedPart2;