function [bestDisparity1, bestDisparity2] = compareVertices(shape1, shape2)
vertices1 = corner(shape1, 'SensitivityFactor', 0.2);
vertices2 = corner(shape2, 'SensitivityFactor', 0.2);

bestCount = 0;
bestDisparity1 = 0;
bestDisparity2 = 0;

for i = 1:length(vertices1)
   for j = 1:length(vertices2)
      vertices2Temp = vertices2;
      counter = 0;
       
      disparity1 = vertices1(i, 1) - vertices2(j, 1);
      disparity2 = vertices1(i, 2) - vertices2(j, 2);
      for k = 1:length(vertices2Temp)
         vertices2Temp(k, 1) = vertices2Temp(k, 1) + disparity1;
         vertices2Temp(k, 2) = vertices2Temp(k, 2) + disparity2;
      end
       
      for m = 1:length(vertices1)
         for n = 1:length(vertices2Temp)
            if ((vertices2Temp(n, 1)-3 <= vertices1(m, 1) && vertices1(m, 1) <= vertices2Temp(n, 1)+3) && (vertices2Temp(n, 2)-3 <= vertices1(m, 2) && vertices1(m, 2) <= vertices2Temp(n, 2)+3))
            %if (((vertices1(m, 1) == vertices2Temp(n, 1)) || (vertices1(m, 1) == vertices2Temp(n, 1)+1) || (vertices1(m, 1) == vertices2Temp(n, 1)-1)) && (((vertices1(m,2) == vertices2Temp(n, 2)) || (vertices1(m,2) == vertices2Temp(n, 2)+1) || (vertices1(m,2) == vertices2Temp(n, 2)-1))))
               if (m ~= i || n ~= j)
                  counter = counter + 1;
                  if (counter > bestCount)
                     bestCount = counter;
                     bestDisparity1 = disparity1;
                     bestDisparity2 = disparity2;
                  end
               end
            end
         end
      end
   end
end