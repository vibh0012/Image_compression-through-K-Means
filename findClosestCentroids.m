function idx = findClosestCentroids(X, centroids)

%K = size(centroids, 1);

idx = zeros(size(X,1), 1);

for i=1:size(X,1)
   % X = 300*2 
  [val,ind]=min(sum ( (X(i,:)-centroids) .^2 , 2) ); 
  idx(i)=ind; 
end

end

