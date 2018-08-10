% % % % re1=zeros(28,28);
% % % % for i = 1:28
% % % %     for j = 1:28
% % % %         re1(i,j)=model.X_hat_tensors.data(i,j,1);
% % % %     end
% % % % end
% % 
% % 

% %  
% % %Generate hat
% % re3=zeros(28,28);
% % res4=0.0;
% % for i = 1:28
% %     for j = 1:28
% %         res4=0.0;
% %         for  pp = 1:5
% %             for qq = 1:6
% % %                 display(B.data(:,j,1,1,qq))
% %                 res4=res4+core(pp,qq)* (model.Z_alpha(1,1).data( :,1,1,pp)*model.Z_alpha(1,2).data(:,qq,1,1,:) );
% %             end
% %         end
% % %         display(j);
% %         re3(i,j)=res4;
% %     end
% % end
% % 
% %%%%%%%%%%%%%%%%%%X_hat***************  
%    core= squeeze(squeeze(model0.Z_alpha(1,3).data));
%    core99=squeeze(core(1,:,:))
%  U1=squeeze(model0.Z_alpha(1,1).data( :,1,1,:));% *core*
%  U2=permute(squeeze(model0.Z_alpha(1,2).data( 1,:,1,1,:)),[2,1]);
%  K=U1*squeeze(core(1,:,:))*U2;
% figure
% imshow(K)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%Original_X*************** 
X=squeeze(model8.X_hat_tensors.data(:,:,1));
figure
imshow(X)

%%%%%%%%%%%%%%%%%%%%%%Or%%%%%%%%%%%%%%%%
% K = squeeze(A0.data(:,:,1))
% figure
% imshow(K)

%%%%%%%%%%%%%%%%%%%%%%   Test Original X%%%%%%%%%%%%%%%%
% K = squeeze(T.data(:,:,1))
% figure
% imshow(K)


%  abs(pinv(U1)*w1*pinv(U2 ))
%  
