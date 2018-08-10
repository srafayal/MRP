A_transpose=permute(model.Z_alpha(1,1).data,[2 1 3 4]);
B_transpose=permute(model.Z_alpha(1,2).data,[2 1 3 4 5]);
core1=zeros(5,6)
res=0.0
 for  pp = 1:1
        for qq = 1:1
            res=0.0;
            for i = 1:28
                    for j = 1:28
%                         display(B.data(:,j,1,1,qq))
                        res=res+T.data(i,j)*A_transpose(:,i,1,pp)*model.Z_alpha(1,2).data(:,j,1,1,qq)
                    end
            end
            core1(pp,qq)=res;
        end
 end

 core1