function detail = NSML_fusion(A,B,paras)

%% Parameter Setting
cN1=paras.cN1;cS1=paras.cS1;cW1=paras.cW1;cE1=paras.cE1;
cNE1=paras.cNE1;cSE1=paras.cSE1;cSW1=paras.cSW1;cNW1=paras.cNW1;

%---------------------------------------Detail Fusion---------------------------------------%
detail = NSML(B,A,cN1,cS1,cW1,cE1,cNW1,cSE1,cNE1,cSW1,cN1,cS1,cW1,cE1,cNW1,cSE1,cNE1,cSW1);
end