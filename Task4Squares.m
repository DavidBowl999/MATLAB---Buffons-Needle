function [p, Corner1xArray, Corner1yArray, Corner2xArray, Corner2yArray, Corner3xArray, Corner3yArray, Corner4xArray, Corner4yArray, numeric_array] = BuffonSquaresPi(width,length,throws, maxBoundary)

    crossings = 0;
    SquareCounter = 0;
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
        Corner4xArray = [];
        Corner4yArray = [];

       %SquareX = [x1Array, x2Array, x3Array, x4Array];
       % SquareY = [y1Array, x2Array, x3Array, x4Array];

        for i = 1:throws

            halfLength = length/2;

            
            
            MiddleOfSquarex = rand() * maxBoundary;
            MiddleOfSquarey = rand() * maxBoundary;

            AngleOfSquareToNormal = rand() * 90;

            angleMid1 = (AngleOfSquareToNormal);
            angleMid2 = (AngleOfSquareToNormal + 90);
            angleMid3 = (AngleOfSquareToNormal + 180);
            angleMid4 = (AngleOfSquareToNormal + 270);
        
            % Calculating midpoints of each side of the square
            Midpoint1x = MiddleOfSquarex + halfLength * cosd(angleMid1);
            Midpoint1y = MiddleOfSquarey + halfLength * sind(angleMid1);
        
            Midpoint2x = MiddleOfSquarex + halfLength * cosd(angleMid2);
            Midpoint2y = MiddleOfSquarey + halfLength * sind(angleMid2);
        
            Midpoint3x = MiddleOfSquarex + halfLength * cosd(angleMid3);
            Midpoint3y = MiddleOfSquarey + halfLength * sind(angleMid3);
        
            Midpoint4x = MiddleOfSquarex + halfLength * cosd(angleMid4);
            Midpoint4y = MiddleOfSquarey + halfLength * sind(angleMid4);
        
            % Calculating corners from midpoints
            Corner1x = Midpoint1x + halfLength * cosd(angleMid2);
            Corner1y = Midpoint1y + halfLength * sind(angleMid2);
        
            Corner2x = Midpoint2x + halfLength * cosd(angleMid3);
            Corner2y = Midpoint2y + halfLength * sind(angleMid3);
        
            Corner3x = Midpoint3x + halfLength * cosd(angleMid4);
            Corner3y = Midpoint3y + halfLength * sind(angleMid4);
        
            Corner4x = Midpoint4x + halfLength * cosd(angleMid1);
            Corner4y = Midpoint4y + halfLength * sind(angleMid1);


            
            floorposCorner1 = floor(Corner1x/width);
            floorposCorner2 = floor(Corner2x/width);
            floorposCorner3 = floor(Corner3x/width);
            floorposCorner4 = floor(Corner4x/width);

            if floorposCorner3 > floorposCorner1 || floorposCorner3 < floorposCorner1 || floorposCorner3 > floorposCorner2 || floorposCorner3 < floorposCorner2 || floorposCorner3 > floorposCorner4 || floorposCorner3 < floorposCorner4 || floorposCorner2 > floorposCorner1 || floorposCorner2 < floorposCorner1 || floorposCorner2 > floorposCorner4 || floorposCorner2 < floorposCorner4 || floorposCorner4 > floorposCorner1 || floorposCorner4 < floorposCorner1 
                crossings = crossings + 1;
                numeric_array(i) = 1;
            end

            SquareCounter = SquareCounter + 1;
        

            if SquareCounter < 1000

                Corner1xArray(end + 1) = Corner1x;
                Corner1yArray(end + 1) = Corner1y;
                Corner2xArray(end + 1) = Corner2x;
                Corner2yArray(end + 1) = Corner2y;
                Corner3xArray(end + 1) = Corner3x;
                Corner3yArray(end + 1) = Corner3y;
                Corner4xArray(end + 1) = Corner4x;
                Corner4yArray(end + 1) = Corner4y;


            end
            

        if crossings > 0
            p = (4 * length)/((crossings/throws)*width);
          
        else
            p = 'No lines were crossed'; 
        end


        end

end