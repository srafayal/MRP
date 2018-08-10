% 
% 
% clear all;
% tft_clear();
% rand('seed',0);
%  load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A0.mat')
% % load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A1.mat')
% % load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A2.mat')
% % load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A3.mat')
% % load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A4.mat')
% % load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A5.mat')
% % load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A6.mat')
% % load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A7.mat')
% % load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A8.mat')
% % load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A9.mat')


load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A0.mat')
for k = 1:6000
    for i = 1:28
        for j = 1:28
            if A0.data(i,j,k)==0
               A0.data(i,j,k)=0.0001;
            end 
        end
    end
    
end


load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A1.mat')
for k = 1:6000
    for i = 1:28
        for j = 1:28
            if A1.data(i,j,k)==0
               A1.data(i,j,k)=0.0001;
            end 
        end
    end
    
end
display(1)

load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A2.mat')
for k = 1:6000
    for i = 1:28
        for j = 1:28
            if A2.data(i,j,k)==0
               A2.data(i,j,k)=0.0001;
            end 
        end
    end
    
end
display(2)
load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A3.mat')
for k = 1:6000
    for i = 1:28
        for j = 1:28
            if A3.data(i,j,k)==0
               A3.data(i,j,k)=0.0001;
            end 
        end
    end
    
end

display(3)

load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A4.mat')
for k = 1:6000
    for i = 1:28
        for j = 1:28
            if A4.data(i,j,k)==0
               A4.data(i,j,k)=0.0001;
            end 
        end
    end
    
end
display(4)


load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A5.mat')
for k = 1:6000
    for i = 1:28
        for j = 1:28
            if A5.data(i,j,k)==0
               A5.data(i,j,k)=0.0001;
            end 
        end
    end
    
end

display(5)
load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A6.mat')
for k = 1:6000
    for i = 1:28
        for j = 1:28
            if A6.data(i,j,k)==0
               A6.data(i,j,k)=0.0001;
            end 
        end
    end
    
end
 
display(6)
load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A7.mat')
for k = 1:6000
    for i = 1:28
        for j = 1:28
            if A7.data(i,j,k)==0
               A7.data(i,j,k)=0.0001;
            end 
        end
    end
    
end


display(7)
load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A8.mat')
for k = 1:6000
    for i = 1:28
        for j = 1:28
            if A8.data(i,j,k)==0
               A8.data(i,j,k)=0.0001;
            end 
        end
    end
    
end

display(8)
load('C:\Users\srafayal\Desktop\MRP\tft-master\data\fashion\fashionmnisttrain_A9.mat')
for k = 1:6000
    for i = 1:28
        for j = 1:28
            if A9.data(i,j,k)==0
               A9.data(i,j,k)=0.0001;
            end 
        end
    end
    
end


% %  A9.data(:,:,1)