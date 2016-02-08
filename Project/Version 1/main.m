function main (shapeImage1, shapeImage2)
[shape1,shape1Outline] = eraseBackground(imread(shapeImage1));
[shape2,shape2Outline] = eraseBackground(imread(shapeImage2));


shape3 = imcomplement(combineShapes(shape1,shape2,shape1Outline,shape2Outline));


figure;
imshow(shape3);

