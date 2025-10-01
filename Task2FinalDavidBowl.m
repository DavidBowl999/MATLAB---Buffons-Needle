function [p,crossings] = BuffonSquaresPi(width,length,throws)

    crossings = 0;

if length > width

    p = 'The needle lengths must be less than or equal to the distance between the edges of the floorboards';

    else

        for i = 1:throws

            
            
            MiddleOfSquare = rand() * width;
            AngleOfSquareToNormal = rand() * 90;

            Needle1Midpoint = MiddleOfSquare + (sind(AngleOfSquareToNormal)) * (length/2);
            Needle2Midpoint = MiddleOfSquare + (cosd(AngleOfSquareToNormal)) * (length/2);
            Needle3Midpoint = MiddleOfSquare - (sind(AngleOfSquareToNormal)) * (length/2);
            Needle4Midpoint = MiddleOfSquare - (cosd(AngleOfSquareToNormal)) * (length/2);
                

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

        if crossings > 0
            p = 4 * (2 * length)/((crossings/throws)*width);

        else
            p = 'No lines were crossed'; 
        end


        end

end