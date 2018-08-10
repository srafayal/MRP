clear all;
tft_clear();
rand('seed',0);
 
load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A9.mat')
 

n1 = Index(28);% pixel
n2 =Index(28);% pixel 
n3 = Index(2000);  
fold_no=1;
st_index=0; 
 
X = Tensor( n1, n2,n3 );
index=1;
T = zeros( 28, 28 );
for i = 1:4
    if(fold_no==i)
        st_index=st_index+500;
    end
    st_index=st_index+1;
    end_index=st_index+499;
    X.data(:,:,(( i-1)*500)+1:((i-1)*500)+500) = A9.data(:,:,st_index:(end_index));
    st_index=end_index;
    
end


for i = 1:28
      for j = 1:28
          sum=0.0;
          for k = 1:2000
              sum=sum+X.data(i,j,k);
          end
          T(i,j)=sum/2000;
      end    
       
end    

 

T1 = zeros( 2000, 2 );
for k = 1:2000
   
    D=norm(T-squeeze(X.data(:,:,k)), 'fro');
    T1(k,1)=k;
    T1(k,2)=D;
end

Training_scores = array2table(T1);
Training_scores= sortrows(Training_scores,2)
class9_scores=Training_scores;
save('C:\Users\srafayal\Desktop\MRP\tft-master\test\experiment\Training_scores\class9_scores.mat','class9_scores');