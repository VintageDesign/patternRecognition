#=
     Author: Riley Kopp
Description: This file generates plots for the manifold in 3 dimensions
             and the Energy Recovery as k approaches the n where n is
             the number of cols in the imageVector
=#


U, sigma, imageVector, meanA, X = generateSingleManifold();


k = computeER(imageVector, sigma, .95);


for i = 1:k
    M[i,:] = X * U[:, i];
end

