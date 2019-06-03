function centroids = computeCentroids(X, idx, K)

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);

%
for i=1:size(centroids,1)
  kn=idx==i;  % this gives matrix with 1's where value will the th index of centroid
  centroids(i,:)= (1/sum(kn,1))*sum((kn.*X),1);   % kn.* X = 1*n
end



