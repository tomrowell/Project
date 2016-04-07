function main(varargin)

for i = 1:nargin
    varargin{i} = imread(varargin{i});
end

for i = 1:nargin-1
    [shape1, shape2] = formatImages(varargin{i}, varargin{i+1});

    [disparity1, disparity2] = compareVertices(shape1, shape2);

    varargin{i+1} = imcomplement(constructShape(shape1, shape2, disparity1, disparity2));
end

vertices1 = corner(varargin{nargin}, 'SensitivityFactor', 0.2);

figure;
imshow(varargin{nargin});
hold on;
plot(vertices1(:,1), vertices1(:,2), '*', 'Color', 'c');
hold off