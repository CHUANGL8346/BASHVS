function S = fusion_contrast_s(x,a)
% x--�ṹ��������Ϣ
% yv,yr--���ؼ���Ϣ
% a--�ֽ����

%% �ṹ������
r=[2,6,12,24,48,96];

S = gradient_f(x,r(a)); %�ṹ������

end