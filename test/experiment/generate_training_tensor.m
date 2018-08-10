
clear all;
tft_clear();
load data/fashion/fashionmnisttrain.mat
training_A0 = head(fashionmnisttrain(fashionmnisttrain.label==0,:),100);
n1 = Index(28);
n2 = Index(height(training_A0));
n3 = Index(28);

A0 = Tensor( n1, n2,n3 );
A0.data = zeros(n1.cardinality, n2.cardinality, n3.cardinality );
 
for k = 1:height(training_A0)
    ic=1
    for i = 1:28
        for j = 1:28
             ic=ic+1
            A0.data(i,k,j)=training_A0{k,ic};
        end
    end
    
end




% %**************************A1
% 
% training_A1 = head(fashionmnisttrain(fashionmnisttrain.label==1,:),100);
% n1 = Index(28);
% n2 = Index(height(training_A1));
% n3 = Index(28);
% 
% A1 = Tensor( n1, n2,n3 );
% A1.data = zeros(n1.cardinality, n2.cardinality, n3.cardinality );
%  
% for k = 1:height(training_A1)
%     for i = 1:28
%         for j = 1:28
%             A1.data(i,k,j)=training_A1{k,(i*j)+1};
%         end
%     end
%     
% end
% 
% %********************
% 
% 
% %**************************A2
% 
% training_A2 = head(fashionmnisttrain(fashionmnisttrain.label==2,:),100);
% n1 = Index(28);
% n2 = Index(height(training_A2));
% n3 = Index(28);
% 
% A2 = Tensor( n1, n2,n3 );
% A2.data = zeros(n1.cardinality, n2.cardinality, n3.cardinality );
%  
% for k = 1:height(training_A2)
%     for i = 1:28
%         for j = 1:28
%             A2.data(i,k,j)=training_A2{k,(i*j)+1};
%         end
%     end
%     
% end
% 
% %********************
% 
% %**************************A3
% 
% training_A3 = head(fashionmnisttrain(fashionmnisttrain.label==3,:),100);
% n1 = Index(28);
% n2 = Index(height(training_A3));
% n3 = Index(28);
% 
% A3 = Tensor( n1, n2,n3 );
% A3.data = zeros(n1.cardinality, n2.cardinality, n3.cardinality );
%  
% for k = 1:height(training_A3)
%     for i = 1:28
%         for j = 1:28
%             A3.data(i,k,j)=training_A3{k,(i*j)+1};
%         end
%     end
%     
% end
% 
% %********************
% 
% %**************************A4
% 
% training_A4 = head(fashionmnisttrain(fashionmnisttrain.label==4,:),100);
% n1 = Index(28);
% n2 = Index(height(training_A4));
% n3 = Index(28);
% 
% A4 = Tensor( n1, n2,n3 );
% A4.data = zeros(n1.cardinality, n2.cardinality, n3.cardinality );
%  
% for k = 1:height(training_A4)
%     for i = 1:28
%         for j = 1:28
%             A4.data(i,k,j)=training_A4{k,(i*j)+1};
%         end
%     end
%     
% end
% 
% %********************
% 
% 
% %**************************A5
% 
% training_A5 = head(fashionmnisttrain(fashionmnisttrain.label==5,:),100);
% n1 = Index(28);
% n2 = Index(height(training_A5));
% n3 = Index(28);
% 
% A5 = Tensor( n1, n2,n3 );
% A5.data = zeros(n1.cardinality, n2.cardinality, n3.cardinality );
%  
% for k = 1:height(training_A5)
%     for i = 1:28
%         for j = 1:28
%             A5.data(i,k,j)=training_A5{k,(i*j)+1};
%         end
%     end
%     
% end
% 
% %********************
% 
% %**************************A6
% 
% training_A6 = head(fashionmnisttrain(fashionmnisttrain.label==6,:),100);
% n1 = Index(28);
% n2 = Index(height(training_A6));
% n3 = Index(28);
% 
% A6 = Tensor( n1, n2,n3 );
% A6.data = zeros(n1.cardinality, n2.cardinality, n3.cardinality );
%  
% for k = 1:height(training_A6)
%     for i = 1:28
%         for j = 1:28
%             A6.data(i,k,j)=training_A6{k,(i*j)+1};
%         end
%     end
%     
% end
% 
% %********************
% 
% %**************************A7
% 
% training_A7 = head(fashionmnisttrain(fashionmnisttrain.label==7,:),100);
% n1 = Index(28);
% n2 = Index(height(training_A7));
% n3 = Index(28);
% 
% A7 = Tensor( n1, n2,n3 );
% A7.data = zeros(n1.cardinality, n2.cardinality, n3.cardinality );
%  
% for k = 1:height(training_A7)
%     for i = 1:28
%         for j = 1:28
%             A7.data(i,k,j)=training_A7{k,(i*j)+1};
%         end
%     end
%     
% end
% 
% %********************
% 
% %**************************A8
% 
% training_A8 = head(fashionmnisttrain(fashionmnisttrain.label==8,:),100);
% n1 = Index(28);
% n2 = Index(height(training_A8));
% n3 = Index(28);
% 
% A8 = Tensor( n1, n2,n3 );
% A8.data = zeros(n1.cardinality, n2.cardinality, n3.cardinality );
%  
% for k = 1:height(training_A8)
%     for i = 1:28
%         for j = 1:28
%             A8.data(i,k,j)=training_A8{k,(i*j)+1};
%         end
%     end
%     
% end
% 
% %********************
% 
% %**************************A9
% 
% training_A9 = head(fashionmnisttrain(fashionmnisttrain.label==9,:),100);
% n1 = Index(28);
% n2 = Index(height(training_A9));
% n3 = Index(28);
% 
% A9 = Tensor( n1, n2,n3 );
% A9.data = zeros(n1.cardinality, n2.cardinality, n3.cardinality );
%  
% for k = 1:height(training_A9)
%     for i = 1:28
%         for j = 1:28
%             A9.data(i,k,j)=training_A9{k,(i*j)+1};
%         end
%     end
%     
% end
% 
% %********************

