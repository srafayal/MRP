% % % % A0_C=permute(model.Z_alpha(1,3).data,[1 3 2 4 5 ]);
% % A0_C1= model.Z_alpha(1,3).data(:,:,1,:,:);
% % A0_C=permute(A0_C1,[1 2 3 5 4 ]);
% % 
% % core=zeros(5,6);
% %  
% %     for i = 1:5
% %         for j = 1:6
% %             core(i,j)=A0_C(:,:,1,j,i);
% %         end
% %     end
% %     
% %  core
% % %  rng('default') % For reproducibility
% % % X = rand(3,2);
% % % Y = rand(3,2);
% % % D = pdist2(X,Y)
% % % 
% % % X1 = rand(3,2);
% % % Y1 = rand(3,2);
% % % 
% % %  D1 =  core-Y1
% 
% 
% X = rand(3,3);
% Y = rand(3,3);
% norm(Y, 'fro')
%  D = pdist2(norm(X, 'fro'),norm(Y, 'fro'),'euclidean')
% % D1=X-Y
% % C = (X < Y)
% % sum(C(:) == 1)
% % if(X>Y)
% %     disp('X')
% % end
% % if(X<Y)
% %     disp('Y')
% % end
% % 
% % 
%  core0= squeeze(squeeze(model0.Z_alpha(1,3).data)) 
%  
%  size(core0)
% %  A0_C=permute(A0_C1,[1 2 3 5 4 ]);
% % core=A0_C(:,:,1,j,i);
 
% cp = classperf(results(:,2),results(:,1));
% cp.CorrectRate % queries for the correct classification rate
% cp.CountingMatrix

clear all;
tft_clear();
load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A0.mat')
fold_no=5;
st_index=0; 
n1 = Index(28);% pixel
n2 =Index(28);% pixel 
n3 = Index(4800); % number of images
FA1 = Tensor( n1, n2,n3 );
index=1;
for i = 1:4
    if(fold_no==i)
        st_index=st_index+1200;
    end
    st_index=st_index+1;
    end_index=st_index+1199;
    FA1.data(:,:,(( i-1)*1200)+1:((i-1)*1200)+1200) = A0.data(:,:,st_index:(end_index));
    st_index=end_index;
    
end
save('C:\Users\srafayal\Desktop\MRP\tft-master\test\experiment\fold_1\model0.mat',variables)

 