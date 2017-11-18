%hsvToLinearSpace
% Converts an array of colors from Matlab's HSV cube to a linear space (i.e. a cone)
%
%Inputs:
% colorsHsv - [Nx3] colors in Matlab's HSV space
%
%Outputs:
% colorLinear - [Nx3] colors in a linear space where Euclidean distances can
% be applied.
function colorLinear=hsvToLinearSpace(colorHsv)
    %---Modify this code---%
    % Tip: Learn the difference between (a*b), (a.*b), and (a*b')
    %      Note that N colors have to be converted. Avoid using a for-loop.
    %      Use matrix operations instead to convert all colors
    %      simultaneously.
    %
    %      Slow and inefficient:
    %       for i=1:size(colorLinear,1)
    %           colorLinear(1,1) = 10*colorHsv(1,1)
    %       end
    %
    %      Good:
    %       colorLinear(:,1) = 10*colorHsv(:,1)
    
    colorLinear(:,1) = colorHsv(:,2).*colorHsv(:,3).*cos(2*pi*colorHsv(:,1));
    colorLinear(:,2) = colorHsv(:,2).*colorHsv(:,3).*sin(2*pi*colorHsv(:,1));
    colorLinear(:,3) = colorHsv(:,3);
    %warning('Ahhhhhhh!!! You must modify this code to complete the assignment!');
    %----------------------%
end