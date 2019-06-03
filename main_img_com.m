clc;
close all;

fprintf('\nRunning K-Means clustering on pixels from an image.\n\n');


A = double(imread('mona_lisa_v1.png'));

A = A / 255; % Divide by 255 so that all values are in the range 0 - 1, provides ease in computation

% Size of the image
img_size = size(A);     % A is 3-D

% Reshape the image into an Nx3 matrix where N = number of pixels.

X = reshape(A, img_size(1) * img_size(2), 3);     %  total no of pixels = A(1)*A(2)

K = 16; 
max_iters = 10;

initial_centroids = kMeansInitCentroids(X, K);

% Run K-Means
[centroids, idx] = runkMeans(X, initial_centroids, max_iters);

fprintf('Program paused. Press enter to continue.\n');
pause;

fprintf('\nApplying K-Means to compress an image.\n\n');

% Find closest cluster members
idx = findClosestCentroids(X, centroids);

% Essentially, now we have represented the image X as in terms of the
% indices in idx. 

% We can now recover the image from the indices (idx) by mapping each pixel
% (specified by its index in idx) to the centroid value
X_recovered = centroids(idx,:);

% Reshape the recovered image into proper dimensions
X_recovered = reshape(X_recovered, img_size(1), img_size(2), 3);

% Display the original image 
subplot(1, 2, 1);
imagesc(A); 
title('Original');

% Display compressed image side by side
subplot(1, 2, 2);
imagesc(X_recovered)
title(sprintf('Compressed, with %d colors.', K));


fprintf('Program paused. Press enter to continue.\n');
pause;