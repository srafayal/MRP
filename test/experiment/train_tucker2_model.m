% i_index = Index(2);
% j_index = Index(3);
% k_index = Index(4);

clear all;
tft_clear();
rand('seed',0);
% load data/fashion/fashionmnisttrain.mat
% training_A0 = head(fashionmnisttrain(fashionmnisttrain.label==9,:),3000);
% n1 = Index(28);% pixel
% n2 =Index(28);% pixel 
% n3 = Index(height(training_A0)); % number of images
% 
% A0 = Tensor( n1, n2,n3 );
% A0.data = zeros(n1.cardinality, n2.cardinality, n3.cardinality );
%  
% for k = 1:height(training_A0)
%      ic=1;
%     for i = 1:28
%         for j = 1:28
%             ic=ic+1;
%             A0.data(i,j,k)=training_A0{k,ic};
%         end
%     end
%     
% end
load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A0.mat')
% load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A1.mat')
% load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A2.mat')
% load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A3.mat')
% load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A4.mat')
% load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A5.mat')
% load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A6.mat')
% load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A7.mat')
% load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A8.mat')
% load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A9.mat')

n1 = Index(28);% pixel
n2 =Index(28);% pixel 
n3 = Index(2000); % number of images

X = Tensor( n1, n2,n3 );
X.data(:,:,1:1000) = A0.data(:,:,1:1000);
 clear 'A9'
p_index = Index(5);
q_index = Index(6);



A = Tensor( n1, p_index);
B = Tensor( n2, q_index);
G = Tensor( p_index, q_index, n3);
 
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

config = TFEngineConfig(model, 250);
engine = TFDefaultEngine(config, 'gtp');
engine.factorize();
plot(engine.beta_divergence'');
check_divergence(engine.beta_divergence);

model0=model;
% path=strcat('C:\Users\srafayal\Desktop\MRP\tft-master\test\experiment\savedmodel','\model0.mat');
% path=strcat(path,'\model0.mat');
% save(path,'model0');
