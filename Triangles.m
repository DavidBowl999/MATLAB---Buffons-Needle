function [p, Corner1xArray, Corner1yArray, Corner2xArray, Corner2yArray, Corner3xArray, Corner3yArray, numeric_array] = BuffonSquaresPi(width,length,throws, maxBoundary)

    crossings = 0;
    TriangleCounter = 0;
    numeric_array = zeros(1, throws);

if length > width

    p = 'The needle lengths must be less than or equal to the distance between the edges of the floorboards';

else


        Corner1xArray = [];
        Corner1yArray = [];
        Corner2xArray = [];
        Corner2yArray = [];
        Corner3xArray = [];
        Corner3yArray = [];

        for i = 1:throws

            halfLength = length/2;

            
            MiddleOfTrianglex = rand() * maxBoundary;
            MiddleOfTriangley = rand() * maxBoundary;

            AngleOfSquareToNormal = rand() * 120;

            angleMid1 = (AngleOfSquareToNormal);
            angleMid2 = (AngleOfSquareToNormal + 120);
            angleMid3 = (AngleOfSquareToNormal + 240);
                        
        
            % Calculating midpoints of each side of the Triangle
            Midpoint1x = MiddleOfTrianglex + halfLength * cosd(angleMid1);
            Midpoint1y = MiddleOfTriangley + halfLength * sind(angleMid1);
        
            Midpoint2x = MiddleOfTrianglex + halfLength * cosd(angleMid2);
            Midpoint2y = MiddleOfTriangley + halfLength * sind(angleMid2);
        
            Midpoint3x = MiddleOfTrianglex + halfLength * cosd(angleMid3);
            Midpoint3y = MiddleOfTriangley + halfLength * sind(angleMid3);
        
            % Calculating corners from midpoints
            Corner1x = Midpoint1x + halfLength * cosd(angleMid1);
            Corner1y = Midpoint1y + halfLength * sind(angleMid1);
        
            Corner2x = Midpoint2x + halfLength * cosd(angleMid2);
            Corner2y = Midpoint2y + halfLength * sind(angleMid2);
        
            Corner3x = Midpoint3x + halfLength * cosd(angleMid3);
            Corner3y = Midpoint3y + halfLength * sind(angleMid3);

            
            floorposCorner1 = floor(Corner1x/width);
            floorposCorner2 = floor(Corner2x/width);
            floorposCorner3 = floor(Corner3x/width);
            

            if floorposCorner3 > floorposCorner1 || floorposCorner3 < floorposCorner1 || floorposCorner3 > floorposCorner2 || floorposCorner3 < floorposCorner2  || floorposCorner2 > floorposCorner1 || floorposCorner2 < floorposCorner1  
                crossings = crossings + 1;
                numeric_array(i) = 1;
            end

            TriangleCounter = TriangleCounter + 1;
        

            if TriangleCounter < 1000

                Corner1xArray(end + 1) = Corner1x;
                Corner1yArray(end + 1) = Corner1y;
                Corner2xArray(end + 1) = Corner2x;
                Corner2yArray(end + 1) = Corner2y;
                Corner3xArray(end + 1) = Corner3x;
                Corner3yArray(end + 1) = Corner3y;


            end
            

        if crossings > 0
            p = (2 * length)/((crossings/throws)*width);
          
        else
            p = 'No lines were crossed'; 
        end


        end

end