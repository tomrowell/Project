function main(shape1Image, shape2Image)
[shape1, shape2] = formatImages(shape1Image, shape2Image);

[disparity1, disparity2] = compareVertices(shape1, shape2);

%vertices1 = corner(shape1, 'SensitivityFactor', 0.2);

completeShape = constructShape(shape1, shape2, disparity1, disparity2);

figure;
imshow(completeShape);
%hold on;
%plot(vertices1(:,1), vertices1(:,2), '*', 'Color', 'c');
%hold off