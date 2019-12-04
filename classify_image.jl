using TestImages;

testImagePath = selectImage();



U, sigma, imageVector, meanA, X = generateBadManifold();


k = computeER(imageVector, sigma, .95);


for i = 1:k
    M[i,:] = X * U[:, i];
end


testImage = mat(testimage(testImagePath));


testImageVec = vec(testImage);


testImageMeanCentered = testImageVec - meanA;

for i = 1:k
    t[i,:] = testImageMeanCentered * U[:, i];
end


#KNN search

#Show Image and object
