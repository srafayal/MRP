 clear all;
tft_clear();
load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A0.mat')
load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A1.mat')
load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A2.mat')
load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A3.mat')
load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A4.mat')
load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A5.mat')
load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A6.mat')
load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A7.mat')
load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A8.mat')
load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A9.mat')
n1 = Index(28);% pixel
n2 =Index(28);% pixel 
n3 = Index(500);  

Test = Tensor( n1, n2,n3 );
Test.data = zeros(n1.cardinality, n2.cardinality, n3.cardinality);

fold_no=5;
st_index=0; 
for i = 1:5
    if(fold_no==i)
         st_index=st_index+1
 
         end_index=st_index+499
         Test.data(:,:,1:500) = A0.data(:,:,st_index:end_index);
         Test.data(:,:,501:1000) = A1.data(:,:,st_index:end_index);
         Test.data(:,:,1001:1500) = A2.data(:,:,st_index:end_index);
         Test.data(:,:,1501:2000) = A3.data(:,:,st_index:end_index);
         Test.data(:,:,2001:2500) = A4.data(:,:,st_index:end_index);
         Test.data(:,:,2501:3000) = A5.data(:,:,st_index:end_index);
         Test.data(:,:,3001:3500) = A6.data(:,:,st_index:end_index);
         Test.data(:,:,3501:4000) = A7.data(:,:,st_index:end_index);
         Test.data(:,:,4001:4500) = A8.data(:,:,st_index:end_index);
         Test.data(:,:,4501:5000) = A9.data(:,:,st_index:end_index);
%          end_index=st_index+49
%          Test.data(:,:,1:50) = A0.data(:,:,st_index:end_index);
%          Test.data(:,:,51:100) = A1.data(:,:,st_index:end_index);
%          Test.data(:,:,101:150) = A2.data(:,:,st_index:end_index);
%          Test.data(:,:,151:200) = A3.data(:,:,st_index:end_index);
%          Test.data(:,:,201:250) = A4.data(:,:,st_index:end_index);
%          Test.data(:,:,251:300) = A5.data(:,:,st_index:end_index);
%          Test.data(:,:,301:350) = A6.data(:,:,st_index:end_index);
%          Test.data(:,:,351:400) = A7.data(:,:,st_index:end_index);
%          Test.data(:,:,401:450) = A8.data(:,:,st_index:end_index);
%          Test.data(:,:,451:500) = A9.data(:,:,st_index:end_index);
         i=5
    end
    st_index=st_index+1;
    end_index=st_index+499;
    st_index=end_index;
    
end


T = Tensor( n1, n2 );
T.data = zeros(n1.cardinality, n2.cardinality);




path=strcat('C:\Users\srafayal\Desktop\MRP\tft-master\test\experiment\fold_',int2str(fold_no))
path1=strcat(path,'\model0.mat');
load(path1);
model0=model;
path1=strcat(path,'\model1.mat')
load(path1);
model1=model;

path1=strcat(path,'\model2.mat')
load(path1);
model2=model;

path1=strcat(path,'\model3.mat')
load(path1);
model3=model;

path1=strcat(path,'\model4.mat')
load(path1);
model4=model;

path1=strcat(path,'\model5.mat')
load(path1);
model5=model;

path1=strcat(path,'\model6.mat')
load(path1);
model6=model;

path1=strcat(path,'\model7.mat')
load(path1);
model7=model;

path1=strcat(path,'\model8.mat')
load(path1);
model8=model;

path1=strcat(path,'\model9.mat')
load(path1);
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
number_of_training=100;
 
results = zeros( 5000, 2 );
 
for k1 = 1:5000

 
    temp1=0;
    T.data= squeeze(Test.data(:,:,k1));
         
   
 
            classId=0;


            U1=squeeze(model0.Z_alpha(1,1).data( :,1,1,:));% *core*
            U2=permute(squeeze(model0.Z_alpha(1,2).data( 1,:,1,1,:)),[2,1]);
%             re=abs(pinv(U1)*T.data*pinv(U2 )) ;

            for k = 1:number_of_training
                 
                %D = norm(squeeze(core0(k,:,:))- re)%pdist2(norm(re, 'fro'),norm(squeeze(core0(k,:,:)), 'fro'),'euclidean');
                %D =pdist2(norm(re, 'fro'),norm(squeeze(core0(k,:,:)), 'fro'),'euclidean')
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
%                re=abs(pinv(U1)*T.data*pinv(U2 )) ;
               
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
                re= U1 *squeeze(core2(k,:,:))* U2 ;
                D=norm((T.data-re), 'fro');
                %D =pdist2(norm(re, 'fro'),norm(squeeze(core2(k,:,:)), 'fro'),'euclidean');
                if(D<temp1)
                    temp1=D;
                    classId=2;
                 end
            end  


            

               U1=squeeze(model3.Z_alpha(1,1).data( :,1,1,:));% *core*
               U2=permute(squeeze(model3.Z_alpha(1,2).data( 1,:,1,1,:)),[2,1]);
%               re=abs(pinv(U1)*T.data*pinv(U2 )) ;

            for k = 1:number_of_training
                 re= U1 *squeeze(core3(k,:,:))* U2 ;
                D=norm((T.data-re), 'fro');
                %D =pdist2(norm(re, 'fro'),norm(squeeze(core3(k,:,:)), 'fro'),'euclidean'); 
                if(D<temp1)
                    temp1=D;
                    classId=3;
                 end

            end

 
           U1=squeeze(model4.Z_alpha(1,1).data( :,1,1,:));% *core*
           U2=permute(squeeze(model4.Z_alpha(1,2).data( 1,:,1,1,:)),[2,1]);
%             re=abs(pinv(U1)*T.data*pinv(U2 )) ;

            for k = 1:number_of_training
                re= U1 *squeeze(core4(k,:,:))* U2 ;
                D=norm((T.data-re), 'fro');
                %D =pdist2(norm(re, 'fro'),norm(squeeze(core4(k,:,:)), 'fro'),'euclidean');
                if(D<temp1)
                    temp1=D;
                    classId=4;
                   
                 end
            end
            
            U1=squeeze(model5.Z_alpha(1,1).data( :,1,1,:));% *core*
            U2=permute(squeeze(model5.Z_alpha(1,2).data( 1,:,1,1,:)),[2,1]);
%             re=abs(pinv(U1)*T.data*pinv(U2 )) ;
            for k = 1:number_of_training
                 re= U1 *squeeze(core5(k,:,:))* U2 ;
                D=norm((T.data-re), 'fro');
                %D =pdist2(norm(re, 'fro'),norm(squeeze(core5(k,:,:)), 'fro'),'euclidean');
                if(D<temp1)
                    temp1=D;
                    classId=5;
                 end
            end
            
           U1=squeeze(model6.Z_alpha(1,1).data( :,1,1,:));% *core*
           U2=permute(squeeze(model6.Z_alpha(1,2).data( 1,:,1,1,:)),[2,1]);
%             re=abs(pinv(U1)*T.data*pinv(U2 )) ;

            for k = 1:number_of_training
                re= U1 *squeeze(core6(k,:,:))* U2 ;
                D=norm((T.data-re), 'fro');
                %D =pdist2(norm(re, 'fro'),norm(squeeze(core6(k,:,:)), 'fro'),'euclidean');
                if(D<temp1)
                    temp1=D;
                    classId=6;

                 end
            end
            
           U1=squeeze(model7.Z_alpha(1,1).data( :,1,1,:));% *core*
           U2=permute(squeeze(model7.Z_alpha(1,2).data( 1,:,1,1,:)),[2,1]);
%               re=abs(pinv(U1)*T.data*pinv(U2 )) ;

            for k = 1:number_of_training
                re= U1 *squeeze(core7(k,:,:))* U2 ;
                D=norm((T.data-re), 'fro');
                %D =pdist2(norm(re, 'fro'),norm(squeeze(core7(k,:,:)), 'fro'),'euclidean');
                if(D<temp1)
                    temp1=D;
                    classId=7;
                     
                 end
            end
            
            
           U1=squeeze(model8.Z_alpha(1,1).data( :,1,1,:));% *core*
           U2=permute(squeeze(model8.Z_alpha(1,2).data( 1,:,1,1,:)),[2,1]);
%            re= abs(pinv(U1)*T.data*pinv(U2 )) ;

            for k = 1:number_of_training
                re= U1 *squeeze(core8(k,:,:))* U2 ;
                D=norm((T.data-re), 'fro');
                %D =pdist2(norm(re, 'fro'),norm(squeeze(core8(k,:,:)), 'fro'),'euclidean');
                if(D<temp1)
                    temp1=D;
                    classId=8;
                     
                 end
            end
            
            
            U1=squeeze(model9.Z_alpha(1,1).data( :,1,1,:));% *core*
            U2=permute(squeeze(model9.Z_alpha(1,2).data( 1,:,1,1,:)),[2,1]);
%             re=abs(pinv(U1)*T.data*pinv(U2 )) ;
            for k = 1:number_of_training
                 re= U1 *squeeze(core9(k,:,:))* U2 ;
                D=norm((T.data-re), 'fro');
                %D =pdist2(norm(re, 'fro'),norm(squeeze(core5(k,:,:)), 'fro'),'euclidean');
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
             
             if(k1>=1 && k1<=500) 
                 results(k1,1)=0;
             end
             if(k1>=501 && k1<=1000) 
                 results(k1,1)=1;
             end
             if(k1>=1001 && k1<=1500) 
                 results(k1,1)=2;
             end
             if(k1>=1501 && k1<=2000) 
                 results(k1,1)=3;
             end
             if(k1>=2001 && k1<=2500) 
                 results(k1,1)=4;
             end
             if(k1>=2501 && k1<=3000) 
                 results(k1,1)=5;
             end
             if(k1>=3001 && k1<=3500) 
                 results(k1,1)=6;
             end
             if(k1>=3501 && k1<=4000) 
                 results(k1,1)=7;
             end
             if(k1>=4001 && k1<=4500) 
                 results(k1,1)=8;
             end
             if(k1>=4501 && k1<=5000) 
                 results(k1,1)=9;
             end
             results(k1,2)=classId;
             k1  
%  K = squeeze(T.data(:,:,1))
%  figure
%  imshow(K)
% %              icount
 end

  cp = classperf(results(:,2),results(:,1));
  cp.CorrectRate % Classified Samples / Total Number of Samples
%  