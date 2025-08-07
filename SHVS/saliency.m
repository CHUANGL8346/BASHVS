function y=saliency(x,r)

[hei, wid] = size(x);
N = boxfilter(ones(hei, wid), r);
mean_xx = boxfilter(x.^2,r);
mean_x = boxfilter(x,r);
y = abs(mean_xx-2*x.*mean_x+(x.^2).*N);

end