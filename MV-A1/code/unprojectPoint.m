%Back-projects a point using the pin-hole camera model (with radial
%distortion). The point is back projected onto the unit sphere, i.e. the
%norm of the resulting point is 1 and implicitly describes an optical ray
%that goes from the origin (center of the camera) and through the resulting
%point Xn.
%
%Input:
% P - [2x1] Point in pixel coordinates [u;v]
% K - [3x3] Intrinsic matrix of the camera
% kc - [2x1] Radial distortion coefficients
%
%Output:
% Xn - [3x1] Point along the optical ray with unit norm.

function Xn=unprojectPoint(P, K, kc)
Xd(1,:) = (P(1,:)-K(1,3))/K(1,1);
Xd(2,:) = (P(2,:)-K(2,3))/K(2,2);
Xn = undistortPoint(Xd, kc);

Xn(3,:) = 1;
XnNorm = sum(Xn.^2).^0.5;
Xn = Xn./repmat(XnNorm,3,1);