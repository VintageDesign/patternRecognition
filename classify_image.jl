#=
     Author: Riley Kopp
Description: This file classifies a user specified image from the test data based on the
             given training images. Once the image has been classified, the script displays
             the test image next to its nearest match in the training data along with an
             estimated pose
=#

push!(LOAD_PATH, pwd())
using Images, Revise, GenerateManifold, PlotManifold, PlotER, Select, ComputeER, JLD

if(!isfile("data.jld"))
    U, sigma, imageMatrix,  mean, imageMatrixMeanCentered, objectTypes = GenerateManifold.generateManifold();
#=    save("data.jld", "U", U, "sigma", sigma, "imageMatrix", imageMatrix, "mean", mean, "imageMatrixMeanCentered", imageMatrixMeanCentered, "objectTypes", objectTypes)
else
    U = load("data.jld", "U")
    sigma = load("data.jld", "sigma")
    imageMatrix = load("data.jld", "imageMatrix")
    mean = load("data.jld", "mean")
    imageMatrixMeanCentered = load("data.jld", "imageMatrixMeanCentered")
    objectTypes = load("data.jld", "objectTypes")
=#
end

k = ComputeER.compute(imageMatrixMeanCentered, sigma, .9);

M = Array{Gray{Float64}, 1}[]

print(summary(U))
for i = 1:k
    temp = imageMatrixMeanCentered * U[:][i]
    push!(M, temp )
end



testImage = mat(float64.(load(testImagePath)));


testImageVec = vec(testImage);


testImageMeanCentered = testImageVec - mean;

for i = 1:k
    t[i,:] = testImageMeanCentered * U[:, i];
end


#KNN search

#Show Image and object
=#
