%Transforms a plane equation from one reference frame {w} to another {c}.
%The plane equation in the original reference {w} frame is:
%   dot(Nw, Xw) - dw = 0
%Points in the new reference frame {c} are obtained by:
%   Xc = R*Xw + t
%The resulting parameters satisfy the equation:
%   dot(Nc, Xc) - dc = 0
%
%Input:
% Nw - [3x1] normal of the plane in reference frame {w}
% dw - [1x1] distance of the plane to the origin in reference frame {w}
% R - [3x3] Rotation matrix to go from {w} to {c}
% t - [3x1] Translation vector to go from {w} to {c}
%
%Output:
% Nc - [3x1] normal of the plane in reference frame {c}
% dc - [1x1] distance of the plane to the origin in reference frame {c}

function [Nc,dc]=getPlaneParamsForCamera(Nw,dw,R,t)
    Nc=R*Nw;
    dc = dw+dot(Nc,t);
end