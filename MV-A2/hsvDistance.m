%hsvDistance
%Calculates the distance between a set of colors and a reference color in the HSV space.

%Inputs:
% colors - [Nx3] hsv color
% ref - [1x3] hsv color

%Outputs:
% returns [Nx1] the distance between each entry in the colors a and b.
%         dist(i) should be the distance between colors a(i,:) and b(i,:)
function dist=hsvDistance(colors,ref)
    %---Modify this code---%
    % Tip: do not use for-loops. Use matrix operations instead.
    %      Use repmat() to duplicate the reference color and have two
    %      matrices of the same size.
    
    % Transform to linear space
    colorsHsvLinear = hsvToLinearSpace(colors);
    refHsvLinear    = hsvToLinearSpace(ref); %ref [1x3]
    
    %Calculate distance in linear space, using L2-norm model
    refHsvColorMat  = repmat(refHsvLinear, size(colorsHsvLinear,1),1); %Duplicate ref matrix with [Nx3]
    dist            = sum((colorsHsvLinear-refHsvColorMat).^2,2).^0.5; %Sum along dimension 2 in 2-d matrix[row x column]
    
    %dist = rand(size(colors,1),1);
    %warning('Ahhhhhhh!!! You must modify this code to complete the assignment!');
    %----------------------%
end