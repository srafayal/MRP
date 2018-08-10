core= squeeze(squeeze(model.Z_alpha(1,4).data));
g1=core(:,:,2)

  U1=squeeze(model.Z_alpha(1,1).data( :,1,1,:));% *core*
  U2= squeeze(model.Z_alpha(1,2).data( 1,:,1,1,:));
  U3=squeeze(model.Z_alpha(1,3).data( 1,1,:,1,1,:));
  X_hat= model.X_hat_tensors.data(:,:,:);
  
  
  
  
% %   % % %Generate hat
% % X_hat_check=zeros(28,28);
% % res4=0.0;
% % for i = 1:28
% %     for j = 1:28
% %         res4=0.0;
% %         for  pp = 1:5
% %             for qq = 1:6
% %                 for rr = 1:7
% %                   res4=res4+core(pp,qq,rr)* (U1( i,pp)*U2(j,qq)*U3(2,rr) );
% %                 end
% %             end
% %         end
% % %         display(j);
% %         X_hat_check(i,j)=res4;
% %     end
% % end


 % % %Generate Core
U1= pinv(U1);
U2= pinv(U2);
U3= pinv(U3);
core_check=zeros(5,6);
res4=0.0;
 
        res4=0.0;
for  pp = 1:5
    for qq = 1:6
        for rr = 2:2
            res4=0.0;
            for i = 1:28
                 for j = 1:28
                     for k = 1:100
                      res4=res4+X_hat(i,j,k)* (U1( pp,i)*U2( qq,j)*U3(rr,k) );
                     end
                end
            end
        end
        core_check(pp,qq)=res4;
    end
end



  
%   

%   re3=zeros(28,28);
%   
%   K=g1*U1*U2*U3;

% % h= model.X_hat_tensors.data(:,:,1)
% % %%%%%%%%%%%%%%%%%Original_X*************** 
% % X=squeeze(model.X_hat_tensors.data(:,:,1));
% % figure
% % imshow(X)
% %   