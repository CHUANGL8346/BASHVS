function image =  image_imread(Path)
base=2;
img_r = double((imread(Path)));
[m,n,c]=size(img_r);
if c == 3
    img_r = img_r(:,:,1);
end
img_m = 255/(max(img_r(:))-min(img_r(:)))*(img_r-min(img_r(:))); 
image = img_m/255;
pr = rem(m,base);
pc = rem(n,base);
if pr ~= 0
    image = padarray(image,[base-pr 0],'post');
end
if pc ~= 0
    image = padarray(image,[0 base-pc],'post');
end
end