A = randn(10000,1); 
B = randn(15000,1);

tic, 
d=ipdm(A,B,'subset','nearest'); 
toc