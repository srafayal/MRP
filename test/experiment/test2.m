% % load data/fashion/fashionmnisttrain.mat
% % size(fashionmnisttrain)
% training_A0 = fashionmnisttrain(fashionmnisttrain.label==0,:);
% % height(fashionmnisttrain)
%  val1= training_A0(1,1)
%  val1{1,1}

 U1=squeeze(model1.Z_alpha(1,1).data( :,1,1,:));% *core*
               U2=permute(squeeze(model1.Z_alpha(1,2).data( 1,:,1,1,:)),[2,1]);
               re=abs(pinv(U1)*T.data*pinv(U2 ));
