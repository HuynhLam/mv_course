%Converts Matlab's computer vision toolbox calibration parameters to our
%notation.
%
%Input:
% cameraParameters - [struct] produced by the calibration app.
% imageIndex - [int] the index of the image for which to generate the plane
%parameters.
%
%Output:
% K - [3x3] Intrinsics matrix that transforms a vector in metric units to
%pixel units (i.e. Xp = K*Xm)
% kc - [1x2] Distortion coeficients.
% N - [3x1] The normal vector of the calibration plane in camera coordinates
% d - [1x1] The distance to the origin of the calibration plane in camera
%coordinates. The plane equation is then N'*X-d=0.
function [K,kc,N,d]=getParamsFromComputerVisionToolbox(cameraParameters, imageIndex)
K = cameraParameters.IntrinsicMatrix';
kc = cameraParameters.RadialDistortion(1:2);

R = cameraParameters.RotationMatrices(:,:,imageIndex)';
t = cameraParameters.TranslationVectors(imageIndex,:)';
[N,d]=getPlaneParamsForCamera([0,0,1]',0,R,t);
