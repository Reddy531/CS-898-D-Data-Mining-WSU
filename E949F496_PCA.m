%This code to apply PCA (Principal Component Analysis) 
%Defining Data
data=[105   102   108   118   114   117   113   122   113   126   124   126   118   120   122   118   121   127   122   121   126   129   127   120
   102   107   110   110   108   114   110   121   116   118   113   118   122   116   117   112   125   122   122   117   121   124   125   123
    99   106   112   118   116   116   114   112   120   114   125   112   114   116   118   115   123   120   123   117   122   115   127   122
   107   110   113   115   117   116   109   120   113   123   119   119   123   113   113   118   118   116   113   112   121   123   119   123
   101   109   111   110   116   116   116   107   118   110   125   111   113   112   117   115   115   112   117   121   111   127   116   118
   104    97   104   109   112   116   121   122   115   110   114   116   106   116   114   125   114   113   117   110   118   115   118   113
   103   105   101   111   102   112   120   125   113   115   117   112   117   117   119   123   122   118   113   121   113   117   115   120
   106   108   101   111   107   112   119   121   110   110   120   118   114   123   119   121   122   126   117   115   114   118   121   120
   104   104   112   117   109   118   112   123   106   116   114   125   113   113   114   111   118   115   114   129   111   122   114   120
   108   105   104   112   111   109   115   113   108   104   112   116   118   119   118   111   117   112   118   118   120   119   122   123
   110   104   106   102   110   117   108   110   111   114   116   118   123   124   119   109   121   113   111   128   118   118   111   125
   102   111   107   114   111   116   113   113   108   113   117   114   119   117   123   117   119   116   116   114   111   116   114   120
   106   101   105   109   115   114   109   119   116   116   112   123   120   119   123   116   121   114   118   122   112   113   112   122
   104   106   106   118   112   115   109   117   115   120   113   121   119   125   116   122   111   122   120   123   117   116   119   120
   108   110   109   102   103   111   101   114   114   111   113   123   118   123   127   125   118   113   108   113   122   120   122   122
   105   110   108   111   113   114   113   114   116   108   122   115   121   120   116   125   116   126   118   123   121   105   113   124
   103   114   107   106   119   111   112   106   115   112   116   122   110   116   115   118   114   121   120   125   122   124   123   124
   107   110   106   109   114   117   111   116   114   106   114   123   119   117   114   113   128   105   113   116   117   123   122   116
   100   114   104   113   114   114   114   107   115   109   127   125   121   120   119   109   123   116   110   113   120   116   122   119
   103   113   111   105   114   113   117   114   112   117   115   118   121   118   112   116   120   122   119   119   119   110   122   123
   101   112   110   120   115   114   110   110   113   110   121   126   115   123   118   115   119   112   119   122   118   114   123   115
   112   105   122   112   117   111   118   108   114   114   116   115   119   123   119   119   121   117   114   115   117   116   121   122
   109   114   109   114   108   117   113   110   112   116   117   111   118   121   123   113   119   120   122   123   122   121   125   121
   105   102   109   108   120   114   111   117   114   119   115    99   112   118   118   122   124   121   124   117   110   117   116   122];
[r,c] = size(data);
% Compute the mean of the data matrix "The mean of each row"
m=mean(data')';
% Subtract the mean from each image [Centering the data]
d=data - repmat(m,1,c);
% Compute the covariance matrix (co)
co=d*d';
% Compute the eigen values and eigen vectors of the covariance matrix
[eigvector,eigvl] = eig(co);
eigvalue = diag(eigvl);
[junk,index] = sort(eigvalue,'descend');
eigvalue = eigvalue(index);
eigvector = eigvector(:,index);
% Compute the number of eigen values that greater than zero (you can select any threshold)
count1 = 0;
for i=1:size(eigvalue,1)
    if(eigvalue(i)>0)
        count1 = count1+1;
    end
end
% Displaying all eigvalues
eigvalue
%Computing sum of eigvalue
sum_eigvalue = sum(eigvalue);
%Defining K-values
K_Values = [3,6,9];
% Logic to find proportion for each K value and storing in Final_Prop
for i = 1 : length(K_Values)
    indpt_sum = 0;
    j = K_Values(i);
    for x = 1 : j
        indpt_sum = indpt_sum + eigvalue(x);
    end
    Final_Prop(i) = indpt_sum/sum_eigvalue;
end
%Displaying all k_values
K_Values
%Displaying the proportions for the K_values
Final_Prop  