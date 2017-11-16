%Intersects an optical ray with a plane. The optical ray passes through the
%origin ([0,0,0]') and the given point (Xn). The plane parameters represent
%the plane equation: dot(N,X)-d=0. A point (Xc) is returned that belongs to
%the optical ray and the plane.
%
%Input:
% N - [3x1] normal of the plane
% d - [1x1] distance of the plane to the origin
% Xn - [3x1] Point along the optical ray
%
%Output:
% Xc - [3x1] Intersection between the optical ray and the plane

function Xc=intersectRayWithPlane(N,d,Xn)

if(size(Xn,1)==2)
    Xn(3,:) = 1;
end
w = d ./ (N(1)*Xn(1,:)+N(2)*Xn(2,:)+Xn(3,:)*N(3));
Xc = Xn.*repmat(w,3,1);