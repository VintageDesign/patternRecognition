#=
     Author: Riley Kopp
Description: This file generates plots for the manifold in 3 dimensions
             and the Energy Recovery as k approaches the n where n is
             the number of cols in the imageVector
=#
push!(LOAD_PATH, pwd())
using Revise, SingleManifold, PlotManifold


println("Generating Plots...")
println("Options are: Boat, Cabinet, Cup, Flashlight, Car, Chair, Handle, Hose Reel, iBook, 2004 iMac, 1998 iMac, Keyboard, LED, Light1, Light2, Mug, Scooter, Spray Bottle, Stapler, Trash can")
println("Please select the image in which to classify:" )

item = readline()
U, sigma, imageVector, meanA, X = generateSingleManifold(item);



#k = computeER(imageVector, sigma, .95);
k = 3

println(summary(X))
println(summary(U))
M = zeros(3, 128)
for i = 1:k
    M[i,:] = X * U[:, i];
end

PlotManifold.plot(M[1, :], M[2, :], M[3, :])
