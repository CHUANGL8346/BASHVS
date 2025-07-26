function [ss1,ss2] = EigDecBlock(img, sigma)

%    sigma = sigma/2;
    winSize = ceil(sigma*6);
    if ~mod(winSize, 2),
        winSize = winSize + 1;
    end
    
    h = fspecial('gauss', [winSize winSize], sigma);
    
    [hh, ww] = size(img);
    ss = zeros(2, hh, ww);

    dx = real(img);
    dy = imag(img);
    dxx = imfilter(dx.*dx, h, 'symmetric');
    dxy = imfilter(dx.*dy, h, 'symmetric');
    dyy = imfilter(dy.*dy, h, 'symmetric');
    
    A = ones(size(img));
    B = -(dxx+dyy);
    C = dxx.*dyy - dxy.*dxy;
    
    ss1 = abs((-B+sqrt(B.^2-4*A.*C))./(2*A));
    ss2 = abs((-B-sqrt(B.^2-4*A.*C))./(2*A));
    
    
%     V12 = (dxx-dyy + sqrt((dxx-dyy).^2+4*dxy.*dxy))./(2*dxy+eps);
%     
%     
%     postMap = sqrt(squeeze(ss(1, :, :))).*(V12 + 1i)./sqrt(V12.^2+1+eps);
   
end