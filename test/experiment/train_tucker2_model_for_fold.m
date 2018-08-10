
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

for i = 1:4
    if(fold_no==i)
        st_index=st_index+500;
    end
    st_index=st_index+1;
    end_index=st_index+499;
    X.data(:,:,(( i-1)*500)+1:((i-1)*500)+500) = A9.data(:,:,st_index:(end_index));
    st_index=end_index;
    
end
clear A9

p_index = Index(8);
q_index = Index(8);

 
A = Tensor( n1, p_index);
B = Tensor( n2, q_index);
G = Tensor( p_index, q_index, n3);
% 
 
A.data = rand( n1.cardinality, p_index.cardinality );
B.data = rand( n2.cardinality, q_index.cardinality );

G.data = rand( p_index.cardinality, q_index.cardinality, n3.cardinality );

pre_process();

p = [1];
phi = [1];

factorization_model = {X, {A, B, G}};

model = TFModel(factorization_model, p, phi);

gtp_rules = model.update_rules();

for rule_ind = 1:length(gtp_rules)
    display_rule( gtp_rules{rule_ind}, rule_ind, 'rule ' );
end

config = TFEngineConfig(model, 60);
engine = TFDefaultEngine(config, 'gtp');
engine.factorize();
 plot(engine.beta_divergence'');
  check_divergence(engine.beta_divergence);
 
path=strcat('C:\Users\srafayal\Desktop\MRP\tft-master\test\experiment\fold\8\fold_',int2str(fold_no));
path=strcat(path,'\model9.mat');
save(path,'model');
