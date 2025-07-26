clear; close all; clc;

addpath(genpath('data'));
addpath(genpath('HSItools'));
addpath(genpath('S-AD'));
addpath(genpath('NSMLF'));
addpath(genpath('SHVS'));
addpath(genpath('GTF'));

%%
% input SAR
[imagename1, imagepath1] = uigetfile('*.jpg;*.bmp;*.png;*.tif;*.tiff;*.pgm;*.gif','Please choose the first input image');
A = imread(strcat(imagepath1,imagename1));
% input MS
[imagename2, imagepath2] = uigetfile('*.jpg;*.bmp;*.png;*.tif;*.tiff;*.pgm;*.gif','Please choose the second input image'); 
B = imread(strcat(imagepath2,imagename2));

tic;

Y1 = double(A)/255; Y2 = double(B)/255;

figure,imshow(Y1);
show1 = cat(3, Y2(:, :, 3), Y2(:, :, 2), Y2(:, :, 1));% 真彩色显示
figure, imshow(show1);

Y21 = RGB2HSVRS(Y2);
Y2_Y = Y21(:, :, 3);

%% ---------- SEAD Decomposition --------------
[Y1_base, Y2Y_base, Y1_detail, Y2Y_detail, paras] = SAD(Y1, Y2_Y);

detail = NSML_fusion(Y1_detail, Y2Y_detail, paras);
figure,imshow(detail,[]),title('the fusion result of detail layer');

BF = HVS_fusion(uint8(Y2Y_base*255), uint8(Y1_base*255));
BF = double(BF)/255;
figure,imshow(BF,[]),title('the fusion result of base layer');

%% ---------- Multi-scale Combination --------------
MF = BF + detail;
figure, imshow(MF); title('the fusion result of two layers');

Y21(:, :, 3) = MF;
imgf = HSV2RGBRS(Y21);

F = uint8(imgf * 255);

tover = toc;
% time1 = double(tover)-double(tstart);
fprintf('融合一张影像运行时间为: %.2f 秒\n', tover);

%%
show = cat(3, F(:, :, 3), F(:, :, 2), F(:, :, 1));
figure, imshow(show);% 真彩色显示
imwrite(F, 'results/SAD_SHVS.tif');
