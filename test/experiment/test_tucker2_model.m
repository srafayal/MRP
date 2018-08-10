%A0_A=permute(model.Z_alpha(1,1).data,[2 1 3 4]);
% A0_B=permute(model.Z_alpha(1,2).data,[2 1 3 4 5]);
% A0_C=permute(model.Z_alpha(1,3).data,[2 1 3 4 5 6]);
%  
%  x=A0_A*A0_B*A0_C

%    model.Z_alpha(1,1)
%    model.Z_alpha(1,2)
%    model.Z_alpha(1,3)


% 0 T-shirt/top 
% 1 Trouser 
% 2 Pullover 
% 3 Dress 
% 4 Coat 
% 5 Sandal 
% 6 Shirt 
% 7 Sneaker 
% 8 Bag 
% 9 Ankle boot

clear all;
tft_clear();


  
%load data/fashion/fashionmnisttrain.mat
%test_A0 = head(fashionmnisttrain(fashionmnisttrain.label==9,:),1);
% test_A0 = head(fashionmnisttrain,300);


 nooftest=10000
 load data/fashion/fashionmnisttest.mat
 load data/fashion/test.mat
 %test_A0 = head(fashionmnisttest(fashionmnisttest.label==0,:),200);
 test_A0 = head(fashionmnisttest,nooftest);

n1 = Index(28);% pixel
n2 =Index(28);% pixel 

number_of_training=100;
% load('C:\Users\srafayal\Desktop\MRP\tft-master\test\experiment\savedmodel20\model0.mat')
% load('C:\Users\srafayal\Desktop\MRP\tft-master\test\experiment\savedmodel20\model1.mat')
% load('C:\Users\srafayal\Desktop\MRP\tft-master\test\experiment\savedmodel20\model2.mat')
% load('C:\Users\srafayal\Desktop\MRP\tft-master\test\experiment\savedmodel20\model3.mat')
% load('C:\Users\srafayal\Desktop\MRP\tft-master\test\experiment\savedmodel20\model4.mat')
% load('C:\Users\srafayal\Desktop\MRP\tft-master\test\experiment\savedmodel20\model5.mat')
% load('C:\Users\srafayal\Desktop\MRP\tft-master\test\experiment\savedmodel20\model6.mat')
% load('C:\Users\srafayal\Desktop\MRP\tft-master\test\experiment\savedmodel20\model7.mat')
% load('C:\Users\srafayal\Desktop\MRP\tft-master\test\experiment\savedmodel20\model8.mat')
% load('C:\Users\srafayal\Desktop\MRP\tft-master\test\experiment\savedmodel20\model9.mat')

load('C:\Users\srafayal\Desktop\MRP\tft-master\test\experiment\fold_4\model0.mat')
model0=model;
load('C:\Users\srafayal\Desktop\MRP\tft-master\test\experiment\fold_4\model1.mat')
model1=model;
load('C:\Users\srafayal\Desktop\MRP\tft-master\test\experiment\fold_4\model2.mat')
model2=model;
load('C:\Users\srafayal\Desktop\MRP\tft-master\test\experiment\fold_4\model3.mat')
model3=model;
load('C:\Users\srafayal\Desktop\MRP\tft-master\test\experiment\fold_4\model4.mat')
model4=model;
load('C:\Users\srafayal\Desktop\MRP\tft-master\test\experiment\fold_4\model5.mat')
model5=model;
load('C:\Users\srafayal\Desktop\MRP\tft-master\test\experiment\fold_4\model6.mat')
model6=model;
load('C:\Users\srafayal\Desktop\MRP\tft-master\test\experiment\fold_4\model7.mat')
model7=model;
load('C:\Users\srafayal\Desktop\MRP\tft-master\test\experiment\fold_4\model8.mat')
model8=model;
load('C:\Users\srafayal\Desktop\MRP\tft-master\test\experiment\fold_4\model9.mat')
model9=model;

icount0=0;
icount1=0;
icount2=0;
icount3=0;
icount4=0;
icount5=0;
icount6=0;
icount7=0;
icount8=0;
icount9=0;
T = Tensor( n1, n2 );
T.data = zeros(n1.cardinality, n2.cardinality);

core0= squeeze(squeeze(model0.Z_alpha(1,3).data)) ;
core1= squeeze(squeeze(model1.Z_alpha(1,3).data)) ;
core2= squeeze(squeeze(model2.Z_alpha(1,3).data)) ;
core3= squeeze(squeeze(model3.Z_alpha(1,3).data)) ;
core4= squeeze(squeeze(model4.Z_alpha(1,3).data)) ;
core5= squeeze(squeeze(model5.Z_alpha(1,3).data)) ;
core6= squeeze(squeeze(model6.Z_alpha(1,3).data)) ;
core7= squeeze(squeeze(model7.Z_alpha(1,3).data)) ;
core8= squeeze(squeeze(model8.Z_alpha(1,3).data)) ;
core9= squeeze(squeeze(model9.Z_alpha(1,3).data)) ;
 

results = zeros( nooftest, 2 );

for k1 = 1:nooftest
    temp1=0;
%     ic=1;
%     for i = 1:28
%         for j = 1:28
%              ic=ic+1;
%             T.data(i,j)=test_A0{k1,ic};
%         end
%     end
   T.data= squeeze(test.data(:,:,k1));
 
            classId=0;


            U1=squeeze(model0.Z_alpha(1,1).data( :,1,1,:));% *core*
            U2=permute(squeeze(model0.Z_alpha(1,2).data( 1,:,1,1,:)),[2,1]);
%             re=abs(pinv(U1)*T.data*pinv(U2 )) ;

            for k = 1:number_of_training
                 
                re= U1 *squeeze(core0(k,:,:))* U2 ;
                D=norm((T.data-re), 'fro');
                classId=0;
                if(k==1)
                   temp1=D;
                end
                if(k>1)
                   
                    if(D<temp1)
                        temp1=D;
                        classId=0;
                       
                    end
                end



            end   



               U1=squeeze(model1.Z_alpha(1,1).data( :,1,1,:));% *core*
               U2=permute(squeeze(model1.Z_alpha(1,2).data( 1,:,1,1,:)),[2,1]);
            for k = 1:number_of_training
                re= U1 *squeeze(core1(k,:,:))* U2 ;
                D=norm((T.data-re), 'fro');
                
                %D = pdist2(norm(re, 'fro'),norm(squeeze(core1(k,:,:)), 'fro'),'euclidean');
                if(D<temp1)
                    temp1=D;
                    classId=1;
                    
                 end
            end  




 
               U1=squeeze(model2.Z_alpha(1,1).data( :,1,1,:));% *core*
               U2=permute(squeeze(model2.Z_alpha(1,2).data( 1,:,1,1,:)),[2,1]);
%                re=abs(pinv(U1)*T.data*pinv(U2 )) ;
            for k = 1:number_of_training
%                D=norm((re-squeeze(core2(k,:,:))), 'fro');
                % D =pdist2(norm(re, 'fro'),norm(squeeze(core2(k,:,:)), 'fro'),'euclidean');
               re= U1 *squeeze(core2(k,:,:))* U2 ;
                D=norm((T.data-re), 'fro');
                if(D<temp1)
                    temp1=D;
                    classId=2;
                 end
            end  


            

               U1=squeeze(model3.Z_alpha(1,1).data( :,1,1,:));% *core*
               U2=permute(squeeze(model3.Z_alpha(1,2).data( 1,:,1,1,:)),[2,1]);
%               re=abs(pinv(U1)*T.data*pinv(U2 )) ;

            for k = 1:number_of_training
%                  D=norm((re-squeeze(core3(k,:,:))), 'fro');
                %D =pdist2(norm(re, 'fro'),norm(squeeze(core3(k,:,:)), 'fro'),'euclidean'); 
                re= U1 *squeeze(core3(k,:,:))* U2 ;
                D=norm((T.data-re), 'fro');
                if(D<temp1)
                    temp1=D;
                    classId=3;
                 end

            end

 
           U1=squeeze(model4.Z_alpha(1,1).data( :,1,1,:));% *core*
           U2=permute(squeeze(model4.Z_alpha(1,2).data( 1,:,1,1,:)),[2,1]);
%             re=abs(pinv(U1)*T.data*pinv(U2 )) ;

            for k = 1:number_of_training
%                 D=norm((re-squeeze(core4(k,:,:))), 'fro');
                %D =pdist2(norm(re, 'fro'),norm(squeeze(core4(k,:,:)), 'fro'),'euclidean');
                re= U1 *squeeze(core4(k,:,:))* U2 ;
                D=norm((T.data-re), 'fro');
                
                if(D<temp1)
                    temp1=D;
                    classId=4;
                   
                 end
            end
            
            U1=squeeze(model5.Z_alpha(1,1).data( :,1,1,:));% *core*
            U2=permute(squeeze(model5.Z_alpha(1,2).data( 1,:,1,1,:)),[2,1]);
%             re=abs(pinv(U1)*T.data*pinv(U2 )) ;
            for k = 1:number_of_training
%                   D=norm((re-squeeze(core5(k,:,:))), 'fro');
                 %D =pdist2(norm(re, 'fro'),norm(squeeze(core5(k,:,:)), 'fro'),'euclidean');
                re= U1 *squeeze(core5(k,:,:))* U2 ;
                D=norm((T.data-re), 'fro');
                 if(D<temp1)
                    temp1=D;
                    classId=5;
                 end
            end
            
           U1=squeeze(model6.Z_alpha(1,1).data( :,1,1,:));% *core*
           U2=permute(squeeze(model6.Z_alpha(1,2).data( 1,:,1,1,:)),[2,1]);
%             re=abs(pinv(U1)*T.data*pinv(U2 )) ;

            for k = 1:number_of_training
%                 D=norm((re-squeeze(core6(k,:,:))), 'fro');
                %D =pdist2(norm(re, 'fro'),norm(squeeze(core6(k,:,:)), 'fro'),'euclidean');
                re= U1 *squeeze(core6(k,:,:))* U2 ;
                D=norm((T.data-re), 'fro');
                if(D<temp1)
                    temp1=D;
                    classId=6;

                 end
            end
            
           U1=squeeze(model7.Z_alpha(1,1).data( :,1,1,:));% *core*
           U2=permute(squeeze(model7.Z_alpha(1,2).data( 1,:,1,1,:)),[2,1]);
%               re=abs(pinv(U1)*T.data*pinv(U2 )) ;

            for k = 1:number_of_training
%                 D=norm((re-squeeze(core7(k,:,:))), 'fro');
                %D =pdist2(norm(re, 'fro'),norm(squeeze(core7(k,:,:)), 'fro'),'euclidean');
                re= U1 *squeeze(core7(k,:,:))* U2 ;
                D=norm((T.data-re), 'fro');
                if(D<temp1)
                    temp1=D;
                    classId=7;
                     
                 end
            end
            
            
           U1=squeeze(model8.Z_alpha(1,1).data( :,1,1,:));% *core*
           U2=permute(squeeze(model8.Z_alpha(1,2).data( 1,:,1,1,:)),[2,1]);
%            re= abs(pinv(U1)*T.data*pinv(U2 )) ;

            for k = 1:number_of_training
%                 D=norm((re-squeeze(core8(k,:,:))), 'fro');
                %D =pdist2(norm(re, 'fro'),norm(squeeze(core8(k,:,:)), 'fro'),'euclidean');
                re= U1 *squeeze(core8(k,:,:))* U2 ;
                D=norm((T.data-re), 'fro');
                if(D<temp1)
                    temp1=D;
                    classId=8;
                     
                 end
            end
            
            
            U1=squeeze(model9.Z_alpha(1,1).data( :,1,1,:));% *core*
            U2=permute(squeeze(model9.Z_alpha(1,2).data( 1,:,1,1,:)),[2,1]);
%             re=abs(pinv(U1)*T.data*pinv(U2 )) ;
            for k = 1:number_of_training
%                  D=norm((re-squeeze(core9(k,:,:))), 'fro');
               % D =pdist2(norm(re, 'fro'),norm(squeeze(core9(k,:,:)), 'fro'),'euclidean');
               re= U1 *squeeze(core9(k,:,:))* U2 ;
                D=norm((T.data-re), 'fro');
               if(D<temp1)
                    temp1=D;
                    classId=9;
                 end
            end
            
            
            
            
            
            
             if(classId==0)
                icount0=icount0+1;
            end
            if(classId==1)
                icount1=icount1+1;
            end
             if(classId==2)
                icount2=icount2+1;
             end
             if(classId==3)
                icount3=icount3+1;
             end
             if(classId==4)
                icount4=icount4+1;
             end
             if(classId==5)
                icount5=icount5+1;
             end
             if(classId==6)
                icount6=icount6+1;
             end
             if(classId==7)
                icount7=icount7+1;
             end
             if(classId==8)
                icount8=icount8+1;
             end
             if(classId==9)
                icount9=icount9+1;
             end
              
             results(k1,1)=test_A0{k1,1};
             results(k1,2)=classId;
             k1;  
%               K = squeeze(T.data(:,:,1));
%  figure
% imshow(K)
%              icount;
end

  cp = classperf(results(:,2),results(:,1));
  cp.CorrectRate % Classified Samples / Total Number of Samples

 
% %  re=zeros(5,6)
% % 
% % A_transpose=permute(model.Z_alpha(1,1).data,[2 1 3 4]);
% % res=0.0
% %  for  pp = 1:5
% %         for qq = 1:6
% %             res=0.0
% %             for i = 1:28
% %                     for j = 1:28
% %                         display(B.data(:,j,1,1,qq))
% %                         res=res+T.data(i,j)*A_transpose(:,i,1,pp)*B.data(:,j,1,1,qq)
% %                     end
% %             end
% %             re(pp,qq)=res
% %         end
% % end
% % 
