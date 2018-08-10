% load data/fashion/fashionmnisttest.mat
% test_A0 = head(fashionmnisttest(fashionmnisttest.label==2,:),100);
% n1 = Index(28);% pixel
% n2 =Index(28);% pixel 
%  
% 
%  
%  
% % for k = 1:1
% %     for i = 1:28
% %         for j = 1:28
% %             T.data(i,j)=test_A0{k,(i*j)+1};
% %         end
% %     end
% %     
% % end
%   cp.CountingMatrix
 
% load data/fashion/fashionmnisttest.mat
% test_A0 = fashionmnisttest(fashionmnisttest.label==1,:) ;
% height(test_A0)
% X=squeeze(model8.factorization_model{1, 1}.data(:,:,1));
% figure
% imshow(X)


%  U1=squeeze(model6.Z_alpha(1,1).data( :,1,1,:));% *core*
%  U2=permute(squeeze(model2.Z_alpha(1,2).data( 1,:,1,1,:)),[2,1]);
%  re= U1 *squeeze(core6(1,:,:))* U2 ;
 r=A8.data(:,:,class8_scores{1,1})
 figure
 imshow(r)
 
 r=A8.data(:,:,class8_scores{1100,1})
 figure
 imshow(r)
 
 r=A8.data(:,:,class8_scores{2000,1})
 figure
 imshow(r)

% figure
% imshow(X)
