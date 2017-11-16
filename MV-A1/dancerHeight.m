%% [Assignment #1] Camera calibration * 521466S Machine Vision
% Objectives: 
%       + How to use pinhole camera model(with radical distortion)
%       to measure objects in an image. 
%
% Input:
%       + picture (calib0008.jpg)
%       + calibration.mat
%       + (#include getParamsFromComputerVisionToolbox.m, getPlaneParamsForCamera.m, intersectRayWithPlane.m,
%       plotImagePlane.m, plotResults.m, undistortPoint.m, unprojectPoint.m)
% Output:      
%       + height of the dancer(distance between 2 selected points)
%
% $Id: respiratoryPatterns,v1.0 2017/01/21 16:00:16 lhuynh Exp $

%% Init data and print the calibration parameters
% (The intrinsic matrix K and distortion coeffs kx
%  and the plane parameters for image)
cur_img    = 8; % current image in use
load('calibration.mat');
[K,kc,N,d] = getParamsFromComputerVisionToolbox(calibrationParameters, cur_img);
fprintf('The intrinsic matrix'); 
K
fprintf('The distortion coefficients');
kc
fprintf('The normal vector of the calibration plane'); 
N
fprintf('The distance to the origin of the calibration plane');
d
img        = imread(strcat('calib000',num2str(cur_img),'.jpg'));
imshow(img);

%% Get 2 points from the picture
P1  = ginput(1)'; %select the point mouse/keystroke
Xn1 = unprojectPoint(P1, K, kc); %unproject the selected point
Xc1 = intersectRayWithPlane(N,d,Xn1); %intersect with calibration plane

P2  = ginput(1)';
Xn2 = unprojectPoint(P2, K, kc);
Xc2 = intersectRayWithPlane(N,d,Xn2);

%% Calculate distance and plot geometry results
fprintf('The height of the dancer = %.5f millimeters\n', norm(Xc1 - Xc2));
plotResults(K,kc,N,d,img,Xn1,Xn2,Xc1,Xc2); %plot in 3D

