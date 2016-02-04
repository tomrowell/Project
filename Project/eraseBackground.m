function [shapeNoBg, shapeOutline] = eraseBackground (shape)
shapeBg = imcomplement(im2bw(shape)); %converts input to binary image and inverts colours

se = strel('disk', 1); %creates a structuring element
shapeOutline = (imdilate(shapeBg, se)) - shapeBg; %creates the outline of the image

[Label]=bwlabel(shapeOutline,8); %labels the outline component
Sdata=regionprops(Label,'BoundingBox'); %draws a box around the labelled component
shapeOutline = imcrop(shapeOutline,Sdata(1).BoundingBox); %crops the image outline based on the box
shapeNoBg = imcrop(shapeBg,Sdata(1).BoundingBox);