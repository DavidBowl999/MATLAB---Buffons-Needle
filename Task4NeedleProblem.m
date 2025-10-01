function [p,crossings, x1Array, y1Array, x2Array, y2Array, numeric_array] = BuffonStandardPi(width,length,throws, maxBoundary, NumberOfFloorboards)

    crossings = 0;
    NeedleCounter = 0;

    array_length = throws;
    numeric_array = zeros(1, array_length);


if length > width

    p = 'The needle must be less than or equal to the distance between the edges of the floorboards';

else

        x1Array =[];
        y1Array =[];
        x2Array =[];
        y2Array =[];

        for i = 1:throws
            
            PlaceOnFloorx = rand() * maxBoundary;
            PlaceOnFloory = rand() * maxBoundary;



            AngleOfNeedleToParallel = rand() * 180;
            Opposite = sind(AngleOfNeedleToParallel) * (length/2);
            Adjacent = cosd(AngleOfNeedleToParallel) * (length/2);



            x1 = PlaceOnFloorx + Adjacent;
            y1 = PlaceOnFloory + Opposite;
            x2 = PlaceOnFloorx - Adjacent;
            y2 = PlaceOnFloory - Opposite;

            FloorPos1 = floor(x1/width);  
            FloorPos2 = floor(x2/width);

            if FloorPos1 > FloorPos2 || FloorPos1 < FloorPos2
                crossings = crossings + 1; 
                numeric_array(i) = 1;
            end 


          %  if Opposite > ShortestDistanceToEdge
            %    crossings = crossings + 1; 
            %    numeric_array(i) = 1;
          %  end

            NeedleCounter = NeedleCounter + 1;
        

            if NeedleCounter < 1000

                x1Array(end + 1) = x1;
                y1Array(end + 1) = y1;
                x2Array(end + 1) = x2;
                y2Array(end + 1) = y2;


            end

        end
   
        if crossings > 0
            p = (2 * length)/((crossings/throws)*width);
        else
            p = 'No lines were crossed'; 
        end
        
end