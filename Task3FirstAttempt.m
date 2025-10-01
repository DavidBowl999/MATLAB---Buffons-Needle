function [r, crossings] = BuffonSquaresRootTwo(width, length, throws)
    crossings = 0;

    if length > width
        error('The square side length must be less than or equal to the distance between the edges of the floorboards');
    else
        for i = 1:throws
            MiddleOfSquare = rand() * width;
            AngleOfSquareToNormal = rand() * 90;

            Needle1Midpoint = MiddleOfSquare + (sind(AngleOfSquareToNormal)) * (length/2);
            Needle2Midpoint = MiddleOfSquare + (cosd(AngleOfSquareToNormal)) * (length/2);
            Needle3Midpoint = MiddleOfSquare - (sind(AngleOfSquareToNormal)) * (length/2);
            Needle4Midpoint = MiddleOfSquare - (cosd(AngleOfSquareToNormal)) * (length/2);

            % Check if two consecutive sides of the square intersect with the cracks
            % Make all midpoint values positive and between 0 and the width
            % whilst keeping the distance the same. 

            Needle3Midpoint = abs(Needle3Midpoint);
            Needle4Midpoint = abs(Needle4Midpoint);

            if Needle1Midpoint > width
                Needle1Midpoint = width - (Needle1Midpoint - width);
            end

            if Needle2Midpoint > width
                Needle2Midpoint = width - (Needle2Midpoint - width);
            end

            opposite = sind(AngleOfSquareToNormal) * (length / 2);
            adjacent = cosd(AngleOfSquareToNormal) * (length/2);

            shortestDistanceToEdge1 = min(Needle1Midpoint, width - Needle1Midpoint);
            shortestDistanceToEdge2 = min(Needle2Midpoint, width - Needle2Midpoint);
            shortestDistanceToEdge3 = min(Needle3Midpoint, width - Needle3Midpoint);
            shortestDistanceToEdge4 = min(Needle4Midpoint, width - Needle4Midpoint);


            if adjacent > shortestDistanceToEdge1 && opposite > shortestDistanceToEdge2
                crossings = crossings + 1;
            end

          %  if adjacent > shortestDistanceToEdge1 && adjacent > shortestDistanceToEdge3
          %      crossings = crossings + 1;
          %  end
            if adjacent > shortestDistanceToEdge3 && opposite > shortestDistanceToEdge4
                crossings = crossings + 1;
            end

           % if opposite > shortestDistanceToEdge4 && opposite > shortestDistanceToEdge2
            %    crossings = crossings + 1;
           % end
        end


        % Calculate the estimate of √2

       %pa = (4 * (crossings/throws)*width) / (4 * length);
       %r = (length)/((crossings/throws)*width);

       %r = (length)/(pi*((crossings/throws)));

        ProbConsecutive = crossings/throws;

        crossings = 0;

        for j = 1:throws

            if adjacent > shortestDistanceToEdge1
                crossings = crossings + 1;
            end
            if opposite > shortestDistanceToEdge2
                crossings = crossings + 1;
            end
            if adjacent > shortestDistanceToEdge3
                crossings = crossings + 1;
            end

            if opposite > shortestDistanceToEdge4
                crossings = crossings + 1;
            end

        end
    
    ProbAll = (crossings/throws);

    r = 2 - (ProbConsecutive / ProbAll);





   % Diagonal = length/(sind(2*AngleOfSquareToNormal));

   % p = (4 * (2 * length) - Diagonal)/(ProbB * width);

   % r = 2 * cos(p/4);


       
    
    end

