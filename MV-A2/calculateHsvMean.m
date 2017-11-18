%calculateHsvMean
%Calculates the mean color from a set of colors in HSV space.
%
%Inputs:
% colors - [Nx3] input colors
%
%Outputs:
% hsvMean - [1x3] mean color
function [hsvMean] = calculateHsvMean(colors)
    %---Modify this code---%
    
    colorsLinear = hsvToLinearSpace(colors); %transform to linear space
    meanColorsLinear = mean(colorsLinear, 1); %get mean in linear space
    %transform back to hsv space
    hsvMean(:,1) = mod(atan2(meanColorsLinear(:,2), meanColorsLinear(:,1))/(2*pi),1);
    hsvMean(:,2) = (meanColorsLinear(:,1).^2 + meanColorsLinear(:,2).^2).^0.5/meanColorsLinear(:,3);
    hsvMean(:,3) = meanColorsLinear(:,3);
    
    %hsvMean = mean(colors);
    %warning('Ahhhhhhh!!! You must modify this code to complete the assignment!');
    %----------------------%
end