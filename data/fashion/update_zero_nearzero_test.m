clear all;
tft_clear();
load data/fashion/fashionmnisttest.mat
testing_X = fashionmnisttest ;

n1 = Index(28);% pixel
n2 =Index(28);% pixel
n3 = Index(height(testing_X)); 

T = Tensor( n1,n2,n3 );
T.data = zeros(n1.cardinality, n2.cardinality, n3.cardinality );


for k = 1:height(testing_X)
     ic=1;
    for i = 1:28
        for j = 1:28
            ic=ic+1;
            if testing_X{k,ic}==0
                T.data(i,j,k)=0.0001; 
            end
            if testing_X{k,ic}>0
               T.data(i,j,k)=testing_X{k,ic};
            end
        end
    end
    display(k)
end