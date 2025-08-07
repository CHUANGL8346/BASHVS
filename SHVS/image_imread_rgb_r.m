function image =  image_imread_rgb_r(Path)
base=2;
img_r = imread(Path); 
[~,~,p]=size(img_r);
if p~=1
    img_r = img_r(:,:,1);
end
img_r = double(img_r); 
img_m = 255/(max(img_r(:))-min(img_r(:)))*(img_r-min(img_r(:))); 
image = img_m/255;
[m,n]=size(image);
pr = rem(m,base);
pc = rem(n,base);
if pr ~= 0
    image = padarray(image,[base-pr 0],'post');
end
if pc ~= 0
    image = padarray(image,[0 base-pc],'post');
end
end