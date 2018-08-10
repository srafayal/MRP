% i_index = Index(2);
% j_index = Index(3);
% k_index = Index(4);

clear all;
tft_clear();
rand('seed',0);
load data/fashion/fashionmnisttrain.mat
training_A0 = head(fashionmnisttrain(fashionmnisttrain.label==0,:),100);
n1 = Index(28);% pixel
n2 =Index(28);% pixel 
n3 = Index(height(training_A0)); % number of images

X = Tensor( n1, n2,n3 );
X.data = zeros(n1.cardinality, n2.cardinality, n3.cardinality );
 
for k = 1:height(training_A0)
     ic=1;
    for i = 1:28
        for j = 1:28
            ic=ic+1;
            X.data(i,j,k)=training_A0{k,ic};
        end
    end
    
end


p_index = Index(5);
q_index = Index(6);
r_index = Index(7);
 
A = Tensor( n1, p_index);
B = Tensor( n2, q_index);
C = Tensor( n3, r_index);
G = Tensor( p_index, q_index, r_index);
% 
% % X.data = rand( i_index.cardinality, j_index.cardinality, k_index.cardinality );
A.data = rand( n1.cardinality, p_index.cardinality );
B.data = rand( n2.cardinality, q_index.cardinality );
C.data = rand( n3.cardinality, r_index.cardinality );
G.data = rand( p_index.cardinality, q_index.cardinality, r_index.cardinality );

pre_process();

p = [1];
phi = [1];

factorization_model = {X, {A, B, C, G}};

model = TFModel(factorization_model, p, phi);

gtp_rules = model.update_rules();

for rule_ind = 1:length(gtp_rules)
    display_rule( gtp_rules{rule_ind}, rule_ind, 'rule ' );
end

config = TFEngineConfig(model, 100);
engine = TFDefaultEngine(config, 'gtp');
engine.factorize();
plot(engine.beta_divergence'');
check_divergence(engine.beta_divergence);
