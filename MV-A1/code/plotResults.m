%Plots the result of the assignment in 3D.
%
%Input:
% K - [3x3] intrinsics matrix
% kc - [2x1] distortion coefficients
% N - [3x1] normal of the calibration plane in camera coordinates
% d - [1x1] distance of the calibration plane to the origin
% im - [NxMx3] rgb image used for calibration (as returned by imread())
% xn1 - [3x1] back-projected point #1 (unit norm)
% xn2 - [3x1] back-projected point #2 (unit norm)
% xc1 - [3x1] intersection of optical ray #1 and calibration plane
% xc2 - [3x1] intersection of optical ray #3 and calibration plane
function plotResults(K,kc,N,d,im,xn1,xn2,xc1,xc2)
    figure();
    plotImagePlane(K,kc,N,d,im,1/4);

    hold on;
    plot3(0,0,0,'*','DisplayName','Camera center');
    plot3([0,xc1(1)],[0,xc1(2)],[0,xc1(3)],'g*-','DisplayName','Xc1');
    plot3(1e3*[0,xn1(1)],1e3*[0,xn1(2)],1e3*[0,xn1(3)],'g*-','DisplayName','Xn1');
    plot3([0,xc2(1)],[0,xc2(2)],[0,xc2(3)],'b*-','DisplayName','Xc2');
    plot3(1e3*[0,xn2(1)],1e3*[0,xn2(2)],1e3*[0,xn2(3)],'b*-','DisplayName','Xn2');
end