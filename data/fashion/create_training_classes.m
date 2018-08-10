clear all;
tft_clear();
rand('seed',0);
load data/fashion/fashionmnisttrain.mat
training_X = fashionmnisttrain(fashionmnisttrain.label==0,:) ; 

n1 = Index(28);% pixel
n2 = Index(28);% pixel 
n3 = Index(height(training_X)); % number of images
A0 = Tensor( n1,n2,n3 );
A0.data = zeros(n1.cardinality, n2.cardinality, n3.cardinality  );
 
for k = 1:height(training_X)
     ic=1;
    for i = 1:28
        for j = 1:28
            ic=ic+1;
            A0.data(i,j,k)=training_X{k,ic};
        end
    end
end

disp(0)

training_X = fashionmnisttrain(fashionmnisttrain.label==1,:) ; 
n3 = Index(height(training_X)); % number of images
A1 = Tensor( n1,n2,n3 );
A1.data = zeros(n1.cardinality, n2.cardinality, n3.cardinality  );
 
for k = 1:height(training_X)
     ic=1;
    for i = 1:28
        for j = 1:28
            ic=ic+1;
            A1.data(i,j,k)=training_X{k,ic};
        end
    end
end

disp(1)
training_X = fashionmnisttrain(fashionmnisttrain.label==2,:) ; 
n3 = Index(height(training_X)); % number of images
A2 = Tensor( n1,n2,n3 );
A2.data = zeros(n1.cardinality, n2.cardinality, n3.cardinality  );
 
for k = 1:height(training_X)
     ic=1;
    for i = 1:28
        for j = 1:28
            ic=ic+1;
            A2.data(i,j,k)=training_X{k,ic};
        end
    end
end


disp(2)
training_X = fashionmnisttrain(fashionmnisttrain.label==3,:) ; 
n3 = Index(height(training_X)); % number of images
A3 = Tensor( n1,n2,n3 );
A3.data = zeros(n1.cardinality, n2.cardinality, n3.cardinality  );
 
for k = 1:height(training_X)
     ic=1;
    for i = 1:28
        for j = 1:28
            ic=ic+1;
            A3.data(i,j,k)=training_X{k,ic};
        end
    end
end

disp(3)
training_X = fashionmnisttrain(fashionmnisttrain.label==4,:) ; 
n3 = Index(height(training_X)); % number of images
A4 = Tensor( n1,n2,n3 );
A4.data = zeros(n1.cardinality, n2.cardinality, n3.cardinality  );
 
for k = 1:height(training_X)
     ic=1;
    for i = 1:28
        for j = 1:28
            ic=ic+1;
            A4.data(i,j,k)=training_X{k,ic};
        end
    end
end

disp(4)


training_X = fashionmnisttrain(fashionmnisttrain.label==5,:) ; 
n3 = Index(height(training_X)); % number of images
A5 = Tensor( n1,n2,n3 );
A5.data = zeros(n1.cardinality, n2.cardinality, n3.cardinality  );
 
for k = 1:height(training_X)
     ic=1;
    for i = 1:28
        for j = 1:28
            ic=ic+1;
            A5.data(i,j,k)=training_X{k,ic};
        end
    end
end


disp(5)
training_X = fashionmnisttrain(fashionmnisttrain.label==6,:) ; 
n3 = Index(height(training_X)); % number of images
A6 = Tensor( n1,n2,n3 );
A6.data = zeros(n1.cardinality, n2.cardinality, n3.cardinality  );
 
for k = 1:height(training_X)
     ic=1;
    for i = 1:28
        for j = 1:28
            ic=ic+1;
            A6.data(i,j,k)=training_X{k,ic};
        end
    end
end

disp(6)

training_X = fashionmnisttrain(fashionmnisttrain.label==7,:) ; 
n3 = Index(height(training_X)); % number of images
A7 = Tensor( n1,n2,n3 );
A7.data = zeros(n1.cardinality, n2.cardinality, n3.cardinality  );
 
for k = 1:height(training_X)
     ic=1;
    for i = 1:28
        for j = 1:28
            ic=ic+1;
            A7.data(i,j,k)=training_X{k,ic};
        end
    end
end


disp(7)

training_X = fashionmnisttrain(fashionmnisttrain.label==8,:) ; 
n3 = Index(height(training_X)); % number of images
A8 = Tensor( n1,n2,n3 );
A8.data = zeros(n1.cardinality, n2.cardinality, n3.cardinality  );
 
for k = 1:height(training_X)
     ic=1;
    for i = 1:28
        for j = 1:28
            ic=ic+1;
            A8.data(i,j,k)=training_X{k,ic};
        end
    end
end


disp(8)
training_X = fashionmnisttrain(fashionmnisttrain.label==9,:) ; 
n3 = Index(height(training_X)); % number of images
A9 = Tensor( n1,n2,n3 );
A9.data = zeros(n1.cardinality,n2.cardinality,n3.cardinality);
 
for k = 1:height(training_X)
     ic=1;
    for i = 1:28
        for j = 1:28
            ic=ic+1;
            A9.data(i,j,k)=training_X{k,ic};
        end
    end
end