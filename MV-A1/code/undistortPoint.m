%Undistorts a point
%This code taken directly from OpenCV.
%The forward projection model is:
% r2 = xn(1)^2 + xn(2)^2;
% factor = 1 + kc(1)*r2 + kc(2)*r4;
% xd = factor*xn;
%This function implements the backward projection model.
function xn=undistortPoint(xd, kc)
    kMaxIters = 11;
    k=[0,0,0,0,0,0,0,0,0,0,0,0];
    k(1) = kc(1);
    k(2) = kc(2);

    xn = zeros(size(xd));
    for idx = 1:size(xd,2)
        x = xd(1,idx);
        x0 = x;
        y = xd(2,idx);
        y0 = y;
        for j =0:kMaxIters
            r2 = x*x + y*y;
            icdist = (1 + ((k(8)*r2 + k(7))*r2 + k(6))*r2)/(1 + ((k(5)*r2 + k(2))*r2 + k(1))*r2);
            deltaX = 2*k(3)*x*y + k(4)*(r2 + 2*x*x)+ k(9)*r2+k(10)*r2*r2;
            deltaY = k(3)*(r2 + 2*y*y) + 2*k(4)*x*y+ k(11)*r2+k(12)*r2*r2;
            x = (x0 - deltaX)*icdist;
            y = (y0 - deltaY)*icdist;
        end
        xn(:,idx) = [x;y];
    end
end