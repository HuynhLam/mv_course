%Plots the image in 3D (assuming it is a plane)
%
%Input:
% K - [3x3] intrinsics matrix
% kc - [2x1] distortion coefficients
% N - [3x1] normal of the calibration plane in camera coordinates
% d - [1x1] distance of the calibration plane to the origin
% im - [NxMx3] rgb image used for calibration (as returned by imread())
% scaleFactor - [1x1] subsampling factor, too large images might cripple
% matlab, use 1/2 or 1/8 to show a subsampled version.
function plotImagePlane(K,kc,N,d,im,scaleFactor)
    imSmall = imresize(im, scaleFactor);
    Ksmall = K*scaleFactor;

    [u,v] = meshgrid(0:size(imSmall,2)-1, 0:size(imSmall,1)-1);
    P = [u(:)'; v(:)'];
    Xn = unprojectPoint(P, Ksmall, kc);
    Xc = intersectRayWithPlane(N,d,Xn);

    Xm = reshape(Xc(1,:), size(u));
    Ym = reshape(Xc(2,:), size(u));
    Zm = reshape(Xc(3,:), size(u));
    surf(Xm,Ym,Zm, imSmall, 'FaceColor', 'texturemap', 'LineStyle','none','DisplayName','Calibration plane')
    hold on

    cornersP = [0,0; size(im,2),0; size(im,2),size(im,1); 0,size(im,1)]'*scaleFactor;
    cornersXn = unprojectPoint(cornersP, Ksmall, kc);
    cornersXc = intersectRayWithPlane(N,d,cornersXn);
    for i=1:4
        plot3([0,cornersXc(1,i)],[0,cornersXc(2,i)],[0,cornersXc(3,i)],'k-');
    end
end