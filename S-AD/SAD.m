function [A_base, B_base, A_detail, B_detail, paras] = SAD(A,B)

%% Parameter Setting
% S-AD parameters
num_iter = 30;  %iteration number
delta_t = 1/30000;
kappa = 20;       %or computing by canny operator

[hei, wid] = size(A);
B_base = zeros(hei, wid);
B_detail = zeros(hei, wid);
A_base = zeros(hei, wid);
A_detail = zeros(hei, wid);

%-------------------------------------image concat------------------------------------%

for x = 1:hei
    for y = wid+1:wid*2
        B(x,y) = A(x,y-wid);
    end
end

%---------------------------------------Decomposition--------------------------------------%
[cN1,cS1,cW1,cE1,cNE1,cSE1,cSW1,cNW1,base] = anisodiff2D(B,num_iter,delta_t,kappa,2,1);% 最后一个是α
detail = double(B)-base;

%---------------------------------------Split--------------------------------------%
for x = 1:hei
    for y = 1:wid
        B_base(x,y) = base(x,y);
        B_detail(x,y) = detail(x,y);
        A_base(x,y) = base(x,y+wid);
        A_detail(x,y) = detail(x,y+wid);
    end
end

paras.cN1 = cN1; paras.cS1 = cS1; paras.cW1 = cW1; paras.cE1 = cE1;
paras.cNE1 = cNE1; paras.cSE1 = cSE1; paras.cSW1 = cSW1; paras.cNW1 = cNW1;
end