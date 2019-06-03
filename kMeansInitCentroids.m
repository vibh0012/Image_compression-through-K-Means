function centroids = kMeansInitCentroids(X, K)

%centroids = zeros(K, size(X, 2));

randix=randperm(size(X,1));
centroids=X(randix(1:K), :);

end