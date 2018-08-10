clear all;
tft_clear();
load data/fashion/fashionmnisttrain.mat
training_A0 = head(fashionmnisttrain(fashionmnisttrain.label==0,:),10);
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
 
U_k = Tensor( n1, n1);
%V_k = Tensor( n2, n2, n3);
% S_k = Tensor( n1, n2, n3);

 
U_k.data = rand( n1.cardinality, n1.cardinality );
%V_k.data = rand( n2.cardinality, n2.cardinality, n3.cardinality );
% S_k.data = rand( n1.cardinality, n2.cardinality, n3.cardinality );

pre_process();

p = [1];
phi = [1];

factorization_model_A0 = {A0, {U_k, S_k, V_k}};
model = TFModel(factorization_model_A0, p, phi);
gtp_rules = model.update_rules();
% 
% for rule_ind = 1:length(gtp_rules)
%     display_rule( gtp_rules{rule_ind}, rule_ind, 'rule ' );
% end
% 
% config = TFEngineConfig(model, 10);
% engine = TFDefaultEngine(config, 'gtp_mex');
% engine.factorize();
% plot(engine.beta_divergence'');
% check_divergence(engine.beta_divergence);