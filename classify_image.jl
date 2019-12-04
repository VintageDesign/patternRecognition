#=
     Author: Riley Kopp
Description: This file classifies a user specified image from the test data based on the
             given training images. Once the image has been classified, the script displays
             the test image next to its nearest match in the training data along with an
             estimated pose
=#


U, sigma, imageVector, meanA, X = generateBadManifold();


k = computeER(imageVector, sigma, .95);


for i = 1:k
    M[i,:] = X * U[:, i];
end



testImage = mat(float64.(load(testImagePath)));


testImageVec = vec(testImage);


testImageMeanCentered = testImageVec - meanA;

for i = 1:k
    t[i,:] = testImageMeanCentered * U[:, i];
end


#KNN search

#Show Image and object
