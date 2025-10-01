function [p,crossings] = BuffonStandardPi(width,length,throws)

    crossings = 0;

if length > width

    p = 'The needle must be less than or equal to the distance between the edges of the floorboards';

    else

        for i = 1:throws
            
            PlaceOnFloor = rand() * width;
            Edge1Distance = PlaceOnFloor;
            Edge2Distance = width - PlaceOnFloor;

            if Edge2Distance > Edge1Distance
                ShortestDistanceToEdge = Edge1Distance;
            elseif Edge1Distance > Edge2Distance
                ShortestDistanceToEdge = Edge2Distance;
            else
                ShortestDistanceToEdge = Edge1Distance;
            end


            AngleOfNeedleToParallel = rand() * 180;
            Opposite = sind(AngleOfNeedleToParallel) * (length/2);

            if Opposite > ShortestDistanceToEdge
                crossings = crossings + 1; 
            end
        end
   
        if crossings > 0
            p = (2 * length)/((crossings/throws)*width);
        else
            p = 'No lines were crossed'; 
        end
        
end